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
# (let ((f71288 (cons (make-symbol "nil" ()) ()))) (lambda () f71288))
# == vectorize-letrec  ==>
# (let ((f71288 (cons (make-symbol "nil" ()) ()))) (lambda () f71288))
# == eliminate-set!  ==>
# (let ((f71288 (cons (make-symbol "nil" ()) ()))) (lambda () (let () f71288)))
# == close-free-variables  ==>
# (let ((f71288 (cons (make-symbol "nil" ()) ()))) (closure () (f71288) (let () f71288)))
# == eliminate-quote  ==>
# (let ((f71288 (cons (make-symbol "nil" ()) ()))) (closure () (f71288) (let () f71288)))
# == eliminate-when/unless  ==>
# (let ((f71288 (cons (make-symbol "nil" ()) ()))) (closure () (f71288) (let () f71288)))
# == eliminate-cond  ==>
# (let ((f71288 (cons (make-symbol "nil" ()) ()))) (closure () (f71288) (let () f71288)))
# == external-symbols  ==>
# (let ((f71288 (cons (make-symbol "nil" ()) ()))) (closure () (f71288) (let () f71288)))
# emit-expr (let ((f71288 (cons (make-symbol "nil" ()) ()))) (closure () (f71288) (let () f71288)))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f71288 (cons (make-symbol "nil" ()) ())))
#  body = (closure () (f71288) (let () f71288))
# emit-expr (cons (make-symbol "nil" ()) ())
# cons arg1=(make-symbol "nil" ()) arg2=()
# emit-expr (make-symbol "nil" ())
# make-symbol arg1="nil" arg2=()
# emit-expr "nil"
# string literal
    jmp _L_718920
    .align 8,0x90
_L_718919 :
    .int 12
    .ascii "nil"
_L_718920:
    movl $_L_718919, %eax
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
# emit-expr (closure () (f71288) (let () f71288))
# emit-closure
# si = -4
# env = ((f71288 . 0))
# expr = (closure () (f71288) (let () f71288))
    movl $_L_718921, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f71288 . 0))
# var=f71288
    movl 0(%esp), %eax  # stack load f71288
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f71288
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_718922            # jump around closure body
_L_718921:
# check argument count
    cmp $0,%eax
    je _L_718923
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_718923:
# emit-tail-expr
# si=-8
# env=((f71288 . 4) (f71288 . 0))
# expr=(let () f71288)
# emit-tail-let
#  si   = -8
#  env  = ((f71288 . 4) (f71288 . 0))
#  bindings = ()
#  body = f71288
# emit-tail-expr
# si=-8
# env=((f71288 . 4) (f71288 . 0))
# expr=f71288
# emit-tail-variable-ref
# emit-variable-ref
# env=((f71288 . 4) (f71288 . 0))
# var=f71288
    movl 2(%edi), %eax  # frame load f71288
# end emit-variable-ref
    ret
# end emit-tail-variable ref
    .align 4,0x90
_L_718922:
     movl %eax, symbols
# == explicit-begins  ==>
# (letrec ((slen= (lambda (s1 s2) (fx= (string-length s1) (string-length s2)))) (si= (lambda (s1 s2 i) (char=? (string-ref s1 i) (string-ref s2 i)))) (si<n= (lambda (s1 s2 i n) (if (fx= i n) #t (if (si= s1 s2 i) (si<n= s1 s2 (fx+ i 1) n) #f)))) (ss= (lambda (s1 s2) (if (slen= s1 s2) (si<n= s1 s2 0 (string-length s1)) #f)))) ss=)
# == eliminate-let*  ==>
# (letrec ((slen= (lambda (s1 s2) (fx= (string-length s1) (string-length s2)))) (si= (lambda (s1 s2 i) (char=? (string-ref s1 i) (string-ref s2 i)))) (si<n= (lambda (s1 s2 i n) (if (fx= i n) #t (if (si= s1 s2 i) (si<n= s1 s2 (fx+ i 1) n) #f)))) (ss= (lambda (s1 s2) (if (slen= s1 s2) (si<n= s1 s2 0 (string-length s1)) #f)))) ss=)
# == uniquify-variables  ==>
# (letrec ((f71292 (lambda (f71313 f71314) (fx= (string-length f71313) (string-length f71314)))) (f71291 (lambda (f71310 f71311 f71312) (char=? (string-ref f71310 f71312) (string-ref f71311 f71312)))) (f71290 (lambda (f71306 f71307 f71308 f71309) (if (fx= f71308 f71309) #t (if (f71291 f71306 f71307 f71308) (f71290 f71306 f71307 (fx+ f71308 1) f71309) #f)))) (f71289 (lambda (f71304 f71305) (if (f71292 f71304 f71305) (f71290 f71304 f71305 0 (string-length f71304)) #f)))) f71289)
# == vectorize-letrec  ==>
# (let ((f71292 (make-vector 1)) (f71291 (make-vector 1)) (f71290 (make-vector 1)) (f71289 (make-vector 1))) (begin (begin (vector-set! f71292 0 (lambda (f71313 f71314) (fx= (string-length f71313) (string-length f71314)))) (vector-set! f71291 0 (lambda (f71310 f71311 f71312) (char=? (string-ref f71310 f71312) (string-ref f71311 f71312)))) (vector-set! f71290 0 (lambda (f71306 f71307 f71308 f71309) (if (fx= f71308 f71309) #t (if ((vector-ref f71291 0) f71306 f71307 f71308) ((vector-ref f71290 0) f71306 f71307 (fx+ f71308 1) f71309) #f)))) (vector-set! f71289 0 (lambda (f71304 f71305) (if ((vector-ref f71292 0) f71304 f71305) ((vector-ref f71290 0) f71304 f71305 0 (string-length f71304)) #f)))) (vector-ref f71289 0)))
# == eliminate-set!  ==>
# (let ((f71292 (make-vector 1)) (f71291 (make-vector 1)) (f71290 (make-vector 1)) (f71289 (make-vector 1))) (begin (begin (vector-set! f71292 0 (lambda (f71313 f71314) (let ((f71313 f71313) (f71314 f71314)) (fx= (string-length f71313) (string-length f71314))))) (vector-set! f71291 0 (lambda (f71310 f71311 f71312) (let ((f71310 f71310) (f71311 f71311) (f71312 f71312)) (char=? (string-ref f71310 f71312) (string-ref f71311 f71312))))) (vector-set! f71290 0 (lambda (f71306 f71307 f71308 f71309) (let ((f71306 f71306) (f71307 f71307) (f71308 f71308) (f71309 f71309)) (if (fx= f71308 f71309) #t (if ((vector-ref f71291 0) f71306 f71307 f71308) ((vector-ref f71290 0) f71306 f71307 (fx+ f71308 1) f71309) #f))))) (vector-set! f71289 0 (lambda (f71304 f71305) (let ((f71304 f71304) (f71305 f71305)) (if ((vector-ref f71292 0) f71304 f71305) ((vector-ref f71290 0) f71304 f71305 0 (string-length f71304)) #f))))) (vector-ref f71289 0)))
# == close-free-variables  ==>
# (let ((f71292 (make-vector 1)) (f71291 (make-vector 1)) (f71290 (make-vector 1)) (f71289 (make-vector 1))) (begin (begin (vector-set! f71292 0 (closure (f71313 f71314) () (let ((f71313 f71313) (f71314 f71314)) (fx= (string-length f71313) (string-length f71314))))) (vector-set! f71291 0 (closure (f71310 f71311 f71312) () (let ((f71310 f71310) (f71311 f71311) (f71312 f71312)) (char=? (string-ref f71310 f71312) (string-ref f71311 f71312))))) (vector-set! f71290 0 (closure (f71306 f71307 f71308 f71309) (f71291 f71290) (let ((f71306 f71306) (f71307 f71307) (f71308 f71308) (f71309 f71309)) (if (fx= f71308 f71309) #t (if ((vector-ref f71291 0) f71306 f71307 f71308) ((vector-ref f71290 0) f71306 f71307 (fx+ f71308 1) f71309) #f))))) (vector-set! f71289 0 (closure (f71304 f71305) (f71292 f71290) (let ((f71304 f71304) (f71305 f71305)) (if ((vector-ref f71292 0) f71304 f71305) ((vector-ref f71290 0) f71304 f71305 0 (string-length f71304)) #f))))) (vector-ref f71289 0)))
# == eliminate-quote  ==>
# (let ((f71292 (make-vector 1)) (f71291 (make-vector 1)) (f71290 (make-vector 1)) (f71289 (make-vector 1))) (begin (begin (vector-set! f71292 0 (closure (f71313 f71314) () (let ((f71313 f71313) (f71314 f71314)) (fx= (string-length f71313) (string-length f71314))))) (vector-set! f71291 0 (closure (f71310 f71311 f71312) () (let ((f71310 f71310) (f71311 f71311) (f71312 f71312)) (char=? (string-ref f71310 f71312) (string-ref f71311 f71312))))) (vector-set! f71290 0 (closure (f71306 f71307 f71308 f71309) (f71291 f71290) (let ((f71306 f71306) (f71307 f71307) (f71308 f71308) (f71309 f71309)) (if (fx= f71308 f71309) #t (if ((vector-ref f71291 0) f71306 f71307 f71308) ((vector-ref f71290 0) f71306 f71307 (fx+ f71308 1) f71309) #f))))) (vector-set! f71289 0 (closure (f71304 f71305) (f71292 f71290) (let ((f71304 f71304) (f71305 f71305)) (if ((vector-ref f71292 0) f71304 f71305) ((vector-ref f71290 0) f71304 f71305 0 (string-length f71304)) #f))))) (vector-ref f71289 0)))
# == eliminate-when/unless  ==>
# (let ((f71292 (make-vector 1)) (f71291 (make-vector 1)) (f71290 (make-vector 1)) (f71289 (make-vector 1))) (begin (begin (vector-set! f71292 0 (closure (f71313 f71314) () (let ((f71313 f71313) (f71314 f71314)) (fx= (string-length f71313) (string-length f71314))))) (vector-set! f71291 0 (closure (f71310 f71311 f71312) () (let ((f71310 f71310) (f71311 f71311) (f71312 f71312)) (char=? (string-ref f71310 f71312) (string-ref f71311 f71312))))) (vector-set! f71290 0 (closure (f71306 f71307 f71308 f71309) (f71291 f71290) (let ((f71306 f71306) (f71307 f71307) (f71308 f71308) (f71309 f71309)) (if (fx= f71308 f71309) #t (if ((vector-ref f71291 0) f71306 f71307 f71308) ((vector-ref f71290 0) f71306 f71307 (fx+ f71308 1) f71309) #f))))) (vector-set! f71289 0 (closure (f71304 f71305) (f71292 f71290) (let ((f71304 f71304) (f71305 f71305)) (if ((vector-ref f71292 0) f71304 f71305) ((vector-ref f71290 0) f71304 f71305 0 (string-length f71304)) #f))))) (vector-ref f71289 0)))
# == eliminate-cond  ==>
# (let ((f71292 (make-vector 1)) (f71291 (make-vector 1)) (f71290 (make-vector 1)) (f71289 (make-vector 1))) (begin (begin (vector-set! f71292 0 (closure (f71313 f71314) () (let ((f71313 f71313) (f71314 f71314)) (fx= (string-length f71313) (string-length f71314))))) (vector-set! f71291 0 (closure (f71310 f71311 f71312) () (let ((f71310 f71310) (f71311 f71311) (f71312 f71312)) (char=? (string-ref f71310 f71312) (string-ref f71311 f71312))))) (vector-set! f71290 0 (closure (f71306 f71307 f71308 f71309) (f71291 f71290) (let ((f71306 f71306) (f71307 f71307) (f71308 f71308) (f71309 f71309)) (if (fx= f71308 f71309) #t (if ((vector-ref f71291 0) f71306 f71307 f71308) ((vector-ref f71290 0) f71306 f71307 (fx+ f71308 1) f71309) #f))))) (vector-set! f71289 0 (closure (f71304 f71305) (f71292 f71290) (let ((f71304 f71304) (f71305 f71305)) (if ((vector-ref f71292 0) f71304 f71305) ((vector-ref f71290 0) f71304 f71305 0 (string-length f71304)) #f))))) (vector-ref f71289 0)))
# == external-symbols  ==>
# (let ((f71292 (make-vector 1)) (f71291 (make-vector 1)) (f71290 (make-vector 1)) (f71289 (make-vector 1))) (begin (begin (vector-set! f71292 0 (closure (f71313 f71314) () (let ((f71313 f71313) (f71314 f71314)) (fx= (string-length f71313) (string-length f71314))))) (vector-set! f71291 0 (closure (f71310 f71311 f71312) () (let ((f71310 f71310) (f71311 f71311) (f71312 f71312)) (char=? (string-ref f71310 f71312) (string-ref f71311 f71312))))) (vector-set! f71290 0 (closure (f71306 f71307 f71308 f71309) (f71291 f71290) (let ((f71306 f71306) (f71307 f71307) (f71308 f71308) (f71309 f71309)) (if (fx= f71308 f71309) #t (if ((vector-ref f71291 0) f71306 f71307 f71308) ((vector-ref f71290 0) f71306 f71307 (fx+ f71308 1) f71309) #f))))) (vector-set! f71289 0 (closure (f71304 f71305) (f71292 f71290) (let ((f71304 f71304) (f71305 f71305)) (if ((vector-ref f71292 0) f71304 f71305) ((vector-ref f71290 0) f71304 f71305 0 (string-length f71304)) #f))))) (vector-ref f71289 0)))
# emit-expr (let ((f71292 (make-vector 1)) (f71291 (make-vector 1)) (f71290 (make-vector 1)) (f71289 (make-vector 1))) (begin (begin (vector-set! f71292 0 (closure (f71313 f71314) () (let ((f71313 f71313) (f71314 f71314)) (fx= (string-length f71313) (string-length f71314))))) (vector-set! f71291 0 (closure (f71310 f71311 f71312) () (let ((f71310 f71310) (f71311 f71311) (f71312 f71312)) (char=? (string-ref f71310 f71312) (string-ref f71311 f71312))))) (vector-set! f71290 0 (closure (f71306 f71307 f71308 f71309) (f71291 f71290) (let ((f71306 f71306) (f71307 f71307) (f71308 f71308) (f71309 f71309)) (if (fx= f71308 f71309) #t (if ((vector-ref f71291 0) f71306 f71307 f71308) ((vector-ref f71290 0) f71306 f71307 (fx+ f71308 1) f71309) #f))))) (vector-set! f71289 0 (closure (f71304 f71305) (f71292 f71290) (let ((f71304 f71304) (f71305 f71305)) (if ((vector-ref f71292 0) f71304 f71305) ((vector-ref f71290 0) f71304 f71305 0 (string-length f71304)) #f))))) (vector-ref f71289 0)))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f71292 (make-vector 1)) (f71291 (make-vector 1)) (f71290 (make-vector 1)) (f71289 (make-vector 1)))
#  body = (begin (begin (vector-set! f71292 0 (closure (f71313 f71314) () (let ((f71313 f71313) (f71314 f71314)) (fx= (string-length f71313) (string-length f71314))))) (vector-set! f71291 0 (closure (f71310 f71311 f71312) () (let ((f71310 f71310) (f71311 f71311) (f71312 f71312)) (char=? (string-ref f71310 f71312) (string-ref f71311 f71312))))) (vector-set! f71290 0 (closure (f71306 f71307 f71308 f71309) (f71291 f71290) (let ((f71306 f71306) (f71307 f71307) (f71308 f71308) (f71309 f71309)) (if (fx= f71308 f71309) #t (if ((vector-ref f71291 0) f71306 f71307 f71308) ((vector-ref f71290 0) f71306 f71307 (fx+ f71308 1) f71309) #f))))) (vector-set! f71289 0 (closure (f71304 f71305) (f71292 f71290) (let ((f71304 f71304) (f71305 f71305)) (if ((vector-ref f71292 0) f71304 f71305) ((vector-ref f71290 0) f71304 f71305 0 (string-length f71304)) #f))))) (vector-ref f71289 0))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_718924"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718924:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_718925
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718925:
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
    je "_L_718926"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718926:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_718927
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718927:
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
    je "_L_718928"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718928:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_718929
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718929:
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
    je "_L_718930"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718930:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_718931
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718931:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, -12(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f71292 0 (closure (f71313 f71314) () (let ((f71313 f71313) (f71314 f71314)) (fx= (string-length f71313) (string-length f71314))))) (vector-set! f71291 0 (closure (f71310 f71311 f71312) () (let ((f71310 f71310) (f71311 f71311) (f71312 f71312)) (char=? (string-ref f71310 f71312) (string-ref f71311 f71312))))) (vector-set! f71290 0 (closure (f71306 f71307 f71308 f71309) (f71291 f71290) (let ((f71306 f71306) (f71307 f71307) (f71308 f71308) (f71309 f71309)) (if (fx= f71308 f71309) #t (if ((vector-ref f71291 0) f71306 f71307 f71308) ((vector-ref f71290 0) f71306 f71307 (fx+ f71308 1) f71309) #f))))) (vector-set! f71289 0 (closure (f71304 f71305) (f71292 f71290) (let ((f71304 f71304) (f71305 f71305)) (if ((vector-ref f71292 0) f71304 f71305) ((vector-ref f71290 0) f71304 f71305 0 (string-length f71304)) #f))))) (vector-ref f71289 0))
# emit-begin
#   expr=(begin (begin (vector-set! f71292 0 (closure (f71313 f71314) () (let ((f71313 f71313) (f71314 f71314)) (fx= (string-length f71313) (string-length f71314))))) (vector-set! f71291 0 (closure (f71310 f71311 f71312) () (let ((f71310 f71310) (f71311 f71311) (f71312 f71312)) (char=? (string-ref f71310 f71312) (string-ref f71311 f71312))))) (vector-set! f71290 0 (closure (f71306 f71307 f71308 f71309) (f71291 f71290) (let ((f71306 f71306) (f71307 f71307) (f71308 f71308) (f71309 f71309)) (if (fx= f71308 f71309) #t (if ((vector-ref f71291 0) f71306 f71307 f71308) ((vector-ref f71290 0) f71306 f71307 (fx+ f71308 1) f71309) #f))))) (vector-set! f71289 0 (closure (f71304 f71305) (f71292 f71290) (let ((f71304 f71304) (f71305 f71305)) (if ((vector-ref f71292 0) f71304 f71305) ((vector-ref f71290 0) f71304 f71305 0 (string-length f71304)) #f))))) (vector-ref f71289 0))
#   env=((f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# emit-expr (begin (vector-set! f71292 0 (closure (f71313 f71314) () (let ((f71313 f71313) (f71314 f71314)) (fx= (string-length f71313) (string-length f71314))))) (vector-set! f71291 0 (closure (f71310 f71311 f71312) () (let ((f71310 f71310) (f71311 f71311) (f71312 f71312)) (char=? (string-ref f71310 f71312) (string-ref f71311 f71312))))) (vector-set! f71290 0 (closure (f71306 f71307 f71308 f71309) (f71291 f71290) (let ((f71306 f71306) (f71307 f71307) (f71308 f71308) (f71309 f71309)) (if (fx= f71308 f71309) #t (if ((vector-ref f71291 0) f71306 f71307 f71308) ((vector-ref f71290 0) f71306 f71307 (fx+ f71308 1) f71309) #f))))) (vector-set! f71289 0 (closure (f71304 f71305) (f71292 f71290) (let ((f71304 f71304) (f71305 f71305)) (if ((vector-ref f71292 0) f71304 f71305) ((vector-ref f71290 0) f71304 f71305 0 (string-length f71304)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f71292 0 (closure (f71313 f71314) () (let ((f71313 f71313) (f71314 f71314)) (fx= (string-length f71313) (string-length f71314))))) (vector-set! f71291 0 (closure (f71310 f71311 f71312) () (let ((f71310 f71310) (f71311 f71311) (f71312 f71312)) (char=? (string-ref f71310 f71312) (string-ref f71311 f71312))))) (vector-set! f71290 0 (closure (f71306 f71307 f71308 f71309) (f71291 f71290) (let ((f71306 f71306) (f71307 f71307) (f71308 f71308) (f71309 f71309)) (if (fx= f71308 f71309) #t (if ((vector-ref f71291 0) f71306 f71307 f71308) ((vector-ref f71290 0) f71306 f71307 (fx+ f71308 1) f71309) #f))))) (vector-set! f71289 0 (closure (f71304 f71305) (f71292 f71290) (let ((f71304 f71304) (f71305 f71305)) (if ((vector-ref f71292 0) f71304 f71305) ((vector-ref f71290 0) f71304 f71305 0 (string-length f71304)) #f)))))
#   env=((f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# emit-expr (vector-set! f71292 0 (closure (f71313 f71314) () (let ((f71313 f71313) (f71314 f71314)) (fx= (string-length f71313) (string-length f71314)))))
# emit-expr f71292
# emit-variable-ref
# env=((f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71292
    movl 0(%esp), %eax  # stack load f71292
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_718932
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718932:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_718933"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718933:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_718935
    cmp  $0,%eax
    jge _L_718934
_L_718935:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_718934:
    movl %eax, -20(%esp)
# emit-expr (closure (f71313 f71314) () (let ((f71313 f71313) (f71314 f71314)) (fx= (string-length f71313) (string-length f71314))))
# emit-closure
# si = -24
# env = ((f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# expr = (closure (f71313 f71314) () (let ((f71313 f71313) (f71314 f71314)) (fx= (string-length f71313) (string-length f71314))))
    movl $_L_718936, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_718937            # jump around closure body
_L_718936:
# check argument count
    cmp $8,%eax
    je _L_718938
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_718938:
# emit-tail-expr
# si=-16
# env=((f71314 . -12) (f71313 . -8) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# expr=(let ((f71313 f71313) (f71314 f71314)) (fx= (string-length f71313) (string-length f71314)))
# emit-tail-let
#  si   = -16
#  env  = ((f71314 . -12) (f71313 . -8) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
#  bindings = ((f71313 f71313) (f71314 f71314))
#  body = (fx= (string-length f71313) (string-length f71314))
# emit-expr f71313
# emit-variable-ref
# env=((f71314 . -12) (f71313 . -8) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71313
    movl -8(%esp), %eax  # stack load f71313
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f71314
# emit-variable-ref
# env=((f71314 . -12) (f71313 . -8) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71314
    movl -12(%esp), %eax  # stack load f71314
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f71314 . -20) (f71313 . -16) (f71314 . -12) (f71313 . -8) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# expr=(fx= (string-length f71313) (string-length f71314))
# tail primcall
# emit-expr (string-length f71314)
# emit-expr f71314
# emit-variable-ref
# env=((f71314 . -20) (f71313 . -16) (f71314 . -12) (f71313 . -8) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71314
    movl -20(%esp), %eax  # stack load f71314
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_718939
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718939:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_718940"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718940:
    movl %eax, -24(%esp)
# emit-expr (string-length f71313)
# emit-expr f71313
# emit-variable-ref
# env=((f71314 . -20) (f71313 . -16) (f71314 . -12) (f71313 . -8) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71313
    movl -16(%esp), %eax  # stack load f71313
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_718941
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718941:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_718942"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718942:
    cmp -24(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
#return from tail (fx= (string-length f71313) (string-length f71314))
    ret
    .align 4,0x90
_L_718937:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71291 0 (closure (f71310 f71311 f71312) () (let ((f71310 f71310) (f71311 f71311) (f71312 f71312)) (char=? (string-ref f71310 f71312) (string-ref f71311 f71312))))) (vector-set! f71290 0 (closure (f71306 f71307 f71308 f71309) (f71291 f71290) (let ((f71306 f71306) (f71307 f71307) (f71308 f71308) (f71309 f71309)) (if (fx= f71308 f71309) #t (if ((vector-ref f71291 0) f71306 f71307 f71308) ((vector-ref f71290 0) f71306 f71307 (fx+ f71308 1) f71309) #f))))) (vector-set! f71289 0 (closure (f71304 f71305) (f71292 f71290) (let ((f71304 f71304) (f71305 f71305)) (if ((vector-ref f71292 0) f71304 f71305) ((vector-ref f71290 0) f71304 f71305 0 (string-length f71304)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f71291 0 (closure (f71310 f71311 f71312) () (let ((f71310 f71310) (f71311 f71311) (f71312 f71312)) (char=? (string-ref f71310 f71312) (string-ref f71311 f71312))))) (vector-set! f71290 0 (closure (f71306 f71307 f71308 f71309) (f71291 f71290) (let ((f71306 f71306) (f71307 f71307) (f71308 f71308) (f71309 f71309)) (if (fx= f71308 f71309) #t (if ((vector-ref f71291 0) f71306 f71307 f71308) ((vector-ref f71290 0) f71306 f71307 (fx+ f71308 1) f71309) #f))))) (vector-set! f71289 0 (closure (f71304 f71305) (f71292 f71290) (let ((f71304 f71304) (f71305 f71305)) (if ((vector-ref f71292 0) f71304 f71305) ((vector-ref f71290 0) f71304 f71305 0 (string-length f71304)) #f)))))
#   env=((f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# emit-expr (vector-set! f71291 0 (closure (f71310 f71311 f71312) () (let ((f71310 f71310) (f71311 f71311) (f71312 f71312)) (char=? (string-ref f71310 f71312) (string-ref f71311 f71312)))))
# emit-expr f71291
# emit-variable-ref
# env=((f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71291
    movl -4(%esp), %eax  # stack load f71291
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_718943
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718943:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_718944"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718944:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_718946
    cmp  $0,%eax
    jge _L_718945
_L_718946:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_718945:
    movl %eax, -20(%esp)
# emit-expr (closure (f71310 f71311 f71312) () (let ((f71310 f71310) (f71311 f71311) (f71312 f71312)) (char=? (string-ref f71310 f71312) (string-ref f71311 f71312))))
# emit-closure
# si = -24
# env = ((f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# expr = (closure (f71310 f71311 f71312) () (let ((f71310 f71310) (f71311 f71311) (f71312 f71312)) (char=? (string-ref f71310 f71312) (string-ref f71311 f71312))))
    movl $_L_718947, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_718948            # jump around closure body
_L_718947:
# check argument count
    cmp $12,%eax
    je _L_718949
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_718949:
# emit-tail-expr
# si=-20
# env=((f71312 . -16) (f71311 . -12) (f71310 . -8) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# expr=(let ((f71310 f71310) (f71311 f71311) (f71312 f71312)) (char=? (string-ref f71310 f71312) (string-ref f71311 f71312)))
# emit-tail-let
#  si   = -20
#  env  = ((f71312 . -16) (f71311 . -12) (f71310 . -8) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
#  bindings = ((f71310 f71310) (f71311 f71311) (f71312 f71312))
#  body = (char=? (string-ref f71310 f71312) (string-ref f71311 f71312))
# emit-expr f71310
# emit-variable-ref
# env=((f71312 . -16) (f71311 . -12) (f71310 . -8) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71310
    movl -8(%esp), %eax  # stack load f71310
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-expr f71311
# emit-variable-ref
# env=((f71312 . -16) (f71311 . -12) (f71310 . -8) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71311
    movl -12(%esp), %eax  # stack load f71311
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f71312
# emit-variable-ref
# env=((f71312 . -16) (f71311 . -12) (f71310 . -8) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71312
    movl -16(%esp), %eax  # stack load f71312
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-tail-expr
# si=-32
# env=((f71312 . -28) (f71311 . -24) (f71310 . -20) (f71312 . -16) (f71311 . -12) (f71310 . -8) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# expr=(char=? (string-ref f71310 f71312) (string-ref f71311 f71312))
# tail primcall
# char= c1=(string-ref f71310 f71312) c2=(string-ref f71311 f71312)
# emit-expr (string-ref f71310 f71312)
# emit-expr f71310
# emit-variable-ref
# env=((f71312 . -28) (f71311 . -24) (f71310 . -20) (f71312 . -16) (f71311 . -12) (f71310 . -8) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71310
    movl -20(%esp), %eax  # stack load f71310
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_718950
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718950:
    movl %eax, -32(%esp)
# emit-expr f71312
# emit-variable-ref
# env=((f71312 . -28) (f71311 . -24) (f71310 . -20) (f71312 . -16) (f71311 . -12) (f71310 . -8) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71312
    movl -28(%esp), %eax  # stack load f71312
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_718951"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718951:
# check bounds on string index
    movl -32(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_718953
    cmp  $0,%eax
    jge _L_718952
_L_718953:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_718952:
    sar $2, %eax
    movl -32(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_718954"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $32,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718954:
    movb %ah, -32(%esp)
# emit-expr (string-ref f71311 f71312)
# emit-expr f71311
# emit-variable-ref
# env=((f71312 . -28) (f71311 . -24) (f71310 . -20) (f71312 . -16) (f71311 . -12) (f71310 . -8) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71311
    movl -24(%esp), %eax  # stack load f71311
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_718955
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718955:
    movl %eax, -36(%esp)
# emit-expr f71312
# emit-variable-ref
# env=((f71312 . -28) (f71311 . -24) (f71310 . -20) (f71312 . -16) (f71311 . -12) (f71310 . -8) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71312
    movl -28(%esp), %eax  # stack load f71312
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_718956"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718956:
# check bounds on string index
    movl -36(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_718958
    cmp  $0,%eax
    jge _L_718957
_L_718958:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_718957:
    sar $2, %eax
    movl -36(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_718959"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $32,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718959:
    cmp %ah, -32(%esp)
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
#return from tail (char=? (string-ref f71310 f71312) (string-ref f71311 f71312))
    ret
    .align 4,0x90
_L_718948:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71290 0 (closure (f71306 f71307 f71308 f71309) (f71291 f71290) (let ((f71306 f71306) (f71307 f71307) (f71308 f71308) (f71309 f71309)) (if (fx= f71308 f71309) #t (if ((vector-ref f71291 0) f71306 f71307 f71308) ((vector-ref f71290 0) f71306 f71307 (fx+ f71308 1) f71309) #f))))) (vector-set! f71289 0 (closure (f71304 f71305) (f71292 f71290) (let ((f71304 f71304) (f71305 f71305)) (if ((vector-ref f71292 0) f71304 f71305) ((vector-ref f71290 0) f71304 f71305 0 (string-length f71304)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f71290 0 (closure (f71306 f71307 f71308 f71309) (f71291 f71290) (let ((f71306 f71306) (f71307 f71307) (f71308 f71308) (f71309 f71309)) (if (fx= f71308 f71309) #t (if ((vector-ref f71291 0) f71306 f71307 f71308) ((vector-ref f71290 0) f71306 f71307 (fx+ f71308 1) f71309) #f))))) (vector-set! f71289 0 (closure (f71304 f71305) (f71292 f71290) (let ((f71304 f71304) (f71305 f71305)) (if ((vector-ref f71292 0) f71304 f71305) ((vector-ref f71290 0) f71304 f71305 0 (string-length f71304)) #f)))))
#   env=((f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# emit-expr (vector-set! f71290 0 (closure (f71306 f71307 f71308 f71309) (f71291 f71290) (let ((f71306 f71306) (f71307 f71307) (f71308 f71308) (f71309 f71309)) (if (fx= f71308 f71309) #t (if ((vector-ref f71291 0) f71306 f71307 f71308) ((vector-ref f71290 0) f71306 f71307 (fx+ f71308 1) f71309) #f)))))
# emit-expr f71290
# emit-variable-ref
# env=((f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71290
    movl -8(%esp), %eax  # stack load f71290
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_718960
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718960:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_718961"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718961:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_718963
    cmp  $0,%eax
    jge _L_718962
_L_718963:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_718962:
    movl %eax, -20(%esp)
# emit-expr (closure (f71306 f71307 f71308 f71309) (f71291 f71290) (let ((f71306 f71306) (f71307 f71307) (f71308 f71308) (f71309 f71309)) (if (fx= f71308 f71309) #t (if ((vector-ref f71291 0) f71306 f71307 f71308) ((vector-ref f71290 0) f71306 f71307 (fx+ f71308 1) f71309) #f))))
# emit-closure
# si = -24
# env = ((f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# expr = (closure (f71306 f71307 f71308 f71309) (f71291 f71290) (let ((f71306 f71306) (f71307 f71307) (f71308 f71308) (f71309 f71309)) (if (fx= f71308 f71309) #t (if ((vector-ref f71291 0) f71306 f71307 f71308) ((vector-ref f71290 0) f71306 f71307 (fx+ f71308 1) f71309) #f))))
    movl $_L_718964, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71291
    movl -4(%esp), %eax  # stack load f71291
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f71291
# emit-variable-ref
# env=((f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71290
    movl -8(%esp), %eax  # stack load f71290
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f71290
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_718965            # jump around closure body
_L_718964:
# check argument count
    cmp $16,%eax
    je _L_718966
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_718966:
# emit-tail-expr
# si=-24
# env=((f71309 . -20) (f71308 . -16) (f71307 . -12) (f71306 . -8) (f71290 . 8) (f71291 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# expr=(let ((f71306 f71306) (f71307 f71307) (f71308 f71308) (f71309 f71309)) (if (fx= f71308 f71309) #t (if ((vector-ref f71291 0) f71306 f71307 f71308) ((vector-ref f71290 0) f71306 f71307 (fx+ f71308 1) f71309) #f)))
# emit-tail-let
#  si   = -24
#  env  = ((f71309 . -20) (f71308 . -16) (f71307 . -12) (f71306 . -8) (f71290 . 8) (f71291 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
#  bindings = ((f71306 f71306) (f71307 f71307) (f71308 f71308) (f71309 f71309))
#  body = (if (fx= f71308 f71309) #t (if ((vector-ref f71291 0) f71306 f71307 f71308) ((vector-ref f71290 0) f71306 f71307 (fx+ f71308 1) f71309) #f))
# emit-expr f71306
# emit-variable-ref
# env=((f71309 . -20) (f71308 . -16) (f71307 . -12) (f71306 . -8) (f71290 . 8) (f71291 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71306
    movl -8(%esp), %eax  # stack load f71306
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f71307
# emit-variable-ref
# env=((f71309 . -20) (f71308 . -16) (f71307 . -12) (f71306 . -8) (f71290 . 8) (f71291 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71307
    movl -12(%esp), %eax  # stack load f71307
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-expr f71308
# emit-variable-ref
# env=((f71309 . -20) (f71308 . -16) (f71307 . -12) (f71306 . -8) (f71290 . 8) (f71291 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71308
    movl -16(%esp), %eax  # stack load f71308
# end emit-variable-ref
    movl %eax, -32(%esp)  # stack save
# emit-expr f71309
# emit-variable-ref
# env=((f71309 . -20) (f71308 . -16) (f71307 . -12) (f71306 . -8) (f71290 . 8) (f71291 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71309
    movl -20(%esp), %eax  # stack load f71309
# end emit-variable-ref
    movl %eax, -36(%esp)  # stack save
# emit-tail-expr
# si=-40
# env=((f71309 . -36) (f71308 . -32) (f71307 . -28) (f71306 . -24) (f71309 . -20) (f71308 . -16) (f71307 . -12) (f71306 . -8) (f71290 . 8) (f71291 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# expr=(if (fx= f71308 f71309) #t (if ((vector-ref f71291 0) f71306 f71307 f71308) ((vector-ref f71290 0) f71306 f71307 (fx+ f71308 1) f71309) #f))
# emit-expr (fx= f71308 f71309)
# emit-expr f71309
# emit-variable-ref
# env=((f71309 . -36) (f71308 . -32) (f71307 . -28) (f71306 . -24) (f71309 . -20) (f71308 . -16) (f71307 . -12) (f71306 . -8) (f71290 . 8) (f71291 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71309
    movl -36(%esp), %eax  # stack load f71309
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_718969"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718969:
    movl %eax, -40(%esp)
# emit-expr f71308
# emit-variable-ref
# env=((f71309 . -36) (f71308 . -32) (f71307 . -28) (f71306 . -24) (f71309 . -20) (f71308 . -16) (f71307 . -12) (f71306 . -8) (f71290 . 8) (f71291 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71308
    movl -32(%esp), %eax  # stack load f71308
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_718970"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718970:
    cmp -40(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_718967
# emit-tail-expr
# si=-40
# env=((f71309 . -36) (f71308 . -32) (f71307 . -28) (f71306 . -24) (f71309 . -20) (f71308 . -16) (f71307 . -12) (f71306 . -8) (f71290 . 8) (f71291 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# expr=#t
    movl $111, %eax     # immed #t
    ret                  # immediate tail return
    jmp _L_718968
_L_718967:
# emit-tail-expr
# si=-40
# env=((f71309 . -36) (f71308 . -32) (f71307 . -28) (f71306 . -24) (f71309 . -20) (f71308 . -16) (f71307 . -12) (f71306 . -8) (f71290 . 8) (f71291 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# expr=(if ((vector-ref f71291 0) f71306 f71307 f71308) ((vector-ref f71290 0) f71306 f71307 (fx+ f71308 1) f71309) #f)
# emit-expr ((vector-ref f71291 0) f71306 f71307 f71308)
# funcall
#    si   =-40
#    env  = ((f71309 . -36) (f71308 . -32) (f71307 . -28) (f71306 . -24) (f71309 . -20) (f71308 . -16) (f71307 . -12) (f71306 . -8) (f71290 . 8) (f71291 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
#    expr = (funcall (vector-ref f71291 0) f71306 f71307 f71308)
# emit-expr (vector-ref f71291 0)
# emit-expr f71291
# emit-variable-ref
# env=((f71309 . -36) (f71308 . -32) (f71307 . -28) (f71306 . -24) (f71309 . -20) (f71308 . -16) (f71307 . -12) (f71306 . -8) (f71290 . 8) (f71291 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71291
    movl 2(%edi), %eax  # frame load f71291
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_718973
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718973:
    movl %eax, -48(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_718974"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718974:
# check bounds on vector index
    movl -48(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_718976
    cmp  $0,%eax
    jge _L_718975
_L_718976:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_718975:
    movl -48(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_718977"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_718977":
   movl %eax,  -48(%esp)  # stash funcall-oper in closure slot
# emit-expr f71306
# emit-variable-ref
# env=((f71309 . -36) (f71308 . -32) (f71307 . -28) (f71306 . -24) (f71309 . -20) (f71308 . -16) (f71307 . -12) (f71306 . -8) (f71290 . 8) (f71291 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71306
    movl -24(%esp), %eax  # stack load f71306
# end emit-variable-ref
    mov %eax, -52(%esp)  # arg f71306
# emit-expr f71307
# emit-variable-ref
# env=((f71309 . -36) (f71308 . -32) (f71307 . -28) (f71306 . -24) (f71309 . -20) (f71308 . -16) (f71307 . -12) (f71306 . -8) (f71290 . 8) (f71291 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71307
    movl -28(%esp), %eax  # stack load f71307
# end emit-variable-ref
    mov %eax, -56(%esp)  # arg f71307
# emit-expr f71308
# emit-variable-ref
# env=((f71309 . -36) (f71308 . -32) (f71307 . -28) (f71306 . -24) (f71309 . -20) (f71308 . -16) (f71307 . -12) (f71306 . -8) (f71290 . 8) (f71291 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71308
    movl -32(%esp), %eax  # stack load f71308
# end emit-variable-ref
    mov %eax, -60(%esp)  # arg f71308
    movl -48(%esp), %edi   # load new closure to %edi
    add $-40, %esp   # adjust base
    movl $12,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $40, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_718971
# emit-tail-expr
# si=-40
# env=((f71309 . -36) (f71308 . -32) (f71307 . -28) (f71306 . -24) (f71309 . -20) (f71308 . -16) (f71307 . -12) (f71306 . -8) (f71290 . 8) (f71291 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# expr=((vector-ref f71290 0) f71306 f71307 (fx+ f71308 1) f71309)
# emit-tail-funcall
#    si   =-40
#    env  = ((f71309 . -36) (f71308 . -32) (f71307 . -28) (f71306 . -24) (f71309 . -20) (f71308 . -16) (f71307 . -12) (f71306 . -8) (f71290 . 8) (f71291 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
#    expr = (funcall (vector-ref f71290 0) f71306 f71307 (fx+ f71308 1) f71309)
# emit-expr (vector-ref f71290 0)
# emit-expr f71290
# emit-variable-ref
# env=((f71309 . -36) (f71308 . -32) (f71307 . -28) (f71306 . -24) (f71309 . -20) (f71308 . -16) (f71307 . -12) (f71306 . -8) (f71290 . 8) (f71291 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71290
    movl 6(%edi), %eax  # frame load f71290
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_718978
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718978:
    movl %eax, -40(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_718979"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718979:
# check bounds on vector index
    movl -40(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_718981
    cmp  $0,%eax
    jge _L_718980
_L_718981:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_718980:
    movl -40(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -40(%esp)  # stash funcall-oper in next closure slot
# emit-expr f71306
# emit-variable-ref
# env=((f71309 . -36) (f71308 . -32) (f71307 . -28) (f71306 . -24) (f71309 . -20) (f71308 . -16) (f71307 . -12) (f71306 . -8) (f71290 . 8) (f71291 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71306
    movl -24(%esp), %eax  # stack load f71306
# end emit-variable-ref
    mov %eax, -44(%esp)    # arg f71306
# emit-expr f71307
# emit-variable-ref
# env=((f71309 . -36) (f71308 . -32) (f71307 . -28) (f71306 . -24) (f71309 . -20) (f71308 . -16) (f71307 . -12) (f71306 . -8) (f71290 . 8) (f71291 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71307
    movl -28(%esp), %eax  # stack load f71307
# end emit-variable-ref
    mov %eax, -48(%esp)    # arg f71307
# emit-expr (fx+ f71308 1)
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_718982"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718982:
    movl %eax, -52(%esp)  # fx+ push arg1
# emit-expr f71308
# emit-variable-ref
# env=((f71309 . -36) (f71308 . -32) (f71307 . -28) (f71306 . -24) (f71309 . -20) (f71308 . -16) (f71307 . -12) (f71306 . -8) (f71290 . 8) (f71291 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71308
    movl -32(%esp), %eax  # stack load f71308
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_718983"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718983:
    addl -52(%esp), %eax  # fx+ arg1 arg2
    mov %eax, -52(%esp)    # arg (fx+ f71308 1)
# emit-expr f71309
# emit-variable-ref
# env=((f71309 . -36) (f71308 . -32) (f71307 . -28) (f71306 . -24) (f71309 . -20) (f71308 . -16) (f71307 . -12) (f71306 . -8) (f71290 . 8) (f71291 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71309
    movl -36(%esp), %eax  # stack load f71309
# end emit-variable-ref
    mov %eax, -56(%esp)    # arg f71309
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
    jmp _L_718972
_L_718971:
# emit-tail-expr
# si=-40
# env=((f71309 . -36) (f71308 . -32) (f71307 . -28) (f71306 . -24) (f71309 . -20) (f71308 . -16) (f71307 . -12) (f71306 . -8) (f71290 . 8) (f71291 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_718972:
_L_718968:
    .align 4,0x90
_L_718965:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71289 0 (closure (f71304 f71305) (f71292 f71290) (let ((f71304 f71304) (f71305 f71305)) (if ((vector-ref f71292 0) f71304 f71305) ((vector-ref f71290 0) f71304 f71305 0 (string-length f71304)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f71289 0 (closure (f71304 f71305) (f71292 f71290) (let ((f71304 f71304) (f71305 f71305)) (if ((vector-ref f71292 0) f71304 f71305) ((vector-ref f71290 0) f71304 f71305 0 (string-length f71304)) #f)))))
#   env=((f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# emit-expr (vector-set! f71289 0 (closure (f71304 f71305) (f71292 f71290) (let ((f71304 f71304) (f71305 f71305)) (if ((vector-ref f71292 0) f71304 f71305) ((vector-ref f71290 0) f71304 f71305 0 (string-length f71304)) #f))))
# emit-expr f71289
# emit-variable-ref
# env=((f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71289
    movl -12(%esp), %eax  # stack load f71289
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_718984
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718984:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_718985"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718985:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_718987
    cmp  $0,%eax
    jge _L_718986
_L_718987:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_718986:
    movl %eax, -20(%esp)
# emit-expr (closure (f71304 f71305) (f71292 f71290) (let ((f71304 f71304) (f71305 f71305)) (if ((vector-ref f71292 0) f71304 f71305) ((vector-ref f71290 0) f71304 f71305 0 (string-length f71304)) #f)))
# emit-closure
# si = -24
# env = ((f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# expr = (closure (f71304 f71305) (f71292 f71290) (let ((f71304 f71304) (f71305 f71305)) (if ((vector-ref f71292 0) f71304 f71305) ((vector-ref f71290 0) f71304 f71305 0 (string-length f71304)) #f)))
    movl $_L_718988, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71292
    movl 0(%esp), %eax  # stack load f71292
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f71292
# emit-variable-ref
# env=((f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71290
    movl -8(%esp), %eax  # stack load f71290
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f71290
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_718989            # jump around closure body
_L_718988:
# check argument count
    cmp $8,%eax
    je _L_718990
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_718990:
# emit-tail-expr
# si=-16
# env=((f71305 . -12) (f71304 . -8) (f71290 . 8) (f71292 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# expr=(let ((f71304 f71304) (f71305 f71305)) (if ((vector-ref f71292 0) f71304 f71305) ((vector-ref f71290 0) f71304 f71305 0 (string-length f71304)) #f))
# emit-tail-let
#  si   = -16
#  env  = ((f71305 . -12) (f71304 . -8) (f71290 . 8) (f71292 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
#  bindings = ((f71304 f71304) (f71305 f71305))
#  body = (if ((vector-ref f71292 0) f71304 f71305) ((vector-ref f71290 0) f71304 f71305 0 (string-length f71304)) #f)
# emit-expr f71304
# emit-variable-ref
# env=((f71305 . -12) (f71304 . -8) (f71290 . 8) (f71292 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71304
    movl -8(%esp), %eax  # stack load f71304
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f71305
# emit-variable-ref
# env=((f71305 . -12) (f71304 . -8) (f71290 . 8) (f71292 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71305
    movl -12(%esp), %eax  # stack load f71305
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f71305 . -20) (f71304 . -16) (f71305 . -12) (f71304 . -8) (f71290 . 8) (f71292 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# expr=(if ((vector-ref f71292 0) f71304 f71305) ((vector-ref f71290 0) f71304 f71305 0 (string-length f71304)) #f)
# emit-expr ((vector-ref f71292 0) f71304 f71305)
# funcall
#    si   =-24
#    env  = ((f71305 . -20) (f71304 . -16) (f71305 . -12) (f71304 . -8) (f71290 . 8) (f71292 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
#    expr = (funcall (vector-ref f71292 0) f71304 f71305)
# emit-expr (vector-ref f71292 0)
# emit-expr f71292
# emit-variable-ref
# env=((f71305 . -20) (f71304 . -16) (f71305 . -12) (f71304 . -8) (f71290 . 8) (f71292 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71292
    movl 2(%edi), %eax  # frame load f71292
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_718993
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718993:
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_718994"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718994:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_718996
    cmp  $0,%eax
    jge _L_718995
_L_718996:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_718995:
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_718997"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_718997":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f71304
# emit-variable-ref
# env=((f71305 . -20) (f71304 . -16) (f71305 . -12) (f71304 . -8) (f71290 . 8) (f71292 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71304
    movl -16(%esp), %eax  # stack load f71304
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f71304
# emit-expr f71305
# emit-variable-ref
# env=((f71305 . -20) (f71304 . -16) (f71305 . -12) (f71304 . -8) (f71290 . 8) (f71292 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71305
    movl -20(%esp), %eax  # stack load f71305
# end emit-variable-ref
    mov %eax, -40(%esp)  # arg f71305
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_718991
# emit-tail-expr
# si=-24
# env=((f71305 . -20) (f71304 . -16) (f71305 . -12) (f71304 . -8) (f71290 . 8) (f71292 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# expr=((vector-ref f71290 0) f71304 f71305 0 (string-length f71304))
# emit-tail-funcall
#    si   =-24
#    env  = ((f71305 . -20) (f71304 . -16) (f71305 . -12) (f71304 . -8) (f71290 . 8) (f71292 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
#    expr = (funcall (vector-ref f71290 0) f71304 f71305 0 (string-length f71304))
# emit-expr (vector-ref f71290 0)
# emit-expr f71290
# emit-variable-ref
# env=((f71305 . -20) (f71304 . -16) (f71305 . -12) (f71304 . -8) (f71290 . 8) (f71292 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71290
    movl 6(%edi), %eax  # frame load f71290
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_718998
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718998:
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_718999"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718999:
# check bounds on vector index
    movl -24(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719001
    cmp  $0,%eax
    jge _L_719000
_L_719001:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719000:
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr f71304
# emit-variable-ref
# env=((f71305 . -20) (f71304 . -16) (f71305 . -12) (f71304 . -8) (f71290 . 8) (f71292 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71304
    movl -16(%esp), %eax  # stack load f71304
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f71304
# emit-expr f71305
# emit-variable-ref
# env=((f71305 . -20) (f71304 . -16) (f71305 . -12) (f71304 . -8) (f71290 . 8) (f71292 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71305
    movl -20(%esp), %eax  # stack load f71305
# end emit-variable-ref
    mov %eax, -32(%esp)    # arg f71305
# emit-expr 0
    movl $0, %eax     # immed 0
    mov %eax, -36(%esp)    # arg 0
# emit-expr (string-length f71304)
# emit-expr f71304
# emit-variable-ref
# env=((f71305 . -20) (f71304 . -16) (f71305 . -12) (f71304 . -8) (f71290 . 8) (f71292 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71304
    movl -16(%esp), %eax  # stack load f71304
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_719002
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719002:
    movl -6(%eax), %eax
    mov %eax, -40(%esp)    # arg (string-length f71304)
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
    jmp _L_718992
_L_718991:
# emit-tail-expr
# si=-24
# env=((f71305 . -20) (f71304 . -16) (f71305 . -12) (f71304 . -8) (f71290 . 8) (f71292 . 4) (f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_718992:
    .align 4,0x90
_L_718989:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# emit-expr (begin (vector-ref f71289 0))
# emit-begin
#   expr=(begin (vector-ref f71289 0))
#   env=((f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# emit-expr (vector-ref f71289 0)
# emit-expr f71289
# emit-variable-ref
# env=((f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
# var=f71289
    movl -12(%esp), %eax  # stack load f71289
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719003
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719003:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719004"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719004:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719006
    cmp  $0,%eax
    jge _L_719005
_L_719006:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719005:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f71289 . -12) (f71290 . -8) (f71291 . -4) (f71292 . 0))
     movl %eax, string$e$q
# == explicit-begins  ==>
# (letrec ((str->sym (lambda (str symlist) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let* ((new-sym (make-symbol str #f)) (new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym)) (str->sym str (cdr symlist))))))) (lambda (str) (str->sym str (symbols))))
# == eliminate-let*  ==>
# (letrec ((str->sym (lambda (str symlist) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) (str->sym str (cdr symlist))))))) (lambda (str) (str->sym str (symbols))))
# == uniquify-variables  ==>
# (letrec ((f71315 (lambda (f71324 f71325) (if (string=? f71324 (symbol->string (car f71325))) (car f71325) (if (null? (cdr f71325)) (let ((f71329 (make-symbol f71324 #f))) (let ((f71331 (cons f71329 ()))) (begin (set-cdr! f71325 f71331) f71329))) (f71315 f71324 (cdr f71325))))))) (lambda (f71333) (f71315 f71333 (symbols))))
# == vectorize-letrec  ==>
# (let ((f71315 (make-vector 1))) (begin (begin (vector-set! f71315 0 (lambda (f71324 f71325) (if (string=? f71324 (symbol->string (car f71325))) (car f71325) (if (null? (cdr f71325)) (let ((f71329 (make-symbol f71324 #f))) (let ((f71331 (cons f71329 ()))) (begin (set-cdr! f71325 f71331) f71329))) ((vector-ref f71315 0) f71324 (cdr f71325))))))) (lambda (f71333) ((vector-ref f71315 0) f71333 (symbols)))))
# == eliminate-set!  ==>
# (let ((f71315 (make-vector 1))) (begin (begin (vector-set! f71315 0 (lambda (f71324 f71325) (let ((f71324 f71324) (f71325 f71325)) (if (string=? f71324 (symbol->string (car f71325))) (car f71325) (if (null? (cdr f71325)) (let ((f71329 (make-symbol f71324 #f))) (let ((f71331 (cons f71329 ()))) (begin (set-cdr! f71325 f71331) f71329))) ((vector-ref f71315 0) f71324 (cdr f71325)))))))) (lambda (f71333) (let ((f71333 f71333)) ((vector-ref f71315 0) f71333 (symbols))))))
# == close-free-variables  ==>
# (let ((f71315 (make-vector 1))) (begin (begin (vector-set! f71315 0 (closure (f71324 f71325) (string=? f71315) (let ((f71324 f71324) (f71325 f71325)) (if (string=? f71324 (symbol->string (car f71325))) (car f71325) (if (null? (cdr f71325)) (let ((f71329 (make-symbol f71324 #f))) (let ((f71331 (cons f71329 ()))) (begin (set-cdr! f71325 f71331) f71329))) ((vector-ref f71315 0) f71324 (cdr f71325)))))))) (closure (f71333) (f71315 symbols) (let ((f71333 f71333)) ((vector-ref f71315 0) f71333 (symbols))))))
# == eliminate-quote  ==>
# (let ((f71315 (make-vector 1))) (begin (begin (vector-set! f71315 0 (closure (f71324 f71325) (string=? f71315) (let ((f71324 f71324) (f71325 f71325)) (if (string=? f71324 (symbol->string (car f71325))) (car f71325) (if (null? (cdr f71325)) (let ((f71329 (make-symbol f71324 #f))) (let ((f71331 (cons f71329 ()))) (begin (set-cdr! f71325 f71331) f71329))) ((vector-ref f71315 0) f71324 (cdr f71325)))))))) (closure (f71333) (f71315 symbols) (let ((f71333 f71333)) ((vector-ref f71315 0) f71333 (symbols))))))
# == eliminate-when/unless  ==>
# (let ((f71315 (make-vector 1))) (begin (begin (vector-set! f71315 0 (closure (f71324 f71325) (string=? f71315) (let ((f71324 f71324) (f71325 f71325)) (if (string=? f71324 (symbol->string (car f71325))) (car f71325) (if (null? (cdr f71325)) (let ((f71329 (make-symbol f71324 #f))) (let ((f71331 (cons f71329 ()))) (begin (set-cdr! f71325 f71331) f71329))) ((vector-ref f71315 0) f71324 (cdr f71325)))))))) (closure (f71333) (f71315 symbols) (let ((f71333 f71333)) ((vector-ref f71315 0) f71333 (symbols))))))
# == eliminate-cond  ==>
# (let ((f71315 (make-vector 1))) (begin (begin (vector-set! f71315 0 (closure (f71324 f71325) (string=? f71315) (let ((f71324 f71324) (f71325 f71325)) (if (string=? f71324 (symbol->string (car f71325))) (car f71325) (if (null? (cdr f71325)) (let ((f71329 (make-symbol f71324 #f))) (let ((f71331 (cons f71329 ()))) (begin (set-cdr! f71325 f71331) f71329))) ((vector-ref f71315 0) f71324 (cdr f71325)))))))) (closure (f71333) (f71315 symbols) (let ((f71333 f71333)) ((vector-ref f71315 0) f71333 (symbols))))))
# == external-symbols  ==>
# (let ((f71315 (make-vector 1))) (begin (begin (vector-set! f71315 0 (closure (f71324 f71325) ((primitive-ref string=?) f71315) (let ((f71324 f71324) (f71325 f71325)) (if ((primitive-ref string=?) f71324 (symbol->string (car f71325))) (car f71325) (if (null? (cdr f71325)) (let ((f71329 (make-symbol f71324 #f))) (let ((f71331 (cons f71329 ()))) (begin (set-cdr! f71325 f71331) f71329))) ((vector-ref f71315 0) f71324 (cdr f71325)))))))) (closure (f71333) (f71315 (primitive-ref symbols)) (let ((f71333 f71333)) ((vector-ref f71315 0) f71333 ((primitive-ref symbols)))))))
# emit-expr (let ((f71315 (make-vector 1))) (begin (begin (vector-set! f71315 0 (closure (f71324 f71325) ((primitive-ref string=?) f71315) (let ((f71324 f71324) (f71325 f71325)) (if ((primitive-ref string=?) f71324 (symbol->string (car f71325))) (car f71325) (if (null? (cdr f71325)) (let ((f71329 (make-symbol f71324 #f))) (let ((f71331 (cons f71329 ()))) (begin (set-cdr! f71325 f71331) f71329))) ((vector-ref f71315 0) f71324 (cdr f71325)))))))) (closure (f71333) (f71315 (primitive-ref symbols)) (let ((f71333 f71333)) ((vector-ref f71315 0) f71333 ((primitive-ref symbols)))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f71315 (make-vector 1)))
#  body = (begin (begin (vector-set! f71315 0 (closure (f71324 f71325) ((primitive-ref string=?) f71315) (let ((f71324 f71324) (f71325 f71325)) (if ((primitive-ref string=?) f71324 (symbol->string (car f71325))) (car f71325) (if (null? (cdr f71325)) (let ((f71329 (make-symbol f71324 #f))) (let ((f71331 (cons f71329 ()))) (begin (set-cdr! f71325 f71331) f71329))) ((vector-ref f71315 0) f71324 (cdr f71325)))))))) (closure (f71333) (f71315 (primitive-ref symbols)) (let ((f71333 f71333)) ((vector-ref f71315 0) f71333 ((primitive-ref symbols))))))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719007"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719007:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_719008
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719008:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f71315 0 (closure (f71324 f71325) ((primitive-ref string=?) f71315) (let ((f71324 f71324) (f71325 f71325)) (if ((primitive-ref string=?) f71324 (symbol->string (car f71325))) (car f71325) (if (null? (cdr f71325)) (let ((f71329 (make-symbol f71324 #f))) (let ((f71331 (cons f71329 ()))) (begin (set-cdr! f71325 f71331) f71329))) ((vector-ref f71315 0) f71324 (cdr f71325)))))))) (closure (f71333) (f71315 (primitive-ref symbols)) (let ((f71333 f71333)) ((vector-ref f71315 0) f71333 ((primitive-ref symbols))))))
# emit-begin
#   expr=(begin (begin (vector-set! f71315 0 (closure (f71324 f71325) ((primitive-ref string=?) f71315) (let ((f71324 f71324) (f71325 f71325)) (if ((primitive-ref string=?) f71324 (symbol->string (car f71325))) (car f71325) (if (null? (cdr f71325)) (let ((f71329 (make-symbol f71324 #f))) (let ((f71331 (cons f71329 ()))) (begin (set-cdr! f71325 f71331) f71329))) ((vector-ref f71315 0) f71324 (cdr f71325)))))))) (closure (f71333) (f71315 (primitive-ref symbols)) (let ((f71333 f71333)) ((vector-ref f71315 0) f71333 ((primitive-ref symbols))))))
#   env=((f71315 . 0))
# emit-expr (begin (vector-set! f71315 0 (closure (f71324 f71325) ((primitive-ref string=?) f71315) (let ((f71324 f71324) (f71325 f71325)) (if ((primitive-ref string=?) f71324 (symbol->string (car f71325))) (car f71325) (if (null? (cdr f71325)) (let ((f71329 (make-symbol f71324 #f))) (let ((f71331 (cons f71329 ()))) (begin (set-cdr! f71325 f71331) f71329))) ((vector-ref f71315 0) f71324 (cdr f71325))))))))
# emit-begin
#   expr=(begin (vector-set! f71315 0 (closure (f71324 f71325) ((primitive-ref string=?) f71315) (let ((f71324 f71324) (f71325 f71325)) (if ((primitive-ref string=?) f71324 (symbol->string (car f71325))) (car f71325) (if (null? (cdr f71325)) (let ((f71329 (make-symbol f71324 #f))) (let ((f71331 (cons f71329 ()))) (begin (set-cdr! f71325 f71331) f71329))) ((vector-ref f71315 0) f71324 (cdr f71325))))))))
#   env=((f71315 . 0))
# emit-expr (vector-set! f71315 0 (closure (f71324 f71325) ((primitive-ref string=?) f71315) (let ((f71324 f71324) (f71325 f71325)) (if ((primitive-ref string=?) f71324 (symbol->string (car f71325))) (car f71325) (if (null? (cdr f71325)) (let ((f71329 (make-symbol f71324 #f))) (let ((f71331 (cons f71329 ()))) (begin (set-cdr! f71325 f71331) f71329))) ((vector-ref f71315 0) f71324 (cdr f71325)))))))
# emit-expr f71315
# emit-variable-ref
# env=((f71315 . 0))
# var=f71315
    movl 0(%esp), %eax  # stack load f71315
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719009
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719009:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719010"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719010:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719012
    cmp  $0,%eax
    jge _L_719011
_L_719012:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719011:
    movl %eax, -8(%esp)
# emit-expr (closure (f71324 f71325) ((primitive-ref string=?) f71315) (let ((f71324 f71324) (f71325 f71325)) (if ((primitive-ref string=?) f71324 (symbol->string (car f71325))) (car f71325) (if (null? (cdr f71325)) (let ((f71329 (make-symbol f71324 #f))) (let ((f71331 (cons f71329 ()))) (begin (set-cdr! f71325 f71331) f71329))) ((vector-ref f71315 0) f71324 (cdr f71325))))))
# emit-closure
# si = -12
# env = ((f71315 . 0))
# expr = (closure (f71324 f71325) ((primitive-ref string=?) f71315) (let ((f71324 f71324) (f71325 f71325)) (if ((primitive-ref string=?) f71324 (symbol->string (car f71325))) (car f71325) (if (null? (cdr f71325)) (let ((f71329 (make-symbol f71324 #f))) (let ((f71331 (cons f71329 ()))) (begin (set-cdr! f71325 f71331) f71329))) ((vector-ref f71315 0) f71324 (cdr f71325))))))
    movl $_L_719013, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref string=?) not defined in the environmnet
# emit-variable-ref
# env=((f71315 . 0))
# var=f71315
    movl 0(%esp), %eax  # stack load f71315
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f71315
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_719014            # jump around closure body
_L_719013:
# check argument count
    cmp $8,%eax
    je _L_719015
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_719015:
# emit-tail-expr
# si=-16
# env=((f71325 . -12) (f71324 . -8) (f71315 . 8) ((primitive-ref string=?) . 4) (f71315 . 0))
# expr=(let ((f71324 f71324) (f71325 f71325)) (if ((primitive-ref string=?) f71324 (symbol->string (car f71325))) (car f71325) (if (null? (cdr f71325)) (let ((f71329 (make-symbol f71324 #f))) (let ((f71331 (cons f71329 ()))) (begin (set-cdr! f71325 f71331) f71329))) ((vector-ref f71315 0) f71324 (cdr f71325)))))
# emit-tail-let
#  si   = -16
#  env  = ((f71325 . -12) (f71324 . -8) (f71315 . 8) ((primitive-ref string=?) . 4) (f71315 . 0))
#  bindings = ((f71324 f71324) (f71325 f71325))
#  body = (if ((primitive-ref string=?) f71324 (symbol->string (car f71325))) (car f71325) (if (null? (cdr f71325)) (let ((f71329 (make-symbol f71324 #f))) (let ((f71331 (cons f71329 ()))) (begin (set-cdr! f71325 f71331) f71329))) ((vector-ref f71315 0) f71324 (cdr f71325))))
# emit-expr f71324
# emit-variable-ref
# env=((f71325 . -12) (f71324 . -8) (f71315 . 8) ((primitive-ref string=?) . 4) (f71315 . 0))
# var=f71324
    movl -8(%esp), %eax  # stack load f71324
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f71325
# emit-variable-ref
# env=((f71325 . -12) (f71324 . -8) (f71315 . 8) ((primitive-ref string=?) . 4) (f71315 . 0))
# var=f71325
    movl -12(%esp), %eax  # stack load f71325
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f71325 . -20) (f71324 . -16) (f71325 . -12) (f71324 . -8) (f71315 . 8) ((primitive-ref string=?) . 4) (f71315 . 0))
# expr=(if ((primitive-ref string=?) f71324 (symbol->string (car f71325))) (car f71325) (if (null? (cdr f71325)) (let ((f71329 (make-symbol f71324 #f))) (let ((f71331 (cons f71329 ()))) (begin (set-cdr! f71325 f71331) f71329))) ((vector-ref f71315 0) f71324 (cdr f71325))))
# emit-expr ((primitive-ref string=?) f71324 (symbol->string (car f71325)))
# funcall
#    si   =-24
#    env  = ((f71325 . -20) (f71324 . -16) (f71325 . -12) (f71324 . -8) (f71315 . 8) ((primitive-ref string=?) . 4) (f71315 . 0))
#    expr = (funcall (primitive-ref string=?) f71324 (symbol->string (car f71325)))
# emit-expr (primitive-ref string=?)
    .extern string$e$q
    movl string$e$q,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719018"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719018":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f71324
# emit-variable-ref
# env=((f71325 . -20) (f71324 . -16) (f71325 . -12) (f71324 . -8) (f71315 . 8) ((primitive-ref string=?) . 4) (f71315 . 0))
# var=f71324
    movl -16(%esp), %eax  # stack load f71324
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f71324
# emit-expr (symbol->string (car f71325))
# symbol->string (car f71325)
# emit-expr (car f71325)
# emit-expr f71325
# emit-variable-ref
# env=((f71325 . -20) (f71324 . -16) (f71325 . -12) (f71324 . -8) (f71315 . 8) ((primitive-ref string=?) . 4) (f71315 . 0))
# var=f71325
    movl -20(%esp), %eax  # stack load f71325
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_719019
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719019:
    movl -1(%eax), %eax
    movl -3(%eax), %eax
    mov %eax, -40(%esp)  # arg (symbol->string (car f71325))
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_719016
# emit-tail-expr
# si=-24
# env=((f71325 . -20) (f71324 . -16) (f71325 . -12) (f71324 . -8) (f71315 . 8) ((primitive-ref string=?) . 4) (f71315 . 0))
# expr=(car f71325)
# tail primcall
# emit-expr f71325
# emit-variable-ref
# env=((f71325 . -20) (f71324 . -16) (f71325 . -12) (f71324 . -8) (f71315 . 8) ((primitive-ref string=?) . 4) (f71315 . 0))
# var=f71325
    movl -20(%esp), %eax  # stack load f71325
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_719020
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719020:
    movl -1(%eax), %eax
#return from tail (car f71325)
    ret
    jmp _L_719017
_L_719016:
# emit-tail-expr
# si=-24
# env=((f71325 . -20) (f71324 . -16) (f71325 . -12) (f71324 . -8) (f71315 . 8) ((primitive-ref string=?) . 4) (f71315 . 0))
# expr=(if (null? (cdr f71325)) (let ((f71329 (make-symbol f71324 #f))) (let ((f71331 (cons f71329 ()))) (begin (set-cdr! f71325 f71331) f71329))) ((vector-ref f71315 0) f71324 (cdr f71325)))
# emit-expr (null? (cdr f71325))
# emit-expr (cdr f71325)
# emit-expr f71325
# emit-variable-ref
# env=((f71325 . -20) (f71324 . -16) (f71325 . -12) (f71324 . -8) (f71315 . 8) ((primitive-ref string=?) . 4) (f71315 . 0))
# var=f71325
    movl -20(%esp), %eax  # stack load f71325
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_719023
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719023:
    movl 3(%eax), %eax
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_719021
# emit-tail-expr
# si=-24
# env=((f71325 . -20) (f71324 . -16) (f71325 . -12) (f71324 . -8) (f71315 . 8) ((primitive-ref string=?) . 4) (f71315 . 0))
# expr=(let ((f71329 (make-symbol f71324 #f))) (let ((f71331 (cons f71329 ()))) (begin (set-cdr! f71325 f71331) f71329)))
# emit-tail-let
#  si   = -24
#  env  = ((f71325 . -20) (f71324 . -16) (f71325 . -12) (f71324 . -8) (f71315 . 8) ((primitive-ref string=?) . 4) (f71315 . 0))
#  bindings = ((f71329 (make-symbol f71324 #f)))
#  body = (let ((f71331 (cons f71329 ()))) (begin (set-cdr! f71325 f71331) f71329))
# emit-expr (make-symbol f71324 #f)
# make-symbol arg1=f71324 arg2=#f
# emit-expr f71324
# emit-variable-ref
# env=((f71325 . -20) (f71324 . -16) (f71325 . -12) (f71324 . -8) (f71315 . 8) ((primitive-ref string=?) . 4) (f71315 . 0))
# var=f71324
    movl -16(%esp), %eax  # stack load f71324
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
# env=((f71329 . -24) (f71325 . -20) (f71324 . -16) (f71325 . -12) (f71324 . -8) (f71315 . 8) ((primitive-ref string=?) . 4) (f71315 . 0))
# expr=(let ((f71331 (cons f71329 ()))) (begin (set-cdr! f71325 f71331) f71329))
# emit-tail-let
#  si   = -28
#  env  = ((f71329 . -24) (f71325 . -20) (f71324 . -16) (f71325 . -12) (f71324 . -8) (f71315 . 8) ((primitive-ref string=?) . 4) (f71315 . 0))
#  bindings = ((f71331 (cons f71329 ())))
#  body = (begin (set-cdr! f71325 f71331) f71329)
# emit-expr (cons f71329 ())
# cons arg1=f71329 arg2=()
# emit-expr f71329
# emit-variable-ref
# env=((f71329 . -24) (f71325 . -20) (f71324 . -16) (f71325 . -12) (f71324 . -8) (f71315 . 8) ((primitive-ref string=?) . 4) (f71315 . 0))
# var=f71329
    movl -24(%esp), %eax  # stack load f71329
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
# env=((f71331 . -28) (f71329 . -24) (f71325 . -20) (f71324 . -16) (f71325 . -12) (f71324 . -8) (f71315 . 8) ((primitive-ref string=?) . 4) (f71315 . 0))
# expr=(begin (set-cdr! f71325 f71331) f71329)
# tail-begin (begin (set-cdr! f71325 f71331) f71329)
#   env=((f71331 . -28) (f71329 . -24) (f71325 . -20) (f71324 . -16) (f71325 . -12) (f71324 . -8) (f71315 . 8) ((primitive-ref string=?) . 4) (f71315 . 0))
# emit-expr (set-cdr! f71325 f71331)
# emit-expr f71325
# emit-variable-ref
# env=((f71331 . -28) (f71329 . -24) (f71325 . -20) (f71324 . -16) (f71325 . -12) (f71324 . -8) (f71315 . 8) ((primitive-ref string=?) . 4) (f71315 . 0))
# var=f71325
    movl -20(%esp), %eax  # stack load f71325
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_719024
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719024:
    movl %eax, -32(%esp)
# emit-expr f71331
# emit-variable-ref
# env=((f71331 . -28) (f71329 . -24) (f71325 . -20) (f71324 . -16) (f71325 . -12) (f71324 . -8) (f71315 . 8) ((primitive-ref string=?) . 4) (f71315 . 0))
# var=f71331
    movl -28(%esp), %eax  # stack load f71331
# end emit-variable-ref
    movl -32(%esp), %ebx
    movl %eax, 3(%ebx)
# emit-tail-expr
# si=-32
# env=((f71331 . -28) (f71329 . -24) (f71325 . -20) (f71324 . -16) (f71325 . -12) (f71324 . -8) (f71315 . 8) ((primitive-ref string=?) . 4) (f71315 . 0))
# expr=(begin f71329)
# tail-begin (begin f71329)
#   env=((f71331 . -28) (f71329 . -24) (f71325 . -20) (f71324 . -16) (f71325 . -12) (f71324 . -8) (f71315 . 8) ((primitive-ref string=?) . 4) (f71315 . 0))
# emit-tail-expr
# si=-32
# env=((f71331 . -28) (f71329 . -24) (f71325 . -20) (f71324 . -16) (f71325 . -12) (f71324 . -8) (f71315 . 8) ((primitive-ref string=?) . 4) (f71315 . 0))
# expr=f71329
# emit-tail-variable-ref
# emit-variable-ref
# env=((f71331 . -28) (f71329 . -24) (f71325 . -20) (f71324 . -16) (f71325 . -12) (f71324 . -8) (f71315 . 8) ((primitive-ref string=?) . 4) (f71315 . 0))
# var=f71329
    movl -24(%esp), %eax  # stack load f71329
# end emit-variable-ref
    ret
# end emit-tail-variable ref
     ret   # return thru stack
    jmp _L_719022
_L_719021:
# emit-tail-expr
# si=-24
# env=((f71325 . -20) (f71324 . -16) (f71325 . -12) (f71324 . -8) (f71315 . 8) ((primitive-ref string=?) . 4) (f71315 . 0))
# expr=((vector-ref f71315 0) f71324 (cdr f71325))
# emit-tail-funcall
#    si   =-24
#    env  = ((f71325 . -20) (f71324 . -16) (f71325 . -12) (f71324 . -8) (f71315 . 8) ((primitive-ref string=?) . 4) (f71315 . 0))
#    expr = (funcall (vector-ref f71315 0) f71324 (cdr f71325))
# emit-expr (vector-ref f71315 0)
# emit-expr f71315
# emit-variable-ref
# env=((f71325 . -20) (f71324 . -16) (f71325 . -12) (f71324 . -8) (f71315 . 8) ((primitive-ref string=?) . 4) (f71315 . 0))
# var=f71315
    movl 6(%edi), %eax  # frame load f71315
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719025
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719025:
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719026"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719026:
# check bounds on vector index
    movl -24(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719028
    cmp  $0,%eax
    jge _L_719027
_L_719028:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719027:
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr f71324
# emit-variable-ref
# env=((f71325 . -20) (f71324 . -16) (f71325 . -12) (f71324 . -8) (f71315 . 8) ((primitive-ref string=?) . 4) (f71315 . 0))
# var=f71324
    movl -16(%esp), %eax  # stack load f71324
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f71324
# emit-expr (cdr f71325)
# emit-expr f71325
# emit-variable-ref
# env=((f71325 . -20) (f71324 . -16) (f71325 . -12) (f71324 . -8) (f71315 . 8) ((primitive-ref string=?) . 4) (f71315 . 0))
# var=f71325
    movl -20(%esp), %eax  # stack load f71325
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_719029
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719029:
    movl 3(%eax), %eax
    mov %eax, -32(%esp)    # arg (cdr f71325)
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
_L_719022:
_L_719017:
    .align 4,0x90
_L_719014:
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f71315 . 0))
# emit-expr (begin (closure (f71333) (f71315 (primitive-ref symbols)) (let ((f71333 f71333)) ((vector-ref f71315 0) f71333 ((primitive-ref symbols))))))
# emit-begin
#   expr=(begin (closure (f71333) (f71315 (primitive-ref symbols)) (let ((f71333 f71333)) ((vector-ref f71315 0) f71333 ((primitive-ref symbols))))))
#   env=((f71315 . 0))
# emit-expr (closure (f71333) (f71315 (primitive-ref symbols)) (let ((f71333 f71333)) ((vector-ref f71315 0) f71333 ((primitive-ref symbols)))))
# emit-closure
# si = -4
# env = ((f71315 . 0))
# expr = (closure (f71333) (f71315 (primitive-ref symbols)) (let ((f71333 f71333)) ((vector-ref f71315 0) f71333 ((primitive-ref symbols)))))
    movl $_L_719030, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f71315 . 0))
# var=f71315
    movl 0(%esp), %eax  # stack load f71315
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f71315
# WARNING: free var (primitive-ref symbols) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_719031            # jump around closure body
_L_719030:
# check argument count
    cmp $4,%eax
    je _L_719032
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_719032:
# emit-tail-expr
# si=-12
# env=((f71333 . -8) ((primitive-ref symbols) . 8) (f71315 . 4) (f71315 . 0))
# expr=(let ((f71333 f71333)) ((vector-ref f71315 0) f71333 ((primitive-ref symbols))))
# emit-tail-let
#  si   = -12
#  env  = ((f71333 . -8) ((primitive-ref symbols) . 8) (f71315 . 4) (f71315 . 0))
#  bindings = ((f71333 f71333))
#  body = ((vector-ref f71315 0) f71333 ((primitive-ref symbols)))
# emit-expr f71333
# emit-variable-ref
# env=((f71333 . -8) ((primitive-ref symbols) . 8) (f71315 . 4) (f71315 . 0))
# var=f71333
    movl -8(%esp), %eax  # stack load f71333
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f71333 . -12) (f71333 . -8) ((primitive-ref symbols) . 8) (f71315 . 4) (f71315 . 0))
# expr=((vector-ref f71315 0) f71333 ((primitive-ref symbols)))
# emit-tail-funcall
#    si   =-16
#    env  = ((f71333 . -12) (f71333 . -8) ((primitive-ref symbols) . 8) (f71315 . 4) (f71315 . 0))
#    expr = (funcall (vector-ref f71315 0) f71333 ((primitive-ref symbols)))
# emit-expr (vector-ref f71315 0)
# emit-expr f71315
# emit-variable-ref
# env=((f71333 . -12) (f71333 . -8) ((primitive-ref symbols) . 8) (f71315 . 4) (f71315 . 0))
# var=f71315
    movl 2(%edi), %eax  # frame load f71315
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719033
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719033:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719034"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719034:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719036
    cmp  $0,%eax
    jge _L_719035
_L_719036:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719035:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr f71333
# emit-variable-ref
# env=((f71333 . -12) (f71333 . -8) ((primitive-ref symbols) . 8) (f71315 . 4) (f71315 . 0))
# var=f71333
    movl -12(%esp), %eax  # stack load f71333
# end emit-variable-ref
    mov %eax, -20(%esp)    # arg f71333
# emit-expr ((primitive-ref symbols))
# funcall
#    si   =-24
#    env  = ((f71333 . -12) (f71333 . -8) ((primitive-ref symbols) . 8) (f71315 . 4) (f71315 . 0))
#    expr = (funcall (primitive-ref symbols))
# emit-expr (primitive-ref symbols)
    .extern symbols
    movl symbols,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719037"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719037":
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
_L_719031:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f71315 . 0))
     movl %eax, string$m$gsymbol
# == explicit-begins  ==>
# (lambda (lst elt) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt))))
# == eliminate-let*  ==>
# (lambda (lst elt) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt))))
# == uniquify-variables  ==>
# (lambda (f71334 f71335) (if (null? f71334) (cons e nil) (cons (car f71334) (append1 (cdr f71334) f71335))))
# == vectorize-letrec  ==>
# (lambda (f71334 f71335) (if (null? f71334) (cons e nil) (cons (car f71334) (append1 (cdr f71334) f71335))))
# == eliminate-set!  ==>
# (lambda (f71334 f71335) (let ((f71334 f71334) (f71335 f71335)) (if (null? f71334) (cons e nil) (cons (car f71334) (append1 (cdr f71334) f71335)))))
# == close-free-variables  ==>
# (closure (f71334 f71335) (e nil append1) (let ((f71334 f71334) (f71335 f71335)) (if (null? f71334) (cons e nil) (cons (car f71334) (append1 (cdr f71334) f71335)))))
# == eliminate-quote  ==>
# (closure (f71334 f71335) (e nil append1) (let ((f71334 f71334) (f71335 f71335)) (if (null? f71334) (cons e nil) (cons (car f71334) (append1 (cdr f71334) f71335)))))
# == eliminate-when/unless  ==>
# (closure (f71334 f71335) (e nil append1) (let ((f71334 f71334) (f71335 f71335)) (if (null? f71334) (cons e nil) (cons (car f71334) (append1 (cdr f71334) f71335)))))
# == eliminate-cond  ==>
# (closure (f71334 f71335) (e nil append1) (let ((f71334 f71334) (f71335 f71335)) (if (null? f71334) (cons e nil) (cons (car f71334) (append1 (cdr f71334) f71335)))))
# == external-symbols  ==>
# (closure (f71334 f71335) (e nil (primitive-ref append1)) (let ((f71334 f71334) (f71335 f71335)) (if (null? f71334) (cons e nil) (cons (car f71334) ((primitive-ref append1) (cdr f71334) f71335)))))
# emit-expr (closure (f71334 f71335) (e nil (primitive-ref append1)) (let ((f71334 f71334) (f71335 f71335)) (if (null? f71334) (cons e nil) (cons (car f71334) ((primitive-ref append1) (cdr f71334) f71335)))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f71334 f71335) (e nil (primitive-ref append1)) (let ((f71334 f71334) (f71335 f71335)) (if (null? f71334) (cons e nil) (cons (car f71334) ((primitive-ref append1) (cdr f71334) f71335)))))
    movl $_L_719038, 0(%ebp)  # closure label
# WARNING: free var e not defined in the environmnet
# WARNING: free var nil not defined in the environmnet
# WARNING: free var (primitive-ref append1) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_719039            # jump around closure body
_L_719038:
# check argument count
    cmp $8,%eax
    je _L_719040
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_719040:
# emit-tail-expr
# si=-16
# env=((f71335 . -12) (f71334 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(let ((f71334 f71334) (f71335 f71335)) (if (null? f71334) (cons e nil) (cons (car f71334) ((primitive-ref append1) (cdr f71334) f71335))))
# emit-tail-let
#  si   = -16
#  env  = ((f71335 . -12) (f71334 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
#  bindings = ((f71334 f71334) (f71335 f71335))
#  body = (if (null? f71334) (cons e nil) (cons (car f71334) ((primitive-ref append1) (cdr f71334) f71335)))
# emit-expr f71334
# emit-variable-ref
# env=((f71335 . -12) (f71334 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f71334
    movl -8(%esp), %eax  # stack load f71334
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f71335
# emit-variable-ref
# env=((f71335 . -12) (f71334 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f71335
    movl -12(%esp), %eax  # stack load f71335
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f71335 . -20) (f71334 . -16) (f71335 . -12) (f71334 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(if (null? f71334) (cons e nil) (cons (car f71334) ((primitive-ref append1) (cdr f71334) f71335)))
# emit-expr (null? f71334)
# emit-expr f71334
# emit-variable-ref
# env=((f71335 . -20) (f71334 . -16) (f71335 . -12) (f71334 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f71334
    movl -16(%esp), %eax  # stack load f71334
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_719041
# emit-tail-expr
# si=-24
# env=((f71335 . -20) (f71334 . -16) (f71335 . -12) (f71334 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(cons e nil)
# tail primcall
# cons arg1=e arg2=nil
# emit-expr e
# emit-variable-ref
# env=((f71335 . -20) (f71334 . -16) (f71335 . -12) (f71334 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=e
    movl 2(%edi), %eax  # frame load e
# end emit-variable-ref
    movl %eax, -24(%esp)
# emit-expr nil
# emit-variable-ref
# env=((f71335 . -20) (f71334 . -16) (f71335 . -12) (f71334 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
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
    jmp _L_719042
_L_719041:
# emit-tail-expr
# si=-24
# env=((f71335 . -20) (f71334 . -16) (f71335 . -12) (f71334 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(cons (car f71334) ((primitive-ref append1) (cdr f71334) f71335))
# tail primcall
# cons arg1=(car f71334) arg2=((primitive-ref append1) (cdr f71334) f71335)
# emit-expr (car f71334)
# emit-expr f71334
# emit-variable-ref
# env=((f71335 . -20) (f71334 . -16) (f71335 . -12) (f71334 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f71334
    movl -16(%esp), %eax  # stack load f71334
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_719043
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719043:
    movl -1(%eax), %eax
    movl %eax, -24(%esp)
# emit-expr ((primitive-ref append1) (cdr f71334) f71335)
# funcall
#    si   =-28
#    env  = ((f71335 . -20) (f71334 . -16) (f71335 . -12) (f71334 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
#    expr = (funcall (primitive-ref append1) (cdr f71334) f71335)
# emit-expr (primitive-ref append1)
    .extern append1
    movl append1,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719044"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719044":
   movl %eax,  -36(%esp)  # stash funcall-oper in closure slot
# emit-expr (cdr f71334)
# emit-expr f71334
# emit-variable-ref
# env=((f71335 . -20) (f71334 . -16) (f71335 . -12) (f71334 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f71334
    movl -16(%esp), %eax  # stack load f71334
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_719045
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719045:
    movl 3(%eax), %eax
    mov %eax, -40(%esp)  # arg (cdr f71334)
# emit-expr f71335
# emit-variable-ref
# env=((f71335 . -20) (f71334 . -16) (f71335 . -12) (f71334 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f71335
    movl -20(%esp), %eax  # stack load f71335
# end emit-variable-ref
    mov %eax, -44(%esp)  # arg f71335
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
#return from tail (cons (car f71334) ((primitive-ref append1) (cdr f71334) f71335))
    ret
_L_719042:
    .align 4,0x90
_L_719039:
     movl %eax, append1
# == explicit-begins  ==>
# (lambda (l k) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1))))
# == eliminate-let*  ==>
# (lambda (l k) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1))))
# == uniquify-variables  ==>
# (lambda (f71336 f71337) (if (fx= f71337 0) (car f71336) (list-ref (cdr f71336) (fx- f71337 1))))
# == vectorize-letrec  ==>
# (lambda (f71336 f71337) (if (fx= f71337 0) (car f71336) (list-ref (cdr f71336) (fx- f71337 1))))
# == eliminate-set!  ==>
# (lambda (f71336 f71337) (let ((f71336 f71336) (f71337 f71337)) (if (fx= f71337 0) (car f71336) (list-ref (cdr f71336) (fx- f71337 1)))))
# == close-free-variables  ==>
# (closure (f71336 f71337) (list-ref) (let ((f71336 f71336) (f71337 f71337)) (if (fx= f71337 0) (car f71336) (list-ref (cdr f71336) (fx- f71337 1)))))
# == eliminate-quote  ==>
# (closure (f71336 f71337) (list-ref) (let ((f71336 f71336) (f71337 f71337)) (if (fx= f71337 0) (car f71336) (list-ref (cdr f71336) (fx- f71337 1)))))
# == eliminate-when/unless  ==>
# (closure (f71336 f71337) (list-ref) (let ((f71336 f71336) (f71337 f71337)) (if (fx= f71337 0) (car f71336) (list-ref (cdr f71336) (fx- f71337 1)))))
# == eliminate-cond  ==>
# (closure (f71336 f71337) (list-ref) (let ((f71336 f71336) (f71337 f71337)) (if (fx= f71337 0) (car f71336) (list-ref (cdr f71336) (fx- f71337 1)))))
# == external-symbols  ==>
# (closure (f71336 f71337) ((primitive-ref list-ref)) (let ((f71336 f71336) (f71337 f71337)) (if (fx= f71337 0) (car f71336) ((primitive-ref list-ref) (cdr f71336) (fx- f71337 1)))))
# emit-expr (closure (f71336 f71337) ((primitive-ref list-ref)) (let ((f71336 f71336) (f71337 f71337)) (if (fx= f71337 0) (car f71336) ((primitive-ref list-ref) (cdr f71336) (fx- f71337 1)))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f71336 f71337) ((primitive-ref list-ref)) (let ((f71336 f71336) (f71337 f71337)) (if (fx= f71337 0) (car f71336) ((primitive-ref list-ref) (cdr f71336) (fx- f71337 1)))))
    movl $_L_719046, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_719047            # jump around closure body
_L_719046:
# check argument count
    cmp $8,%eax
    je _L_719048
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_719048:
# emit-tail-expr
# si=-16
# env=((f71337 . -12) (f71336 . -8) ((primitive-ref list-ref) . 4))
# expr=(let ((f71336 f71336) (f71337 f71337)) (if (fx= f71337 0) (car f71336) ((primitive-ref list-ref) (cdr f71336) (fx- f71337 1))))
# emit-tail-let
#  si   = -16
#  env  = ((f71337 . -12) (f71336 . -8) ((primitive-ref list-ref) . 4))
#  bindings = ((f71336 f71336) (f71337 f71337))
#  body = (if (fx= f71337 0) (car f71336) ((primitive-ref list-ref) (cdr f71336) (fx- f71337 1)))
# emit-expr f71336
# emit-variable-ref
# env=((f71337 . -12) (f71336 . -8) ((primitive-ref list-ref) . 4))
# var=f71336
    movl -8(%esp), %eax  # stack load f71336
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f71337
# emit-variable-ref
# env=((f71337 . -12) (f71336 . -8) ((primitive-ref list-ref) . 4))
# var=f71337
    movl -12(%esp), %eax  # stack load f71337
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f71337 . -20) (f71336 . -16) (f71337 . -12) (f71336 . -8) ((primitive-ref list-ref) . 4))
# expr=(if (fx= f71337 0) (car f71336) ((primitive-ref list-ref) (cdr f71336) (fx- f71337 1)))
# emit-expr (fx= f71337 0)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719051"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719051:
    movl %eax, -24(%esp)
# emit-expr f71337
# emit-variable-ref
# env=((f71337 . -20) (f71336 . -16) (f71337 . -12) (f71336 . -8) ((primitive-ref list-ref) . 4))
# var=f71337
    movl -20(%esp), %eax  # stack load f71337
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719052"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719052:
    cmp -24(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_719049
# emit-tail-expr
# si=-24
# env=((f71337 . -20) (f71336 . -16) (f71337 . -12) (f71336 . -8) ((primitive-ref list-ref) . 4))
# expr=(car f71336)
# tail primcall
# emit-expr f71336
# emit-variable-ref
# env=((f71337 . -20) (f71336 . -16) (f71337 . -12) (f71336 . -8) ((primitive-ref list-ref) . 4))
# var=f71336
    movl -16(%esp), %eax  # stack load f71336
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_719053
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719053:
    movl -1(%eax), %eax
#return from tail (car f71336)
    ret
    jmp _L_719050
_L_719049:
# emit-tail-expr
# si=-24
# env=((f71337 . -20) (f71336 . -16) (f71337 . -12) (f71336 . -8) ((primitive-ref list-ref) . 4))
# expr=((primitive-ref list-ref) (cdr f71336) (fx- f71337 1))
# emit-tail-funcall
#    si   =-24
#    env  = ((f71337 . -20) (f71336 . -16) (f71337 . -12) (f71336 . -8) ((primitive-ref list-ref) . 4))
#    expr = (funcall (primitive-ref list-ref) (cdr f71336) (fx- f71337 1))
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr (cdr f71336)
# emit-expr f71336
# emit-variable-ref
# env=((f71337 . -20) (f71336 . -16) (f71337 . -12) (f71336 . -8) ((primitive-ref list-ref) . 4))
# var=f71336
    movl -16(%esp), %eax  # stack load f71336
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_719054
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719054:
    movl 3(%eax), %eax
    mov %eax, -28(%esp)    # arg (cdr f71336)
# emit-expr (fx- f71337 1)
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719055"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $84,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719055:
    movl %eax, -32(%esp)
# emit-expr f71337
# emit-variable-ref
# env=((f71337 . -20) (f71336 . -16) (f71337 . -12) (f71336 . -8) ((primitive-ref list-ref) . 4))
# var=f71337
    movl -20(%esp), %eax  # stack load f71337
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719056"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $84,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719056:
    subl -32(%esp), %eax
    mov %eax, -32(%esp)    # arg (fx- f71337 1)
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
_L_719050:
    .align 4,0x90
_L_719047:
     movl %eax, list$mref
# == explicit-begins  ==>
# (lambda (l) (if (null? l) 0 (fxadd1 (list-length (cdr l)))))
# == eliminate-let*  ==>
# (lambda (l) (if (null? l) 0 (fxadd1 (list-length (cdr l)))))
# == uniquify-variables  ==>
# (lambda (f71338) (if (null? f71338) 0 (fxadd1 (list-length (cdr f71338)))))
# == vectorize-letrec  ==>
# (lambda (f71338) (if (null? f71338) 0 (fxadd1 (list-length (cdr f71338)))))
# == eliminate-set!  ==>
# (lambda (f71338) (let ((f71338 f71338)) (if (null? f71338) 0 (fxadd1 (list-length (cdr f71338))))))
# == close-free-variables  ==>
# (closure (f71338) (list-length) (let ((f71338 f71338)) (if (null? f71338) 0 (fxadd1 (list-length (cdr f71338))))))
# == eliminate-quote  ==>
# (closure (f71338) (list-length) (let ((f71338 f71338)) (if (null? f71338) 0 (fxadd1 (list-length (cdr f71338))))))
# == eliminate-when/unless  ==>
# (closure (f71338) (list-length) (let ((f71338 f71338)) (if (null? f71338) 0 (fxadd1 (list-length (cdr f71338))))))
# == eliminate-cond  ==>
# (closure (f71338) (list-length) (let ((f71338 f71338)) (if (null? f71338) 0 (fxadd1 (list-length (cdr f71338))))))
# == external-symbols  ==>
# (closure (f71338) ((primitive-ref list-length)) (let ((f71338 f71338)) (if (null? f71338) 0 (fxadd1 ((primitive-ref list-length) (cdr f71338))))))
# emit-expr (closure (f71338) ((primitive-ref list-length)) (let ((f71338 f71338)) (if (null? f71338) 0 (fxadd1 ((primitive-ref list-length) (cdr f71338))))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f71338) ((primitive-ref list-length)) (let ((f71338 f71338)) (if (null? f71338) 0 (fxadd1 ((primitive-ref list-length) (cdr f71338))))))
    movl $_L_719057, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref list-length) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_719058            # jump around closure body
_L_719057:
# check argument count
    cmp $4,%eax
    je _L_719059
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_719059:
# emit-tail-expr
# si=-12
# env=((f71338 . -8) ((primitive-ref list-length) . 4))
# expr=(let ((f71338 f71338)) (if (null? f71338) 0 (fxadd1 ((primitive-ref list-length) (cdr f71338)))))
# emit-tail-let
#  si   = -12
#  env  = ((f71338 . -8) ((primitive-ref list-length) . 4))
#  bindings = ((f71338 f71338))
#  body = (if (null? f71338) 0 (fxadd1 ((primitive-ref list-length) (cdr f71338))))
# emit-expr f71338
# emit-variable-ref
# env=((f71338 . -8) ((primitive-ref list-length) . 4))
# var=f71338
    movl -8(%esp), %eax  # stack load f71338
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f71338 . -12) (f71338 . -8) ((primitive-ref list-length) . 4))
# expr=(if (null? f71338) 0 (fxadd1 ((primitive-ref list-length) (cdr f71338))))
# emit-expr (null? f71338)
# emit-expr f71338
# emit-variable-ref
# env=((f71338 . -12) (f71338 . -8) ((primitive-ref list-length) . 4))
# var=f71338
    movl -12(%esp), %eax  # stack load f71338
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_719060
# emit-tail-expr
# si=-16
# env=((f71338 . -12) (f71338 . -8) ((primitive-ref list-length) . 4))
# expr=0
    movl $0, %eax     # immed 0
    ret                  # immediate tail return
    jmp _L_719061
_L_719060:
# emit-tail-expr
# si=-16
# env=((f71338 . -12) (f71338 . -8) ((primitive-ref list-length) . 4))
# expr=(fxadd1 ((primitive-ref list-length) (cdr f71338)))
# tail primcall
# emit-expr ((primitive-ref list-length) (cdr f71338))
# funcall
#    si   =-16
#    env  = ((f71338 . -12) (f71338 . -8) ((primitive-ref list-length) . 4))
#    expr = (funcall (primitive-ref list-length) (cdr f71338))
# emit-expr (primitive-ref list-length)
    .extern list$mlength
    movl list$mlength,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719062"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719062":
   movl %eax,  -24(%esp)  # stash funcall-oper in closure slot
# emit-expr (cdr f71338)
# emit-expr f71338
# emit-variable-ref
# env=((f71338 . -12) (f71338 . -8) ((primitive-ref list-length) . 4))
# var=f71338
    movl -12(%esp), %eax  # stack load f71338
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_719063
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719063:
    movl 3(%eax), %eax
    mov %eax, -28(%esp)  # arg (cdr f71338)
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
    je "_L_719064"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $48,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719064:
     addl $4, %eax
#return from tail (fxadd1 ((primitive-ref list-length) (cdr f71338)))
    ret
_L_719061:
    .align 4,0x90
_L_719058:
     movl %eax, list$mlength
# == explicit-begins  ==>
# (let* ((write-stderr (lambda (s) (foreign-call "s_write" 2 s (string-length s)))) (write-errmsg (lambda (sym emsg) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))))) (lambda (sym emsg) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))
# == eliminate-let*  ==>
# (let ((write-stderr (lambda (s) (foreign-call "s_write" 2 s (string-length s))))) (let ((write-errmsg (lambda (sym emsg) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))))) (lambda (sym emsg) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1)))))
# == uniquify-variables  ==>
# (let ((f71339 (lambda (f71340) (foreign-call "s_write" 2 f71340 (string-length f71340))))) (let ((f71348 (lambda (f71349 f71350) (begin (f71339 "error:") (f71339 (symbol->string f71349)) (f71339 ": ") (f71339 f71350) (f71339 "\n"))))) (lambda (f71353 f71354) (begin (f71348 f71353 f71354) (foreign-call "s_exit" 1)))))
# == vectorize-letrec  ==>
# (let ((f71339 (lambda (f71340) (foreign-call "s_write" 2 f71340 (string-length f71340))))) (let ((f71348 (lambda (f71349 f71350) (begin (f71339 "error:") (f71339 (symbol->string f71349)) (f71339 ": ") (f71339 f71350) (f71339 "\n"))))) (lambda (f71353 f71354) (begin (f71348 f71353 f71354) (foreign-call "s_exit" 1)))))
# == eliminate-set!  ==>
# (let ((f71339 (lambda (f71340) (let ((f71340 f71340)) (foreign-call "s_write" 2 f71340 (string-length f71340)))))) (let ((f71348 (lambda (f71349 f71350) (let ((f71349 f71349) (f71350 f71350)) (begin (f71339 "error:") (f71339 (symbol->string f71349)) (f71339 ": ") (f71339 f71350) (f71339 "\n")))))) (lambda (f71353 f71354) (let ((f71353 f71353) (f71354 f71354)) (begin (f71348 f71353 f71354) (foreign-call "s_exit" 1))))))
# == close-free-variables  ==>
# (let ((f71339 (closure (f71340) () (let ((f71340 f71340)) (foreign-call "s_write" 2 f71340 (string-length f71340)))))) (let ((f71348 (closure (f71349 f71350) (f71339 f71339 f71339 f71339 f71339) (let ((f71349 f71349) (f71350 f71350)) (begin (f71339 "error:") (f71339 (symbol->string f71349)) (f71339 ": ") (f71339 f71350) (f71339 "\n")))))) (closure (f71353 f71354) (f71348) (let ((f71353 f71353) (f71354 f71354)) (begin (f71348 f71353 f71354) (foreign-call "s_exit" 1))))))
# == eliminate-quote  ==>
# (let ((f71339 (closure (f71340) () (let ((f71340 f71340)) (foreign-call "s_write" 2 f71340 (string-length f71340)))))) (let ((f71348 (closure (f71349 f71350) (f71339 f71339 f71339 f71339 f71339) (let ((f71349 f71349) (f71350 f71350)) (begin (f71339 "error:") (f71339 (symbol->string f71349)) (f71339 ": ") (f71339 f71350) (f71339 "\n")))))) (closure (f71353 f71354) (f71348) (let ((f71353 f71353) (f71354 f71354)) (begin (f71348 f71353 f71354) (foreign-call "s_exit" 1))))))
# == eliminate-when/unless  ==>
# (let ((f71339 (closure (f71340) () (let ((f71340 f71340)) (foreign-call "s_write" 2 f71340 (string-length f71340)))))) (let ((f71348 (closure (f71349 f71350) (f71339 f71339 f71339 f71339 f71339) (let ((f71349 f71349) (f71350 f71350)) (begin (f71339 "error:") (f71339 (symbol->string f71349)) (f71339 ": ") (f71339 f71350) (f71339 "\n")))))) (closure (f71353 f71354) (f71348) (let ((f71353 f71353) (f71354 f71354)) (begin (f71348 f71353 f71354) (foreign-call "s_exit" 1))))))
# == eliminate-cond  ==>
# (let ((f71339 (closure (f71340) () (let ((f71340 f71340)) (foreign-call "s_write" 2 f71340 (string-length f71340)))))) (let ((f71348 (closure (f71349 f71350) (f71339 f71339 f71339 f71339 f71339) (let ((f71349 f71349) (f71350 f71350)) (begin (f71339 "error:") (f71339 (symbol->string f71349)) (f71339 ": ") (f71339 f71350) (f71339 "\n")))))) (closure (f71353 f71354) (f71348) (let ((f71353 f71353) (f71354 f71354)) (begin (f71348 f71353 f71354) (foreign-call "s_exit" 1))))))
# == external-symbols  ==>
# (let ((f71339 (closure (f71340) () (let ((f71340 f71340)) (foreign-call "s_write" 2 f71340 (string-length f71340)))))) (let ((f71348 (closure (f71349 f71350) (f71339 f71339 f71339 f71339 f71339) (let ((f71349 f71349) (f71350 f71350)) (begin (f71339 "error:") (f71339 (symbol->string f71349)) (f71339 ": ") (f71339 f71350) (f71339 "\n")))))) (closure (f71353 f71354) (f71348) (let ((f71353 f71353) (f71354 f71354)) (begin (f71348 f71353 f71354) (foreign-call "s_exit" 1))))))
# emit-expr (let ((f71339 (closure (f71340) () (let ((f71340 f71340)) (foreign-call "s_write" 2 f71340 (string-length f71340)))))) (let ((f71348 (closure (f71349 f71350) (f71339 f71339 f71339 f71339 f71339) (let ((f71349 f71349) (f71350 f71350)) (begin (f71339 "error:") (f71339 (symbol->string f71349)) (f71339 ": ") (f71339 f71350) (f71339 "\n")))))) (closure (f71353 f71354) (f71348) (let ((f71353 f71353) (f71354 f71354)) (begin (f71348 f71353 f71354) (foreign-call "s_exit" 1))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f71339 (closure (f71340) () (let ((f71340 f71340)) (foreign-call "s_write" 2 f71340 (string-length f71340))))))
#  body = (let ((f71348 (closure (f71349 f71350) (f71339 f71339 f71339 f71339 f71339) (let ((f71349 f71349) (f71350 f71350)) (begin (f71339 "error:") (f71339 (symbol->string f71349)) (f71339 ": ") (f71339 f71350) (f71339 "\n")))))) (closure (f71353 f71354) (f71348) (let ((f71353 f71353) (f71354 f71354)) (begin (f71348 f71353 f71354) (foreign-call "s_exit" 1)))))
# emit-expr (closure (f71340) () (let ((f71340 f71340)) (foreign-call "s_write" 2 f71340 (string-length f71340))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f71340) () (let ((f71340 f71340)) (foreign-call "s_write" 2 f71340 (string-length f71340))))
    movl $_L_719065, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_719066            # jump around closure body
_L_719065:
# check argument count
    cmp $4,%eax
    je _L_719067
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_719067:
# emit-tail-expr
# si=-12
# env=((f71340 . -8))
# expr=(let ((f71340 f71340)) (foreign-call "s_write" 2 f71340 (string-length f71340)))
# emit-tail-let
#  si   = -12
#  env  = ((f71340 . -8))
#  bindings = ((f71340 f71340))
#  body = (foreign-call "s_write" 2 f71340 (string-length f71340))
# emit-expr f71340
# emit-variable-ref
# env=((f71340 . -8))
# var=f71340
    movl -8(%esp), %eax  # stack load f71340
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f71340 . -12) (f71340 . -8))
# expr=(foreign-call "s_write" 2 f71340 (string-length f71340))
    movl %ecx,-16(%esp)
    movl %esp,-20(%esp)
# emit-expr (string-length f71340)
# emit-expr f71340
# emit-variable-ref
# env=((f71340 . -12) (f71340 . -8))
# var=f71340
    movl -12(%esp), %eax  # stack load f71340
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_719068
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719068:
    movl -6(%eax), %eax
    movl %eax, -24(%esp)
# emit-expr f71340
# emit-variable-ref
# env=((f71340 . -12) (f71340 . -8))
# var=f71340
    movl -12(%esp), %eax  # stack load f71340
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
_L_719066:
    movl %eax, 0(%esp)  # stack save
# emit-expr (let ((f71348 (closure (f71349 f71350) (f71339 f71339 f71339 f71339 f71339) (let ((f71349 f71349) (f71350 f71350)) (begin (f71339 "error:") (f71339 (symbol->string f71349)) (f71339 ": ") (f71339 f71350) (f71339 "\n")))))) (closure (f71353 f71354) (f71348) (let ((f71353 f71353) (f71354 f71354)) (begin (f71348 f71353 f71354) (foreign-call "s_exit" 1)))))
# emit-let
#  si   = -4
#  env  = ((f71339 . 0))
#  bindings = ((f71348 (closure (f71349 f71350) (f71339 f71339 f71339 f71339 f71339) (let ((f71349 f71349) (f71350 f71350)) (begin (f71339 "error:") (f71339 (symbol->string f71349)) (f71339 ": ") (f71339 f71350) (f71339 "\n"))))))
#  body = (closure (f71353 f71354) (f71348) (let ((f71353 f71353) (f71354 f71354)) (begin (f71348 f71353 f71354) (foreign-call "s_exit" 1))))
# emit-expr (closure (f71349 f71350) (f71339 f71339 f71339 f71339 f71339) (let ((f71349 f71349) (f71350 f71350)) (begin (f71339 "error:") (f71339 (symbol->string f71349)) (f71339 ": ") (f71339 f71350) (f71339 "\n"))))
# emit-closure
# si = -4
# env = ((f71339 . 0))
# expr = (closure (f71349 f71350) (f71339 f71339 f71339 f71339 f71339) (let ((f71349 f71349) (f71350 f71350)) (begin (f71339 "error:") (f71339 (symbol->string f71349)) (f71339 ": ") (f71339 f71350) (f71339 "\n"))))
    movl $_L_719069, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f71339 . 0))
# var=f71339
    movl 0(%esp), %eax  # stack load f71339
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f71339
# emit-variable-ref
# env=((f71339 . 0))
# var=f71339
    movl 0(%esp), %eax  # stack load f71339
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f71339
# emit-variable-ref
# env=((f71339 . 0))
# var=f71339
    movl 0(%esp), %eax  # stack load f71339
# end emit-variable-ref
   movl  %eax, 12(%ebp)  # f71339
# emit-variable-ref
# env=((f71339 . 0))
# var=f71339
    movl 0(%esp), %eax  # stack load f71339
# end emit-variable-ref
   movl  %eax, 16(%ebp)  # f71339
# emit-variable-ref
# env=((f71339 . 0))
# var=f71339
    movl 0(%esp), %eax  # stack load f71339
# end emit-variable-ref
   movl  %eax, 20(%ebp)  # f71339
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $24, %ebp     # bump ebp
    jmp _L_719070            # jump around closure body
_L_719069:
# check argument count
    cmp $8,%eax
    je _L_719071
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_719071:
# emit-tail-expr
# si=-16
# env=((f71350 . -12) (f71349 . -8) (f71339 . 20) (f71339 . 16) (f71339 . 12) (f71339 . 8) (f71339 . 4) (f71339 . 0))
# expr=(let ((f71349 f71349) (f71350 f71350)) (begin (f71339 "error:") (f71339 (symbol->string f71349)) (f71339 ": ") (f71339 f71350) (f71339 "\n")))
# emit-tail-let
#  si   = -16
#  env  = ((f71350 . -12) (f71349 . -8) (f71339 . 20) (f71339 . 16) (f71339 . 12) (f71339 . 8) (f71339 . 4) (f71339 . 0))
#  bindings = ((f71349 f71349) (f71350 f71350))
#  body = (begin (f71339 "error:") (f71339 (symbol->string f71349)) (f71339 ": ") (f71339 f71350) (f71339 "\n"))
# emit-expr f71349
# emit-variable-ref
# env=((f71350 . -12) (f71349 . -8) (f71339 . 20) (f71339 . 16) (f71339 . 12) (f71339 . 8) (f71339 . 4) (f71339 . 0))
# var=f71349
    movl -8(%esp), %eax  # stack load f71349
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f71350
# emit-variable-ref
# env=((f71350 . -12) (f71349 . -8) (f71339 . 20) (f71339 . 16) (f71339 . 12) (f71339 . 8) (f71339 . 4) (f71339 . 0))
# var=f71350
    movl -12(%esp), %eax  # stack load f71350
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f71350 . -20) (f71349 . -16) (f71350 . -12) (f71349 . -8) (f71339 . 20) (f71339 . 16) (f71339 . 12) (f71339 . 8) (f71339 . 4) (f71339 . 0))
# expr=(begin (f71339 "error:") (f71339 (symbol->string f71349)) (f71339 ": ") (f71339 f71350) (f71339 "\n"))
# tail-begin (begin (f71339 "error:") (f71339 (symbol->string f71349)) (f71339 ": ") (f71339 f71350) (f71339 "\n"))
#   env=((f71350 . -20) (f71349 . -16) (f71350 . -12) (f71349 . -8) (f71339 . 20) (f71339 . 16) (f71339 . 12) (f71339 . 8) (f71339 . 4) (f71339 . 0))
# emit-expr (f71339 "error:")
# funcall
#    si   =-24
#    env  = ((f71350 . -20) (f71349 . -16) (f71350 . -12) (f71349 . -8) (f71339 . 20) (f71339 . 16) (f71339 . 12) (f71339 . 8) (f71339 . 4) (f71339 . 0))
#    expr = (funcall f71339 "error:")
# emit-expr f71339
# emit-variable-ref
# env=((f71350 . -20) (f71349 . -16) (f71350 . -12) (f71349 . -8) (f71339 . 20) (f71339 . 16) (f71339 . 12) (f71339 . 8) (f71339 . 4) (f71339 . 0))
# var=f71339
    movl 18(%edi), %eax  # frame load f71339
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719072"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719072":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr "error:"
# string literal
    jmp _L_719074
    .align 8,0x90
_L_719073 :
    .int 24
    .ascii "error:"
_L_719074:
    movl $_L_719073, %eax
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
# env=((f71350 . -20) (f71349 . -16) (f71350 . -12) (f71349 . -8) (f71339 . 20) (f71339 . 16) (f71339 . 12) (f71339 . 8) (f71339 . 4) (f71339 . 0))
# expr=(begin (f71339 (symbol->string f71349)) (f71339 ": ") (f71339 f71350) (f71339 "\n"))
# tail-begin (begin (f71339 (symbol->string f71349)) (f71339 ": ") (f71339 f71350) (f71339 "\n"))
#   env=((f71350 . -20) (f71349 . -16) (f71350 . -12) (f71349 . -8) (f71339 . 20) (f71339 . 16) (f71339 . 12) (f71339 . 8) (f71339 . 4) (f71339 . 0))
# emit-expr (f71339 (symbol->string f71349))
# funcall
#    si   =-24
#    env  = ((f71350 . -20) (f71349 . -16) (f71350 . -12) (f71349 . -8) (f71339 . 20) (f71339 . 16) (f71339 . 12) (f71339 . 8) (f71339 . 4) (f71339 . 0))
#    expr = (funcall f71339 (symbol->string f71349))
# emit-expr f71339
# emit-variable-ref
# env=((f71350 . -20) (f71349 . -16) (f71350 . -12) (f71349 . -8) (f71339 . 20) (f71339 . 16) (f71339 . 12) (f71339 . 8) (f71339 . 4) (f71339 . 0))
# var=f71339
    movl 18(%edi), %eax  # frame load f71339
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719075"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719075":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr (symbol->string f71349)
# symbol->string f71349
# emit-expr f71349
# emit-variable-ref
# env=((f71350 . -20) (f71349 . -16) (f71350 . -12) (f71349 . -8) (f71339 . 20) (f71339 . 16) (f71339 . 12) (f71339 . 8) (f71339 . 4) (f71339 . 0))
# var=f71349
    movl -16(%esp), %eax  # stack load f71349
# end emit-variable-ref
    movl -3(%eax), %eax
    mov %eax, -36(%esp)  # arg (symbol->string f71349)
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((f71350 . -20) (f71349 . -16) (f71350 . -12) (f71349 . -8) (f71339 . 20) (f71339 . 16) (f71339 . 12) (f71339 . 8) (f71339 . 4) (f71339 . 0))
# expr=(begin (f71339 ": ") (f71339 f71350) (f71339 "\n"))
# tail-begin (begin (f71339 ": ") (f71339 f71350) (f71339 "\n"))
#   env=((f71350 . -20) (f71349 . -16) (f71350 . -12) (f71349 . -8) (f71339 . 20) (f71339 . 16) (f71339 . 12) (f71339 . 8) (f71339 . 4) (f71339 . 0))
# emit-expr (f71339 ": ")
# funcall
#    si   =-24
#    env  = ((f71350 . -20) (f71349 . -16) (f71350 . -12) (f71349 . -8) (f71339 . 20) (f71339 . 16) (f71339 . 12) (f71339 . 8) (f71339 . 4) (f71339 . 0))
#    expr = (funcall f71339 ": ")
# emit-expr f71339
# emit-variable-ref
# env=((f71350 . -20) (f71349 . -16) (f71350 . -12) (f71349 . -8) (f71339 . 20) (f71339 . 16) (f71339 . 12) (f71339 . 8) (f71339 . 4) (f71339 . 0))
# var=f71339
    movl 18(%edi), %eax  # frame load f71339
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719076"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719076":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr ": "
# string literal
    jmp _L_719078
    .align 8,0x90
_L_719077 :
    .int 8
    .ascii ": "
_L_719078:
    movl $_L_719077, %eax
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
# env=((f71350 . -20) (f71349 . -16) (f71350 . -12) (f71349 . -8) (f71339 . 20) (f71339 . 16) (f71339 . 12) (f71339 . 8) (f71339 . 4) (f71339 . 0))
# expr=(begin (f71339 f71350) (f71339 "\n"))
# tail-begin (begin (f71339 f71350) (f71339 "\n"))
#   env=((f71350 . -20) (f71349 . -16) (f71350 . -12) (f71349 . -8) (f71339 . 20) (f71339 . 16) (f71339 . 12) (f71339 . 8) (f71339 . 4) (f71339 . 0))
# emit-expr (f71339 f71350)
# funcall
#    si   =-24
#    env  = ((f71350 . -20) (f71349 . -16) (f71350 . -12) (f71349 . -8) (f71339 . 20) (f71339 . 16) (f71339 . 12) (f71339 . 8) (f71339 . 4) (f71339 . 0))
#    expr = (funcall f71339 f71350)
# emit-expr f71339
# emit-variable-ref
# env=((f71350 . -20) (f71349 . -16) (f71350 . -12) (f71349 . -8) (f71339 . 20) (f71339 . 16) (f71339 . 12) (f71339 . 8) (f71339 . 4) (f71339 . 0))
# var=f71339
    movl 18(%edi), %eax  # frame load f71339
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719079"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719079":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f71350
# emit-variable-ref
# env=((f71350 . -20) (f71349 . -16) (f71350 . -12) (f71349 . -8) (f71339 . 20) (f71339 . 16) (f71339 . 12) (f71339 . 8) (f71339 . 4) (f71339 . 0))
# var=f71350
    movl -20(%esp), %eax  # stack load f71350
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f71350
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((f71350 . -20) (f71349 . -16) (f71350 . -12) (f71349 . -8) (f71339 . 20) (f71339 . 16) (f71339 . 12) (f71339 . 8) (f71339 . 4) (f71339 . 0))
# expr=(begin (f71339 "\n"))
# tail-begin (begin (f71339 "\n"))
#   env=((f71350 . -20) (f71349 . -16) (f71350 . -12) (f71349 . -8) (f71339 . 20) (f71339 . 16) (f71339 . 12) (f71339 . 8) (f71339 . 4) (f71339 . 0))
# emit-tail-expr
# si=-24
# env=((f71350 . -20) (f71349 . -16) (f71350 . -12) (f71349 . -8) (f71339 . 20) (f71339 . 16) (f71339 . 12) (f71339 . 8) (f71339 . 4) (f71339 . 0))
# expr=(f71339 "\n")
# emit-tail-funcall
#    si   =-24
#    env  = ((f71350 . -20) (f71349 . -16) (f71350 . -12) (f71349 . -8) (f71339 . 20) (f71339 . 16) (f71339 . 12) (f71339 . 8) (f71339 . 4) (f71339 . 0))
#    expr = (funcall f71339 "\n")
# emit-expr f71339
# emit-variable-ref
# env=((f71350 . -20) (f71349 . -16) (f71350 . -12) (f71349 . -8) (f71339 . 20) (f71339 . 16) (f71339 . 12) (f71339 . 8) (f71339 . 4) (f71339 . 0))
# var=f71339
    movl 18(%edi), %eax  # frame load f71339
# end emit-variable-ref
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr "\n"
# string literal
    jmp _L_719081
    .align 8,0x90
_L_719080 :
    .int 4
    .ascii "\n"
_L_719081:
    movl $_L_719080, %eax
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
_L_719070:
    movl %eax, -4(%esp)  # stack save
# emit-expr (closure (f71353 f71354) (f71348) (let ((f71353 f71353) (f71354 f71354)) (begin (f71348 f71353 f71354) (foreign-call "s_exit" 1))))
# emit-closure
# si = -8
# env = ((f71348 . -4) (f71339 . 0))
# expr = (closure (f71353 f71354) (f71348) (let ((f71353 f71353) (f71354 f71354)) (begin (f71348 f71353 f71354) (foreign-call "s_exit" 1))))
    movl $_L_719082, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f71348 . -4) (f71339 . 0))
# var=f71348
    movl -4(%esp), %eax  # stack load f71348
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f71348
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_719083            # jump around closure body
_L_719082:
# check argument count
    cmp $8,%eax
    je _L_719084
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_719084:
# emit-tail-expr
# si=-16
# env=((f71354 . -12) (f71353 . -8) (f71348 . 4) (f71348 . -4) (f71339 . 0))
# expr=(let ((f71353 f71353) (f71354 f71354)) (begin (f71348 f71353 f71354) (foreign-call "s_exit" 1)))
# emit-tail-let
#  si   = -16
#  env  = ((f71354 . -12) (f71353 . -8) (f71348 . 4) (f71348 . -4) (f71339 . 0))
#  bindings = ((f71353 f71353) (f71354 f71354))
#  body = (begin (f71348 f71353 f71354) (foreign-call "s_exit" 1))
# emit-expr f71353
# emit-variable-ref
# env=((f71354 . -12) (f71353 . -8) (f71348 . 4) (f71348 . -4) (f71339 . 0))
# var=f71353
    movl -8(%esp), %eax  # stack load f71353
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f71354
# emit-variable-ref
# env=((f71354 . -12) (f71353 . -8) (f71348 . 4) (f71348 . -4) (f71339 . 0))
# var=f71354
    movl -12(%esp), %eax  # stack load f71354
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f71354 . -20) (f71353 . -16) (f71354 . -12) (f71353 . -8) (f71348 . 4) (f71348 . -4) (f71339 . 0))
# expr=(begin (f71348 f71353 f71354) (foreign-call "s_exit" 1))
# tail-begin (begin (f71348 f71353 f71354) (foreign-call "s_exit" 1))
#   env=((f71354 . -20) (f71353 . -16) (f71354 . -12) (f71353 . -8) (f71348 . 4) (f71348 . -4) (f71339 . 0))
# emit-expr (f71348 f71353 f71354)
# funcall
#    si   =-24
#    env  = ((f71354 . -20) (f71353 . -16) (f71354 . -12) (f71353 . -8) (f71348 . 4) (f71348 . -4) (f71339 . 0))
#    expr = (funcall f71348 f71353 f71354)
# emit-expr f71348
# emit-variable-ref
# env=((f71354 . -20) (f71353 . -16) (f71354 . -12) (f71353 . -8) (f71348 . 4) (f71348 . -4) (f71339 . 0))
# var=f71348
    movl 2(%edi), %eax  # frame load f71348
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719085"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719085":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f71353
# emit-variable-ref
# env=((f71354 . -20) (f71353 . -16) (f71354 . -12) (f71353 . -8) (f71348 . 4) (f71348 . -4) (f71339 . 0))
# var=f71353
    movl -16(%esp), %eax  # stack load f71353
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f71353
# emit-expr f71354
# emit-variable-ref
# env=((f71354 . -20) (f71353 . -16) (f71354 . -12) (f71353 . -8) (f71348 . 4) (f71348 . -4) (f71339 . 0))
# var=f71354
    movl -20(%esp), %eax  # stack load f71354
# end emit-variable-ref
    mov %eax, -40(%esp)  # arg f71354
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((f71354 . -20) (f71353 . -16) (f71354 . -12) (f71353 . -8) (f71348 . 4) (f71348 . -4) (f71339 . 0))
# expr=(begin (foreign-call "s_exit" 1))
# tail-begin (begin (foreign-call "s_exit" 1))
#   env=((f71354 . -20) (f71353 . -16) (f71354 . -12) (f71353 . -8) (f71348 . 4) (f71348 . -4) (f71339 . 0))
# emit-tail-expr
# si=-24
# env=((f71354 . -20) (f71353 . -16) (f71354 . -12) (f71353 . -8) (f71348 . 4) (f71348 . -4) (f71339 . 0))
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
_L_719083:
     movl %eax, error
# == explicit-begins  ==>
# (let ((p (quote ()))) (begin (set! p (cons (quote procedure?) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote symbol-value) p)) (set! p (cons (quote symbol->string) p)) (set! p (cons (quote make-symbol) p)) (set! p (cons (quote symbol?) p)) (set! p (cons (quote string-set!) p)) (set! p (cons (quote string-ref) p)) (set! p (cons (quote string-length) p)) (set! p (cons (quote string?) p)) (set! p (cons (quote make-string) p)) (set! p (cons (quote vector) p)) (set! p (cons (quote vector-ref) p)) (set! p (cons (quote vector-set!) p)) (set! p (cons (quote vector-length) p)) (set! p (cons (quote make-vector) p)) (set! p (cons (quote vector?) p)) (set! p (cons (quote set-cdr!) p)) (set! p (cons (quote set-car!) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote cons) p)) (set! p (cons (quote pair?) p)) (set! p (cons (quote fx*) p)) (set! p (cons (quote fx-) p)) (set! p (cons (quote fx+) p)) (set! p (cons (quote fx>=) p)) (set! p (cons (quote fx>) p)) (set! p (cons (quote fx<=) p)) (set! p (cons (quote fx<) p)) (set! p (cons (quote fx=) p)) (set! p (cons (quote fxzero?) p)) (set! p (cons (quote fxsub1) p)) (set! p (cons (quote fxadd1) p)) (set! p (cons (quote fxlogor) p)) (set! p (cons (quote fxlogand) p)) (set! p (cons (quote fxlognot) p)) (set! p (cons (quote char=?) p)) (set! p (cons (quote eq?) p)) (set! p (cons (quote not) p)) (set! p (cons (quote boolean?) p)) (set! p (cons (quote fixnum?) p)) (set! p (cons (quote char?) p)) (set! p (cons (quote null?) p)) (set! p (cons (quote char->fixnum) p)) (set! p (cons (quote fixnum->char) p)) (lambda () p)))
# == eliminate-let*  ==>
# (let ((p (quote ()))) (begin (set! p (cons (quote procedure?) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote symbol-value) p)) (set! p (cons (quote symbol->string) p)) (set! p (cons (quote make-symbol) p)) (set! p (cons (quote symbol?) p)) (set! p (cons (quote string-set!) p)) (set! p (cons (quote string-ref) p)) (set! p (cons (quote string-length) p)) (set! p (cons (quote string?) p)) (set! p (cons (quote make-string) p)) (set! p (cons (quote vector) p)) (set! p (cons (quote vector-ref) p)) (set! p (cons (quote vector-set!) p)) (set! p (cons (quote vector-length) p)) (set! p (cons (quote make-vector) p)) (set! p (cons (quote vector?) p)) (set! p (cons (quote set-cdr!) p)) (set! p (cons (quote set-car!) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote cons) p)) (set! p (cons (quote pair?) p)) (set! p (cons (quote fx*) p)) (set! p (cons (quote fx-) p)) (set! p (cons (quote fx+) p)) (set! p (cons (quote fx>=) p)) (set! p (cons (quote fx>) p)) (set! p (cons (quote fx<=) p)) (set! p (cons (quote fx<) p)) (set! p (cons (quote fx=) p)) (set! p (cons (quote fxzero?) p)) (set! p (cons (quote fxsub1) p)) (set! p (cons (quote fxadd1) p)) (set! p (cons (quote fxlogor) p)) (set! p (cons (quote fxlogand) p)) (set! p (cons (quote fxlognot) p)) (set! p (cons (quote char=?) p)) (set! p (cons (quote eq?) p)) (set! p (cons (quote not) p)) (set! p (cons (quote boolean?) p)) (set! p (cons (quote fixnum?) p)) (set! p (cons (quote char?) p)) (set! p (cons (quote null?) p)) (set! p (cons (quote char->fixnum) p)) (set! p (cons (quote fixnum->char) p)) (lambda () p)))
# == uniquify-variables  ==>
# (let ((f71355 (quote ()))) (begin (set! f71355 (cons (quote procedure?) f71355)) (set! f71355 (cons (quote cdr) f71355)) (set! f71355 (cons (quote car) f71355)) (set! f71355 (cons (quote symbol-value) f71355)) (set! f71355 (cons (quote symbol->string) f71355)) (set! f71355 (cons (quote make-symbol) f71355)) (set! f71355 (cons (quote symbol?) f71355)) (set! f71355 (cons (quote string-set!) f71355)) (set! f71355 (cons (quote string-ref) f71355)) (set! f71355 (cons (quote string-length) f71355)) (set! f71355 (cons (quote string?) f71355)) (set! f71355 (cons (quote make-string) f71355)) (set! f71355 (cons (quote vector) f71355)) (set! f71355 (cons (quote vector-ref) f71355)) (set! f71355 (cons (quote vector-set!) f71355)) (set! f71355 (cons (quote vector-length) f71355)) (set! f71355 (cons (quote make-vector) f71355)) (set! f71355 (cons (quote vector?) f71355)) (set! f71355 (cons (quote set-cdr!) f71355)) (set! f71355 (cons (quote set-car!) f71355)) (set! f71355 (cons (quote cdr) f71355)) (set! f71355 (cons (quote car) f71355)) (set! f71355 (cons (quote cons) f71355)) (set! f71355 (cons (quote pair?) f71355)) (set! f71355 (cons (quote fx*) f71355)) (set! f71355 (cons (quote fx-) f71355)) (set! f71355 (cons (quote fx+) f71355)) (set! f71355 (cons (quote fx>=) f71355)) (set! f71355 (cons (quote fx>) f71355)) (set! f71355 (cons (quote fx<=) f71355)) (set! f71355 (cons (quote fx<) f71355)) (set! f71355 (cons (quote fx=) f71355)) (set! f71355 (cons (quote fxzero?) f71355)) (set! f71355 (cons (quote fxsub1) f71355)) (set! f71355 (cons (quote fxadd1) f71355)) (set! f71355 (cons (quote fxlogor) f71355)) (set! f71355 (cons (quote fxlogand) f71355)) (set! f71355 (cons (quote fxlognot) f71355)) (set! f71355 (cons (quote char=?) f71355)) (set! f71355 (cons (quote eq?) f71355)) (set! f71355 (cons (quote not) f71355)) (set! f71355 (cons (quote boolean?) f71355)) (set! f71355 (cons (quote fixnum?) f71355)) (set! f71355 (cons (quote char?) f71355)) (set! f71355 (cons (quote null?) f71355)) (set! f71355 (cons (quote char->fixnum) f71355)) (set! f71355 (cons (quote fixnum->char) f71355)) (lambda () f71355)))
# == vectorize-letrec  ==>
# (let ((f71355 (quote ()))) (begin (set! f71355 (cons (quote procedure?) f71355)) (set! f71355 (cons (quote cdr) f71355)) (set! f71355 (cons (quote car) f71355)) (set! f71355 (cons (quote symbol-value) f71355)) (set! f71355 (cons (quote symbol->string) f71355)) (set! f71355 (cons (quote make-symbol) f71355)) (set! f71355 (cons (quote symbol?) f71355)) (set! f71355 (cons (quote string-set!) f71355)) (set! f71355 (cons (quote string-ref) f71355)) (set! f71355 (cons (quote string-length) f71355)) (set! f71355 (cons (quote string?) f71355)) (set! f71355 (cons (quote make-string) f71355)) (set! f71355 (cons (quote vector) f71355)) (set! f71355 (cons (quote vector-ref) f71355)) (set! f71355 (cons (quote vector-set!) f71355)) (set! f71355 (cons (quote vector-length) f71355)) (set! f71355 (cons (quote make-vector) f71355)) (set! f71355 (cons (quote vector?) f71355)) (set! f71355 (cons (quote set-cdr!) f71355)) (set! f71355 (cons (quote set-car!) f71355)) (set! f71355 (cons (quote cdr) f71355)) (set! f71355 (cons (quote car) f71355)) (set! f71355 (cons (quote cons) f71355)) (set! f71355 (cons (quote pair?) f71355)) (set! f71355 (cons (quote fx*) f71355)) (set! f71355 (cons (quote fx-) f71355)) (set! f71355 (cons (quote fx+) f71355)) (set! f71355 (cons (quote fx>=) f71355)) (set! f71355 (cons (quote fx>) f71355)) (set! f71355 (cons (quote fx<=) f71355)) (set! f71355 (cons (quote fx<) f71355)) (set! f71355 (cons (quote fx=) f71355)) (set! f71355 (cons (quote fxzero?) f71355)) (set! f71355 (cons (quote fxsub1) f71355)) (set! f71355 (cons (quote fxadd1) f71355)) (set! f71355 (cons (quote fxlogor) f71355)) (set! f71355 (cons (quote fxlogand) f71355)) (set! f71355 (cons (quote fxlognot) f71355)) (set! f71355 (cons (quote char=?) f71355)) (set! f71355 (cons (quote eq?) f71355)) (set! f71355 (cons (quote not) f71355)) (set! f71355 (cons (quote boolean?) f71355)) (set! f71355 (cons (quote fixnum?) f71355)) (set! f71355 (cons (quote char?) f71355)) (set! f71355 (cons (quote null?) f71355)) (set! f71355 (cons (quote char->fixnum) f71355)) (set! f71355 (cons (quote fixnum->char) f71355)) (lambda () f71355)))
# == eliminate-set!  ==>
# (let ((f71355 (vector (quote ())))) (begin (vector-set! f71355 0 (cons (quote procedure?) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote cdr) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote car) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote symbol-value) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote symbol->string) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote make-symbol) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote symbol?) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote string-set!) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote string-ref) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote string-length) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote string?) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote make-string) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote vector) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote vector-ref) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote vector-set!) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote vector-length) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote make-vector) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote vector?) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote set-cdr!) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote set-car!) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote cdr) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote car) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote cons) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote pair?) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote fx*) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote fx-) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote fx+) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote fx>=) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote fx>) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote fx<=) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote fx<) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote fx=) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote fxzero?) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote fxsub1) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote fxadd1) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote fxlogor) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote fxlogand) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote fxlognot) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote char=?) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote eq?) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote not) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote boolean?) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote fixnum?) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote char?) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote null?) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote char->fixnum) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote fixnum->char) (vector-ref f71355 0))) (lambda () (let () (vector-ref f71355 0)))))
# == close-free-variables  ==>
# (let ((f71355 (vector (quote ())))) (begin (vector-set! f71355 0 (cons (quote procedure?) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote cdr) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote car) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote symbol-value) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote symbol->string) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote make-symbol) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote symbol?) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote string-set!) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote string-ref) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote string-length) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote string?) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote make-string) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote vector) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote vector-ref) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote vector-set!) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote vector-length) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote make-vector) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote vector?) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote set-cdr!) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote set-car!) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote cdr) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote car) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote cons) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote pair?) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote fx*) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote fx-) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote fx+) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote fx>=) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote fx>) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote fx<=) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote fx<) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote fx=) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote fxzero?) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote fxsub1) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote fxadd1) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote fxlogor) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote fxlogand) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote fxlognot) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote char=?) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote eq?) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote not) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote boolean?) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote fixnum?) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote char?) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote null?) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote char->fixnum) (vector-ref f71355 0))) (vector-set! f71355 0 (cons (quote fixnum->char) (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0)))))
# == eliminate-quote  ==>
# (let ((f71355 (vector ()))) (begin (vector-set! f71355 0 (cons (string->symbol "procedure?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "symbol-value") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "symbol->string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "make-symbol") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "symbol?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "string-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "string-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "string-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "string?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "make-string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "vector-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "vector-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0)))))
# == eliminate-when/unless  ==>
# (let ((f71355 (vector ()))) (begin (vector-set! f71355 0 (cons (string->symbol "procedure?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "symbol-value") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "symbol->string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "make-symbol") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "symbol?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "string-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "string-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "string-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "string?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "make-string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "vector-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "vector-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0)))))
# == eliminate-cond  ==>
# (let ((f71355 (vector ()))) (begin (vector-set! f71355 0 (cons (string->symbol "procedure?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "symbol-value") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "symbol->string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "make-symbol") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "symbol?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "string-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "string-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "string-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "string?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "make-string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "vector-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "vector-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons (string->symbol "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0)))))
# == external-symbols  ==>
# (let ((f71355 (vector ()))) (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0)))))
# emit-expr (let ((f71355 (vector ()))) (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0)))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f71355 (vector ())))
#  body = (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-expr (vector ())
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719086"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719086:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_719087
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719087:
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
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719088
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719088:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719089"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719089:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719091
    cmp  $0,%eax
    jge _L_719090
_L_719091:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719090:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "procedure?") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "procedure?")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "procedure?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719092"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719092":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "procedure?"
# string literal
    jmp _L_719094
    .align 8,0x90
_L_719093 :
    .int 40
    .ascii "procedure?"
_L_719094:
    movl $_L_719093, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg procedure?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719095
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719095:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719096"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719096:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719098
    cmp  $0,%eax
    jge _L_719097
_L_719098:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719097:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719099
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719099:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719100"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719100:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719102
    cmp  $0,%eax
    jge _L_719101
_L_719102:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719101:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "cdr") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "cdr")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "cdr")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719103"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719103":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cdr"
# string literal
    jmp _L_719105
    .align 8,0x90
_L_719104 :
    .int 12
    .ascii "cdr"
_L_719105:
    movl $_L_719104, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cdr
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719106
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719106:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719107"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719107:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719109
    cmp  $0,%eax
    jge _L_719108
_L_719109:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719108:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719110
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719110:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719111"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719111:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719113
    cmp  $0,%eax
    jge _L_719112
_L_719113:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719112:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "car") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "car")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "car")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719114"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719114":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "car"
# string literal
    jmp _L_719116
    .align 8,0x90
_L_719115 :
    .int 12
    .ascii "car"
_L_719116:
    movl $_L_719115, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg car
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719117
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719117:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719118"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719118:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719120
    cmp  $0,%eax
    jge _L_719119
_L_719120:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719119:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719121
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719121:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719122"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719122:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719124
    cmp  $0,%eax
    jge _L_719123
_L_719124:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719123:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "symbol-value") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "symbol-value")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol-value")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719125"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719125":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol-value"
# string literal
    jmp _L_719127
    .align 8,0x90
_L_719126 :
    .int 48
    .ascii "symbol-value"
_L_719127:
    movl $_L_719126, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol-value
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719128
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719128:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719129"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719129:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719131
    cmp  $0,%eax
    jge _L_719130
_L_719131:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719130:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719132
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719132:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719133"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719133:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719135
    cmp  $0,%eax
    jge _L_719134
_L_719135:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719134:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "symbol->string") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "symbol->string")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol->string")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719136"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719136":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol->string"
# string literal
    jmp _L_719138
    .align 8,0x90
_L_719137 :
    .int 56
    .ascii "symbol->string"
_L_719138:
    movl $_L_719137, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol->string
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719139
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719139:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719140"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719140:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719142
    cmp  $0,%eax
    jge _L_719141
_L_719142:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719141:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719143
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719143:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719144"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719144:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719146
    cmp  $0,%eax
    jge _L_719145
_L_719146:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719145:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "make-symbol") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "make-symbol")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-symbol")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719147"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719147":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-symbol"
# string literal
    jmp _L_719149
    .align 8,0x90
_L_719148 :
    .int 44
    .ascii "make-symbol"
_L_719149:
    movl $_L_719148, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-symbol
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719150
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719150:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719151"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719151:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719153
    cmp  $0,%eax
    jge _L_719152
_L_719153:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719152:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719154
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719154:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719155"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719155:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719157
    cmp  $0,%eax
    jge _L_719156
_L_719157:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719156:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "symbol?") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "symbol?")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719158"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719158":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol?"
# string literal
    jmp _L_719160
    .align 8,0x90
_L_719159 :
    .int 28
    .ascii "symbol?"
_L_719160:
    movl $_L_719159, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719161
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719161:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719162"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719162:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719164
    cmp  $0,%eax
    jge _L_719163
_L_719164:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719163:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719165
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719165:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719166"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719166:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719168
    cmp  $0,%eax
    jge _L_719167
_L_719168:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719167:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "string-set!") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "string-set!")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-set!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719169"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719169":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-set!"
# string literal
    jmp _L_719171
    .align 8,0x90
_L_719170 :
    .int 44
    .ascii "string-set!"
_L_719171:
    movl $_L_719170, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-set!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719172
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719172:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719173"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719173:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719175
    cmp  $0,%eax
    jge _L_719174
_L_719175:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719174:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719176
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719176:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719177"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719177:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719179
    cmp  $0,%eax
    jge _L_719178
_L_719179:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719178:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "string-ref") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "string-ref")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-ref")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719180"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719180":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-ref"
# string literal
    jmp _L_719182
    .align 8,0x90
_L_719181 :
    .int 40
    .ascii "string-ref"
_L_719182:
    movl $_L_719181, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-ref
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719183
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719183:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719184"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719184:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719186
    cmp  $0,%eax
    jge _L_719185
_L_719186:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719185:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719187
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719187:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719188"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719188:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719190
    cmp  $0,%eax
    jge _L_719189
_L_719190:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719189:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-length") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "string-length") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "string-length")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-length")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719191"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719191":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-length"
# string literal
    jmp _L_719193
    .align 8,0x90
_L_719192 :
    .int 52
    .ascii "string-length"
_L_719193:
    movl $_L_719192, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-length
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719194
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719194:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719195"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719195:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719197
    cmp  $0,%eax
    jge _L_719196
_L_719197:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719196:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719198
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719198:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719199"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719199:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719201
    cmp  $0,%eax
    jge _L_719200
_L_719201:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719200:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string?") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "string?") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "string?")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719202"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719202":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string?"
# string literal
    jmp _L_719204
    .align 8,0x90
_L_719203 :
    .int 28
    .ascii "string?"
_L_719204:
    movl $_L_719203, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719205
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719205:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719206"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719206:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719208
    cmp  $0,%eax
    jge _L_719207
_L_719208:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719207:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719209
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719209:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719210"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719210:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719212
    cmp  $0,%eax
    jge _L_719211
_L_719212:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719211:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-string") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "make-string") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "make-string")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-string")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719213"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719213":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-string"
# string literal
    jmp _L_719215
    .align 8,0x90
_L_719214 :
    .int 44
    .ascii "make-string"
_L_719215:
    movl $_L_719214, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-string
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719216
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719216:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719217"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719217:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719219
    cmp  $0,%eax
    jge _L_719218
_L_719219:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719218:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719220
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719220:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719221"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719221:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719223
    cmp  $0,%eax
    jge _L_719222
_L_719223:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719222:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "vector") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "vector")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719224"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719224":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector"
# string literal
    jmp _L_719226
    .align 8,0x90
_L_719225 :
    .int 24
    .ascii "vector"
_L_719226:
    movl $_L_719225, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719227
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719227:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719228"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719228:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719230
    cmp  $0,%eax
    jge _L_719229
_L_719230:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719229:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719231
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719231:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719232"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719232:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719234
    cmp  $0,%eax
    jge _L_719233
_L_719234:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719233:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "vector-ref") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "vector-ref")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-ref")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719235"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719235":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-ref"
# string literal
    jmp _L_719237
    .align 8,0x90
_L_719236 :
    .int 40
    .ascii "vector-ref"
_L_719237:
    movl $_L_719236, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-ref
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719238
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719238:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719239"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719239:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719241
    cmp  $0,%eax
    jge _L_719240
_L_719241:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719240:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719242
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719242:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719243"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719243:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719245
    cmp  $0,%eax
    jge _L_719244
_L_719245:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719244:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "vector-set!") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "vector-set!")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-set!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719246"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719246":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-set!"
# string literal
    jmp _L_719248
    .align 8,0x90
_L_719247 :
    .int 44
    .ascii "vector-set!"
_L_719248:
    movl $_L_719247, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-set!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719249
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719249:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719250"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719250:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719252
    cmp  $0,%eax
    jge _L_719251
_L_719252:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719251:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719253
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719253:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719254"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719254:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719256
    cmp  $0,%eax
    jge _L_719255
_L_719256:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719255:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "vector-length") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "vector-length")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-length")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719257"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719257":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-length"
# string literal
    jmp _L_719259
    .align 8,0x90
_L_719258 :
    .int 52
    .ascii "vector-length"
_L_719259:
    movl $_L_719258, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-length
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719260
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719260:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719261"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719261:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719263
    cmp  $0,%eax
    jge _L_719262
_L_719263:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719262:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719264
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719264:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719265"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719265:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719267
    cmp  $0,%eax
    jge _L_719266
_L_719267:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719266:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "make-vector") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "make-vector")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-vector")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719268"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719268":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-vector"
# string literal
    jmp _L_719270
    .align 8,0x90
_L_719269 :
    .int 44
    .ascii "make-vector"
_L_719270:
    movl $_L_719269, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-vector
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719271
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719271:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719272"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719272:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719274
    cmp  $0,%eax
    jge _L_719273
_L_719274:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719273:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719275
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719275:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719276"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719276:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719278
    cmp  $0,%eax
    jge _L_719277
_L_719278:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719277:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector?") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "vector?") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "vector?")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719279"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719279":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector?"
# string literal
    jmp _L_719281
    .align 8,0x90
_L_719280 :
    .int 28
    .ascii "vector?"
_L_719281:
    movl $_L_719280, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719282
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719282:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719283"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719283:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719285
    cmp  $0,%eax
    jge _L_719284
_L_719285:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719284:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719286
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719286:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719287"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719287:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719289
    cmp  $0,%eax
    jge _L_719288
_L_719289:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719288:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "set-cdr!") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "set-cdr!")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "set-cdr!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719290"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719290":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "set-cdr!"
# string literal
    jmp _L_719292
    .align 8,0x90
_L_719291 :
    .int 32
    .ascii "set-cdr!"
_L_719292:
    movl $_L_719291, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg set-cdr!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719293
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719293:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719294"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719294:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719296
    cmp  $0,%eax
    jge _L_719295
_L_719296:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719295:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719297
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719297:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719298"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719298:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719300
    cmp  $0,%eax
    jge _L_719299
_L_719300:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719299:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "set-car!") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "set-car!")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "set-car!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719301"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719301":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "set-car!"
# string literal
    jmp _L_719303
    .align 8,0x90
_L_719302 :
    .int 32
    .ascii "set-car!"
_L_719303:
    movl $_L_719302, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg set-car!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719304
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719304:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719305"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719305:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719307
    cmp  $0,%eax
    jge _L_719306
_L_719307:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719306:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719308
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719308:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719309"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719309:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719311
    cmp  $0,%eax
    jge _L_719310
_L_719311:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719310:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cdr") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "cdr") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "cdr")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "cdr")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719312"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719312":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cdr"
# string literal
    jmp _L_719314
    .align 8,0x90
_L_719313 :
    .int 12
    .ascii "cdr"
_L_719314:
    movl $_L_719313, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cdr
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719315
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719315:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719316"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719316:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719318
    cmp  $0,%eax
    jge _L_719317
_L_719318:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719317:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719319
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719319:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719320"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719320:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719322
    cmp  $0,%eax
    jge _L_719321
_L_719322:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719321:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "car") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "car") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "car")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "car")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719323"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719323":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "car"
# string literal
    jmp _L_719325
    .align 8,0x90
_L_719324 :
    .int 12
    .ascii "car"
_L_719325:
    movl $_L_719324, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg car
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719326
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719326:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719327"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719327:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719329
    cmp  $0,%eax
    jge _L_719328
_L_719329:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719328:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719330
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719330:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719331"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719331:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719333
    cmp  $0,%eax
    jge _L_719332
_L_719333:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719332:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cons") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "cons") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "cons")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "cons")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719334"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719334":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cons"
# string literal
    jmp _L_719336
    .align 8,0x90
_L_719335 :
    .int 16
    .ascii "cons"
_L_719336:
    movl $_L_719335, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cons
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719337
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719337:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719338"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719338:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719340
    cmp  $0,%eax
    jge _L_719339
_L_719340:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719339:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719341
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719341:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719342"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719342:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719344
    cmp  $0,%eax
    jge _L_719343
_L_719344:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719343:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "pair?") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "pair?") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "pair?")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "pair?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719345"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719345":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "pair?"
# string literal
    jmp _L_719347
    .align 8,0x90
_L_719346 :
    .int 20
    .ascii "pair?"
_L_719347:
    movl $_L_719346, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg pair?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719348
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719348:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719349"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719349:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719351
    cmp  $0,%eax
    jge _L_719350
_L_719351:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719350:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719352
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719352:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719353"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719353:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719355
    cmp  $0,%eax
    jge _L_719354
_L_719355:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719354:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx*") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "fx*") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "fx*")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx*")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719356"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719356":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx*"
# string literal
    jmp _L_719358
    .align 8,0x90
_L_719357 :
    .int 12
    .ascii "fx*"
_L_719358:
    movl $_L_719357, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx*
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719359
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719359:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719360"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719360:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719362
    cmp  $0,%eax
    jge _L_719361
_L_719362:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719361:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719363
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719363:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719364"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719364:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719366
    cmp  $0,%eax
    jge _L_719365
_L_719366:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719365:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx-") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "fx-") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "fx-")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx-")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719367"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719367":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx-"
# string literal
    jmp _L_719369
    .align 8,0x90
_L_719368 :
    .int 12
    .ascii "fx-"
_L_719369:
    movl $_L_719368, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx-
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719370
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719370:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719371"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719371:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719373
    cmp  $0,%eax
    jge _L_719372
_L_719373:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719372:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719374
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719374:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719375"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719375:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719377
    cmp  $0,%eax
    jge _L_719376
_L_719377:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719376:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx+") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "fx+") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "fx+")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx+")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719378"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719378":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx+"
# string literal
    jmp _L_719380
    .align 8,0x90
_L_719379 :
    .int 12
    .ascii "fx+"
_L_719380:
    movl $_L_719379, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx+
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719381
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719381:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719382"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719382:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719384
    cmp  $0,%eax
    jge _L_719383
_L_719384:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719383:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719385
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719385:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719386"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719386:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719388
    cmp  $0,%eax
    jge _L_719387
_L_719388:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719387:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "fx>=") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "fx>=")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx>=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719389"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719389":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx>="
# string literal
    jmp _L_719391
    .align 8,0x90
_L_719390 :
    .int 16
    .ascii "fx>="
_L_719391:
    movl $_L_719390, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx>=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719392
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719392:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719393"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719393:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719395
    cmp  $0,%eax
    jge _L_719394
_L_719395:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719394:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719396
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719396:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719397"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719397:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719399
    cmp  $0,%eax
    jge _L_719398
_L_719399:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719398:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx>") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "fx>") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "fx>")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx>")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719400"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719400":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx>"
# string literal
    jmp _L_719402
    .align 8,0x90
_L_719401 :
    .int 12
    .ascii "fx>"
_L_719402:
    movl $_L_719401, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx>
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719403
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719403:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719404"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719404:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719406
    cmp  $0,%eax
    jge _L_719405
_L_719406:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719405:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719407
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719407:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719408"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719408:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719410
    cmp  $0,%eax
    jge _L_719409
_L_719410:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719409:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "fx<=") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "fx<=")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx<=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719411"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719411":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx<="
# string literal
    jmp _L_719413
    .align 8,0x90
_L_719412 :
    .int 16
    .ascii "fx<="
_L_719413:
    movl $_L_719412, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx<=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719414
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719414:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719415"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719415:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719417
    cmp  $0,%eax
    jge _L_719416
_L_719417:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719416:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719418
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719418:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719419"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719419:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719421
    cmp  $0,%eax
    jge _L_719420
_L_719421:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719420:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx<") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "fx<") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "fx<")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx<")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719422"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719422":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx<"
# string literal
    jmp _L_719424
    .align 8,0x90
_L_719423 :
    .int 12
    .ascii "fx<"
_L_719424:
    movl $_L_719423, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx<
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719425
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719425:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719426"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719426:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719428
    cmp  $0,%eax
    jge _L_719427
_L_719428:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719427:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719429
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719429:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719430"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719430:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719432
    cmp  $0,%eax
    jge _L_719431
_L_719432:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719431:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx=") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "fx=") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "fx=")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719433"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719433":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx="
# string literal
    jmp _L_719435
    .align 8,0x90
_L_719434 :
    .int 12
    .ascii "fx="
_L_719435:
    movl $_L_719434, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719436
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719436:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719437"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719437:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719439
    cmp  $0,%eax
    jge _L_719438
_L_719439:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719438:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719440
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719440:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719441"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719441:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719443
    cmp  $0,%eax
    jge _L_719442
_L_719443:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719442:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "fxzero?") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "fxzero?")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxzero?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719444"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719444":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxzero?"
# string literal
    jmp _L_719446
    .align 8,0x90
_L_719445 :
    .int 28
    .ascii "fxzero?"
_L_719446:
    movl $_L_719445, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxzero?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719447
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719447:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719448"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719448:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719450
    cmp  $0,%eax
    jge _L_719449
_L_719450:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719449:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719451
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719451:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719452"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719452:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719454
    cmp  $0,%eax
    jge _L_719453
_L_719454:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719453:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "fxsub1") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "fxsub1")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxsub1")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719455"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719455":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxsub1"
# string literal
    jmp _L_719457
    .align 8,0x90
_L_719456 :
    .int 24
    .ascii "fxsub1"
_L_719457:
    movl $_L_719456, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxsub1
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719458
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719458:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719459"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719459:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719461
    cmp  $0,%eax
    jge _L_719460
_L_719461:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719460:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719462
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719462:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719463"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719463:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719465
    cmp  $0,%eax
    jge _L_719464
_L_719465:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719464:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "fxadd1") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "fxadd1")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxadd1")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719466"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719466":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxadd1"
# string literal
    jmp _L_719468
    .align 8,0x90
_L_719467 :
    .int 24
    .ascii "fxadd1"
_L_719468:
    movl $_L_719467, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxadd1
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719469
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719469:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719470"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719470:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719472
    cmp  $0,%eax
    jge _L_719471
_L_719472:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719471:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719473
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719473:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719474"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719474:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719476
    cmp  $0,%eax
    jge _L_719475
_L_719476:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719475:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "fxlogor") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "fxlogor")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlogor")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719477"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719477":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlogor"
# string literal
    jmp _L_719479
    .align 8,0x90
_L_719478 :
    .int 28
    .ascii "fxlogor"
_L_719479:
    movl $_L_719478, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlogor
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719480
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719480:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719481"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719481:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719483
    cmp  $0,%eax
    jge _L_719482
_L_719483:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719482:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719484
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719484:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719485"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719485:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719487
    cmp  $0,%eax
    jge _L_719486
_L_719487:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719486:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "fxlogand") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "fxlogand")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlogand")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719488"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719488":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlogand"
# string literal
    jmp _L_719490
    .align 8,0x90
_L_719489 :
    .int 32
    .ascii "fxlogand"
_L_719490:
    movl $_L_719489, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlogand
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719491
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719491:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719492"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719492:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719494
    cmp  $0,%eax
    jge _L_719493
_L_719494:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719493:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719495
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719495:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719496"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719496:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719498
    cmp  $0,%eax
    jge _L_719497
_L_719498:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719497:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "fxlognot") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "fxlognot")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlognot")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719499"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719499":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlognot"
# string literal
    jmp _L_719501
    .align 8,0x90
_L_719500 :
    .int 32
    .ascii "fxlognot"
_L_719501:
    movl $_L_719500, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlognot
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719502
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719502:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719503"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719503:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719505
    cmp  $0,%eax
    jge _L_719504
_L_719505:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719504:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719506
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719506:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719507"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719507:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719509
    cmp  $0,%eax
    jge _L_719508
_L_719509:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719508:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char=?") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "char=?") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "char=?")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "char=?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719510"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719510":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char=?"
# string literal
    jmp _L_719512
    .align 8,0x90
_L_719511 :
    .int 24
    .ascii "char=?"
_L_719512:
    movl $_L_719511, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char=?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719513
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719513:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719514"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719514:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719516
    cmp  $0,%eax
    jge _L_719515
_L_719516:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719515:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719517
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719517:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719518"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719518:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719520
    cmp  $0,%eax
    jge _L_719519
_L_719520:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719519:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "eq?") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "eq?") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "eq?")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "eq?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719521"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719521":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "eq?"
# string literal
    jmp _L_719523
    .align 8,0x90
_L_719522 :
    .int 12
    .ascii "eq?"
_L_719523:
    movl $_L_719522, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg eq?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719524
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719524:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719525"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719525:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719527
    cmp  $0,%eax
    jge _L_719526
_L_719527:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719526:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719528
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719528:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719529"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719529:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719531
    cmp  $0,%eax
    jge _L_719530
_L_719531:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719530:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "not") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "not") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "not")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "not")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719532"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719532":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "not"
# string literal
    jmp _L_719534
    .align 8,0x90
_L_719533 :
    .int 12
    .ascii "not"
_L_719534:
    movl $_L_719533, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg not
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719535
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719535:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719536"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719536:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719538
    cmp  $0,%eax
    jge _L_719537
_L_719538:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719537:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719539
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719539:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719540"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719540:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719542
    cmp  $0,%eax
    jge _L_719541
_L_719542:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719541:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "boolean?") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "boolean?")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "boolean?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719543"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719543":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "boolean?"
# string literal
    jmp _L_719545
    .align 8,0x90
_L_719544 :
    .int 32
    .ascii "boolean?"
_L_719545:
    movl $_L_719544, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg boolean?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719546
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719546:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719547"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719547:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719549
    cmp  $0,%eax
    jge _L_719548
_L_719549:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719548:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719550
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719550:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719551"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719551:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719553
    cmp  $0,%eax
    jge _L_719552
_L_719553:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719552:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "fixnum?") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "fixnum?")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fixnum?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719554"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719554":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fixnum?"
# string literal
    jmp _L_719556
    .align 8,0x90
_L_719555 :
    .int 28
    .ascii "fixnum?"
_L_719556:
    movl $_L_719555, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fixnum?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719557
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719557:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719558"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719558:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719560
    cmp  $0,%eax
    jge _L_719559
_L_719560:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719559:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719561
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719561:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719562"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719562:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719564
    cmp  $0,%eax
    jge _L_719563
_L_719564:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719563:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char?") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "char?") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "char?")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "char?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719565"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719565":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char?"
# string literal
    jmp _L_719567
    .align 8,0x90
_L_719566 :
    .int 20
    .ascii "char?"
_L_719567:
    movl $_L_719566, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719568
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719568:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719569"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719569:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719571
    cmp  $0,%eax
    jge _L_719570
_L_719571:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719570:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719572
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719572:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719573"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719573:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719575
    cmp  $0,%eax
    jge _L_719574
_L_719575:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719574:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "null?") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "null?") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "null?")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "null?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719576"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719576":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "null?"
# string literal
    jmp _L_719578
    .align 8,0x90
_L_719577 :
    .int 20
    .ascii "null?"
_L_719578:
    movl $_L_719577, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg null?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719579
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719579:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719580"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719580:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719582
    cmp  $0,%eax
    jge _L_719581
_L_719582:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719581:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))) (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719583
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719583:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719584"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719584:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719586
    cmp  $0,%eax
    jge _L_719585
_L_719586:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719585:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "char->fixnum") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "char->fixnum")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "char->fixnum")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719587"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719587":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char->fixnum"
# string literal
    jmp _L_719589
    .align 8,0x90
_L_719588 :
    .int 48
    .ascii "char->fixnum"
_L_719589:
    movl $_L_719588, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char->fixnum
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719590
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719590:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719591"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719591:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719593
    cmp  $0,%eax
    jge _L_719592
_L_719593:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719592:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))) (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (vector-set! f71355 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0)))
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719594
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719594:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719595"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719595:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719597
    cmp  $0,%eax
    jge _L_719596
_L_719597:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719596:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f71355 0))
# cons arg1=((primitive-ref string->symbol) "fixnum->char") arg2=(vector-ref f71355 0)
# emit-expr ((primitive-ref string->symbol) "fixnum->char")
# funcall
#    si   =-12
#    env  = ((f71355 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fixnum->char")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719598"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719598":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fixnum->char"
# string literal
    jmp _L_719600
    .align 8,0x90
_L_719599 :
    .int 48
    .ascii "fixnum->char"
_L_719600:
    movl $_L_719599, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fixnum->char
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f71355 0)
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719601
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719601:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719602"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719602:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719604
    cmp  $0,%eax
    jge _L_719603
_L_719604:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719603:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (closure () (f71355) (let () (vector-ref f71355 0))))
# emit-begin
#   expr=(begin (closure () (f71355) (let () (vector-ref f71355 0))))
#   env=((f71355 . 0))
# emit-expr (closure () (f71355) (let () (vector-ref f71355 0)))
# emit-closure
# si = -4
# env = ((f71355 . 0))
# expr = (closure () (f71355) (let () (vector-ref f71355 0)))
    movl $_L_719605, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f71355 . 0))
# var=f71355
    movl 0(%esp), %eax  # stack load f71355
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f71355
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_719606            # jump around closure body
_L_719605:
# check argument count
    cmp $0,%eax
    je _L_719607
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_719607:
# emit-tail-expr
# si=-8
# env=((f71355 . 4) (f71355 . 0))
# expr=(let () (vector-ref f71355 0))
# emit-tail-let
#  si   = -8
#  env  = ((f71355 . 4) (f71355 . 0))
#  bindings = ()
#  body = (vector-ref f71355 0)
# emit-tail-expr
# si=-8
# env=((f71355 . 4) (f71355 . 0))
# expr=(vector-ref f71355 0)
# tail primcall
# emit-expr f71355
# emit-variable-ref
# env=((f71355 . 4) (f71355 . 0))
# var=f71355
    movl 2(%edi), %eax  # frame load f71355
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_719608
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719608:
    movl %eax, -8(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_719609"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_719609:
# check bounds on vector index
    movl -8(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_719611
    cmp  $0,%eax
    jge _L_719610
_L_719611:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719610:
    movl -8(%esp), %esi
    movl -1(%eax,%esi), %eax
#return from tail (vector-ref f71355 0)
    ret
    .align 4,0x90
_L_719606:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f71355 . 0))
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
    movl $_L_719612, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_719613            # jump around closure body
_L_719612:
# check argument count
    cmp $0,%eax
    je _L_719614
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_719614:
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
    je "_L_719615"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719615":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_719617
    .align 8,0x90
_L_719616 :
    .int 28
    .ascii "funcall"
_L_719617:
    movl $_L_719616, %eax
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
    jmp _L_719619
    .align 8,0x90
_L_719618 :
    .int 100
    .ascii "arg 1 must be a procedure"
_L_719619:
    movl $_L_719618, %eax
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
_L_719613:
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
    movl $_L_719620, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_719621            # jump around closure body
_L_719620:
# check argument count
    cmp $0,%eax
    je _L_719622
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_719622:
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
    je "_L_719623"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719623":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_719625
    .align 8,0x90
_L_719624 :
    .int 28
    .ascii "funcall"
_L_719625:
    movl $_L_719624, %eax
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
    jmp _L_719627
    .align 8,0x90
_L_719626 :
    .int 80
    .ascii "wrong number of args"
_L_719627:
    movl $_L_719626, %eax
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
_L_719621:
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
    movl $_L_719628, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_719629            # jump around closure body
_L_719628:
# check argument count
    cmp $0,%eax
    je _L_719630
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_719630:
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
    je "_L_719631"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719631":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_719633
    .align 8,0x90
_L_719632 :
    .int 28
    .ascii "funcall"
_L_719633:
    movl $_L_719632, %eax
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
    jmp _L_719635
    .align 8,0x90
_L_719634 :
    .int 48
    .ascii "too few args"
_L_719635:
    movl $_L_719634, %eax
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
_L_719629:
     movl %eax, eh$uargcount$umin
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a fixnum"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a fixnum"))
# == uniquify-variables  ==>
# (lambda (f71356) (error (list-ref (primitives) f71356) "arg must be a fixnum"))
# == vectorize-letrec  ==>
# (lambda (f71356) (error (list-ref (primitives) f71356) "arg must be a fixnum"))
# == eliminate-set!  ==>
# (lambda (f71356) (let ((f71356 f71356)) (error (list-ref (primitives) f71356) "arg must be a fixnum")))
# == close-free-variables  ==>
# (closure (f71356) (error list-ref primitives) (let ((f71356 f71356)) (error (list-ref (primitives) f71356) "arg must be a fixnum")))
# == eliminate-quote  ==>
# (closure (f71356) (error list-ref primitives) (let ((f71356 f71356)) (error (list-ref (primitives) f71356) "arg must be a fixnum")))
# == eliminate-when/unless  ==>
# (closure (f71356) (error list-ref primitives) (let ((f71356 f71356)) (error (list-ref (primitives) f71356) "arg must be a fixnum")))
# == eliminate-cond  ==>
# (closure (f71356) (error list-ref primitives) (let ((f71356 f71356)) (error (list-ref (primitives) f71356) "arg must be a fixnum")))
# == external-symbols  ==>
# (closure (f71356) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f71356 f71356)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71356) "arg must be a fixnum")))
# emit-expr (closure (f71356) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f71356 f71356)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71356) "arg must be a fixnum")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f71356) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f71356 f71356)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71356) "arg must be a fixnum")))
    movl $_L_719636, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_719637            # jump around closure body
_L_719636:
# check argument count
    cmp $4,%eax
    je _L_719638
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_719638:
# emit-tail-expr
# si=-12
# env=((f71356 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f71356 f71356)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71356) "arg must be a fixnum"))
# emit-tail-let
#  si   = -12
#  env  = ((f71356 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f71356 f71356))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71356) "arg must be a fixnum")
# emit-expr f71356
# emit-variable-ref
# env=((f71356 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f71356
    movl -8(%esp), %eax  # stack load f71356
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f71356 . -12) (f71356 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71356) "arg must be a fixnum")
# emit-tail-funcall
#    si   =-16
#    env  = ((f71356 . -12) (f71356 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71356) "arg must be a fixnum")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f71356)
# funcall
#    si   =-20
#    env  = ((f71356 . -12) (f71356 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f71356)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719639"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719639":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f71356 . -12) (f71356 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719640"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719640":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f71356
# emit-variable-ref
# env=((f71356 . -12) (f71356 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f71356
    movl -12(%esp), %eax  # stack load f71356
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f71356
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f71356)
# emit-expr "arg must be a fixnum"
# string literal
    jmp _L_719642
    .align 8,0x90
_L_719641 :
    .int 80
    .ascii "arg must be a fixnum"
_L_719642:
    movl $_L_719641, %eax
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
_L_719637:
     movl %eax, eh$ufixnum
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a string"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a string"))
# == uniquify-variables  ==>
# (lambda (f71357) (error (list-ref (primitives) f71357) "arg must be a string"))
# == vectorize-letrec  ==>
# (lambda (f71357) (error (list-ref (primitives) f71357) "arg must be a string"))
# == eliminate-set!  ==>
# (lambda (f71357) (let ((f71357 f71357)) (error (list-ref (primitives) f71357) "arg must be a string")))
# == close-free-variables  ==>
# (closure (f71357) (error list-ref primitives) (let ((f71357 f71357)) (error (list-ref (primitives) f71357) "arg must be a string")))
# == eliminate-quote  ==>
# (closure (f71357) (error list-ref primitives) (let ((f71357 f71357)) (error (list-ref (primitives) f71357) "arg must be a string")))
# == eliminate-when/unless  ==>
# (closure (f71357) (error list-ref primitives) (let ((f71357 f71357)) (error (list-ref (primitives) f71357) "arg must be a string")))
# == eliminate-cond  ==>
# (closure (f71357) (error list-ref primitives) (let ((f71357 f71357)) (error (list-ref (primitives) f71357) "arg must be a string")))
# == external-symbols  ==>
# (closure (f71357) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f71357 f71357)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71357) "arg must be a string")))
# emit-expr (closure (f71357) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f71357 f71357)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71357) "arg must be a string")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f71357) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f71357 f71357)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71357) "arg must be a string")))
    movl $_L_719643, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_719644            # jump around closure body
_L_719643:
# check argument count
    cmp $4,%eax
    je _L_719645
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_719645:
# emit-tail-expr
# si=-12
# env=((f71357 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f71357 f71357)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71357) "arg must be a string"))
# emit-tail-let
#  si   = -12
#  env  = ((f71357 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f71357 f71357))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71357) "arg must be a string")
# emit-expr f71357
# emit-variable-ref
# env=((f71357 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f71357
    movl -8(%esp), %eax  # stack load f71357
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f71357 . -12) (f71357 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71357) "arg must be a string")
# emit-tail-funcall
#    si   =-16
#    env  = ((f71357 . -12) (f71357 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71357) "arg must be a string")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f71357)
# funcall
#    si   =-20
#    env  = ((f71357 . -12) (f71357 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f71357)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719646"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719646":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f71357 . -12) (f71357 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719647"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719647":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f71357
# emit-variable-ref
# env=((f71357 . -12) (f71357 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f71357
    movl -12(%esp), %eax  # stack load f71357
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f71357
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f71357)
# emit-expr "arg must be a string"
# string literal
    jmp _L_719649
    .align 8,0x90
_L_719648 :
    .int 80
    .ascii "arg must be a string"
_L_719649:
    movl $_L_719648, %eax
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
_L_719644:
     movl %eax, eh$ustring
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a character"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a character"))
# == uniquify-variables  ==>
# (lambda (f71358) (error (list-ref (primitives) f71358) "arg must be a character"))
# == vectorize-letrec  ==>
# (lambda (f71358) (error (list-ref (primitives) f71358) "arg must be a character"))
# == eliminate-set!  ==>
# (lambda (f71358) (let ((f71358 f71358)) (error (list-ref (primitives) f71358) "arg must be a character")))
# == close-free-variables  ==>
# (closure (f71358) (error list-ref primitives) (let ((f71358 f71358)) (error (list-ref (primitives) f71358) "arg must be a character")))
# == eliminate-quote  ==>
# (closure (f71358) (error list-ref primitives) (let ((f71358 f71358)) (error (list-ref (primitives) f71358) "arg must be a character")))
# == eliminate-when/unless  ==>
# (closure (f71358) (error list-ref primitives) (let ((f71358 f71358)) (error (list-ref (primitives) f71358) "arg must be a character")))
# == eliminate-cond  ==>
# (closure (f71358) (error list-ref primitives) (let ((f71358 f71358)) (error (list-ref (primitives) f71358) "arg must be a character")))
# == external-symbols  ==>
# (closure (f71358) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f71358 f71358)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71358) "arg must be a character")))
# emit-expr (closure (f71358) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f71358 f71358)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71358) "arg must be a character")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f71358) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f71358 f71358)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71358) "arg must be a character")))
    movl $_L_719650, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_719651            # jump around closure body
_L_719650:
# check argument count
    cmp $4,%eax
    je _L_719652
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_719652:
# emit-tail-expr
# si=-12
# env=((f71358 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f71358 f71358)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71358) "arg must be a character"))
# emit-tail-let
#  si   = -12
#  env  = ((f71358 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f71358 f71358))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71358) "arg must be a character")
# emit-expr f71358
# emit-variable-ref
# env=((f71358 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f71358
    movl -8(%esp), %eax  # stack load f71358
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f71358 . -12) (f71358 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71358) "arg must be a character")
# emit-tail-funcall
#    si   =-16
#    env  = ((f71358 . -12) (f71358 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71358) "arg must be a character")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f71358)
# funcall
#    si   =-20
#    env  = ((f71358 . -12) (f71358 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f71358)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719653"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719653":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f71358 . -12) (f71358 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719654"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719654":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f71358
# emit-variable-ref
# env=((f71358 . -12) (f71358 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f71358
    movl -12(%esp), %eax  # stack load f71358
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f71358
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f71358)
# emit-expr "arg must be a character"
# string literal
    jmp _L_719656
    .align 8,0x90
_L_719655 :
    .int 92
    .ascii "arg must be a character"
_L_719656:
    movl $_L_719655, %eax
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
_L_719651:
     movl %eax, eh$ucharacter
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a pair"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a pair"))
# == uniquify-variables  ==>
# (lambda (f71359) (error (list-ref (primitives) f71359) "arg must be a pair"))
# == vectorize-letrec  ==>
# (lambda (f71359) (error (list-ref (primitives) f71359) "arg must be a pair"))
# == eliminate-set!  ==>
# (lambda (f71359) (let ((f71359 f71359)) (error (list-ref (primitives) f71359) "arg must be a pair")))
# == close-free-variables  ==>
# (closure (f71359) (error list-ref primitives) (let ((f71359 f71359)) (error (list-ref (primitives) f71359) "arg must be a pair")))
# == eliminate-quote  ==>
# (closure (f71359) (error list-ref primitives) (let ((f71359 f71359)) (error (list-ref (primitives) f71359) "arg must be a pair")))
# == eliminate-when/unless  ==>
# (closure (f71359) (error list-ref primitives) (let ((f71359 f71359)) (error (list-ref (primitives) f71359) "arg must be a pair")))
# == eliminate-cond  ==>
# (closure (f71359) (error list-ref primitives) (let ((f71359 f71359)) (error (list-ref (primitives) f71359) "arg must be a pair")))
# == external-symbols  ==>
# (closure (f71359) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f71359 f71359)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71359) "arg must be a pair")))
# emit-expr (closure (f71359) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f71359 f71359)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71359) "arg must be a pair")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f71359) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f71359 f71359)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71359) "arg must be a pair")))
    movl $_L_719657, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_719658            # jump around closure body
_L_719657:
# check argument count
    cmp $4,%eax
    je _L_719659
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_719659:
# emit-tail-expr
# si=-12
# env=((f71359 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f71359 f71359)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71359) "arg must be a pair"))
# emit-tail-let
#  si   = -12
#  env  = ((f71359 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f71359 f71359))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71359) "arg must be a pair")
# emit-expr f71359
# emit-variable-ref
# env=((f71359 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f71359
    movl -8(%esp), %eax  # stack load f71359
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f71359 . -12) (f71359 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71359) "arg must be a pair")
# emit-tail-funcall
#    si   =-16
#    env  = ((f71359 . -12) (f71359 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71359) "arg must be a pair")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f71359)
# funcall
#    si   =-20
#    env  = ((f71359 . -12) (f71359 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f71359)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719660"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719660":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f71359 . -12) (f71359 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719661"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719661":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f71359
# emit-variable-ref
# env=((f71359 . -12) (f71359 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f71359
    movl -12(%esp), %eax  # stack load f71359
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f71359
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f71359)
# emit-expr "arg must be a pair"
# string literal
    jmp _L_719663
    .align 8,0x90
_L_719662 :
    .int 72
    .ascii "arg must be a pair"
_L_719663:
    movl $_L_719662, %eax
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
_L_719658:
     movl %eax, eh$upair
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a vector"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a vector"))
# == uniquify-variables  ==>
# (lambda (f71360) (error (list-ref (primitives) f71360) "arg must be a vector"))
# == vectorize-letrec  ==>
# (lambda (f71360) (error (list-ref (primitives) f71360) "arg must be a vector"))
# == eliminate-set!  ==>
# (lambda (f71360) (let ((f71360 f71360)) (error (list-ref (primitives) f71360) "arg must be a vector")))
# == close-free-variables  ==>
# (closure (f71360) (error list-ref primitives) (let ((f71360 f71360)) (error (list-ref (primitives) f71360) "arg must be a vector")))
# == eliminate-quote  ==>
# (closure (f71360) (error list-ref primitives) (let ((f71360 f71360)) (error (list-ref (primitives) f71360) "arg must be a vector")))
# == eliminate-when/unless  ==>
# (closure (f71360) (error list-ref primitives) (let ((f71360 f71360)) (error (list-ref (primitives) f71360) "arg must be a vector")))
# == eliminate-cond  ==>
# (closure (f71360) (error list-ref primitives) (let ((f71360 f71360)) (error (list-ref (primitives) f71360) "arg must be a vector")))
# == external-symbols  ==>
# (closure (f71360) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f71360 f71360)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71360) "arg must be a vector")))
# emit-expr (closure (f71360) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f71360 f71360)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71360) "arg must be a vector")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f71360) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f71360 f71360)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71360) "arg must be a vector")))
    movl $_L_719664, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_719665            # jump around closure body
_L_719664:
# check argument count
    cmp $4,%eax
    je _L_719666
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_719666:
# emit-tail-expr
# si=-12
# env=((f71360 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f71360 f71360)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71360) "arg must be a vector"))
# emit-tail-let
#  si   = -12
#  env  = ((f71360 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f71360 f71360))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71360) "arg must be a vector")
# emit-expr f71360
# emit-variable-ref
# env=((f71360 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f71360
    movl -8(%esp), %eax  # stack load f71360
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f71360 . -12) (f71360 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71360) "arg must be a vector")
# emit-tail-funcall
#    si   =-16
#    env  = ((f71360 . -12) (f71360 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71360) "arg must be a vector")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f71360)
# funcall
#    si   =-20
#    env  = ((f71360 . -12) (f71360 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f71360)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719667"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719667":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f71360 . -12) (f71360 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719668"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719668":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f71360
# emit-variable-ref
# env=((f71360 . -12) (f71360 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f71360
    movl -12(%esp), %eax  # stack load f71360
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f71360
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f71360)
# emit-expr "arg must be a vector"
# string literal
    jmp _L_719670
    .align 8,0x90
_L_719669 :
    .int 80
    .ascii "arg must be a vector"
_L_719670:
    movl $_L_719669, %eax
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
_L_719665:
     movl %eax, eh$uvector
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "length must be a fixnum >= 0"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "length must be a fixnum >= 0"))
# == uniquify-variables  ==>
# (lambda (f71361) (error (list-ref (primitives) f71361) "length must be a fixnum >= 0"))
# == vectorize-letrec  ==>
# (lambda (f71361) (error (list-ref (primitives) f71361) "length must be a fixnum >= 0"))
# == eliminate-set!  ==>
# (lambda (f71361) (let ((f71361 f71361)) (error (list-ref (primitives) f71361) "length must be a fixnum >= 0")))
# == close-free-variables  ==>
# (closure (f71361) (error list-ref primitives) (let ((f71361 f71361)) (error (list-ref (primitives) f71361) "length must be a fixnum >= 0")))
# == eliminate-quote  ==>
# (closure (f71361) (error list-ref primitives) (let ((f71361 f71361)) (error (list-ref (primitives) f71361) "length must be a fixnum >= 0")))
# == eliminate-when/unless  ==>
# (closure (f71361) (error list-ref primitives) (let ((f71361 f71361)) (error (list-ref (primitives) f71361) "length must be a fixnum >= 0")))
# == eliminate-cond  ==>
# (closure (f71361) (error list-ref primitives) (let ((f71361 f71361)) (error (list-ref (primitives) f71361) "length must be a fixnum >= 0")))
# == external-symbols  ==>
# (closure (f71361) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f71361 f71361)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71361) "length must be a fixnum >= 0")))
# emit-expr (closure (f71361) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f71361 f71361)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71361) "length must be a fixnum >= 0")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f71361) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f71361 f71361)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71361) "length must be a fixnum >= 0")))
    movl $_L_719671, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_719672            # jump around closure body
_L_719671:
# check argument count
    cmp $4,%eax
    je _L_719673
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_719673:
# emit-tail-expr
# si=-12
# env=((f71361 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f71361 f71361)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71361) "length must be a fixnum >= 0"))
# emit-tail-let
#  si   = -12
#  env  = ((f71361 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f71361 f71361))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71361) "length must be a fixnum >= 0")
# emit-expr f71361
# emit-variable-ref
# env=((f71361 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f71361
    movl -8(%esp), %eax  # stack load f71361
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f71361 . -12) (f71361 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71361) "length must be a fixnum >= 0")
# emit-tail-funcall
#    si   =-16
#    env  = ((f71361 . -12) (f71361 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71361) "length must be a fixnum >= 0")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f71361)
# funcall
#    si   =-20
#    env  = ((f71361 . -12) (f71361 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f71361)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719674"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719674":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f71361 . -12) (f71361 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719675"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719675":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f71361
# emit-variable-ref
# env=((f71361 . -12) (f71361 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f71361
    movl -12(%esp), %eax  # stack load f71361
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f71361
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f71361)
# emit-expr "length must be a fixnum >= 0"
# string literal
    jmp _L_719677
    .align 8,0x90
_L_719676 :
    .int 112
    .ascii "length must be a fixnum >= 0"
_L_719677:
    movl $_L_719676, %eax
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
_L_719672:
     movl %eax, eh$ulength
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == uniquify-variables  ==>
# (lambda (f71362) (error (list-ref (primitives) f71362) "index out of bounds"))
# == vectorize-letrec  ==>
# (lambda (f71362) (error (list-ref (primitives) f71362) "index out of bounds"))
# == eliminate-set!  ==>
# (lambda (f71362) (let ((f71362 f71362)) (error (list-ref (primitives) f71362) "index out of bounds")))
# == close-free-variables  ==>
# (closure (f71362) (error list-ref primitives) (let ((f71362 f71362)) (error (list-ref (primitives) f71362) "index out of bounds")))
# == eliminate-quote  ==>
# (closure (f71362) (error list-ref primitives) (let ((f71362 f71362)) (error (list-ref (primitives) f71362) "index out of bounds")))
# == eliminate-when/unless  ==>
# (closure (f71362) (error list-ref primitives) (let ((f71362 f71362)) (error (list-ref (primitives) f71362) "index out of bounds")))
# == eliminate-cond  ==>
# (closure (f71362) (error list-ref primitives) (let ((f71362 f71362)) (error (list-ref (primitives) f71362) "index out of bounds")))
# == external-symbols  ==>
# (closure (f71362) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f71362 f71362)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71362) "index out of bounds")))
# emit-expr (closure (f71362) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f71362 f71362)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71362) "index out of bounds")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f71362) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f71362 f71362)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71362) "index out of bounds")))
    movl $_L_719678, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_719679            # jump around closure body
_L_719678:
# check argument count
    cmp $4,%eax
    je _L_719680
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_719680:
# emit-tail-expr
# si=-12
# env=((f71362 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f71362 f71362)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71362) "index out of bounds"))
# emit-tail-let
#  si   = -12
#  env  = ((f71362 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f71362 f71362))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71362) "index out of bounds")
# emit-expr f71362
# emit-variable-ref
# env=((f71362 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f71362
    movl -8(%esp), %eax  # stack load f71362
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f71362 . -12) (f71362 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71362) "index out of bounds")
# emit-tail-funcall
#    si   =-16
#    env  = ((f71362 . -12) (f71362 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71362) "index out of bounds")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f71362)
# funcall
#    si   =-20
#    env  = ((f71362 . -12) (f71362 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f71362)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719681"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719681":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f71362 . -12) (f71362 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719682"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719682":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f71362
# emit-variable-ref
# env=((f71362 . -12) (f71362 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f71362
    movl -12(%esp), %eax  # stack load f71362
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f71362
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f71362)
# emit-expr "index out of bounds"
# string literal
    jmp _L_719684
    .align 8,0x90
_L_719683 :
    .int 76
    .ascii "index out of bounds"
_L_719684:
    movl $_L_719683, %eax
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
_L_719679:
     movl %eax, eh$uvector$uindex
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == uniquify-variables  ==>
# (lambda (f71363) (error (list-ref (primitives) f71363) "index out of bounds"))
# == vectorize-letrec  ==>
# (lambda (f71363) (error (list-ref (primitives) f71363) "index out of bounds"))
# == eliminate-set!  ==>
# (lambda (f71363) (let ((f71363 f71363)) (error (list-ref (primitives) f71363) "index out of bounds")))
# == close-free-variables  ==>
# (closure (f71363) (error list-ref primitives) (let ((f71363 f71363)) (error (list-ref (primitives) f71363) "index out of bounds")))
# == eliminate-quote  ==>
# (closure (f71363) (error list-ref primitives) (let ((f71363 f71363)) (error (list-ref (primitives) f71363) "index out of bounds")))
# == eliminate-when/unless  ==>
# (closure (f71363) (error list-ref primitives) (let ((f71363 f71363)) (error (list-ref (primitives) f71363) "index out of bounds")))
# == eliminate-cond  ==>
# (closure (f71363) (error list-ref primitives) (let ((f71363 f71363)) (error (list-ref (primitives) f71363) "index out of bounds")))
# == external-symbols  ==>
# (closure (f71363) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f71363 f71363)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71363) "index out of bounds")))
# emit-expr (closure (f71363) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f71363 f71363)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71363) "index out of bounds")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f71363) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f71363 f71363)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71363) "index out of bounds")))
    movl $_L_719685, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_719686            # jump around closure body
_L_719685:
# check argument count
    cmp $4,%eax
    je _L_719687
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_719687:
# emit-tail-expr
# si=-12
# env=((f71363 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f71363 f71363)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71363) "index out of bounds"))
# emit-tail-let
#  si   = -12
#  env  = ((f71363 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f71363 f71363))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71363) "index out of bounds")
# emit-expr f71363
# emit-variable-ref
# env=((f71363 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f71363
    movl -8(%esp), %eax  # stack load f71363
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f71363 . -12) (f71363 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71363) "index out of bounds")
# emit-tail-funcall
#    si   =-16
#    env  = ((f71363 . -12) (f71363 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f71363) "index out of bounds")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f71363)
# funcall
#    si   =-20
#    env  = ((f71363 . -12) (f71363 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f71363)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719688"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719688":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f71363 . -12) (f71363 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_719689"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_719689":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f71363
# emit-variable-ref
# env=((f71363 . -12) (f71363 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f71363
    movl -12(%esp), %eax  # stack load f71363
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f71363
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f71363)
# emit-expr "index out of bounds"
# string literal
    jmp _L_719691
    .align 8,0x90
_L_719690 :
    .int 76
    .ascii "index out of bounds"
_L_719691:
    movl $_L_719690, %eax
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
_L_719686:
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
