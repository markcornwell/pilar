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
# (let ((f105609 (cons (make-symbol "nil" ()) ()))) (lambda () f105609))
# == vectorize-letrec  ==>
# (let ((f105609 (cons (make-symbol "nil" ()) ()))) (lambda () f105609))
# == eliminate-set!  ==>
# (let ((f105609 (cons (make-symbol "nil" ()) ()))) (lambda () (let () f105609)))
# == close-free-variables  ==>
# (let ((f105609 (cons (make-symbol "nil" ()) ()))) (closure () (f105609) (let () f105609)))
# == eliminate-quote  ==>
# (let ((f105609 (cons (make-symbol "nil" ()) ()))) (closure () (f105609) (let () f105609)))
# == eliminate-when/unless  ==>
# (let ((f105609 (cons (make-symbol "nil" ()) ()))) (closure () (f105609) (let () f105609)))
# == eliminate-cond  ==>
# (let ((f105609 (cons (make-symbol "nil" ()) ()))) (closure () (f105609) (let () f105609)))
# == external-symbols  ==>
# (let ((f105609 (cons (make-symbol "nil" ()) ()))) (closure () (f105609) (let () f105609)))
# emit-expr (let ((f105609 (cons (make-symbol "nil" ()) ()))) (closure () (f105609) (let () f105609)))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f105609 (cons (make-symbol "nil" ()) ())))
#  body = (closure () (f105609) (let () f105609))
# emit-expr (cons (make-symbol "nil" ()) ())
# cons arg1=(make-symbol "nil" ()) arg2=()
# emit-expr (make-symbol "nil" ())
# make-symbol arg1="nil" arg2=()
# emit-expr "nil"
# string literal
    jmp _L_854334
    .align 8,0x90
_L_854333 :
    .int 12
    .ascii "nil"
_L_854334:
    movl $_L_854333, %eax
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
# emit-expr (closure () (f105609) (let () f105609))
# emit-closure
# si = -4
# env = ((f105609 . 0))
# expr = (closure () (f105609) (let () f105609))
    movl $_L_854335, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f105609 . 0))
# var=f105609
    movl 0(%esp), %eax  # stack load f105609
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f105609
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_854336            # jump around closure body
_L_854335:
# check argument count
    cmp $0,%eax
    je _L_854337
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_854337:
# emit-tail-expr
# si=-8
# env=((f105609 . 4) (f105609 . 0))
# expr=(let () f105609)
# emit-tail-let
#  si   = -8
#  env  = ((f105609 . 4) (f105609 . 0))
#  bindings = ()
#  body = f105609
# emit-tail-expr
# si=-8
# env=((f105609 . 4) (f105609 . 0))
# expr=f105609
# emit-tail-variable-ref
# emit-variable-ref
# env=((f105609 . 4) (f105609 . 0))
# var=f105609
    movl 2(%edi), %eax  # frame load f105609
# end emit-variable-ref
    ret
# end emit-tail-variable ref
    .align 4,0x90
_L_854336:
     movl %eax, symbols
# == explicit-begins  ==>
# (letrec ((slen= (lambda (s1 s2) (fx= (string-length s1) (string-length s2)))) (si= (lambda (s1 s2 i) (char=? (string-ref s1 i) (string-ref s2 i)))) (si<n= (lambda (s1 s2 i n) (if (fx= i n) #t (if (si= s1 s2 i) (si<n= s1 s2 (fx+ i 1) n) #f)))) (ss= (lambda (s1 s2) (if (slen= s1 s2) (si<n= s1 s2 0 (string-length s1)) #f)))) ss=)
# == eliminate-let*  ==>
# (letrec ((slen= (lambda (s1 s2) (fx= (string-length s1) (string-length s2)))) (si= (lambda (s1 s2 i) (char=? (string-ref s1 i) (string-ref s2 i)))) (si<n= (lambda (s1 s2 i n) (if (fx= i n) #t (if (si= s1 s2 i) (si<n= s1 s2 (fx+ i 1) n) #f)))) (ss= (lambda (s1 s2) (if (slen= s1 s2) (si<n= s1 s2 0 (string-length s1)) #f)))) ss=)
# == uniquify-variables  ==>
# (letrec ((f105613 (lambda (f105634 f105635) (fx= (string-length f105634) (string-length f105635)))) (f105612 (lambda (f105631 f105632 f105633) (char=? (string-ref f105631 f105633) (string-ref f105632 f105633)))) (f105611 (lambda (f105627 f105628 f105629 f105630) (if (fx= f105629 f105630) #t (if (f105612 f105627 f105628 f105629) (f105611 f105627 f105628 (fx+ f105629 1) f105630) #f)))) (f105610 (lambda (f105625 f105626) (if (f105613 f105625 f105626) (f105611 f105625 f105626 0 (string-length f105625)) #f)))) f105610)
# == vectorize-letrec  ==>
# (let ((f105613 (make-vector 1)) (f105612 (make-vector 1)) (f105611 (make-vector 1)) (f105610 (make-vector 1))) (begin (begin (vector-set! f105613 0 (lambda (f105634 f105635) (fx= (string-length f105634) (string-length f105635)))) (vector-set! f105612 0 (lambda (f105631 f105632 f105633) (char=? (string-ref f105631 f105633) (string-ref f105632 f105633)))) (vector-set! f105611 0 (lambda (f105627 f105628 f105629 f105630) (if (fx= f105629 f105630) #t (if ((vector-ref f105612 0) f105627 f105628 f105629) ((vector-ref f105611 0) f105627 f105628 (fx+ f105629 1) f105630) #f)))) (vector-set! f105610 0 (lambda (f105625 f105626) (if ((vector-ref f105613 0) f105625 f105626) ((vector-ref f105611 0) f105625 f105626 0 (string-length f105625)) #f)))) (vector-ref f105610 0)))
# == eliminate-set!  ==>
# (let ((f105613 (make-vector 1)) (f105612 (make-vector 1)) (f105611 (make-vector 1)) (f105610 (make-vector 1))) (begin (begin (vector-set! f105613 0 (lambda (f105634 f105635) (let ((f105634 f105634) (f105635 f105635)) (fx= (string-length f105634) (string-length f105635))))) (vector-set! f105612 0 (lambda (f105631 f105632 f105633) (let ((f105631 f105631) (f105632 f105632) (f105633 f105633)) (char=? (string-ref f105631 f105633) (string-ref f105632 f105633))))) (vector-set! f105611 0 (lambda (f105627 f105628 f105629 f105630) (let ((f105627 f105627) (f105628 f105628) (f105629 f105629) (f105630 f105630)) (if (fx= f105629 f105630) #t (if ((vector-ref f105612 0) f105627 f105628 f105629) ((vector-ref f105611 0) f105627 f105628 (fx+ f105629 1) f105630) #f))))) (vector-set! f105610 0 (lambda (f105625 f105626) (let ((f105625 f105625) (f105626 f105626)) (if ((vector-ref f105613 0) f105625 f105626) ((vector-ref f105611 0) f105625 f105626 0 (string-length f105625)) #f))))) (vector-ref f105610 0)))
# == close-free-variables  ==>
# (let ((f105613 (make-vector 1)) (f105612 (make-vector 1)) (f105611 (make-vector 1)) (f105610 (make-vector 1))) (begin (begin (vector-set! f105613 0 (closure (f105634 f105635) () (let ((f105634 f105634) (f105635 f105635)) (fx= (string-length f105634) (string-length f105635))))) (vector-set! f105612 0 (closure (f105631 f105632 f105633) () (let ((f105631 f105631) (f105632 f105632) (f105633 f105633)) (char=? (string-ref f105631 f105633) (string-ref f105632 f105633))))) (vector-set! f105611 0 (closure (f105627 f105628 f105629 f105630) (f105612 f105611) (let ((f105627 f105627) (f105628 f105628) (f105629 f105629) (f105630 f105630)) (if (fx= f105629 f105630) #t (if ((vector-ref f105612 0) f105627 f105628 f105629) ((vector-ref f105611 0) f105627 f105628 (fx+ f105629 1) f105630) #f))))) (vector-set! f105610 0 (closure (f105625 f105626) (f105613 f105611) (let ((f105625 f105625) (f105626 f105626)) (if ((vector-ref f105613 0) f105625 f105626) ((vector-ref f105611 0) f105625 f105626 0 (string-length f105625)) #f))))) (vector-ref f105610 0)))
# == eliminate-quote  ==>
# (let ((f105613 (make-vector 1)) (f105612 (make-vector 1)) (f105611 (make-vector 1)) (f105610 (make-vector 1))) (begin (begin (vector-set! f105613 0 (closure (f105634 f105635) () (let ((f105634 f105634) (f105635 f105635)) (fx= (string-length f105634) (string-length f105635))))) (vector-set! f105612 0 (closure (f105631 f105632 f105633) () (let ((f105631 f105631) (f105632 f105632) (f105633 f105633)) (char=? (string-ref f105631 f105633) (string-ref f105632 f105633))))) (vector-set! f105611 0 (closure (f105627 f105628 f105629 f105630) (f105612 f105611) (let ((f105627 f105627) (f105628 f105628) (f105629 f105629) (f105630 f105630)) (if (fx= f105629 f105630) #t (if ((vector-ref f105612 0) f105627 f105628 f105629) ((vector-ref f105611 0) f105627 f105628 (fx+ f105629 1) f105630) #f))))) (vector-set! f105610 0 (closure (f105625 f105626) (f105613 f105611) (let ((f105625 f105625) (f105626 f105626)) (if ((vector-ref f105613 0) f105625 f105626) ((vector-ref f105611 0) f105625 f105626 0 (string-length f105625)) #f))))) (vector-ref f105610 0)))
# == eliminate-when/unless  ==>
# (let ((f105613 (make-vector 1)) (f105612 (make-vector 1)) (f105611 (make-vector 1)) (f105610 (make-vector 1))) (begin (begin (vector-set! f105613 0 (closure (f105634 f105635) () (let ((f105634 f105634) (f105635 f105635)) (fx= (string-length f105634) (string-length f105635))))) (vector-set! f105612 0 (closure (f105631 f105632 f105633) () (let ((f105631 f105631) (f105632 f105632) (f105633 f105633)) (char=? (string-ref f105631 f105633) (string-ref f105632 f105633))))) (vector-set! f105611 0 (closure (f105627 f105628 f105629 f105630) (f105612 f105611) (let ((f105627 f105627) (f105628 f105628) (f105629 f105629) (f105630 f105630)) (if (fx= f105629 f105630) #t (if ((vector-ref f105612 0) f105627 f105628 f105629) ((vector-ref f105611 0) f105627 f105628 (fx+ f105629 1) f105630) #f))))) (vector-set! f105610 0 (closure (f105625 f105626) (f105613 f105611) (let ((f105625 f105625) (f105626 f105626)) (if ((vector-ref f105613 0) f105625 f105626) ((vector-ref f105611 0) f105625 f105626 0 (string-length f105625)) #f))))) (vector-ref f105610 0)))
# == eliminate-cond  ==>
# (let ((f105613 (make-vector 1)) (f105612 (make-vector 1)) (f105611 (make-vector 1)) (f105610 (make-vector 1))) (begin (begin (vector-set! f105613 0 (closure (f105634 f105635) () (let ((f105634 f105634) (f105635 f105635)) (fx= (string-length f105634) (string-length f105635))))) (vector-set! f105612 0 (closure (f105631 f105632 f105633) () (let ((f105631 f105631) (f105632 f105632) (f105633 f105633)) (char=? (string-ref f105631 f105633) (string-ref f105632 f105633))))) (vector-set! f105611 0 (closure (f105627 f105628 f105629 f105630) (f105612 f105611) (let ((f105627 f105627) (f105628 f105628) (f105629 f105629) (f105630 f105630)) (if (fx= f105629 f105630) #t (if ((vector-ref f105612 0) f105627 f105628 f105629) ((vector-ref f105611 0) f105627 f105628 (fx+ f105629 1) f105630) #f))))) (vector-set! f105610 0 (closure (f105625 f105626) (f105613 f105611) (let ((f105625 f105625) (f105626 f105626)) (if ((vector-ref f105613 0) f105625 f105626) ((vector-ref f105611 0) f105625 f105626 0 (string-length f105625)) #f))))) (vector-ref f105610 0)))
# == external-symbols  ==>
# (let ((f105613 (make-vector 1)) (f105612 (make-vector 1)) (f105611 (make-vector 1)) (f105610 (make-vector 1))) (begin (begin (vector-set! f105613 0 (closure (f105634 f105635) () (let ((f105634 f105634) (f105635 f105635)) (fx= (string-length f105634) (string-length f105635))))) (vector-set! f105612 0 (closure (f105631 f105632 f105633) () (let ((f105631 f105631) (f105632 f105632) (f105633 f105633)) (char=? (string-ref f105631 f105633) (string-ref f105632 f105633))))) (vector-set! f105611 0 (closure (f105627 f105628 f105629 f105630) (f105612 f105611) (let ((f105627 f105627) (f105628 f105628) (f105629 f105629) (f105630 f105630)) (if (fx= f105629 f105630) #t (if ((vector-ref f105612 0) f105627 f105628 f105629) ((vector-ref f105611 0) f105627 f105628 (fx+ f105629 1) f105630) #f))))) (vector-set! f105610 0 (closure (f105625 f105626) (f105613 f105611) (let ((f105625 f105625) (f105626 f105626)) (if ((vector-ref f105613 0) f105625 f105626) ((vector-ref f105611 0) f105625 f105626 0 (string-length f105625)) #f))))) (vector-ref f105610 0)))
# emit-expr (let ((f105613 (make-vector 1)) (f105612 (make-vector 1)) (f105611 (make-vector 1)) (f105610 (make-vector 1))) (begin (begin (vector-set! f105613 0 (closure (f105634 f105635) () (let ((f105634 f105634) (f105635 f105635)) (fx= (string-length f105634) (string-length f105635))))) (vector-set! f105612 0 (closure (f105631 f105632 f105633) () (let ((f105631 f105631) (f105632 f105632) (f105633 f105633)) (char=? (string-ref f105631 f105633) (string-ref f105632 f105633))))) (vector-set! f105611 0 (closure (f105627 f105628 f105629 f105630) (f105612 f105611) (let ((f105627 f105627) (f105628 f105628) (f105629 f105629) (f105630 f105630)) (if (fx= f105629 f105630) #t (if ((vector-ref f105612 0) f105627 f105628 f105629) ((vector-ref f105611 0) f105627 f105628 (fx+ f105629 1) f105630) #f))))) (vector-set! f105610 0 (closure (f105625 f105626) (f105613 f105611) (let ((f105625 f105625) (f105626 f105626)) (if ((vector-ref f105613 0) f105625 f105626) ((vector-ref f105611 0) f105625 f105626 0 (string-length f105625)) #f))))) (vector-ref f105610 0)))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f105613 (make-vector 1)) (f105612 (make-vector 1)) (f105611 (make-vector 1)) (f105610 (make-vector 1)))
#  body = (begin (begin (vector-set! f105613 0 (closure (f105634 f105635) () (let ((f105634 f105634) (f105635 f105635)) (fx= (string-length f105634) (string-length f105635))))) (vector-set! f105612 0 (closure (f105631 f105632 f105633) () (let ((f105631 f105631) (f105632 f105632) (f105633 f105633)) (char=? (string-ref f105631 f105633) (string-ref f105632 f105633))))) (vector-set! f105611 0 (closure (f105627 f105628 f105629 f105630) (f105612 f105611) (let ((f105627 f105627) (f105628 f105628) (f105629 f105629) (f105630 f105630)) (if (fx= f105629 f105630) #t (if ((vector-ref f105612 0) f105627 f105628 f105629) ((vector-ref f105611 0) f105627 f105628 (fx+ f105629 1) f105630) #f))))) (vector-set! f105610 0 (closure (f105625 f105626) (f105613 f105611) (let ((f105625 f105625) (f105626 f105626)) (if ((vector-ref f105613 0) f105625 f105626) ((vector-ref f105611 0) f105625 f105626 0 (string-length f105625)) #f))))) (vector-ref f105610 0))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854338"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854338:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_854339
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854339:
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
    je "_L_854340"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854340:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_854341
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854341:
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
    je "_L_854342"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854342:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_854343
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854343:
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
    je "_L_854344"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854344:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_854345
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854345:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, -12(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f105613 0 (closure (f105634 f105635) () (let ((f105634 f105634) (f105635 f105635)) (fx= (string-length f105634) (string-length f105635))))) (vector-set! f105612 0 (closure (f105631 f105632 f105633) () (let ((f105631 f105631) (f105632 f105632) (f105633 f105633)) (char=? (string-ref f105631 f105633) (string-ref f105632 f105633))))) (vector-set! f105611 0 (closure (f105627 f105628 f105629 f105630) (f105612 f105611) (let ((f105627 f105627) (f105628 f105628) (f105629 f105629) (f105630 f105630)) (if (fx= f105629 f105630) #t (if ((vector-ref f105612 0) f105627 f105628 f105629) ((vector-ref f105611 0) f105627 f105628 (fx+ f105629 1) f105630) #f))))) (vector-set! f105610 0 (closure (f105625 f105626) (f105613 f105611) (let ((f105625 f105625) (f105626 f105626)) (if ((vector-ref f105613 0) f105625 f105626) ((vector-ref f105611 0) f105625 f105626 0 (string-length f105625)) #f))))) (vector-ref f105610 0))
# emit-begin
#   expr=(begin (begin (vector-set! f105613 0 (closure (f105634 f105635) () (let ((f105634 f105634) (f105635 f105635)) (fx= (string-length f105634) (string-length f105635))))) (vector-set! f105612 0 (closure (f105631 f105632 f105633) () (let ((f105631 f105631) (f105632 f105632) (f105633 f105633)) (char=? (string-ref f105631 f105633) (string-ref f105632 f105633))))) (vector-set! f105611 0 (closure (f105627 f105628 f105629 f105630) (f105612 f105611) (let ((f105627 f105627) (f105628 f105628) (f105629 f105629) (f105630 f105630)) (if (fx= f105629 f105630) #t (if ((vector-ref f105612 0) f105627 f105628 f105629) ((vector-ref f105611 0) f105627 f105628 (fx+ f105629 1) f105630) #f))))) (vector-set! f105610 0 (closure (f105625 f105626) (f105613 f105611) (let ((f105625 f105625) (f105626 f105626)) (if ((vector-ref f105613 0) f105625 f105626) ((vector-ref f105611 0) f105625 f105626 0 (string-length f105625)) #f))))) (vector-ref f105610 0))
#   env=((f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# emit-expr (begin (vector-set! f105613 0 (closure (f105634 f105635) () (let ((f105634 f105634) (f105635 f105635)) (fx= (string-length f105634) (string-length f105635))))) (vector-set! f105612 0 (closure (f105631 f105632 f105633) () (let ((f105631 f105631) (f105632 f105632) (f105633 f105633)) (char=? (string-ref f105631 f105633) (string-ref f105632 f105633))))) (vector-set! f105611 0 (closure (f105627 f105628 f105629 f105630) (f105612 f105611) (let ((f105627 f105627) (f105628 f105628) (f105629 f105629) (f105630 f105630)) (if (fx= f105629 f105630) #t (if ((vector-ref f105612 0) f105627 f105628 f105629) ((vector-ref f105611 0) f105627 f105628 (fx+ f105629 1) f105630) #f))))) (vector-set! f105610 0 (closure (f105625 f105626) (f105613 f105611) (let ((f105625 f105625) (f105626 f105626)) (if ((vector-ref f105613 0) f105625 f105626) ((vector-ref f105611 0) f105625 f105626 0 (string-length f105625)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f105613 0 (closure (f105634 f105635) () (let ((f105634 f105634) (f105635 f105635)) (fx= (string-length f105634) (string-length f105635))))) (vector-set! f105612 0 (closure (f105631 f105632 f105633) () (let ((f105631 f105631) (f105632 f105632) (f105633 f105633)) (char=? (string-ref f105631 f105633) (string-ref f105632 f105633))))) (vector-set! f105611 0 (closure (f105627 f105628 f105629 f105630) (f105612 f105611) (let ((f105627 f105627) (f105628 f105628) (f105629 f105629) (f105630 f105630)) (if (fx= f105629 f105630) #t (if ((vector-ref f105612 0) f105627 f105628 f105629) ((vector-ref f105611 0) f105627 f105628 (fx+ f105629 1) f105630) #f))))) (vector-set! f105610 0 (closure (f105625 f105626) (f105613 f105611) (let ((f105625 f105625) (f105626 f105626)) (if ((vector-ref f105613 0) f105625 f105626) ((vector-ref f105611 0) f105625 f105626 0 (string-length f105625)) #f)))))
#   env=((f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# emit-expr (vector-set! f105613 0 (closure (f105634 f105635) () (let ((f105634 f105634) (f105635 f105635)) (fx= (string-length f105634) (string-length f105635)))))
# emit-expr f105613
# emit-variable-ref
# env=((f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105613
    movl 0(%esp), %eax  # stack load f105613
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854346
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854346:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854347"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854347:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854349
    cmp  $0,%eax
    jge _L_854348
_L_854349:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854348:
    movl %eax, -20(%esp)
# emit-expr (closure (f105634 f105635) () (let ((f105634 f105634) (f105635 f105635)) (fx= (string-length f105634) (string-length f105635))))
# emit-closure
# si = -24
# env = ((f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# expr = (closure (f105634 f105635) () (let ((f105634 f105634) (f105635 f105635)) (fx= (string-length f105634) (string-length f105635))))
    movl $_L_854350, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_854351            # jump around closure body
_L_854350:
# check argument count
    cmp $8,%eax
    je _L_854352
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_854352:
# emit-tail-expr
# si=-16
# env=((f105635 . -12) (f105634 . -8) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# expr=(let ((f105634 f105634) (f105635 f105635)) (fx= (string-length f105634) (string-length f105635)))
# emit-tail-let
#  si   = -16
#  env  = ((f105635 . -12) (f105634 . -8) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
#  bindings = ((f105634 f105634) (f105635 f105635))
#  body = (fx= (string-length f105634) (string-length f105635))
# emit-expr f105634
# emit-variable-ref
# env=((f105635 . -12) (f105634 . -8) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105634
    movl -8(%esp), %eax  # stack load f105634
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f105635
# emit-variable-ref
# env=((f105635 . -12) (f105634 . -8) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105635
    movl -12(%esp), %eax  # stack load f105635
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f105635 . -20) (f105634 . -16) (f105635 . -12) (f105634 . -8) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# expr=(fx= (string-length f105634) (string-length f105635))
# tail primcall
# emit-expr (string-length f105635)
# emit-expr f105635
# emit-variable-ref
# env=((f105635 . -20) (f105634 . -16) (f105635 . -12) (f105634 . -8) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105635
    movl -20(%esp), %eax  # stack load f105635
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_854353
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854353:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854354"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854354:
    movl %eax, -24(%esp)
# emit-expr (string-length f105634)
# emit-expr f105634
# emit-variable-ref
# env=((f105635 . -20) (f105634 . -16) (f105635 . -12) (f105634 . -8) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105634
    movl -16(%esp), %eax  # stack load f105634
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_854355
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854355:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854356"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854356:
    cmp -24(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
#return from tail (fx= (string-length f105634) (string-length f105635))
    ret
    .align 4,0x90
_L_854351:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105612 0 (closure (f105631 f105632 f105633) () (let ((f105631 f105631) (f105632 f105632) (f105633 f105633)) (char=? (string-ref f105631 f105633) (string-ref f105632 f105633))))) (vector-set! f105611 0 (closure (f105627 f105628 f105629 f105630) (f105612 f105611) (let ((f105627 f105627) (f105628 f105628) (f105629 f105629) (f105630 f105630)) (if (fx= f105629 f105630) #t (if ((vector-ref f105612 0) f105627 f105628 f105629) ((vector-ref f105611 0) f105627 f105628 (fx+ f105629 1) f105630) #f))))) (vector-set! f105610 0 (closure (f105625 f105626) (f105613 f105611) (let ((f105625 f105625) (f105626 f105626)) (if ((vector-ref f105613 0) f105625 f105626) ((vector-ref f105611 0) f105625 f105626 0 (string-length f105625)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f105612 0 (closure (f105631 f105632 f105633) () (let ((f105631 f105631) (f105632 f105632) (f105633 f105633)) (char=? (string-ref f105631 f105633) (string-ref f105632 f105633))))) (vector-set! f105611 0 (closure (f105627 f105628 f105629 f105630) (f105612 f105611) (let ((f105627 f105627) (f105628 f105628) (f105629 f105629) (f105630 f105630)) (if (fx= f105629 f105630) #t (if ((vector-ref f105612 0) f105627 f105628 f105629) ((vector-ref f105611 0) f105627 f105628 (fx+ f105629 1) f105630) #f))))) (vector-set! f105610 0 (closure (f105625 f105626) (f105613 f105611) (let ((f105625 f105625) (f105626 f105626)) (if ((vector-ref f105613 0) f105625 f105626) ((vector-ref f105611 0) f105625 f105626 0 (string-length f105625)) #f)))))
#   env=((f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# emit-expr (vector-set! f105612 0 (closure (f105631 f105632 f105633) () (let ((f105631 f105631) (f105632 f105632) (f105633 f105633)) (char=? (string-ref f105631 f105633) (string-ref f105632 f105633)))))
# emit-expr f105612
# emit-variable-ref
# env=((f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105612
    movl -4(%esp), %eax  # stack load f105612
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854357
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854357:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854358"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854358:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854360
    cmp  $0,%eax
    jge _L_854359
_L_854360:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854359:
    movl %eax, -20(%esp)
# emit-expr (closure (f105631 f105632 f105633) () (let ((f105631 f105631) (f105632 f105632) (f105633 f105633)) (char=? (string-ref f105631 f105633) (string-ref f105632 f105633))))
# emit-closure
# si = -24
# env = ((f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# expr = (closure (f105631 f105632 f105633) () (let ((f105631 f105631) (f105632 f105632) (f105633 f105633)) (char=? (string-ref f105631 f105633) (string-ref f105632 f105633))))
    movl $_L_854361, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_854362            # jump around closure body
_L_854361:
# check argument count
    cmp $12,%eax
    je _L_854363
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_854363:
# emit-tail-expr
# si=-20
# env=((f105633 . -16) (f105632 . -12) (f105631 . -8) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# expr=(let ((f105631 f105631) (f105632 f105632) (f105633 f105633)) (char=? (string-ref f105631 f105633) (string-ref f105632 f105633)))
# emit-tail-let
#  si   = -20
#  env  = ((f105633 . -16) (f105632 . -12) (f105631 . -8) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
#  bindings = ((f105631 f105631) (f105632 f105632) (f105633 f105633))
#  body = (char=? (string-ref f105631 f105633) (string-ref f105632 f105633))
# emit-expr f105631
# emit-variable-ref
# env=((f105633 . -16) (f105632 . -12) (f105631 . -8) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105631
    movl -8(%esp), %eax  # stack load f105631
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-expr f105632
# emit-variable-ref
# env=((f105633 . -16) (f105632 . -12) (f105631 . -8) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105632
    movl -12(%esp), %eax  # stack load f105632
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f105633
# emit-variable-ref
# env=((f105633 . -16) (f105632 . -12) (f105631 . -8) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105633
    movl -16(%esp), %eax  # stack load f105633
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-tail-expr
# si=-32
# env=((f105633 . -28) (f105632 . -24) (f105631 . -20) (f105633 . -16) (f105632 . -12) (f105631 . -8) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# expr=(char=? (string-ref f105631 f105633) (string-ref f105632 f105633))
# tail primcall
# char= c1=(string-ref f105631 f105633) c2=(string-ref f105632 f105633)
# emit-expr (string-ref f105631 f105633)
# emit-expr f105631
# emit-variable-ref
# env=((f105633 . -28) (f105632 . -24) (f105631 . -20) (f105633 . -16) (f105632 . -12) (f105631 . -8) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105631
    movl -20(%esp), %eax  # stack load f105631
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_854364
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854364:
    movl %eax, -32(%esp)
# emit-expr f105633
# emit-variable-ref
# env=((f105633 . -28) (f105632 . -24) (f105631 . -20) (f105633 . -16) (f105632 . -12) (f105631 . -8) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105633
    movl -28(%esp), %eax  # stack load f105633
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854365"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854365:
# check bounds on string index
    movl -32(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_854367
    cmp  $0,%eax
    jge _L_854366
_L_854367:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854366:
    sar $2, %eax
    movl -32(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_854368"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $32,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854368:
    movb %ah, -32(%esp)
# emit-expr (string-ref f105632 f105633)
# emit-expr f105632
# emit-variable-ref
# env=((f105633 . -28) (f105632 . -24) (f105631 . -20) (f105633 . -16) (f105632 . -12) (f105631 . -8) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105632
    movl -24(%esp), %eax  # stack load f105632
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_854369
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854369:
    movl %eax, -36(%esp)
# emit-expr f105633
# emit-variable-ref
# env=((f105633 . -28) (f105632 . -24) (f105631 . -20) (f105633 . -16) (f105632 . -12) (f105631 . -8) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105633
    movl -28(%esp), %eax  # stack load f105633
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854370"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854370:
# check bounds on string index
    movl -36(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_854372
    cmp  $0,%eax
    jge _L_854371
_L_854372:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854371:
    sar $2, %eax
    movl -36(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_854373"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $32,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854373:
    cmp %ah, -32(%esp)
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
#return from tail (char=? (string-ref f105631 f105633) (string-ref f105632 f105633))
    ret
    .align 4,0x90
_L_854362:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105611 0 (closure (f105627 f105628 f105629 f105630) (f105612 f105611) (let ((f105627 f105627) (f105628 f105628) (f105629 f105629) (f105630 f105630)) (if (fx= f105629 f105630) #t (if ((vector-ref f105612 0) f105627 f105628 f105629) ((vector-ref f105611 0) f105627 f105628 (fx+ f105629 1) f105630) #f))))) (vector-set! f105610 0 (closure (f105625 f105626) (f105613 f105611) (let ((f105625 f105625) (f105626 f105626)) (if ((vector-ref f105613 0) f105625 f105626) ((vector-ref f105611 0) f105625 f105626 0 (string-length f105625)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f105611 0 (closure (f105627 f105628 f105629 f105630) (f105612 f105611) (let ((f105627 f105627) (f105628 f105628) (f105629 f105629) (f105630 f105630)) (if (fx= f105629 f105630) #t (if ((vector-ref f105612 0) f105627 f105628 f105629) ((vector-ref f105611 0) f105627 f105628 (fx+ f105629 1) f105630) #f))))) (vector-set! f105610 0 (closure (f105625 f105626) (f105613 f105611) (let ((f105625 f105625) (f105626 f105626)) (if ((vector-ref f105613 0) f105625 f105626) ((vector-ref f105611 0) f105625 f105626 0 (string-length f105625)) #f)))))
#   env=((f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# emit-expr (vector-set! f105611 0 (closure (f105627 f105628 f105629 f105630) (f105612 f105611) (let ((f105627 f105627) (f105628 f105628) (f105629 f105629) (f105630 f105630)) (if (fx= f105629 f105630) #t (if ((vector-ref f105612 0) f105627 f105628 f105629) ((vector-ref f105611 0) f105627 f105628 (fx+ f105629 1) f105630) #f)))))
# emit-expr f105611
# emit-variable-ref
# env=((f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105611
    movl -8(%esp), %eax  # stack load f105611
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854374
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854374:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854375"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854375:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854377
    cmp  $0,%eax
    jge _L_854376
_L_854377:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854376:
    movl %eax, -20(%esp)
# emit-expr (closure (f105627 f105628 f105629 f105630) (f105612 f105611) (let ((f105627 f105627) (f105628 f105628) (f105629 f105629) (f105630 f105630)) (if (fx= f105629 f105630) #t (if ((vector-ref f105612 0) f105627 f105628 f105629) ((vector-ref f105611 0) f105627 f105628 (fx+ f105629 1) f105630) #f))))
# emit-closure
# si = -24
# env = ((f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# expr = (closure (f105627 f105628 f105629 f105630) (f105612 f105611) (let ((f105627 f105627) (f105628 f105628) (f105629 f105629) (f105630 f105630)) (if (fx= f105629 f105630) #t (if ((vector-ref f105612 0) f105627 f105628 f105629) ((vector-ref f105611 0) f105627 f105628 (fx+ f105629 1) f105630) #f))))
    movl $_L_854378, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105612
    movl -4(%esp), %eax  # stack load f105612
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f105612
# emit-variable-ref
# env=((f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105611
    movl -8(%esp), %eax  # stack load f105611
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f105611
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_854379            # jump around closure body
_L_854378:
# check argument count
    cmp $16,%eax
    je _L_854380
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_854380:
# emit-tail-expr
# si=-24
# env=((f105630 . -20) (f105629 . -16) (f105628 . -12) (f105627 . -8) (f105611 . 8) (f105612 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# expr=(let ((f105627 f105627) (f105628 f105628) (f105629 f105629) (f105630 f105630)) (if (fx= f105629 f105630) #t (if ((vector-ref f105612 0) f105627 f105628 f105629) ((vector-ref f105611 0) f105627 f105628 (fx+ f105629 1) f105630) #f)))
# emit-tail-let
#  si   = -24
#  env  = ((f105630 . -20) (f105629 . -16) (f105628 . -12) (f105627 . -8) (f105611 . 8) (f105612 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
#  bindings = ((f105627 f105627) (f105628 f105628) (f105629 f105629) (f105630 f105630))
#  body = (if (fx= f105629 f105630) #t (if ((vector-ref f105612 0) f105627 f105628 f105629) ((vector-ref f105611 0) f105627 f105628 (fx+ f105629 1) f105630) #f))
# emit-expr f105627
# emit-variable-ref
# env=((f105630 . -20) (f105629 . -16) (f105628 . -12) (f105627 . -8) (f105611 . 8) (f105612 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105627
    movl -8(%esp), %eax  # stack load f105627
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f105628
# emit-variable-ref
# env=((f105630 . -20) (f105629 . -16) (f105628 . -12) (f105627 . -8) (f105611 . 8) (f105612 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105628
    movl -12(%esp), %eax  # stack load f105628
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-expr f105629
# emit-variable-ref
# env=((f105630 . -20) (f105629 . -16) (f105628 . -12) (f105627 . -8) (f105611 . 8) (f105612 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105629
    movl -16(%esp), %eax  # stack load f105629
# end emit-variable-ref
    movl %eax, -32(%esp)  # stack save
# emit-expr f105630
# emit-variable-ref
# env=((f105630 . -20) (f105629 . -16) (f105628 . -12) (f105627 . -8) (f105611 . 8) (f105612 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105630
    movl -20(%esp), %eax  # stack load f105630
# end emit-variable-ref
    movl %eax, -36(%esp)  # stack save
# emit-tail-expr
# si=-40
# env=((f105630 . -36) (f105629 . -32) (f105628 . -28) (f105627 . -24) (f105630 . -20) (f105629 . -16) (f105628 . -12) (f105627 . -8) (f105611 . 8) (f105612 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# expr=(if (fx= f105629 f105630) #t (if ((vector-ref f105612 0) f105627 f105628 f105629) ((vector-ref f105611 0) f105627 f105628 (fx+ f105629 1) f105630) #f))
# emit-expr (fx= f105629 f105630)
# emit-expr f105630
# emit-variable-ref
# env=((f105630 . -36) (f105629 . -32) (f105628 . -28) (f105627 . -24) (f105630 . -20) (f105629 . -16) (f105628 . -12) (f105627 . -8) (f105611 . 8) (f105612 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105630
    movl -36(%esp), %eax  # stack load f105630
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854383"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854383:
    movl %eax, -40(%esp)
# emit-expr f105629
# emit-variable-ref
# env=((f105630 . -36) (f105629 . -32) (f105628 . -28) (f105627 . -24) (f105630 . -20) (f105629 . -16) (f105628 . -12) (f105627 . -8) (f105611 . 8) (f105612 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105629
    movl -32(%esp), %eax  # stack load f105629
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854384"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854384:
    cmp -40(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_854381
# emit-tail-expr
# si=-40
# env=((f105630 . -36) (f105629 . -32) (f105628 . -28) (f105627 . -24) (f105630 . -20) (f105629 . -16) (f105628 . -12) (f105627 . -8) (f105611 . 8) (f105612 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# expr=#t
    movl $111, %eax     # immed #t
    ret                  # immediate tail return
    jmp _L_854382
_L_854381:
# emit-tail-expr
# si=-40
# env=((f105630 . -36) (f105629 . -32) (f105628 . -28) (f105627 . -24) (f105630 . -20) (f105629 . -16) (f105628 . -12) (f105627 . -8) (f105611 . 8) (f105612 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# expr=(if ((vector-ref f105612 0) f105627 f105628 f105629) ((vector-ref f105611 0) f105627 f105628 (fx+ f105629 1) f105630) #f)
# emit-expr ((vector-ref f105612 0) f105627 f105628 f105629)
# funcall
#    si   =-40
#    env  = ((f105630 . -36) (f105629 . -32) (f105628 . -28) (f105627 . -24) (f105630 . -20) (f105629 . -16) (f105628 . -12) (f105627 . -8) (f105611 . 8) (f105612 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
#    expr = (funcall (vector-ref f105612 0) f105627 f105628 f105629)
# emit-expr (vector-ref f105612 0)
# emit-expr f105612
# emit-variable-ref
# env=((f105630 . -36) (f105629 . -32) (f105628 . -28) (f105627 . -24) (f105630 . -20) (f105629 . -16) (f105628 . -12) (f105627 . -8) (f105611 . 8) (f105612 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105612
    movl 2(%edi), %eax  # frame load f105612
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854387
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854387:
    movl %eax, -48(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854388"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854388:
# check bounds on vector index
    movl -48(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854390
    cmp  $0,%eax
    jge _L_854389
_L_854390:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854389:
    movl -48(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854391"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854391":
   movl %eax,  -48(%esp)  # stash funcall-oper in closure slot
# emit-expr f105627
# emit-variable-ref
# env=((f105630 . -36) (f105629 . -32) (f105628 . -28) (f105627 . -24) (f105630 . -20) (f105629 . -16) (f105628 . -12) (f105627 . -8) (f105611 . 8) (f105612 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105627
    movl -24(%esp), %eax  # stack load f105627
# end emit-variable-ref
    mov %eax, -52(%esp)  # arg f105627
# emit-expr f105628
# emit-variable-ref
# env=((f105630 . -36) (f105629 . -32) (f105628 . -28) (f105627 . -24) (f105630 . -20) (f105629 . -16) (f105628 . -12) (f105627 . -8) (f105611 . 8) (f105612 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105628
    movl -28(%esp), %eax  # stack load f105628
# end emit-variable-ref
    mov %eax, -56(%esp)  # arg f105628
# emit-expr f105629
# emit-variable-ref
# env=((f105630 . -36) (f105629 . -32) (f105628 . -28) (f105627 . -24) (f105630 . -20) (f105629 . -16) (f105628 . -12) (f105627 . -8) (f105611 . 8) (f105612 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105629
    movl -32(%esp), %eax  # stack load f105629
# end emit-variable-ref
    mov %eax, -60(%esp)  # arg f105629
    movl -48(%esp), %edi   # load new closure to %edi
    add $-40, %esp   # adjust base
    movl $12,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $40, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_854385
# emit-tail-expr
# si=-40
# env=((f105630 . -36) (f105629 . -32) (f105628 . -28) (f105627 . -24) (f105630 . -20) (f105629 . -16) (f105628 . -12) (f105627 . -8) (f105611 . 8) (f105612 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# expr=((vector-ref f105611 0) f105627 f105628 (fx+ f105629 1) f105630)
# emit-tail-funcall
#    si   =-40
#    env  = ((f105630 . -36) (f105629 . -32) (f105628 . -28) (f105627 . -24) (f105630 . -20) (f105629 . -16) (f105628 . -12) (f105627 . -8) (f105611 . 8) (f105612 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
#    expr = (funcall (vector-ref f105611 0) f105627 f105628 (fx+ f105629 1) f105630)
# emit-expr (vector-ref f105611 0)
# emit-expr f105611
# emit-variable-ref
# env=((f105630 . -36) (f105629 . -32) (f105628 . -28) (f105627 . -24) (f105630 . -20) (f105629 . -16) (f105628 . -12) (f105627 . -8) (f105611 . 8) (f105612 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105611
    movl 6(%edi), %eax  # frame load f105611
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854392
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854392:
    movl %eax, -40(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854393"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854393:
# check bounds on vector index
    movl -40(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854395
    cmp  $0,%eax
    jge _L_854394
_L_854395:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854394:
    movl -40(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -40(%esp)  # stash funcall-oper in next closure slot
# emit-expr f105627
# emit-variable-ref
# env=((f105630 . -36) (f105629 . -32) (f105628 . -28) (f105627 . -24) (f105630 . -20) (f105629 . -16) (f105628 . -12) (f105627 . -8) (f105611 . 8) (f105612 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105627
    movl -24(%esp), %eax  # stack load f105627
# end emit-variable-ref
    mov %eax, -44(%esp)    # arg f105627
# emit-expr f105628
# emit-variable-ref
# env=((f105630 . -36) (f105629 . -32) (f105628 . -28) (f105627 . -24) (f105630 . -20) (f105629 . -16) (f105628 . -12) (f105627 . -8) (f105611 . 8) (f105612 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105628
    movl -28(%esp), %eax  # stack load f105628
# end emit-variable-ref
    mov %eax, -48(%esp)    # arg f105628
# emit-expr (fx+ f105629 1)
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854396"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854396:
    movl %eax, -52(%esp)  # fx+ push arg1
# emit-expr f105629
# emit-variable-ref
# env=((f105630 . -36) (f105629 . -32) (f105628 . -28) (f105627 . -24) (f105630 . -20) (f105629 . -16) (f105628 . -12) (f105627 . -8) (f105611 . 8) (f105612 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105629
    movl -32(%esp), %eax  # stack load f105629
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854397"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854397:
    addl -52(%esp), %eax  # fx+ arg1 arg2
    mov %eax, -52(%esp)    # arg (fx+ f105629 1)
# emit-expr f105630
# emit-variable-ref
# env=((f105630 . -36) (f105629 . -32) (f105628 . -28) (f105627 . -24) (f105630 . -20) (f105629 . -16) (f105628 . -12) (f105627 . -8) (f105611 . 8) (f105612 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105630
    movl -36(%esp), %eax  # stack load f105630
# end emit-variable-ref
    mov %eax, -56(%esp)    # arg f105630
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
    jmp _L_854386
_L_854385:
# emit-tail-expr
# si=-40
# env=((f105630 . -36) (f105629 . -32) (f105628 . -28) (f105627 . -24) (f105630 . -20) (f105629 . -16) (f105628 . -12) (f105627 . -8) (f105611 . 8) (f105612 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_854386:
_L_854382:
    .align 4,0x90
_L_854379:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105610 0 (closure (f105625 f105626) (f105613 f105611) (let ((f105625 f105625) (f105626 f105626)) (if ((vector-ref f105613 0) f105625 f105626) ((vector-ref f105611 0) f105625 f105626 0 (string-length f105625)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f105610 0 (closure (f105625 f105626) (f105613 f105611) (let ((f105625 f105625) (f105626 f105626)) (if ((vector-ref f105613 0) f105625 f105626) ((vector-ref f105611 0) f105625 f105626 0 (string-length f105625)) #f)))))
#   env=((f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# emit-expr (vector-set! f105610 0 (closure (f105625 f105626) (f105613 f105611) (let ((f105625 f105625) (f105626 f105626)) (if ((vector-ref f105613 0) f105625 f105626) ((vector-ref f105611 0) f105625 f105626 0 (string-length f105625)) #f))))
# emit-expr f105610
# emit-variable-ref
# env=((f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105610
    movl -12(%esp), %eax  # stack load f105610
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854398
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854398:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854399"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854399:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854401
    cmp  $0,%eax
    jge _L_854400
_L_854401:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854400:
    movl %eax, -20(%esp)
# emit-expr (closure (f105625 f105626) (f105613 f105611) (let ((f105625 f105625) (f105626 f105626)) (if ((vector-ref f105613 0) f105625 f105626) ((vector-ref f105611 0) f105625 f105626 0 (string-length f105625)) #f)))
# emit-closure
# si = -24
# env = ((f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# expr = (closure (f105625 f105626) (f105613 f105611) (let ((f105625 f105625) (f105626 f105626)) (if ((vector-ref f105613 0) f105625 f105626) ((vector-ref f105611 0) f105625 f105626 0 (string-length f105625)) #f)))
    movl $_L_854402, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105613
    movl 0(%esp), %eax  # stack load f105613
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f105613
# emit-variable-ref
# env=((f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105611
    movl -8(%esp), %eax  # stack load f105611
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f105611
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_854403            # jump around closure body
_L_854402:
# check argument count
    cmp $8,%eax
    je _L_854404
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_854404:
# emit-tail-expr
# si=-16
# env=((f105626 . -12) (f105625 . -8) (f105611 . 8) (f105613 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# expr=(let ((f105625 f105625) (f105626 f105626)) (if ((vector-ref f105613 0) f105625 f105626) ((vector-ref f105611 0) f105625 f105626 0 (string-length f105625)) #f))
# emit-tail-let
#  si   = -16
#  env  = ((f105626 . -12) (f105625 . -8) (f105611 . 8) (f105613 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
#  bindings = ((f105625 f105625) (f105626 f105626))
#  body = (if ((vector-ref f105613 0) f105625 f105626) ((vector-ref f105611 0) f105625 f105626 0 (string-length f105625)) #f)
# emit-expr f105625
# emit-variable-ref
# env=((f105626 . -12) (f105625 . -8) (f105611 . 8) (f105613 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105625
    movl -8(%esp), %eax  # stack load f105625
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f105626
# emit-variable-ref
# env=((f105626 . -12) (f105625 . -8) (f105611 . 8) (f105613 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105626
    movl -12(%esp), %eax  # stack load f105626
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f105626 . -20) (f105625 . -16) (f105626 . -12) (f105625 . -8) (f105611 . 8) (f105613 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# expr=(if ((vector-ref f105613 0) f105625 f105626) ((vector-ref f105611 0) f105625 f105626 0 (string-length f105625)) #f)
# emit-expr ((vector-ref f105613 0) f105625 f105626)
# funcall
#    si   =-24
#    env  = ((f105626 . -20) (f105625 . -16) (f105626 . -12) (f105625 . -8) (f105611 . 8) (f105613 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
#    expr = (funcall (vector-ref f105613 0) f105625 f105626)
# emit-expr (vector-ref f105613 0)
# emit-expr f105613
# emit-variable-ref
# env=((f105626 . -20) (f105625 . -16) (f105626 . -12) (f105625 . -8) (f105611 . 8) (f105613 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105613
    movl 2(%edi), %eax  # frame load f105613
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854407
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854407:
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854408"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854408:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854410
    cmp  $0,%eax
    jge _L_854409
_L_854410:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854409:
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854411"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854411":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f105625
# emit-variable-ref
# env=((f105626 . -20) (f105625 . -16) (f105626 . -12) (f105625 . -8) (f105611 . 8) (f105613 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105625
    movl -16(%esp), %eax  # stack load f105625
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f105625
# emit-expr f105626
# emit-variable-ref
# env=((f105626 . -20) (f105625 . -16) (f105626 . -12) (f105625 . -8) (f105611 . 8) (f105613 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105626
    movl -20(%esp), %eax  # stack load f105626
# end emit-variable-ref
    mov %eax, -40(%esp)  # arg f105626
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_854405
# emit-tail-expr
# si=-24
# env=((f105626 . -20) (f105625 . -16) (f105626 . -12) (f105625 . -8) (f105611 . 8) (f105613 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# expr=((vector-ref f105611 0) f105625 f105626 0 (string-length f105625))
# emit-tail-funcall
#    si   =-24
#    env  = ((f105626 . -20) (f105625 . -16) (f105626 . -12) (f105625 . -8) (f105611 . 8) (f105613 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
#    expr = (funcall (vector-ref f105611 0) f105625 f105626 0 (string-length f105625))
# emit-expr (vector-ref f105611 0)
# emit-expr f105611
# emit-variable-ref
# env=((f105626 . -20) (f105625 . -16) (f105626 . -12) (f105625 . -8) (f105611 . 8) (f105613 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105611
    movl 6(%edi), %eax  # frame load f105611
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854412
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854412:
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854413"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854413:
# check bounds on vector index
    movl -24(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854415
    cmp  $0,%eax
    jge _L_854414
_L_854415:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854414:
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr f105625
# emit-variable-ref
# env=((f105626 . -20) (f105625 . -16) (f105626 . -12) (f105625 . -8) (f105611 . 8) (f105613 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105625
    movl -16(%esp), %eax  # stack load f105625
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f105625
# emit-expr f105626
# emit-variable-ref
# env=((f105626 . -20) (f105625 . -16) (f105626 . -12) (f105625 . -8) (f105611 . 8) (f105613 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105626
    movl -20(%esp), %eax  # stack load f105626
# end emit-variable-ref
    mov %eax, -32(%esp)    # arg f105626
# emit-expr 0
    movl $0, %eax     # immed 0
    mov %eax, -36(%esp)    # arg 0
# emit-expr (string-length f105625)
# emit-expr f105625
# emit-variable-ref
# env=((f105626 . -20) (f105625 . -16) (f105626 . -12) (f105625 . -8) (f105611 . 8) (f105613 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105625
    movl -16(%esp), %eax  # stack load f105625
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_854416
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854416:
    movl -6(%eax), %eax
    mov %eax, -40(%esp)    # arg (string-length f105625)
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
    jmp _L_854406
_L_854405:
# emit-tail-expr
# si=-24
# env=((f105626 . -20) (f105625 . -16) (f105626 . -12) (f105625 . -8) (f105611 . 8) (f105613 . 4) (f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_854406:
    .align 4,0x90
_L_854403:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# emit-expr (begin (vector-ref f105610 0))
# emit-begin
#   expr=(begin (vector-ref f105610 0))
#   env=((f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# emit-expr (vector-ref f105610 0)
# emit-expr f105610
# emit-variable-ref
# env=((f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
# var=f105610
    movl -12(%esp), %eax  # stack load f105610
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854417
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854417:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854418"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854418:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854420
    cmp  $0,%eax
    jge _L_854419
_L_854420:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854419:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f105610 . -12) (f105611 . -8) (f105612 . -4) (f105613 . 0))
     movl %eax, string$e$q
# == explicit-begins  ==>
# (letrec ((str->sym (lambda (str symlist) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let* ((new-sym (make-symbol str #f)) (new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym)) (str->sym str (cdr symlist))))))) (lambda (str) (str->sym str (symbols))))
# == eliminate-let*  ==>
# (letrec ((str->sym (lambda (str symlist) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) (str->sym str (cdr symlist))))))) (lambda (str) (str->sym str (symbols))))
# == uniquify-variables  ==>
# (letrec ((f105636 (lambda (f105645 f105646) (if (string=? f105645 (symbol->string (car f105646))) (car f105646) (if (null? (cdr f105646)) (let ((f105650 (make-symbol f105645 #f))) (let ((f105652 (cons f105650 ()))) (begin (set-cdr! f105646 f105652) f105650))) (f105636 f105645 (cdr f105646))))))) (lambda (f105654) (f105636 f105654 (symbols))))
# == vectorize-letrec  ==>
# (let ((f105636 (make-vector 1))) (begin (begin (vector-set! f105636 0 (lambda (f105645 f105646) (if (string=? f105645 (symbol->string (car f105646))) (car f105646) (if (null? (cdr f105646)) (let ((f105650 (make-symbol f105645 #f))) (let ((f105652 (cons f105650 ()))) (begin (set-cdr! f105646 f105652) f105650))) ((vector-ref f105636 0) f105645 (cdr f105646))))))) (lambda (f105654) ((vector-ref f105636 0) f105654 (symbols)))))
# == eliminate-set!  ==>
# (let ((f105636 (make-vector 1))) (begin (begin (vector-set! f105636 0 (lambda (f105645 f105646) (let ((f105645 f105645) (f105646 f105646)) (if (string=? f105645 (symbol->string (car f105646))) (car f105646) (if (null? (cdr f105646)) (let ((f105650 (make-symbol f105645 #f))) (let ((f105652 (cons f105650 ()))) (begin (set-cdr! f105646 f105652) f105650))) ((vector-ref f105636 0) f105645 (cdr f105646)))))))) (lambda (f105654) (let ((f105654 f105654)) ((vector-ref f105636 0) f105654 (symbols))))))
# == close-free-variables  ==>
# (let ((f105636 (make-vector 1))) (begin (begin (vector-set! f105636 0 (closure (f105645 f105646) (string=? f105636) (let ((f105645 f105645) (f105646 f105646)) (if (string=? f105645 (symbol->string (car f105646))) (car f105646) (if (null? (cdr f105646)) (let ((f105650 (make-symbol f105645 #f))) (let ((f105652 (cons f105650 ()))) (begin (set-cdr! f105646 f105652) f105650))) ((vector-ref f105636 0) f105645 (cdr f105646)))))))) (closure (f105654) (f105636 symbols) (let ((f105654 f105654)) ((vector-ref f105636 0) f105654 (symbols))))))
# == eliminate-quote  ==>
# (let ((f105636 (make-vector 1))) (begin (begin (vector-set! f105636 0 (closure (f105645 f105646) (string=? f105636) (let ((f105645 f105645) (f105646 f105646)) (if (string=? f105645 (symbol->string (car f105646))) (car f105646) (if (null? (cdr f105646)) (let ((f105650 (make-symbol f105645 #f))) (let ((f105652 (cons f105650 ()))) (begin (set-cdr! f105646 f105652) f105650))) ((vector-ref f105636 0) f105645 (cdr f105646)))))))) (closure (f105654) (f105636 symbols) (let ((f105654 f105654)) ((vector-ref f105636 0) f105654 (symbols))))))
# == eliminate-when/unless  ==>
# (let ((f105636 (make-vector 1))) (begin (begin (vector-set! f105636 0 (closure (f105645 f105646) (string=? f105636) (let ((f105645 f105645) (f105646 f105646)) (if (string=? f105645 (symbol->string (car f105646))) (car f105646) (if (null? (cdr f105646)) (let ((f105650 (make-symbol f105645 #f))) (let ((f105652 (cons f105650 ()))) (begin (set-cdr! f105646 f105652) f105650))) ((vector-ref f105636 0) f105645 (cdr f105646)))))))) (closure (f105654) (f105636 symbols) (let ((f105654 f105654)) ((vector-ref f105636 0) f105654 (symbols))))))
# == eliminate-cond  ==>
# (let ((f105636 (make-vector 1))) (begin (begin (vector-set! f105636 0 (closure (f105645 f105646) (string=? f105636) (let ((f105645 f105645) (f105646 f105646)) (if (string=? f105645 (symbol->string (car f105646))) (car f105646) (if (null? (cdr f105646)) (let ((f105650 (make-symbol f105645 #f))) (let ((f105652 (cons f105650 ()))) (begin (set-cdr! f105646 f105652) f105650))) ((vector-ref f105636 0) f105645 (cdr f105646)))))))) (closure (f105654) (f105636 symbols) (let ((f105654 f105654)) ((vector-ref f105636 0) f105654 (symbols))))))
# == external-symbols  ==>
# (let ((f105636 (make-vector 1))) (begin (begin (vector-set! f105636 0 (closure (f105645 f105646) ((primitive-ref string=?) f105636) (let ((f105645 f105645) (f105646 f105646)) (if ((primitive-ref string=?) f105645 (symbol->string (car f105646))) (car f105646) (if (null? (cdr f105646)) (let ((f105650 (make-symbol f105645 #f))) (let ((f105652 (cons f105650 ()))) (begin (set-cdr! f105646 f105652) f105650))) ((vector-ref f105636 0) f105645 (cdr f105646)))))))) (closure (f105654) (f105636 (primitive-ref symbols)) (let ((f105654 f105654)) ((vector-ref f105636 0) f105654 ((primitive-ref symbols)))))))
# emit-expr (let ((f105636 (make-vector 1))) (begin (begin (vector-set! f105636 0 (closure (f105645 f105646) ((primitive-ref string=?) f105636) (let ((f105645 f105645) (f105646 f105646)) (if ((primitive-ref string=?) f105645 (symbol->string (car f105646))) (car f105646) (if (null? (cdr f105646)) (let ((f105650 (make-symbol f105645 #f))) (let ((f105652 (cons f105650 ()))) (begin (set-cdr! f105646 f105652) f105650))) ((vector-ref f105636 0) f105645 (cdr f105646)))))))) (closure (f105654) (f105636 (primitive-ref symbols)) (let ((f105654 f105654)) ((vector-ref f105636 0) f105654 ((primitive-ref symbols)))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f105636 (make-vector 1)))
#  body = (begin (begin (vector-set! f105636 0 (closure (f105645 f105646) ((primitive-ref string=?) f105636) (let ((f105645 f105645) (f105646 f105646)) (if ((primitive-ref string=?) f105645 (symbol->string (car f105646))) (car f105646) (if (null? (cdr f105646)) (let ((f105650 (make-symbol f105645 #f))) (let ((f105652 (cons f105650 ()))) (begin (set-cdr! f105646 f105652) f105650))) ((vector-ref f105636 0) f105645 (cdr f105646)))))))) (closure (f105654) (f105636 (primitive-ref symbols)) (let ((f105654 f105654)) ((vector-ref f105636 0) f105654 ((primitive-ref symbols))))))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854421"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854421:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_854422
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854422:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f105636 0 (closure (f105645 f105646) ((primitive-ref string=?) f105636) (let ((f105645 f105645) (f105646 f105646)) (if ((primitive-ref string=?) f105645 (symbol->string (car f105646))) (car f105646) (if (null? (cdr f105646)) (let ((f105650 (make-symbol f105645 #f))) (let ((f105652 (cons f105650 ()))) (begin (set-cdr! f105646 f105652) f105650))) ((vector-ref f105636 0) f105645 (cdr f105646)))))))) (closure (f105654) (f105636 (primitive-ref symbols)) (let ((f105654 f105654)) ((vector-ref f105636 0) f105654 ((primitive-ref symbols))))))
# emit-begin
#   expr=(begin (begin (vector-set! f105636 0 (closure (f105645 f105646) ((primitive-ref string=?) f105636) (let ((f105645 f105645) (f105646 f105646)) (if ((primitive-ref string=?) f105645 (symbol->string (car f105646))) (car f105646) (if (null? (cdr f105646)) (let ((f105650 (make-symbol f105645 #f))) (let ((f105652 (cons f105650 ()))) (begin (set-cdr! f105646 f105652) f105650))) ((vector-ref f105636 0) f105645 (cdr f105646)))))))) (closure (f105654) (f105636 (primitive-ref symbols)) (let ((f105654 f105654)) ((vector-ref f105636 0) f105654 ((primitive-ref symbols))))))
#   env=((f105636 . 0))
# emit-expr (begin (vector-set! f105636 0 (closure (f105645 f105646) ((primitive-ref string=?) f105636) (let ((f105645 f105645) (f105646 f105646)) (if ((primitive-ref string=?) f105645 (symbol->string (car f105646))) (car f105646) (if (null? (cdr f105646)) (let ((f105650 (make-symbol f105645 #f))) (let ((f105652 (cons f105650 ()))) (begin (set-cdr! f105646 f105652) f105650))) ((vector-ref f105636 0) f105645 (cdr f105646))))))))
# emit-begin
#   expr=(begin (vector-set! f105636 0 (closure (f105645 f105646) ((primitive-ref string=?) f105636) (let ((f105645 f105645) (f105646 f105646)) (if ((primitive-ref string=?) f105645 (symbol->string (car f105646))) (car f105646) (if (null? (cdr f105646)) (let ((f105650 (make-symbol f105645 #f))) (let ((f105652 (cons f105650 ()))) (begin (set-cdr! f105646 f105652) f105650))) ((vector-ref f105636 0) f105645 (cdr f105646))))))))
#   env=((f105636 . 0))
# emit-expr (vector-set! f105636 0 (closure (f105645 f105646) ((primitive-ref string=?) f105636) (let ((f105645 f105645) (f105646 f105646)) (if ((primitive-ref string=?) f105645 (symbol->string (car f105646))) (car f105646) (if (null? (cdr f105646)) (let ((f105650 (make-symbol f105645 #f))) (let ((f105652 (cons f105650 ()))) (begin (set-cdr! f105646 f105652) f105650))) ((vector-ref f105636 0) f105645 (cdr f105646)))))))
# emit-expr f105636
# emit-variable-ref
# env=((f105636 . 0))
# var=f105636
    movl 0(%esp), %eax  # stack load f105636
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854423
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854423:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854424"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854424:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854426
    cmp  $0,%eax
    jge _L_854425
_L_854426:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854425:
    movl %eax, -8(%esp)
# emit-expr (closure (f105645 f105646) ((primitive-ref string=?) f105636) (let ((f105645 f105645) (f105646 f105646)) (if ((primitive-ref string=?) f105645 (symbol->string (car f105646))) (car f105646) (if (null? (cdr f105646)) (let ((f105650 (make-symbol f105645 #f))) (let ((f105652 (cons f105650 ()))) (begin (set-cdr! f105646 f105652) f105650))) ((vector-ref f105636 0) f105645 (cdr f105646))))))
# emit-closure
# si = -12
# env = ((f105636 . 0))
# expr = (closure (f105645 f105646) ((primitive-ref string=?) f105636) (let ((f105645 f105645) (f105646 f105646)) (if ((primitive-ref string=?) f105645 (symbol->string (car f105646))) (car f105646) (if (null? (cdr f105646)) (let ((f105650 (make-symbol f105645 #f))) (let ((f105652 (cons f105650 ()))) (begin (set-cdr! f105646 f105652) f105650))) ((vector-ref f105636 0) f105645 (cdr f105646))))))
    movl $_L_854427, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref string=?) not defined in the environmnet
# emit-variable-ref
# env=((f105636 . 0))
# var=f105636
    movl 0(%esp), %eax  # stack load f105636
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f105636
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_854428            # jump around closure body
_L_854427:
# check argument count
    cmp $8,%eax
    je _L_854429
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_854429:
# emit-tail-expr
# si=-16
# env=((f105646 . -12) (f105645 . -8) (f105636 . 8) ((primitive-ref string=?) . 4) (f105636 . 0))
# expr=(let ((f105645 f105645) (f105646 f105646)) (if ((primitive-ref string=?) f105645 (symbol->string (car f105646))) (car f105646) (if (null? (cdr f105646)) (let ((f105650 (make-symbol f105645 #f))) (let ((f105652 (cons f105650 ()))) (begin (set-cdr! f105646 f105652) f105650))) ((vector-ref f105636 0) f105645 (cdr f105646)))))
# emit-tail-let
#  si   = -16
#  env  = ((f105646 . -12) (f105645 . -8) (f105636 . 8) ((primitive-ref string=?) . 4) (f105636 . 0))
#  bindings = ((f105645 f105645) (f105646 f105646))
#  body = (if ((primitive-ref string=?) f105645 (symbol->string (car f105646))) (car f105646) (if (null? (cdr f105646)) (let ((f105650 (make-symbol f105645 #f))) (let ((f105652 (cons f105650 ()))) (begin (set-cdr! f105646 f105652) f105650))) ((vector-ref f105636 0) f105645 (cdr f105646))))
# emit-expr f105645
# emit-variable-ref
# env=((f105646 . -12) (f105645 . -8) (f105636 . 8) ((primitive-ref string=?) . 4) (f105636 . 0))
# var=f105645
    movl -8(%esp), %eax  # stack load f105645
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f105646
# emit-variable-ref
# env=((f105646 . -12) (f105645 . -8) (f105636 . 8) ((primitive-ref string=?) . 4) (f105636 . 0))
# var=f105646
    movl -12(%esp), %eax  # stack load f105646
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f105646 . -20) (f105645 . -16) (f105646 . -12) (f105645 . -8) (f105636 . 8) ((primitive-ref string=?) . 4) (f105636 . 0))
# expr=(if ((primitive-ref string=?) f105645 (symbol->string (car f105646))) (car f105646) (if (null? (cdr f105646)) (let ((f105650 (make-symbol f105645 #f))) (let ((f105652 (cons f105650 ()))) (begin (set-cdr! f105646 f105652) f105650))) ((vector-ref f105636 0) f105645 (cdr f105646))))
# emit-expr ((primitive-ref string=?) f105645 (symbol->string (car f105646)))
# funcall
#    si   =-24
#    env  = ((f105646 . -20) (f105645 . -16) (f105646 . -12) (f105645 . -8) (f105636 . 8) ((primitive-ref string=?) . 4) (f105636 . 0))
#    expr = (funcall (primitive-ref string=?) f105645 (symbol->string (car f105646)))
# emit-expr (primitive-ref string=?)
    .extern string$e$q
    movl string$e$q,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854432"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854432":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f105645
# emit-variable-ref
# env=((f105646 . -20) (f105645 . -16) (f105646 . -12) (f105645 . -8) (f105636 . 8) ((primitive-ref string=?) . 4) (f105636 . 0))
# var=f105645
    movl -16(%esp), %eax  # stack load f105645
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f105645
# emit-expr (symbol->string (car f105646))
# symbol->string (car f105646)
# emit-expr (car f105646)
# emit-expr f105646
# emit-variable-ref
# env=((f105646 . -20) (f105645 . -16) (f105646 . -12) (f105645 . -8) (f105636 . 8) ((primitive-ref string=?) . 4) (f105636 . 0))
# var=f105646
    movl -20(%esp), %eax  # stack load f105646
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_854433
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854433:
    movl -1(%eax), %eax
    movl -3(%eax), %eax
    mov %eax, -40(%esp)  # arg (symbol->string (car f105646))
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_854430
# emit-tail-expr
# si=-24
# env=((f105646 . -20) (f105645 . -16) (f105646 . -12) (f105645 . -8) (f105636 . 8) ((primitive-ref string=?) . 4) (f105636 . 0))
# expr=(car f105646)
# tail primcall
# emit-expr f105646
# emit-variable-ref
# env=((f105646 . -20) (f105645 . -16) (f105646 . -12) (f105645 . -8) (f105636 . 8) ((primitive-ref string=?) . 4) (f105636 . 0))
# var=f105646
    movl -20(%esp), %eax  # stack load f105646
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_854434
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854434:
    movl -1(%eax), %eax
#return from tail (car f105646)
    ret
    jmp _L_854431
_L_854430:
# emit-tail-expr
# si=-24
# env=((f105646 . -20) (f105645 . -16) (f105646 . -12) (f105645 . -8) (f105636 . 8) ((primitive-ref string=?) . 4) (f105636 . 0))
# expr=(if (null? (cdr f105646)) (let ((f105650 (make-symbol f105645 #f))) (let ((f105652 (cons f105650 ()))) (begin (set-cdr! f105646 f105652) f105650))) ((vector-ref f105636 0) f105645 (cdr f105646)))
# emit-expr (null? (cdr f105646))
# emit-expr (cdr f105646)
# emit-expr f105646
# emit-variable-ref
# env=((f105646 . -20) (f105645 . -16) (f105646 . -12) (f105645 . -8) (f105636 . 8) ((primitive-ref string=?) . 4) (f105636 . 0))
# var=f105646
    movl -20(%esp), %eax  # stack load f105646
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_854437
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854437:
    movl 3(%eax), %eax
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_854435
# emit-tail-expr
# si=-24
# env=((f105646 . -20) (f105645 . -16) (f105646 . -12) (f105645 . -8) (f105636 . 8) ((primitive-ref string=?) . 4) (f105636 . 0))
# expr=(let ((f105650 (make-symbol f105645 #f))) (let ((f105652 (cons f105650 ()))) (begin (set-cdr! f105646 f105652) f105650)))
# emit-tail-let
#  si   = -24
#  env  = ((f105646 . -20) (f105645 . -16) (f105646 . -12) (f105645 . -8) (f105636 . 8) ((primitive-ref string=?) . 4) (f105636 . 0))
#  bindings = ((f105650 (make-symbol f105645 #f)))
#  body = (let ((f105652 (cons f105650 ()))) (begin (set-cdr! f105646 f105652) f105650))
# emit-expr (make-symbol f105645 #f)
# make-symbol arg1=f105645 arg2=#f
# emit-expr f105645
# emit-variable-ref
# env=((f105646 . -20) (f105645 . -16) (f105646 . -12) (f105645 . -8) (f105636 . 8) ((primitive-ref string=?) . 4) (f105636 . 0))
# var=f105645
    movl -16(%esp), %eax  # stack load f105645
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
# env=((f105650 . -24) (f105646 . -20) (f105645 . -16) (f105646 . -12) (f105645 . -8) (f105636 . 8) ((primitive-ref string=?) . 4) (f105636 . 0))
# expr=(let ((f105652 (cons f105650 ()))) (begin (set-cdr! f105646 f105652) f105650))
# emit-tail-let
#  si   = -28
#  env  = ((f105650 . -24) (f105646 . -20) (f105645 . -16) (f105646 . -12) (f105645 . -8) (f105636 . 8) ((primitive-ref string=?) . 4) (f105636 . 0))
#  bindings = ((f105652 (cons f105650 ())))
#  body = (begin (set-cdr! f105646 f105652) f105650)
# emit-expr (cons f105650 ())
# cons arg1=f105650 arg2=()
# emit-expr f105650
# emit-variable-ref
# env=((f105650 . -24) (f105646 . -20) (f105645 . -16) (f105646 . -12) (f105645 . -8) (f105636 . 8) ((primitive-ref string=?) . 4) (f105636 . 0))
# var=f105650
    movl -24(%esp), %eax  # stack load f105650
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
# env=((f105652 . -28) (f105650 . -24) (f105646 . -20) (f105645 . -16) (f105646 . -12) (f105645 . -8) (f105636 . 8) ((primitive-ref string=?) . 4) (f105636 . 0))
# expr=(begin (set-cdr! f105646 f105652) f105650)
# tail-begin (begin (set-cdr! f105646 f105652) f105650)
#   env=((f105652 . -28) (f105650 . -24) (f105646 . -20) (f105645 . -16) (f105646 . -12) (f105645 . -8) (f105636 . 8) ((primitive-ref string=?) . 4) (f105636 . 0))
# emit-expr (set-cdr! f105646 f105652)
# emit-expr f105646
# emit-variable-ref
# env=((f105652 . -28) (f105650 . -24) (f105646 . -20) (f105645 . -16) (f105646 . -12) (f105645 . -8) (f105636 . 8) ((primitive-ref string=?) . 4) (f105636 . 0))
# var=f105646
    movl -20(%esp), %eax  # stack load f105646
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_854438
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854438:
    movl %eax, -32(%esp)
# emit-expr f105652
# emit-variable-ref
# env=((f105652 . -28) (f105650 . -24) (f105646 . -20) (f105645 . -16) (f105646 . -12) (f105645 . -8) (f105636 . 8) ((primitive-ref string=?) . 4) (f105636 . 0))
# var=f105652
    movl -28(%esp), %eax  # stack load f105652
# end emit-variable-ref
    movl -32(%esp), %ebx
    movl %eax, 3(%ebx)
# emit-tail-expr
# si=-32
# env=((f105652 . -28) (f105650 . -24) (f105646 . -20) (f105645 . -16) (f105646 . -12) (f105645 . -8) (f105636 . 8) ((primitive-ref string=?) . 4) (f105636 . 0))
# expr=(begin f105650)
# tail-begin (begin f105650)
#   env=((f105652 . -28) (f105650 . -24) (f105646 . -20) (f105645 . -16) (f105646 . -12) (f105645 . -8) (f105636 . 8) ((primitive-ref string=?) . 4) (f105636 . 0))
# emit-tail-expr
# si=-32
# env=((f105652 . -28) (f105650 . -24) (f105646 . -20) (f105645 . -16) (f105646 . -12) (f105645 . -8) (f105636 . 8) ((primitive-ref string=?) . 4) (f105636 . 0))
# expr=f105650
# emit-tail-variable-ref
# emit-variable-ref
# env=((f105652 . -28) (f105650 . -24) (f105646 . -20) (f105645 . -16) (f105646 . -12) (f105645 . -8) (f105636 . 8) ((primitive-ref string=?) . 4) (f105636 . 0))
# var=f105650
    movl -24(%esp), %eax  # stack load f105650
# end emit-variable-ref
    ret
# end emit-tail-variable ref
     ret   # return thru stack
    jmp _L_854436
_L_854435:
# emit-tail-expr
# si=-24
# env=((f105646 . -20) (f105645 . -16) (f105646 . -12) (f105645 . -8) (f105636 . 8) ((primitive-ref string=?) . 4) (f105636 . 0))
# expr=((vector-ref f105636 0) f105645 (cdr f105646))
# emit-tail-funcall
#    si   =-24
#    env  = ((f105646 . -20) (f105645 . -16) (f105646 . -12) (f105645 . -8) (f105636 . 8) ((primitive-ref string=?) . 4) (f105636 . 0))
#    expr = (funcall (vector-ref f105636 0) f105645 (cdr f105646))
# emit-expr (vector-ref f105636 0)
# emit-expr f105636
# emit-variable-ref
# env=((f105646 . -20) (f105645 . -16) (f105646 . -12) (f105645 . -8) (f105636 . 8) ((primitive-ref string=?) . 4) (f105636 . 0))
# var=f105636
    movl 6(%edi), %eax  # frame load f105636
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854439
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854439:
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854440"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854440:
# check bounds on vector index
    movl -24(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854442
    cmp  $0,%eax
    jge _L_854441
_L_854442:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854441:
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr f105645
# emit-variable-ref
# env=((f105646 . -20) (f105645 . -16) (f105646 . -12) (f105645 . -8) (f105636 . 8) ((primitive-ref string=?) . 4) (f105636 . 0))
# var=f105645
    movl -16(%esp), %eax  # stack load f105645
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f105645
# emit-expr (cdr f105646)
# emit-expr f105646
# emit-variable-ref
# env=((f105646 . -20) (f105645 . -16) (f105646 . -12) (f105645 . -8) (f105636 . 8) ((primitive-ref string=?) . 4) (f105636 . 0))
# var=f105646
    movl -20(%esp), %eax  # stack load f105646
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_854443
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854443:
    movl 3(%eax), %eax
    mov %eax, -32(%esp)    # arg (cdr f105646)
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
_L_854436:
_L_854431:
    .align 4,0x90
_L_854428:
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f105636 . 0))
# emit-expr (begin (closure (f105654) (f105636 (primitive-ref symbols)) (let ((f105654 f105654)) ((vector-ref f105636 0) f105654 ((primitive-ref symbols))))))
# emit-begin
#   expr=(begin (closure (f105654) (f105636 (primitive-ref symbols)) (let ((f105654 f105654)) ((vector-ref f105636 0) f105654 ((primitive-ref symbols))))))
#   env=((f105636 . 0))
# emit-expr (closure (f105654) (f105636 (primitive-ref symbols)) (let ((f105654 f105654)) ((vector-ref f105636 0) f105654 ((primitive-ref symbols)))))
# emit-closure
# si = -4
# env = ((f105636 . 0))
# expr = (closure (f105654) (f105636 (primitive-ref symbols)) (let ((f105654 f105654)) ((vector-ref f105636 0) f105654 ((primitive-ref symbols)))))
    movl $_L_854444, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f105636 . 0))
# var=f105636
    movl 0(%esp), %eax  # stack load f105636
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f105636
# WARNING: free var (primitive-ref symbols) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_854445            # jump around closure body
_L_854444:
# check argument count
    cmp $4,%eax
    je _L_854446
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_854446:
# emit-tail-expr
# si=-12
# env=((f105654 . -8) ((primitive-ref symbols) . 8) (f105636 . 4) (f105636 . 0))
# expr=(let ((f105654 f105654)) ((vector-ref f105636 0) f105654 ((primitive-ref symbols))))
# emit-tail-let
#  si   = -12
#  env  = ((f105654 . -8) ((primitive-ref symbols) . 8) (f105636 . 4) (f105636 . 0))
#  bindings = ((f105654 f105654))
#  body = ((vector-ref f105636 0) f105654 ((primitive-ref symbols)))
# emit-expr f105654
# emit-variable-ref
# env=((f105654 . -8) ((primitive-ref symbols) . 8) (f105636 . 4) (f105636 . 0))
# var=f105654
    movl -8(%esp), %eax  # stack load f105654
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f105654 . -12) (f105654 . -8) ((primitive-ref symbols) . 8) (f105636 . 4) (f105636 . 0))
# expr=((vector-ref f105636 0) f105654 ((primitive-ref symbols)))
# emit-tail-funcall
#    si   =-16
#    env  = ((f105654 . -12) (f105654 . -8) ((primitive-ref symbols) . 8) (f105636 . 4) (f105636 . 0))
#    expr = (funcall (vector-ref f105636 0) f105654 ((primitive-ref symbols)))
# emit-expr (vector-ref f105636 0)
# emit-expr f105636
# emit-variable-ref
# env=((f105654 . -12) (f105654 . -8) ((primitive-ref symbols) . 8) (f105636 . 4) (f105636 . 0))
# var=f105636
    movl 2(%edi), %eax  # frame load f105636
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854447
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854447:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854448"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854448:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854450
    cmp  $0,%eax
    jge _L_854449
_L_854450:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854449:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr f105654
# emit-variable-ref
# env=((f105654 . -12) (f105654 . -8) ((primitive-ref symbols) . 8) (f105636 . 4) (f105636 . 0))
# var=f105654
    movl -12(%esp), %eax  # stack load f105654
# end emit-variable-ref
    mov %eax, -20(%esp)    # arg f105654
# emit-expr ((primitive-ref symbols))
# funcall
#    si   =-24
#    env  = ((f105654 . -12) (f105654 . -8) ((primitive-ref symbols) . 8) (f105636 . 4) (f105636 . 0))
#    expr = (funcall (primitive-ref symbols))
# emit-expr (primitive-ref symbols)
    .extern symbols
    movl symbols,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854451"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854451":
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
_L_854445:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f105636 . 0))
     movl %eax, string$m$gsymbol
# == explicit-begins  ==>
# (lambda (lst elt) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt))))
# == eliminate-let*  ==>
# (lambda (lst elt) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt))))
# == uniquify-variables  ==>
# (lambda (f105655 f105656) (if (null? f105655) (cons e nil) (cons (car f105655) (append1 (cdr f105655) f105656))))
# == vectorize-letrec  ==>
# (lambda (f105655 f105656) (if (null? f105655) (cons e nil) (cons (car f105655) (append1 (cdr f105655) f105656))))
# == eliminate-set!  ==>
# (lambda (f105655 f105656) (let ((f105655 f105655) (f105656 f105656)) (if (null? f105655) (cons e nil) (cons (car f105655) (append1 (cdr f105655) f105656)))))
# == close-free-variables  ==>
# (closure (f105655 f105656) (e nil append1) (let ((f105655 f105655) (f105656 f105656)) (if (null? f105655) (cons e nil) (cons (car f105655) (append1 (cdr f105655) f105656)))))
# == eliminate-quote  ==>
# (closure (f105655 f105656) (e nil append1) (let ((f105655 f105655) (f105656 f105656)) (if (null? f105655) (cons e nil) (cons (car f105655) (append1 (cdr f105655) f105656)))))
# == eliminate-when/unless  ==>
# (closure (f105655 f105656) (e nil append1) (let ((f105655 f105655) (f105656 f105656)) (if (null? f105655) (cons e nil) (cons (car f105655) (append1 (cdr f105655) f105656)))))
# == eliminate-cond  ==>
# (closure (f105655 f105656) (e nil append1) (let ((f105655 f105655) (f105656 f105656)) (if (null? f105655) (cons e nil) (cons (car f105655) (append1 (cdr f105655) f105656)))))
# == external-symbols  ==>
# (closure (f105655 f105656) (e nil (primitive-ref append1)) (let ((f105655 f105655) (f105656 f105656)) (if (null? f105655) (cons e nil) (cons (car f105655) ((primitive-ref append1) (cdr f105655) f105656)))))
# emit-expr (closure (f105655 f105656) (e nil (primitive-ref append1)) (let ((f105655 f105655) (f105656 f105656)) (if (null? f105655) (cons e nil) (cons (car f105655) ((primitive-ref append1) (cdr f105655) f105656)))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f105655 f105656) (e nil (primitive-ref append1)) (let ((f105655 f105655) (f105656 f105656)) (if (null? f105655) (cons e nil) (cons (car f105655) ((primitive-ref append1) (cdr f105655) f105656)))))
    movl $_L_854452, 0(%ebp)  # closure label
# WARNING: free var e not defined in the environmnet
# WARNING: free var nil not defined in the environmnet
# WARNING: free var (primitive-ref append1) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_854453            # jump around closure body
_L_854452:
# check argument count
    cmp $8,%eax
    je _L_854454
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_854454:
# emit-tail-expr
# si=-16
# env=((f105656 . -12) (f105655 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(let ((f105655 f105655) (f105656 f105656)) (if (null? f105655) (cons e nil) (cons (car f105655) ((primitive-ref append1) (cdr f105655) f105656))))
# emit-tail-let
#  si   = -16
#  env  = ((f105656 . -12) (f105655 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
#  bindings = ((f105655 f105655) (f105656 f105656))
#  body = (if (null? f105655) (cons e nil) (cons (car f105655) ((primitive-ref append1) (cdr f105655) f105656)))
# emit-expr f105655
# emit-variable-ref
# env=((f105656 . -12) (f105655 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f105655
    movl -8(%esp), %eax  # stack load f105655
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f105656
# emit-variable-ref
# env=((f105656 . -12) (f105655 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f105656
    movl -12(%esp), %eax  # stack load f105656
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f105656 . -20) (f105655 . -16) (f105656 . -12) (f105655 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(if (null? f105655) (cons e nil) (cons (car f105655) ((primitive-ref append1) (cdr f105655) f105656)))
# emit-expr (null? f105655)
# emit-expr f105655
# emit-variable-ref
# env=((f105656 . -20) (f105655 . -16) (f105656 . -12) (f105655 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f105655
    movl -16(%esp), %eax  # stack load f105655
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_854455
# emit-tail-expr
# si=-24
# env=((f105656 . -20) (f105655 . -16) (f105656 . -12) (f105655 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(cons e nil)
# tail primcall
# cons arg1=e arg2=nil
# emit-expr e
# emit-variable-ref
# env=((f105656 . -20) (f105655 . -16) (f105656 . -12) (f105655 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=e
    movl 2(%edi), %eax  # frame load e
# end emit-variable-ref
    movl %eax, -24(%esp)
# emit-expr nil
# emit-variable-ref
# env=((f105656 . -20) (f105655 . -16) (f105656 . -12) (f105655 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
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
    jmp _L_854456
_L_854455:
# emit-tail-expr
# si=-24
# env=((f105656 . -20) (f105655 . -16) (f105656 . -12) (f105655 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(cons (car f105655) ((primitive-ref append1) (cdr f105655) f105656))
# tail primcall
# cons arg1=(car f105655) arg2=((primitive-ref append1) (cdr f105655) f105656)
# emit-expr (car f105655)
# emit-expr f105655
# emit-variable-ref
# env=((f105656 . -20) (f105655 . -16) (f105656 . -12) (f105655 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f105655
    movl -16(%esp), %eax  # stack load f105655
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_854457
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854457:
    movl -1(%eax), %eax
    movl %eax, -24(%esp)
# emit-expr ((primitive-ref append1) (cdr f105655) f105656)
# funcall
#    si   =-28
#    env  = ((f105656 . -20) (f105655 . -16) (f105656 . -12) (f105655 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
#    expr = (funcall (primitive-ref append1) (cdr f105655) f105656)
# emit-expr (primitive-ref append1)
    .extern append1
    movl append1,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854458"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854458":
   movl %eax,  -36(%esp)  # stash funcall-oper in closure slot
# emit-expr (cdr f105655)
# emit-expr f105655
# emit-variable-ref
# env=((f105656 . -20) (f105655 . -16) (f105656 . -12) (f105655 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f105655
    movl -16(%esp), %eax  # stack load f105655
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_854459
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854459:
    movl 3(%eax), %eax
    mov %eax, -40(%esp)  # arg (cdr f105655)
# emit-expr f105656
# emit-variable-ref
# env=((f105656 . -20) (f105655 . -16) (f105656 . -12) (f105655 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f105656
    movl -20(%esp), %eax  # stack load f105656
# end emit-variable-ref
    mov %eax, -44(%esp)  # arg f105656
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
#return from tail (cons (car f105655) ((primitive-ref append1) (cdr f105655) f105656))
    ret
_L_854456:
    .align 4,0x90
_L_854453:
     movl %eax, append1
# == explicit-begins  ==>
# (lambda (l k) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1))))
# == eliminate-let*  ==>
# (lambda (l k) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1))))
# == uniquify-variables  ==>
# (lambda (f105657 f105658) (if (fx= f105658 0) (car f105657) (list-ref (cdr f105657) (fx- f105658 1))))
# == vectorize-letrec  ==>
# (lambda (f105657 f105658) (if (fx= f105658 0) (car f105657) (list-ref (cdr f105657) (fx- f105658 1))))
# == eliminate-set!  ==>
# (lambda (f105657 f105658) (let ((f105657 f105657) (f105658 f105658)) (if (fx= f105658 0) (car f105657) (list-ref (cdr f105657) (fx- f105658 1)))))
# == close-free-variables  ==>
# (closure (f105657 f105658) (list-ref) (let ((f105657 f105657) (f105658 f105658)) (if (fx= f105658 0) (car f105657) (list-ref (cdr f105657) (fx- f105658 1)))))
# == eliminate-quote  ==>
# (closure (f105657 f105658) (list-ref) (let ((f105657 f105657) (f105658 f105658)) (if (fx= f105658 0) (car f105657) (list-ref (cdr f105657) (fx- f105658 1)))))
# == eliminate-when/unless  ==>
# (closure (f105657 f105658) (list-ref) (let ((f105657 f105657) (f105658 f105658)) (if (fx= f105658 0) (car f105657) (list-ref (cdr f105657) (fx- f105658 1)))))
# == eliminate-cond  ==>
# (closure (f105657 f105658) (list-ref) (let ((f105657 f105657) (f105658 f105658)) (if (fx= f105658 0) (car f105657) (list-ref (cdr f105657) (fx- f105658 1)))))
# == external-symbols  ==>
# (closure (f105657 f105658) ((primitive-ref list-ref)) (let ((f105657 f105657) (f105658 f105658)) (if (fx= f105658 0) (car f105657) ((primitive-ref list-ref) (cdr f105657) (fx- f105658 1)))))
# emit-expr (closure (f105657 f105658) ((primitive-ref list-ref)) (let ((f105657 f105657) (f105658 f105658)) (if (fx= f105658 0) (car f105657) ((primitive-ref list-ref) (cdr f105657) (fx- f105658 1)))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f105657 f105658) ((primitive-ref list-ref)) (let ((f105657 f105657) (f105658 f105658)) (if (fx= f105658 0) (car f105657) ((primitive-ref list-ref) (cdr f105657) (fx- f105658 1)))))
    movl $_L_854460, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_854461            # jump around closure body
_L_854460:
# check argument count
    cmp $8,%eax
    je _L_854462
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_854462:
# emit-tail-expr
# si=-16
# env=((f105658 . -12) (f105657 . -8) ((primitive-ref list-ref) . 4))
# expr=(let ((f105657 f105657) (f105658 f105658)) (if (fx= f105658 0) (car f105657) ((primitive-ref list-ref) (cdr f105657) (fx- f105658 1))))
# emit-tail-let
#  si   = -16
#  env  = ((f105658 . -12) (f105657 . -8) ((primitive-ref list-ref) . 4))
#  bindings = ((f105657 f105657) (f105658 f105658))
#  body = (if (fx= f105658 0) (car f105657) ((primitive-ref list-ref) (cdr f105657) (fx- f105658 1)))
# emit-expr f105657
# emit-variable-ref
# env=((f105658 . -12) (f105657 . -8) ((primitive-ref list-ref) . 4))
# var=f105657
    movl -8(%esp), %eax  # stack load f105657
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f105658
# emit-variable-ref
# env=((f105658 . -12) (f105657 . -8) ((primitive-ref list-ref) . 4))
# var=f105658
    movl -12(%esp), %eax  # stack load f105658
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f105658 . -20) (f105657 . -16) (f105658 . -12) (f105657 . -8) ((primitive-ref list-ref) . 4))
# expr=(if (fx= f105658 0) (car f105657) ((primitive-ref list-ref) (cdr f105657) (fx- f105658 1)))
# emit-expr (fx= f105658 0)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854465"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854465:
    movl %eax, -24(%esp)
# emit-expr f105658
# emit-variable-ref
# env=((f105658 . -20) (f105657 . -16) (f105658 . -12) (f105657 . -8) ((primitive-ref list-ref) . 4))
# var=f105658
    movl -20(%esp), %eax  # stack load f105658
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854466"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854466:
    cmp -24(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_854463
# emit-tail-expr
# si=-24
# env=((f105658 . -20) (f105657 . -16) (f105658 . -12) (f105657 . -8) ((primitive-ref list-ref) . 4))
# expr=(car f105657)
# tail primcall
# emit-expr f105657
# emit-variable-ref
# env=((f105658 . -20) (f105657 . -16) (f105658 . -12) (f105657 . -8) ((primitive-ref list-ref) . 4))
# var=f105657
    movl -16(%esp), %eax  # stack load f105657
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_854467
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854467:
    movl -1(%eax), %eax
#return from tail (car f105657)
    ret
    jmp _L_854464
_L_854463:
# emit-tail-expr
# si=-24
# env=((f105658 . -20) (f105657 . -16) (f105658 . -12) (f105657 . -8) ((primitive-ref list-ref) . 4))
# expr=((primitive-ref list-ref) (cdr f105657) (fx- f105658 1))
# emit-tail-funcall
#    si   =-24
#    env  = ((f105658 . -20) (f105657 . -16) (f105658 . -12) (f105657 . -8) ((primitive-ref list-ref) . 4))
#    expr = (funcall (primitive-ref list-ref) (cdr f105657) (fx- f105658 1))
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr (cdr f105657)
# emit-expr f105657
# emit-variable-ref
# env=((f105658 . -20) (f105657 . -16) (f105658 . -12) (f105657 . -8) ((primitive-ref list-ref) . 4))
# var=f105657
    movl -16(%esp), %eax  # stack load f105657
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_854468
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854468:
    movl 3(%eax), %eax
    mov %eax, -28(%esp)    # arg (cdr f105657)
# emit-expr (fx- f105658 1)
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854469"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $84,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854469:
    movl %eax, -32(%esp)
# emit-expr f105658
# emit-variable-ref
# env=((f105658 . -20) (f105657 . -16) (f105658 . -12) (f105657 . -8) ((primitive-ref list-ref) . 4))
# var=f105658
    movl -20(%esp), %eax  # stack load f105658
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854470"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $84,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854470:
    subl -32(%esp), %eax
    mov %eax, -32(%esp)    # arg (fx- f105658 1)
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
_L_854464:
    .align 4,0x90
_L_854461:
     movl %eax, list$mref
# == explicit-begins  ==>
# (lambda (l) (if (null? l) 0 (fxadd1 (list-length (cdr l)))))
# == eliminate-let*  ==>
# (lambda (l) (if (null? l) 0 (fxadd1 (list-length (cdr l)))))
# == uniquify-variables  ==>
# (lambda (f105659) (if (null? f105659) 0 (fxadd1 (list-length (cdr f105659)))))
# == vectorize-letrec  ==>
# (lambda (f105659) (if (null? f105659) 0 (fxadd1 (list-length (cdr f105659)))))
# == eliminate-set!  ==>
# (lambda (f105659) (let ((f105659 f105659)) (if (null? f105659) 0 (fxadd1 (list-length (cdr f105659))))))
# == close-free-variables  ==>
# (closure (f105659) (list-length) (let ((f105659 f105659)) (if (null? f105659) 0 (fxadd1 (list-length (cdr f105659))))))
# == eliminate-quote  ==>
# (closure (f105659) (list-length) (let ((f105659 f105659)) (if (null? f105659) 0 (fxadd1 (list-length (cdr f105659))))))
# == eliminate-when/unless  ==>
# (closure (f105659) (list-length) (let ((f105659 f105659)) (if (null? f105659) 0 (fxadd1 (list-length (cdr f105659))))))
# == eliminate-cond  ==>
# (closure (f105659) (list-length) (let ((f105659 f105659)) (if (null? f105659) 0 (fxadd1 (list-length (cdr f105659))))))
# == external-symbols  ==>
# (closure (f105659) ((primitive-ref list-length)) (let ((f105659 f105659)) (if (null? f105659) 0 (fxadd1 ((primitive-ref list-length) (cdr f105659))))))
# emit-expr (closure (f105659) ((primitive-ref list-length)) (let ((f105659 f105659)) (if (null? f105659) 0 (fxadd1 ((primitive-ref list-length) (cdr f105659))))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f105659) ((primitive-ref list-length)) (let ((f105659 f105659)) (if (null? f105659) 0 (fxadd1 ((primitive-ref list-length) (cdr f105659))))))
    movl $_L_854471, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref list-length) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_854472            # jump around closure body
_L_854471:
# check argument count
    cmp $4,%eax
    je _L_854473
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_854473:
# emit-tail-expr
# si=-12
# env=((f105659 . -8) ((primitive-ref list-length) . 4))
# expr=(let ((f105659 f105659)) (if (null? f105659) 0 (fxadd1 ((primitive-ref list-length) (cdr f105659)))))
# emit-tail-let
#  si   = -12
#  env  = ((f105659 . -8) ((primitive-ref list-length) . 4))
#  bindings = ((f105659 f105659))
#  body = (if (null? f105659) 0 (fxadd1 ((primitive-ref list-length) (cdr f105659))))
# emit-expr f105659
# emit-variable-ref
# env=((f105659 . -8) ((primitive-ref list-length) . 4))
# var=f105659
    movl -8(%esp), %eax  # stack load f105659
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f105659 . -12) (f105659 . -8) ((primitive-ref list-length) . 4))
# expr=(if (null? f105659) 0 (fxadd1 ((primitive-ref list-length) (cdr f105659))))
# emit-expr (null? f105659)
# emit-expr f105659
# emit-variable-ref
# env=((f105659 . -12) (f105659 . -8) ((primitive-ref list-length) . 4))
# var=f105659
    movl -12(%esp), %eax  # stack load f105659
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_854474
# emit-tail-expr
# si=-16
# env=((f105659 . -12) (f105659 . -8) ((primitive-ref list-length) . 4))
# expr=0
    movl $0, %eax     # immed 0
    ret                  # immediate tail return
    jmp _L_854475
_L_854474:
# emit-tail-expr
# si=-16
# env=((f105659 . -12) (f105659 . -8) ((primitive-ref list-length) . 4))
# expr=(fxadd1 ((primitive-ref list-length) (cdr f105659)))
# tail primcall
# emit-expr ((primitive-ref list-length) (cdr f105659))
# funcall
#    si   =-16
#    env  = ((f105659 . -12) (f105659 . -8) ((primitive-ref list-length) . 4))
#    expr = (funcall (primitive-ref list-length) (cdr f105659))
# emit-expr (primitive-ref list-length)
    .extern list$mlength
    movl list$mlength,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854476"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854476":
   movl %eax,  -24(%esp)  # stash funcall-oper in closure slot
# emit-expr (cdr f105659)
# emit-expr f105659
# emit-variable-ref
# env=((f105659 . -12) (f105659 . -8) ((primitive-ref list-length) . 4))
# var=f105659
    movl -12(%esp), %eax  # stack load f105659
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_854477
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854477:
    movl 3(%eax), %eax
    mov %eax, -28(%esp)  # arg (cdr f105659)
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
    je "_L_854478"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $48,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854478:
     addl $4, %eax
#return from tail (fxadd1 ((primitive-ref list-length) (cdr f105659)))
    ret
_L_854475:
    .align 4,0x90
_L_854472:
     movl %eax, list$mlength
# == explicit-begins  ==>
# (letrec ((fill-vector (lambda (v k args) (if (null? args) v (begin (vector-set! v k (car args)) (fill-vector v (fxadd1 k) (cdr args))))))) (lambda args (let ((v (make-vector (list-length args)))) (fill-vector v 0 args))))
# == eliminate-let*  ==>
# (letrec ((fill-vector (lambda (v k args) (if (null? args) v (begin (vector-set! v k (car args)) (fill-vector v (fxadd1 k) (cdr args))))))) (lambda args (let ((v (make-vector (list-length args)))) (fill-vector v 0 args))))
# == uniquify-variables  ==>
# (letrec ((f105660 (lambda (f105664 f105665 f105666) (if (null? f105666) f105664 (begin (vector-set! f105664 f105665 (car f105666)) (f105660 f105664 (fxadd1 f105665) (cdr f105666))))))) (lambda f105670 (let ((f105672 (make-vector (list-length f105670)))) (f105660 f105672 0 f105670))))
# == vectorize-letrec  ==>
# (let ((f105660 (make-vector 1))) (begin (begin (vector-set! f105660 0 (lambda (f105664 f105665 f105666) (if (null? f105666) f105664 (begin (vector-set! f105664 f105665 (car f105666)) ((vector-ref f105660 0) f105664 (fxadd1 f105665) (cdr f105666))))))) (lambda f105670 (let ((f105672 (make-vector (list-length f105670)))) ((vector-ref f105660 0) f105672 0 f105670)))))
# == eliminate-set!  ==>
# (let ((f105660 (make-vector 1))) (begin (begin (vector-set! f105660 0 (lambda (f105664 f105665 f105666) (let ((f105664 f105664) (f105665 f105665) (f105666 f105666)) (if (null? f105666) f105664 (begin (vector-set! f105664 f105665 (car f105666)) ((vector-ref f105660 0) f105664 (fxadd1 f105665) (cdr f105666)))))))) (lambda f105670 (let () (let ((f105672 (make-vector (list-length f105670)))) ((vector-ref f105660 0) f105672 0 f105670))))))
# == close-free-variables  ==>
# (let ((f105660 (make-vector 1))) (begin (begin (vector-set! f105660 0 (closure (f105664 f105665 f105666) (f105660) (let ((f105664 f105664) (f105665 f105665) (f105666 f105666)) (if (null? f105666) f105664 (begin (vector-set! f105664 f105665 (car f105666)) ((vector-ref f105660 0) f105664 (fxadd1 f105665) (cdr f105666)))))))) (closure f105670 (f105660) (let () (let ((f105672 (make-vector (list-length f105670)))) ((vector-ref f105660 0) f105672 0 f105670))))))
# == eliminate-quote  ==>
# (let ((f105660 (make-vector 1))) (begin (begin (vector-set! f105660 0 (closure (f105664 f105665 f105666) (f105660) (let ((f105664 f105664) (f105665 f105665) (f105666 f105666)) (if (null? f105666) f105664 (begin (vector-set! f105664 f105665 (car f105666)) ((vector-ref f105660 0) f105664 (fxadd1 f105665) (cdr f105666)))))))) (closure f105670 (f105660) (let () (let ((f105672 (make-vector (list-length f105670)))) ((vector-ref f105660 0) f105672 0 f105670))))))
# == eliminate-when/unless  ==>
# (let ((f105660 (make-vector 1))) (begin (begin (vector-set! f105660 0 (closure (f105664 f105665 f105666) (f105660) (let ((f105664 f105664) (f105665 f105665) (f105666 f105666)) (if (null? f105666) f105664 (begin (vector-set! f105664 f105665 (car f105666)) ((vector-ref f105660 0) f105664 (fxadd1 f105665) (cdr f105666)))))))) (closure f105670 (f105660) (let () (let ((f105672 (make-vector (list-length f105670)))) ((vector-ref f105660 0) f105672 0 f105670))))))
# == eliminate-cond  ==>
# (let ((f105660 (make-vector 1))) (begin (begin (vector-set! f105660 0 (closure (f105664 f105665 f105666) (f105660) (let ((f105664 f105664) (f105665 f105665) (f105666 f105666)) (if (null? f105666) f105664 (begin (vector-set! f105664 f105665 (car f105666)) ((vector-ref f105660 0) f105664 (fxadd1 f105665) (cdr f105666)))))))) (closure f105670 (f105660) (let () (let ((f105672 (make-vector (list-length f105670)))) ((vector-ref f105660 0) f105672 0 f105670))))))
# == external-symbols  ==>
# (let ((f105660 (make-vector 1))) (begin (begin (vector-set! f105660 0 (closure (f105664 f105665 f105666) (f105660) (let ((f105664 f105664) (f105665 f105665) (f105666 f105666)) (if (null? f105666) f105664 (begin (vector-set! f105664 f105665 (car f105666)) ((vector-ref f105660 0) f105664 (fxadd1 f105665) (cdr f105666)))))))) (closure f105670 (f105660) (let () (let ((f105672 (make-vector ((primitive-ref list-length) f105670)))) ((vector-ref f105660 0) f105672 0 f105670))))))
# emit-expr (let ((f105660 (make-vector 1))) (begin (begin (vector-set! f105660 0 (closure (f105664 f105665 f105666) (f105660) (let ((f105664 f105664) (f105665 f105665) (f105666 f105666)) (if (null? f105666) f105664 (begin (vector-set! f105664 f105665 (car f105666)) ((vector-ref f105660 0) f105664 (fxadd1 f105665) (cdr f105666)))))))) (closure f105670 (f105660) (let () (let ((f105672 (make-vector ((primitive-ref list-length) f105670)))) ((vector-ref f105660 0) f105672 0 f105670))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f105660 (make-vector 1)))
#  body = (begin (begin (vector-set! f105660 0 (closure (f105664 f105665 f105666) (f105660) (let ((f105664 f105664) (f105665 f105665) (f105666 f105666)) (if (null? f105666) f105664 (begin (vector-set! f105664 f105665 (car f105666)) ((vector-ref f105660 0) f105664 (fxadd1 f105665) (cdr f105666)))))))) (closure f105670 (f105660) (let () (let ((f105672 (make-vector ((primitive-ref list-length) f105670)))) ((vector-ref f105660 0) f105672 0 f105670)))))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854479"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854479:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_854480
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854480:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f105660 0 (closure (f105664 f105665 f105666) (f105660) (let ((f105664 f105664) (f105665 f105665) (f105666 f105666)) (if (null? f105666) f105664 (begin (vector-set! f105664 f105665 (car f105666)) ((vector-ref f105660 0) f105664 (fxadd1 f105665) (cdr f105666)))))))) (closure f105670 (f105660) (let () (let ((f105672 (make-vector ((primitive-ref list-length) f105670)))) ((vector-ref f105660 0) f105672 0 f105670)))))
# emit-begin
#   expr=(begin (begin (vector-set! f105660 0 (closure (f105664 f105665 f105666) (f105660) (let ((f105664 f105664) (f105665 f105665) (f105666 f105666)) (if (null? f105666) f105664 (begin (vector-set! f105664 f105665 (car f105666)) ((vector-ref f105660 0) f105664 (fxadd1 f105665) (cdr f105666)))))))) (closure f105670 (f105660) (let () (let ((f105672 (make-vector ((primitive-ref list-length) f105670)))) ((vector-ref f105660 0) f105672 0 f105670)))))
#   env=((f105660 . 0))
# emit-expr (begin (vector-set! f105660 0 (closure (f105664 f105665 f105666) (f105660) (let ((f105664 f105664) (f105665 f105665) (f105666 f105666)) (if (null? f105666) f105664 (begin (vector-set! f105664 f105665 (car f105666)) ((vector-ref f105660 0) f105664 (fxadd1 f105665) (cdr f105666))))))))
# emit-begin
#   expr=(begin (vector-set! f105660 0 (closure (f105664 f105665 f105666) (f105660) (let ((f105664 f105664) (f105665 f105665) (f105666 f105666)) (if (null? f105666) f105664 (begin (vector-set! f105664 f105665 (car f105666)) ((vector-ref f105660 0) f105664 (fxadd1 f105665) (cdr f105666))))))))
#   env=((f105660 . 0))
# emit-expr (vector-set! f105660 0 (closure (f105664 f105665 f105666) (f105660) (let ((f105664 f105664) (f105665 f105665) (f105666 f105666)) (if (null? f105666) f105664 (begin (vector-set! f105664 f105665 (car f105666)) ((vector-ref f105660 0) f105664 (fxadd1 f105665) (cdr f105666)))))))
# emit-expr f105660
# emit-variable-ref
# env=((f105660 . 0))
# var=f105660
    movl 0(%esp), %eax  # stack load f105660
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854481
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854481:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854482"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854482:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854484
    cmp  $0,%eax
    jge _L_854483
_L_854484:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854483:
    movl %eax, -8(%esp)
# emit-expr (closure (f105664 f105665 f105666) (f105660) (let ((f105664 f105664) (f105665 f105665) (f105666 f105666)) (if (null? f105666) f105664 (begin (vector-set! f105664 f105665 (car f105666)) ((vector-ref f105660 0) f105664 (fxadd1 f105665) (cdr f105666))))))
# emit-closure
# si = -12
# env = ((f105660 . 0))
# expr = (closure (f105664 f105665 f105666) (f105660) (let ((f105664 f105664) (f105665 f105665) (f105666 f105666)) (if (null? f105666) f105664 (begin (vector-set! f105664 f105665 (car f105666)) ((vector-ref f105660 0) f105664 (fxadd1 f105665) (cdr f105666))))))
    movl $_L_854485, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f105660 . 0))
# var=f105660
    movl 0(%esp), %eax  # stack load f105660
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f105660
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_854486            # jump around closure body
_L_854485:
# check argument count
    cmp $12,%eax
    je _L_854487
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_854487:
# emit-tail-expr
# si=-20
# env=((f105666 . -16) (f105665 . -12) (f105664 . -8) (f105660 . 4) (f105660 . 0))
# expr=(let ((f105664 f105664) (f105665 f105665) (f105666 f105666)) (if (null? f105666) f105664 (begin (vector-set! f105664 f105665 (car f105666)) ((vector-ref f105660 0) f105664 (fxadd1 f105665) (cdr f105666)))))
# emit-tail-let
#  si   = -20
#  env  = ((f105666 . -16) (f105665 . -12) (f105664 . -8) (f105660 . 4) (f105660 . 0))
#  bindings = ((f105664 f105664) (f105665 f105665) (f105666 f105666))
#  body = (if (null? f105666) f105664 (begin (vector-set! f105664 f105665 (car f105666)) ((vector-ref f105660 0) f105664 (fxadd1 f105665) (cdr f105666))))
# emit-expr f105664
# emit-variable-ref
# env=((f105666 . -16) (f105665 . -12) (f105664 . -8) (f105660 . 4) (f105660 . 0))
# var=f105664
    movl -8(%esp), %eax  # stack load f105664
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-expr f105665
# emit-variable-ref
# env=((f105666 . -16) (f105665 . -12) (f105664 . -8) (f105660 . 4) (f105660 . 0))
# var=f105665
    movl -12(%esp), %eax  # stack load f105665
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f105666
# emit-variable-ref
# env=((f105666 . -16) (f105665 . -12) (f105664 . -8) (f105660 . 4) (f105660 . 0))
# var=f105666
    movl -16(%esp), %eax  # stack load f105666
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-tail-expr
# si=-32
# env=((f105666 . -28) (f105665 . -24) (f105664 . -20) (f105666 . -16) (f105665 . -12) (f105664 . -8) (f105660 . 4) (f105660 . 0))
# expr=(if (null? f105666) f105664 (begin (vector-set! f105664 f105665 (car f105666)) ((vector-ref f105660 0) f105664 (fxadd1 f105665) (cdr f105666))))
# emit-expr (null? f105666)
# emit-expr f105666
# emit-variable-ref
# env=((f105666 . -28) (f105665 . -24) (f105664 . -20) (f105666 . -16) (f105665 . -12) (f105664 . -8) (f105660 . 4) (f105660 . 0))
# var=f105666
    movl -28(%esp), %eax  # stack load f105666
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_854488
# emit-tail-expr
# si=-32
# env=((f105666 . -28) (f105665 . -24) (f105664 . -20) (f105666 . -16) (f105665 . -12) (f105664 . -8) (f105660 . 4) (f105660 . 0))
# expr=f105664
# emit-tail-variable-ref
# emit-variable-ref
# env=((f105666 . -28) (f105665 . -24) (f105664 . -20) (f105666 . -16) (f105665 . -12) (f105664 . -8) (f105660 . 4) (f105660 . 0))
# var=f105664
    movl -20(%esp), %eax  # stack load f105664
# end emit-variable-ref
    ret
# end emit-tail-variable ref
    jmp _L_854489
_L_854488:
# emit-tail-expr
# si=-32
# env=((f105666 . -28) (f105665 . -24) (f105664 . -20) (f105666 . -16) (f105665 . -12) (f105664 . -8) (f105660 . 4) (f105660 . 0))
# expr=(begin (vector-set! f105664 f105665 (car f105666)) ((vector-ref f105660 0) f105664 (fxadd1 f105665) (cdr f105666)))
# tail-begin (begin (vector-set! f105664 f105665 (car f105666)) ((vector-ref f105660 0) f105664 (fxadd1 f105665) (cdr f105666)))
#   env=((f105666 . -28) (f105665 . -24) (f105664 . -20) (f105666 . -16) (f105665 . -12) (f105664 . -8) (f105660 . 4) (f105660 . 0))
# emit-expr (vector-set! f105664 f105665 (car f105666))
# emit-expr f105664
# emit-variable-ref
# env=((f105666 . -28) (f105665 . -24) (f105664 . -20) (f105666 . -16) (f105665 . -12) (f105664 . -8) (f105660 . 4) (f105660 . 0))
# var=f105664
    movl -20(%esp), %eax  # stack load f105664
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854490
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854490:
    movl %eax, -32(%esp)
# emit-expr f105665
# emit-variable-ref
# env=((f105666 . -28) (f105665 . -24) (f105664 . -20) (f105666 . -16) (f105665 . -12) (f105664 . -8) (f105660 . 4) (f105660 . 0))
# var=f105665
    movl -24(%esp), %eax  # stack load f105665
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854491"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854491:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854493
    cmp  $0,%eax
    jge _L_854492
_L_854493:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854492:
    movl %eax, -36(%esp)
# emit-expr (car f105666)
# emit-expr f105666
# emit-variable-ref
# env=((f105666 . -28) (f105665 . -24) (f105664 . -20) (f105666 . -16) (f105665 . -12) (f105664 . -8) (f105660 . 4) (f105660 . 0))
# var=f105666
    movl -28(%esp), %eax  # stack load f105666
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_854494
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854494:
    movl -1(%eax), %eax
    movl -32(%esp), %ebx
    movl -36(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-tail-expr
# si=-32
# env=((f105666 . -28) (f105665 . -24) (f105664 . -20) (f105666 . -16) (f105665 . -12) (f105664 . -8) (f105660 . 4) (f105660 . 0))
# expr=(begin ((vector-ref f105660 0) f105664 (fxadd1 f105665) (cdr f105666)))
# tail-begin (begin ((vector-ref f105660 0) f105664 (fxadd1 f105665) (cdr f105666)))
#   env=((f105666 . -28) (f105665 . -24) (f105664 . -20) (f105666 . -16) (f105665 . -12) (f105664 . -8) (f105660 . 4) (f105660 . 0))
# emit-tail-expr
# si=-32
# env=((f105666 . -28) (f105665 . -24) (f105664 . -20) (f105666 . -16) (f105665 . -12) (f105664 . -8) (f105660 . 4) (f105660 . 0))
# expr=((vector-ref f105660 0) f105664 (fxadd1 f105665) (cdr f105666))
# emit-tail-funcall
#    si   =-32
#    env  = ((f105666 . -28) (f105665 . -24) (f105664 . -20) (f105666 . -16) (f105665 . -12) (f105664 . -8) (f105660 . 4) (f105660 . 0))
#    expr = (funcall (vector-ref f105660 0) f105664 (fxadd1 f105665) (cdr f105666))
# emit-expr (vector-ref f105660 0)
# emit-expr f105660
# emit-variable-ref
# env=((f105666 . -28) (f105665 . -24) (f105664 . -20) (f105666 . -16) (f105665 . -12) (f105664 . -8) (f105660 . 4) (f105660 . 0))
# var=f105660
    movl 2(%edi), %eax  # frame load f105660
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854495
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854495:
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854496"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854496:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854498
    cmp  $0,%eax
    jge _L_854497
_L_854498:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854497:
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -32(%esp)  # stash funcall-oper in next closure slot
# emit-expr f105664
# emit-variable-ref
# env=((f105666 . -28) (f105665 . -24) (f105664 . -20) (f105666 . -16) (f105665 . -12) (f105664 . -8) (f105660 . 4) (f105660 . 0))
# var=f105664
    movl -20(%esp), %eax  # stack load f105664
# end emit-variable-ref
    mov %eax, -36(%esp)    # arg f105664
# emit-expr (fxadd1 f105665)
# emit-expr f105665
# emit-variable-ref
# env=((f105666 . -28) (f105665 . -24) (f105664 . -20) (f105666 . -16) (f105665 . -12) (f105664 . -8) (f105660 . 4) (f105660 . 0))
# var=f105665
    movl -24(%esp), %eax  # stack load f105665
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854499"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $48,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854499:
     addl $4, %eax
    mov %eax, -40(%esp)    # arg (fxadd1 f105665)
# emit-expr (cdr f105666)
# emit-expr f105666
# emit-variable-ref
# env=((f105666 . -28) (f105665 . -24) (f105664 . -20) (f105666 . -16) (f105665 . -12) (f105664 . -8) (f105660 . 4) (f105660 . 0))
# var=f105666
    movl -28(%esp), %eax  # stack load f105666
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_854500
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854500:
    movl 3(%eax), %eax
    mov %eax, -44(%esp)    # arg (cdr f105666)
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
_L_854489:
    .align 4,0x90
_L_854486:
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f105660 . 0))
# emit-expr (begin (closure f105670 (f105660) (let () (let ((f105672 (make-vector ((primitive-ref list-length) f105670)))) ((vector-ref f105660 0) f105672 0 f105670)))))
# emit-begin
#   expr=(begin (closure f105670 (f105660) (let () (let ((f105672 (make-vector ((primitive-ref list-length) f105670)))) ((vector-ref f105660 0) f105672 0 f105670)))))
#   env=((f105660 . 0))
# emit-expr (closure f105670 (f105660) (let () (let ((f105672 (make-vector ((primitive-ref list-length) f105670)))) ((vector-ref f105660 0) f105672 0 f105670))))
# emit-closure
# si = -4
# env = ((f105660 . 0))
# expr = (closure f105670 (f105660) (let () (let ((f105672 (make-vector ((primitive-ref list-length) f105670)))) ((vector-ref f105660 0) f105672 0 f105670))))
    movl $_L_854501, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f105660 . 0))
# var=f105660
    movl 0(%esp), %eax  # stack load f105660
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f105660
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_854502            # jump around closure body
_L_854501:
# check argument count
    cmp $0,%eax
    jge _L_854503
# invoke error handler eh_argcount_min
    .extern eh$uargcount$umin
    movl eh$uargcount$umin, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_854503:
# emit-build-varargs-list
    movl $63, %esi       # args <- () 
    lea -4(%esp),%edi    # edi <- esp-4
    subl %eax, %edi      # edi <- esp-4-eax    addr of arg[K+N] on stack
_L_854505:
    lea -4(%esp),%ebx    # addr of arg[K] on stack
    cmp %edi, %ebx       # while edi <> esp+(si+4)
    je _L_854504
    movl (%edi),%ebx     # arg i -> car
    movl %ebx, 0(%ebp)
    movl %esi, 4(%ebp)  # esi -> cdr
    movl %ebp, %esi
    addl $1, %esi       # tag as pair
    addl $8,%ebp         # bump heap ptr
    addl $4,%edi         # move to next previous arg from the end
    jmp _L_854505
_L_854504:
    movl %esi, -8(%esp)  # set args
# emit-tail-expr
# si=-12
# env=((f105670 . -8) (f105660 . 4) (f105660 . 0))
# expr=(let () (let ((f105672 (make-vector ((primitive-ref list-length) f105670)))) ((vector-ref f105660 0) f105672 0 f105670)))
# emit-tail-let
#  si   = -12
#  env  = ((f105670 . -8) (f105660 . 4) (f105660 . 0))
#  bindings = ()
#  body = (let ((f105672 (make-vector ((primitive-ref list-length) f105670)))) ((vector-ref f105660 0) f105672 0 f105670))
# emit-tail-expr
# si=-12
# env=((f105670 . -8) (f105660 . 4) (f105660 . 0))
# expr=(let ((f105672 (make-vector ((primitive-ref list-length) f105670)))) ((vector-ref f105660 0) f105672 0 f105670))
# emit-tail-let
#  si   = -12
#  env  = ((f105670 . -8) (f105660 . 4) (f105660 . 0))
#  bindings = ((f105672 (make-vector ((primitive-ref list-length) f105670))))
#  body = ((vector-ref f105660 0) f105672 0 f105670)
# emit-expr (make-vector ((primitive-ref list-length) f105670))
# make-vector ((primitive-ref list-length) f105670)
# emit-expr ((primitive-ref list-length) f105670)
# funcall
#    si   =-12
#    env  = ((f105670 . -8) (f105660 . 4) (f105660 . 0))
#    expr = (funcall (primitive-ref list-length) f105670)
# emit-expr (primitive-ref list-length)
    .extern list$mlength
    movl list$mlength,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854506"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854506":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr f105670
# emit-variable-ref
# env=((f105670 . -8) (f105660 . 4) (f105660 . 0))
# var=f105670
    movl -8(%esp), %eax  # stack load f105670
# end emit-variable-ref
    mov %eax, -24(%esp)  # arg f105670
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
    je "_L_854507"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854507:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_854508
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854508:
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
# env=((f105672 . -12) (f105670 . -8) (f105660 . 4) (f105660 . 0))
# expr=((vector-ref f105660 0) f105672 0 f105670)
# emit-tail-funcall
#    si   =-16
#    env  = ((f105672 . -12) (f105670 . -8) (f105660 . 4) (f105660 . 0))
#    expr = (funcall (vector-ref f105660 0) f105672 0 f105670)
# emit-expr (vector-ref f105660 0)
# emit-expr f105660
# emit-variable-ref
# env=((f105672 . -12) (f105670 . -8) (f105660 . 4) (f105660 . 0))
# var=f105660
    movl 2(%edi), %eax  # frame load f105660
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854509
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854509:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854510"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854510:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854512
    cmp  $0,%eax
    jge _L_854511
_L_854512:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854511:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr f105672
# emit-variable-ref
# env=((f105672 . -12) (f105670 . -8) (f105660 . 4) (f105660 . 0))
# var=f105672
    movl -12(%esp), %eax  # stack load f105672
# end emit-variable-ref
    mov %eax, -20(%esp)    # arg f105672
# emit-expr 0
    movl $0, %eax     # immed 0
    mov %eax, -24(%esp)    # arg 0
# emit-expr f105670
# emit-variable-ref
# env=((f105672 . -12) (f105670 . -8) (f105660 . 4) (f105660 . 0))
# var=f105670
    movl -8(%esp), %eax  # stack load f105670
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f105670
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
_L_854502:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f105660 . 0))
     movl %eax, vector
# == explicit-begins  ==>
# (letrec ((fill-string (lambda (s k args) (if (null? args) s (begin (string-set! s k (car args)) (fill-string s (fxadd1 k) (cdr args))))))) (lambda args (let ((s (make-string (list-length args)))) (fill-string s 0 args))))
# == eliminate-let*  ==>
# (letrec ((fill-string (lambda (s k args) (if (null? args) s (begin (string-set! s k (car args)) (fill-string s (fxadd1 k) (cdr args))))))) (lambda args (let ((s (make-string (list-length args)))) (fill-string s 0 args))))
# == uniquify-variables  ==>
# (letrec ((f105673 (lambda (f105677 f105678 f105679) (if (null? f105679) f105677 (begin (string-set! f105677 f105678 (car f105679)) (f105673 f105677 (fxadd1 f105678) (cdr f105679))))))) (lambda f105683 (let ((f105685 (make-string (list-length f105683)))) (f105673 f105685 0 f105683))))
# == vectorize-letrec  ==>
# (let ((f105673 (make-vector 1))) (begin (begin (vector-set! f105673 0 (lambda (f105677 f105678 f105679) (if (null? f105679) f105677 (begin (string-set! f105677 f105678 (car f105679)) ((vector-ref f105673 0) f105677 (fxadd1 f105678) (cdr f105679))))))) (lambda f105683 (let ((f105685 (make-string (list-length f105683)))) ((vector-ref f105673 0) f105685 0 f105683)))))
# == eliminate-set!  ==>
# (let ((f105673 (make-vector 1))) (begin (begin (vector-set! f105673 0 (lambda (f105677 f105678 f105679) (let ((f105677 f105677) (f105678 f105678) (f105679 f105679)) (if (null? f105679) f105677 (begin (string-set! f105677 f105678 (car f105679)) ((vector-ref f105673 0) f105677 (fxadd1 f105678) (cdr f105679)))))))) (lambda f105683 (let () (let ((f105685 (make-string (list-length f105683)))) ((vector-ref f105673 0) f105685 0 f105683))))))
# == close-free-variables  ==>
# (let ((f105673 (make-vector 1))) (begin (begin (vector-set! f105673 0 (closure (f105677 f105678 f105679) (f105673) (let ((f105677 f105677) (f105678 f105678) (f105679 f105679)) (if (null? f105679) f105677 (begin (string-set! f105677 f105678 (car f105679)) ((vector-ref f105673 0) f105677 (fxadd1 f105678) (cdr f105679)))))))) (closure f105683 (f105673) (let () (let ((f105685 (make-string (list-length f105683)))) ((vector-ref f105673 0) f105685 0 f105683))))))
# == eliminate-quote  ==>
# (let ((f105673 (make-vector 1))) (begin (begin (vector-set! f105673 0 (closure (f105677 f105678 f105679) (f105673) (let ((f105677 f105677) (f105678 f105678) (f105679 f105679)) (if (null? f105679) f105677 (begin (string-set! f105677 f105678 (car f105679)) ((vector-ref f105673 0) f105677 (fxadd1 f105678) (cdr f105679)))))))) (closure f105683 (f105673) (let () (let ((f105685 (make-string (list-length f105683)))) ((vector-ref f105673 0) f105685 0 f105683))))))
# == eliminate-when/unless  ==>
# (let ((f105673 (make-vector 1))) (begin (begin (vector-set! f105673 0 (closure (f105677 f105678 f105679) (f105673) (let ((f105677 f105677) (f105678 f105678) (f105679 f105679)) (if (null? f105679) f105677 (begin (string-set! f105677 f105678 (car f105679)) ((vector-ref f105673 0) f105677 (fxadd1 f105678) (cdr f105679)))))))) (closure f105683 (f105673) (let () (let ((f105685 (make-string (list-length f105683)))) ((vector-ref f105673 0) f105685 0 f105683))))))
# == eliminate-cond  ==>
# (let ((f105673 (make-vector 1))) (begin (begin (vector-set! f105673 0 (closure (f105677 f105678 f105679) (f105673) (let ((f105677 f105677) (f105678 f105678) (f105679 f105679)) (if (null? f105679) f105677 (begin (string-set! f105677 f105678 (car f105679)) ((vector-ref f105673 0) f105677 (fxadd1 f105678) (cdr f105679)))))))) (closure f105683 (f105673) (let () (let ((f105685 (make-string (list-length f105683)))) ((vector-ref f105673 0) f105685 0 f105683))))))
# == external-symbols  ==>
# (let ((f105673 (make-vector 1))) (begin (begin (vector-set! f105673 0 (closure (f105677 f105678 f105679) (f105673) (let ((f105677 f105677) (f105678 f105678) (f105679 f105679)) (if (null? f105679) f105677 (begin (string-set! f105677 f105678 (car f105679)) ((vector-ref f105673 0) f105677 (fxadd1 f105678) (cdr f105679)))))))) (closure f105683 (f105673) (let () (let ((f105685 (make-string ((primitive-ref list-length) f105683)))) ((vector-ref f105673 0) f105685 0 f105683))))))
# emit-expr (let ((f105673 (make-vector 1))) (begin (begin (vector-set! f105673 0 (closure (f105677 f105678 f105679) (f105673) (let ((f105677 f105677) (f105678 f105678) (f105679 f105679)) (if (null? f105679) f105677 (begin (string-set! f105677 f105678 (car f105679)) ((vector-ref f105673 0) f105677 (fxadd1 f105678) (cdr f105679)))))))) (closure f105683 (f105673) (let () (let ((f105685 (make-string ((primitive-ref list-length) f105683)))) ((vector-ref f105673 0) f105685 0 f105683))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f105673 (make-vector 1)))
#  body = (begin (begin (vector-set! f105673 0 (closure (f105677 f105678 f105679) (f105673) (let ((f105677 f105677) (f105678 f105678) (f105679 f105679)) (if (null? f105679) f105677 (begin (string-set! f105677 f105678 (car f105679)) ((vector-ref f105673 0) f105677 (fxadd1 f105678) (cdr f105679)))))))) (closure f105683 (f105673) (let () (let ((f105685 (make-string ((primitive-ref list-length) f105683)))) ((vector-ref f105673 0) f105685 0 f105683)))))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854513"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854513:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_854514
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854514:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f105673 0 (closure (f105677 f105678 f105679) (f105673) (let ((f105677 f105677) (f105678 f105678) (f105679 f105679)) (if (null? f105679) f105677 (begin (string-set! f105677 f105678 (car f105679)) ((vector-ref f105673 0) f105677 (fxadd1 f105678) (cdr f105679)))))))) (closure f105683 (f105673) (let () (let ((f105685 (make-string ((primitive-ref list-length) f105683)))) ((vector-ref f105673 0) f105685 0 f105683)))))
# emit-begin
#   expr=(begin (begin (vector-set! f105673 0 (closure (f105677 f105678 f105679) (f105673) (let ((f105677 f105677) (f105678 f105678) (f105679 f105679)) (if (null? f105679) f105677 (begin (string-set! f105677 f105678 (car f105679)) ((vector-ref f105673 0) f105677 (fxadd1 f105678) (cdr f105679)))))))) (closure f105683 (f105673) (let () (let ((f105685 (make-string ((primitive-ref list-length) f105683)))) ((vector-ref f105673 0) f105685 0 f105683)))))
#   env=((f105673 . 0))
# emit-expr (begin (vector-set! f105673 0 (closure (f105677 f105678 f105679) (f105673) (let ((f105677 f105677) (f105678 f105678) (f105679 f105679)) (if (null? f105679) f105677 (begin (string-set! f105677 f105678 (car f105679)) ((vector-ref f105673 0) f105677 (fxadd1 f105678) (cdr f105679))))))))
# emit-begin
#   expr=(begin (vector-set! f105673 0 (closure (f105677 f105678 f105679) (f105673) (let ((f105677 f105677) (f105678 f105678) (f105679 f105679)) (if (null? f105679) f105677 (begin (string-set! f105677 f105678 (car f105679)) ((vector-ref f105673 0) f105677 (fxadd1 f105678) (cdr f105679))))))))
#   env=((f105673 . 0))
# emit-expr (vector-set! f105673 0 (closure (f105677 f105678 f105679) (f105673) (let ((f105677 f105677) (f105678 f105678) (f105679 f105679)) (if (null? f105679) f105677 (begin (string-set! f105677 f105678 (car f105679)) ((vector-ref f105673 0) f105677 (fxadd1 f105678) (cdr f105679)))))))
# emit-expr f105673
# emit-variable-ref
# env=((f105673 . 0))
# var=f105673
    movl 0(%esp), %eax  # stack load f105673
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854515
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854515:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854516"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854516:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854518
    cmp  $0,%eax
    jge _L_854517
_L_854518:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854517:
    movl %eax, -8(%esp)
# emit-expr (closure (f105677 f105678 f105679) (f105673) (let ((f105677 f105677) (f105678 f105678) (f105679 f105679)) (if (null? f105679) f105677 (begin (string-set! f105677 f105678 (car f105679)) ((vector-ref f105673 0) f105677 (fxadd1 f105678) (cdr f105679))))))
# emit-closure
# si = -12
# env = ((f105673 . 0))
# expr = (closure (f105677 f105678 f105679) (f105673) (let ((f105677 f105677) (f105678 f105678) (f105679 f105679)) (if (null? f105679) f105677 (begin (string-set! f105677 f105678 (car f105679)) ((vector-ref f105673 0) f105677 (fxadd1 f105678) (cdr f105679))))))
    movl $_L_854519, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f105673 . 0))
# var=f105673
    movl 0(%esp), %eax  # stack load f105673
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f105673
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_854520            # jump around closure body
_L_854519:
# check argument count
    cmp $12,%eax
    je _L_854521
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_854521:
# emit-tail-expr
# si=-20
# env=((f105679 . -16) (f105678 . -12) (f105677 . -8) (f105673 . 4) (f105673 . 0))
# expr=(let ((f105677 f105677) (f105678 f105678) (f105679 f105679)) (if (null? f105679) f105677 (begin (string-set! f105677 f105678 (car f105679)) ((vector-ref f105673 0) f105677 (fxadd1 f105678) (cdr f105679)))))
# emit-tail-let
#  si   = -20
#  env  = ((f105679 . -16) (f105678 . -12) (f105677 . -8) (f105673 . 4) (f105673 . 0))
#  bindings = ((f105677 f105677) (f105678 f105678) (f105679 f105679))
#  body = (if (null? f105679) f105677 (begin (string-set! f105677 f105678 (car f105679)) ((vector-ref f105673 0) f105677 (fxadd1 f105678) (cdr f105679))))
# emit-expr f105677
# emit-variable-ref
# env=((f105679 . -16) (f105678 . -12) (f105677 . -8) (f105673 . 4) (f105673 . 0))
# var=f105677
    movl -8(%esp), %eax  # stack load f105677
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-expr f105678
# emit-variable-ref
# env=((f105679 . -16) (f105678 . -12) (f105677 . -8) (f105673 . 4) (f105673 . 0))
# var=f105678
    movl -12(%esp), %eax  # stack load f105678
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f105679
# emit-variable-ref
# env=((f105679 . -16) (f105678 . -12) (f105677 . -8) (f105673 . 4) (f105673 . 0))
# var=f105679
    movl -16(%esp), %eax  # stack load f105679
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-tail-expr
# si=-32
# env=((f105679 . -28) (f105678 . -24) (f105677 . -20) (f105679 . -16) (f105678 . -12) (f105677 . -8) (f105673 . 4) (f105673 . 0))
# expr=(if (null? f105679) f105677 (begin (string-set! f105677 f105678 (car f105679)) ((vector-ref f105673 0) f105677 (fxadd1 f105678) (cdr f105679))))
# emit-expr (null? f105679)
# emit-expr f105679
# emit-variable-ref
# env=((f105679 . -28) (f105678 . -24) (f105677 . -20) (f105679 . -16) (f105678 . -12) (f105677 . -8) (f105673 . 4) (f105673 . 0))
# var=f105679
    movl -28(%esp), %eax  # stack load f105679
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_854522
# emit-tail-expr
# si=-32
# env=((f105679 . -28) (f105678 . -24) (f105677 . -20) (f105679 . -16) (f105678 . -12) (f105677 . -8) (f105673 . 4) (f105673 . 0))
# expr=f105677
# emit-tail-variable-ref
# emit-variable-ref
# env=((f105679 . -28) (f105678 . -24) (f105677 . -20) (f105679 . -16) (f105678 . -12) (f105677 . -8) (f105673 . 4) (f105673 . 0))
# var=f105677
    movl -20(%esp), %eax  # stack load f105677
# end emit-variable-ref
    ret
# end emit-tail-variable ref
    jmp _L_854523
_L_854522:
# emit-tail-expr
# si=-32
# env=((f105679 . -28) (f105678 . -24) (f105677 . -20) (f105679 . -16) (f105678 . -12) (f105677 . -8) (f105673 . 4) (f105673 . 0))
# expr=(begin (string-set! f105677 f105678 (car f105679)) ((vector-ref f105673 0) f105677 (fxadd1 f105678) (cdr f105679)))
# tail-begin (begin (string-set! f105677 f105678 (car f105679)) ((vector-ref f105673 0) f105677 (fxadd1 f105678) (cdr f105679)))
#   env=((f105679 . -28) (f105678 . -24) (f105677 . -20) (f105679 . -16) (f105678 . -12) (f105677 . -8) (f105673 . 4) (f105673 . 0))
# emit-expr (string-set! f105677 f105678 (car f105679))
# emit-expr f105677
# emit-variable-ref
# env=((f105679 . -28) (f105678 . -24) (f105677 . -20) (f105679 . -16) (f105678 . -12) (f105677 . -8) (f105673 . 4) (f105673 . 0))
# var=f105677
    movl -20(%esp), %eax  # stack load f105677
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_854524
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854524:
    movl %eax, -32(%esp)
# emit-expr f105678
# emit-variable-ref
# env=((f105679 . -28) (f105678 . -24) (f105677 . -20) (f105679 . -16) (f105678 . -12) (f105677 . -8) (f105673 . 4) (f105673 . 0))
# var=f105678
    movl -24(%esp), %eax  # stack load f105678
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854525"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854525:
# check bounds on string index
    movl -32(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_854527
    cmp  $0,%eax
    jge _L_854526
_L_854527:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854526:
    movl %eax, -36(%esp)
# emit-expr (car f105679)
# emit-expr f105679
# emit-variable-ref
# env=((f105679 . -28) (f105678 . -24) (f105677 . -20) (f105679 . -16) (f105678 . -12) (f105677 . -8) (f105673 . 4) (f105673 . 0))
# var=f105679
    movl -28(%esp), %eax  # stack load f105679
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_854528
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854528:
    movl -1(%eax), %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_854529"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854529:
    movl -32(%esp), %ebx
    movl -36(%esp), %esi
    sar $2, %esi
    movb  %ah, -2(%ebx,%esi)
# emit-tail-expr
# si=-32
# env=((f105679 . -28) (f105678 . -24) (f105677 . -20) (f105679 . -16) (f105678 . -12) (f105677 . -8) (f105673 . 4) (f105673 . 0))
# expr=(begin ((vector-ref f105673 0) f105677 (fxadd1 f105678) (cdr f105679)))
# tail-begin (begin ((vector-ref f105673 0) f105677 (fxadd1 f105678) (cdr f105679)))
#   env=((f105679 . -28) (f105678 . -24) (f105677 . -20) (f105679 . -16) (f105678 . -12) (f105677 . -8) (f105673 . 4) (f105673 . 0))
# emit-tail-expr
# si=-32
# env=((f105679 . -28) (f105678 . -24) (f105677 . -20) (f105679 . -16) (f105678 . -12) (f105677 . -8) (f105673 . 4) (f105673 . 0))
# expr=((vector-ref f105673 0) f105677 (fxadd1 f105678) (cdr f105679))
# emit-tail-funcall
#    si   =-32
#    env  = ((f105679 . -28) (f105678 . -24) (f105677 . -20) (f105679 . -16) (f105678 . -12) (f105677 . -8) (f105673 . 4) (f105673 . 0))
#    expr = (funcall (vector-ref f105673 0) f105677 (fxadd1 f105678) (cdr f105679))
# emit-expr (vector-ref f105673 0)
# emit-expr f105673
# emit-variable-ref
# env=((f105679 . -28) (f105678 . -24) (f105677 . -20) (f105679 . -16) (f105678 . -12) (f105677 . -8) (f105673 . 4) (f105673 . 0))
# var=f105673
    movl 2(%edi), %eax  # frame load f105673
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854530
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854530:
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854531"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854531:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854533
    cmp  $0,%eax
    jge _L_854532
_L_854533:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854532:
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -32(%esp)  # stash funcall-oper in next closure slot
# emit-expr f105677
# emit-variable-ref
# env=((f105679 . -28) (f105678 . -24) (f105677 . -20) (f105679 . -16) (f105678 . -12) (f105677 . -8) (f105673 . 4) (f105673 . 0))
# var=f105677
    movl -20(%esp), %eax  # stack load f105677
# end emit-variable-ref
    mov %eax, -36(%esp)    # arg f105677
# emit-expr (fxadd1 f105678)
# emit-expr f105678
# emit-variable-ref
# env=((f105679 . -28) (f105678 . -24) (f105677 . -20) (f105679 . -16) (f105678 . -12) (f105677 . -8) (f105673 . 4) (f105673 . 0))
# var=f105678
    movl -24(%esp), %eax  # stack load f105678
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854534"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $48,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854534:
     addl $4, %eax
    mov %eax, -40(%esp)    # arg (fxadd1 f105678)
# emit-expr (cdr f105679)
# emit-expr f105679
# emit-variable-ref
# env=((f105679 . -28) (f105678 . -24) (f105677 . -20) (f105679 . -16) (f105678 . -12) (f105677 . -8) (f105673 . 4) (f105673 . 0))
# var=f105679
    movl -28(%esp), %eax  # stack load f105679
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_854535
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854535:
    movl 3(%eax), %eax
    mov %eax, -44(%esp)    # arg (cdr f105679)
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
_L_854523:
    .align 4,0x90
_L_854520:
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f105673 . 0))
# emit-expr (begin (closure f105683 (f105673) (let () (let ((f105685 (make-string ((primitive-ref list-length) f105683)))) ((vector-ref f105673 0) f105685 0 f105683)))))
# emit-begin
#   expr=(begin (closure f105683 (f105673) (let () (let ((f105685 (make-string ((primitive-ref list-length) f105683)))) ((vector-ref f105673 0) f105685 0 f105683)))))
#   env=((f105673 . 0))
# emit-expr (closure f105683 (f105673) (let () (let ((f105685 (make-string ((primitive-ref list-length) f105683)))) ((vector-ref f105673 0) f105685 0 f105683))))
# emit-closure
# si = -4
# env = ((f105673 . 0))
# expr = (closure f105683 (f105673) (let () (let ((f105685 (make-string ((primitive-ref list-length) f105683)))) ((vector-ref f105673 0) f105685 0 f105683))))
    movl $_L_854536, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f105673 . 0))
# var=f105673
    movl 0(%esp), %eax  # stack load f105673
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f105673
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_854537            # jump around closure body
_L_854536:
# check argument count
    cmp $0,%eax
    jge _L_854538
# invoke error handler eh_argcount_min
    .extern eh$uargcount$umin
    movl eh$uargcount$umin, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_854538:
# emit-build-varargs-list
    movl $63, %esi       # args <- () 
    lea -4(%esp),%edi    # edi <- esp-4
    subl %eax, %edi      # edi <- esp-4-eax    addr of arg[K+N] on stack
_L_854540:
    lea -4(%esp),%ebx    # addr of arg[K] on stack
    cmp %edi, %ebx       # while edi <> esp+(si+4)
    je _L_854539
    movl (%edi),%ebx     # arg i -> car
    movl %ebx, 0(%ebp)
    movl %esi, 4(%ebp)  # esi -> cdr
    movl %ebp, %esi
    addl $1, %esi       # tag as pair
    addl $8,%ebp         # bump heap ptr
    addl $4,%edi         # move to next previous arg from the end
    jmp _L_854540
_L_854539:
    movl %esi, -8(%esp)  # set args
# emit-tail-expr
# si=-12
# env=((f105683 . -8) (f105673 . 4) (f105673 . 0))
# expr=(let () (let ((f105685 (make-string ((primitive-ref list-length) f105683)))) ((vector-ref f105673 0) f105685 0 f105683)))
# emit-tail-let
#  si   = -12
#  env  = ((f105683 . -8) (f105673 . 4) (f105673 . 0))
#  bindings = ()
#  body = (let ((f105685 (make-string ((primitive-ref list-length) f105683)))) ((vector-ref f105673 0) f105685 0 f105683))
# emit-tail-expr
# si=-12
# env=((f105683 . -8) (f105673 . 4) (f105673 . 0))
# expr=(let ((f105685 (make-string ((primitive-ref list-length) f105683)))) ((vector-ref f105673 0) f105685 0 f105683))
# emit-tail-let
#  si   = -12
#  env  = ((f105683 . -8) (f105673 . 4) (f105673 . 0))
#  bindings = ((f105685 (make-string ((primitive-ref list-length) f105683))))
#  body = ((vector-ref f105673 0) f105685 0 f105683)
# emit-expr (make-string ((primitive-ref list-length) f105683))
# make-string len=((primitive-ref list-length) f105683)
# emit-expr ((primitive-ref list-length) f105683)
# funcall
#    si   =-12
#    env  = ((f105683 . -8) (f105673 . 4) (f105673 . 0))
#    expr = (funcall (primitive-ref list-length) f105683)
# emit-expr (primitive-ref list-length)
    .extern list$mlength
    movl list$mlength,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854541"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854541":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr f105683
# emit-variable-ref
# env=((f105683 . -8) (f105673 . 4) (f105673 . 0))
# var=f105683
    movl -8(%esp), %eax  # stack load f105683
# end emit-variable-ref
    mov %eax, -24(%esp)  # arg f105683
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
    je "_L_854542"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854542:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_854543
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854543:
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
# env=((f105685 . -12) (f105683 . -8) (f105673 . 4) (f105673 . 0))
# expr=((vector-ref f105673 0) f105685 0 f105683)
# emit-tail-funcall
#    si   =-16
#    env  = ((f105685 . -12) (f105683 . -8) (f105673 . 4) (f105673 . 0))
#    expr = (funcall (vector-ref f105673 0) f105685 0 f105683)
# emit-expr (vector-ref f105673 0)
# emit-expr f105673
# emit-variable-ref
# env=((f105685 . -12) (f105683 . -8) (f105673 . 4) (f105673 . 0))
# var=f105673
    movl 2(%edi), %eax  # frame load f105673
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854544
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854544:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854545"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854545:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854547
    cmp  $0,%eax
    jge _L_854546
_L_854547:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854546:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr f105685
# emit-variable-ref
# env=((f105685 . -12) (f105683 . -8) (f105673 . 4) (f105673 . 0))
# var=f105685
    movl -12(%esp), %eax  # stack load f105685
# end emit-variable-ref
    mov %eax, -20(%esp)    # arg f105685
# emit-expr 0
    movl $0, %eax     # immed 0
    mov %eax, -24(%esp)    # arg 0
# emit-expr f105683
# emit-variable-ref
# env=((f105685 . -12) (f105683 . -8) (f105673 . 4) (f105673 . 0))
# var=f105683
    movl -8(%esp), %eax  # stack load f105683
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f105683
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
_L_854537:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f105673 . 0))
     movl %eax, string
# == explicit-begins  ==>
# (let* ((write-stderr (lambda (s) (foreign-call "s_write" 2 s (string-length s)))) (write-errmsg (lambda (sym emsg) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))))) (lambda (sym emsg) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))
# == eliminate-let*  ==>
# (let ((write-stderr (lambda (s) (foreign-call "s_write" 2 s (string-length s))))) (let ((write-errmsg (lambda (sym emsg) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))))) (lambda (sym emsg) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1)))))
# == uniquify-variables  ==>
# (let ((f105686 (lambda (f105687) (foreign-call "s_write" 2 f105687 (string-length f105687))))) (let ((f105695 (lambda (f105696 f105697) (begin (f105686 "error:") (f105686 (symbol->string f105696)) (f105686 ": ") (f105686 f105697) (f105686 "\n"))))) (lambda (f105700 f105701) (begin (f105695 f105700 f105701) (foreign-call "s_exit" 1)))))
# == vectorize-letrec  ==>
# (let ((f105686 (lambda (f105687) (foreign-call "s_write" 2 f105687 (string-length f105687))))) (let ((f105695 (lambda (f105696 f105697) (begin (f105686 "error:") (f105686 (symbol->string f105696)) (f105686 ": ") (f105686 f105697) (f105686 "\n"))))) (lambda (f105700 f105701) (begin (f105695 f105700 f105701) (foreign-call "s_exit" 1)))))
# == eliminate-set!  ==>
# (let ((f105686 (lambda (f105687) (let ((f105687 f105687)) (foreign-call "s_write" 2 f105687 (string-length f105687)))))) (let ((f105695 (lambda (f105696 f105697) (let ((f105696 f105696) (f105697 f105697)) (begin (f105686 "error:") (f105686 (symbol->string f105696)) (f105686 ": ") (f105686 f105697) (f105686 "\n")))))) (lambda (f105700 f105701) (let ((f105700 f105700) (f105701 f105701)) (begin (f105695 f105700 f105701) (foreign-call "s_exit" 1))))))
# == close-free-variables  ==>
# (let ((f105686 (closure (f105687) () (let ((f105687 f105687)) (foreign-call "s_write" 2 f105687 (string-length f105687)))))) (let ((f105695 (closure (f105696 f105697) (f105686 f105686 f105686 f105686 f105686) (let ((f105696 f105696) (f105697 f105697)) (begin (f105686 "error:") (f105686 (symbol->string f105696)) (f105686 ": ") (f105686 f105697) (f105686 "\n")))))) (closure (f105700 f105701) (f105695) (let ((f105700 f105700) (f105701 f105701)) (begin (f105695 f105700 f105701) (foreign-call "s_exit" 1))))))
# == eliminate-quote  ==>
# (let ((f105686 (closure (f105687) () (let ((f105687 f105687)) (foreign-call "s_write" 2 f105687 (string-length f105687)))))) (let ((f105695 (closure (f105696 f105697) (f105686 f105686 f105686 f105686 f105686) (let ((f105696 f105696) (f105697 f105697)) (begin (f105686 "error:") (f105686 (symbol->string f105696)) (f105686 ": ") (f105686 f105697) (f105686 "\n")))))) (closure (f105700 f105701) (f105695) (let ((f105700 f105700) (f105701 f105701)) (begin (f105695 f105700 f105701) (foreign-call "s_exit" 1))))))
# == eliminate-when/unless  ==>
# (let ((f105686 (closure (f105687) () (let ((f105687 f105687)) (foreign-call "s_write" 2 f105687 (string-length f105687)))))) (let ((f105695 (closure (f105696 f105697) (f105686 f105686 f105686 f105686 f105686) (let ((f105696 f105696) (f105697 f105697)) (begin (f105686 "error:") (f105686 (symbol->string f105696)) (f105686 ": ") (f105686 f105697) (f105686 "\n")))))) (closure (f105700 f105701) (f105695) (let ((f105700 f105700) (f105701 f105701)) (begin (f105695 f105700 f105701) (foreign-call "s_exit" 1))))))
# == eliminate-cond  ==>
# (let ((f105686 (closure (f105687) () (let ((f105687 f105687)) (foreign-call "s_write" 2 f105687 (string-length f105687)))))) (let ((f105695 (closure (f105696 f105697) (f105686 f105686 f105686 f105686 f105686) (let ((f105696 f105696) (f105697 f105697)) (begin (f105686 "error:") (f105686 (symbol->string f105696)) (f105686 ": ") (f105686 f105697) (f105686 "\n")))))) (closure (f105700 f105701) (f105695) (let ((f105700 f105700) (f105701 f105701)) (begin (f105695 f105700 f105701) (foreign-call "s_exit" 1))))))
# == external-symbols  ==>
# (let ((f105686 (closure (f105687) () (let ((f105687 f105687)) (foreign-call "s_write" 2 f105687 (string-length f105687)))))) (let ((f105695 (closure (f105696 f105697) (f105686 f105686 f105686 f105686 f105686) (let ((f105696 f105696) (f105697 f105697)) (begin (f105686 "error:") (f105686 (symbol->string f105696)) (f105686 ": ") (f105686 f105697) (f105686 "\n")))))) (closure (f105700 f105701) (f105695) (let ((f105700 f105700) (f105701 f105701)) (begin (f105695 f105700 f105701) (foreign-call "s_exit" 1))))))
# emit-expr (let ((f105686 (closure (f105687) () (let ((f105687 f105687)) (foreign-call "s_write" 2 f105687 (string-length f105687)))))) (let ((f105695 (closure (f105696 f105697) (f105686 f105686 f105686 f105686 f105686) (let ((f105696 f105696) (f105697 f105697)) (begin (f105686 "error:") (f105686 (symbol->string f105696)) (f105686 ": ") (f105686 f105697) (f105686 "\n")))))) (closure (f105700 f105701) (f105695) (let ((f105700 f105700) (f105701 f105701)) (begin (f105695 f105700 f105701) (foreign-call "s_exit" 1))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f105686 (closure (f105687) () (let ((f105687 f105687)) (foreign-call "s_write" 2 f105687 (string-length f105687))))))
#  body = (let ((f105695 (closure (f105696 f105697) (f105686 f105686 f105686 f105686 f105686) (let ((f105696 f105696) (f105697 f105697)) (begin (f105686 "error:") (f105686 (symbol->string f105696)) (f105686 ": ") (f105686 f105697) (f105686 "\n")))))) (closure (f105700 f105701) (f105695) (let ((f105700 f105700) (f105701 f105701)) (begin (f105695 f105700 f105701) (foreign-call "s_exit" 1)))))
# emit-expr (closure (f105687) () (let ((f105687 f105687)) (foreign-call "s_write" 2 f105687 (string-length f105687))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f105687) () (let ((f105687 f105687)) (foreign-call "s_write" 2 f105687 (string-length f105687))))
    movl $_L_854548, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_854549            # jump around closure body
_L_854548:
# check argument count
    cmp $4,%eax
    je _L_854550
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_854550:
# emit-tail-expr
# si=-12
# env=((f105687 . -8))
# expr=(let ((f105687 f105687)) (foreign-call "s_write" 2 f105687 (string-length f105687)))
# emit-tail-let
#  si   = -12
#  env  = ((f105687 . -8))
#  bindings = ((f105687 f105687))
#  body = (foreign-call "s_write" 2 f105687 (string-length f105687))
# emit-expr f105687
# emit-variable-ref
# env=((f105687 . -8))
# var=f105687
    movl -8(%esp), %eax  # stack load f105687
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f105687 . -12) (f105687 . -8))
# expr=(foreign-call "s_write" 2 f105687 (string-length f105687))
    movl %ecx,-16(%esp)
    movl %esp,-20(%esp)
# emit-expr (string-length f105687)
# emit-expr f105687
# emit-variable-ref
# env=((f105687 . -12) (f105687 . -8))
# var=f105687
    movl -12(%esp), %eax  # stack load f105687
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_854551
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854551:
    movl -6(%eax), %eax
    movl %eax, -24(%esp)
# emit-expr f105687
# emit-variable-ref
# env=((f105687 . -12) (f105687 . -8))
# var=f105687
    movl -12(%esp), %eax  # stack load f105687
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
_L_854549:
    movl %eax, 0(%esp)  # stack save
# emit-expr (let ((f105695 (closure (f105696 f105697) (f105686 f105686 f105686 f105686 f105686) (let ((f105696 f105696) (f105697 f105697)) (begin (f105686 "error:") (f105686 (symbol->string f105696)) (f105686 ": ") (f105686 f105697) (f105686 "\n")))))) (closure (f105700 f105701) (f105695) (let ((f105700 f105700) (f105701 f105701)) (begin (f105695 f105700 f105701) (foreign-call "s_exit" 1)))))
# emit-let
#  si   = -4
#  env  = ((f105686 . 0))
#  bindings = ((f105695 (closure (f105696 f105697) (f105686 f105686 f105686 f105686 f105686) (let ((f105696 f105696) (f105697 f105697)) (begin (f105686 "error:") (f105686 (symbol->string f105696)) (f105686 ": ") (f105686 f105697) (f105686 "\n"))))))
#  body = (closure (f105700 f105701) (f105695) (let ((f105700 f105700) (f105701 f105701)) (begin (f105695 f105700 f105701) (foreign-call "s_exit" 1))))
# emit-expr (closure (f105696 f105697) (f105686 f105686 f105686 f105686 f105686) (let ((f105696 f105696) (f105697 f105697)) (begin (f105686 "error:") (f105686 (symbol->string f105696)) (f105686 ": ") (f105686 f105697) (f105686 "\n"))))
# emit-closure
# si = -4
# env = ((f105686 . 0))
# expr = (closure (f105696 f105697) (f105686 f105686 f105686 f105686 f105686) (let ((f105696 f105696) (f105697 f105697)) (begin (f105686 "error:") (f105686 (symbol->string f105696)) (f105686 ": ") (f105686 f105697) (f105686 "\n"))))
    movl $_L_854552, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f105686 . 0))
# var=f105686
    movl 0(%esp), %eax  # stack load f105686
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f105686
# emit-variable-ref
# env=((f105686 . 0))
# var=f105686
    movl 0(%esp), %eax  # stack load f105686
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f105686
# emit-variable-ref
# env=((f105686 . 0))
# var=f105686
    movl 0(%esp), %eax  # stack load f105686
# end emit-variable-ref
   movl  %eax, 12(%ebp)  # f105686
# emit-variable-ref
# env=((f105686 . 0))
# var=f105686
    movl 0(%esp), %eax  # stack load f105686
# end emit-variable-ref
   movl  %eax, 16(%ebp)  # f105686
# emit-variable-ref
# env=((f105686 . 0))
# var=f105686
    movl 0(%esp), %eax  # stack load f105686
# end emit-variable-ref
   movl  %eax, 20(%ebp)  # f105686
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $24, %ebp     # bump ebp
    jmp _L_854553            # jump around closure body
_L_854552:
# check argument count
    cmp $8,%eax
    je _L_854554
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_854554:
# emit-tail-expr
# si=-16
# env=((f105697 . -12) (f105696 . -8) (f105686 . 20) (f105686 . 16) (f105686 . 12) (f105686 . 8) (f105686 . 4) (f105686 . 0))
# expr=(let ((f105696 f105696) (f105697 f105697)) (begin (f105686 "error:") (f105686 (symbol->string f105696)) (f105686 ": ") (f105686 f105697) (f105686 "\n")))
# emit-tail-let
#  si   = -16
#  env  = ((f105697 . -12) (f105696 . -8) (f105686 . 20) (f105686 . 16) (f105686 . 12) (f105686 . 8) (f105686 . 4) (f105686 . 0))
#  bindings = ((f105696 f105696) (f105697 f105697))
#  body = (begin (f105686 "error:") (f105686 (symbol->string f105696)) (f105686 ": ") (f105686 f105697) (f105686 "\n"))
# emit-expr f105696
# emit-variable-ref
# env=((f105697 . -12) (f105696 . -8) (f105686 . 20) (f105686 . 16) (f105686 . 12) (f105686 . 8) (f105686 . 4) (f105686 . 0))
# var=f105696
    movl -8(%esp), %eax  # stack load f105696
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f105697
# emit-variable-ref
# env=((f105697 . -12) (f105696 . -8) (f105686 . 20) (f105686 . 16) (f105686 . 12) (f105686 . 8) (f105686 . 4) (f105686 . 0))
# var=f105697
    movl -12(%esp), %eax  # stack load f105697
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f105697 . -20) (f105696 . -16) (f105697 . -12) (f105696 . -8) (f105686 . 20) (f105686 . 16) (f105686 . 12) (f105686 . 8) (f105686 . 4) (f105686 . 0))
# expr=(begin (f105686 "error:") (f105686 (symbol->string f105696)) (f105686 ": ") (f105686 f105697) (f105686 "\n"))
# tail-begin (begin (f105686 "error:") (f105686 (symbol->string f105696)) (f105686 ": ") (f105686 f105697) (f105686 "\n"))
#   env=((f105697 . -20) (f105696 . -16) (f105697 . -12) (f105696 . -8) (f105686 . 20) (f105686 . 16) (f105686 . 12) (f105686 . 8) (f105686 . 4) (f105686 . 0))
# emit-expr (f105686 "error:")
# funcall
#    si   =-24
#    env  = ((f105697 . -20) (f105696 . -16) (f105697 . -12) (f105696 . -8) (f105686 . 20) (f105686 . 16) (f105686 . 12) (f105686 . 8) (f105686 . 4) (f105686 . 0))
#    expr = (funcall f105686 "error:")
# emit-expr f105686
# emit-variable-ref
# env=((f105697 . -20) (f105696 . -16) (f105697 . -12) (f105696 . -8) (f105686 . 20) (f105686 . 16) (f105686 . 12) (f105686 . 8) (f105686 . 4) (f105686 . 0))
# var=f105686
    movl 18(%edi), %eax  # frame load f105686
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854555"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854555":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr "error:"
# string literal
    jmp _L_854557
    .align 8,0x90
_L_854556 :
    .int 24
    .ascii "error:"
_L_854557:
    movl $_L_854556, %eax
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
# env=((f105697 . -20) (f105696 . -16) (f105697 . -12) (f105696 . -8) (f105686 . 20) (f105686 . 16) (f105686 . 12) (f105686 . 8) (f105686 . 4) (f105686 . 0))
# expr=(begin (f105686 (symbol->string f105696)) (f105686 ": ") (f105686 f105697) (f105686 "\n"))
# tail-begin (begin (f105686 (symbol->string f105696)) (f105686 ": ") (f105686 f105697) (f105686 "\n"))
#   env=((f105697 . -20) (f105696 . -16) (f105697 . -12) (f105696 . -8) (f105686 . 20) (f105686 . 16) (f105686 . 12) (f105686 . 8) (f105686 . 4) (f105686 . 0))
# emit-expr (f105686 (symbol->string f105696))
# funcall
#    si   =-24
#    env  = ((f105697 . -20) (f105696 . -16) (f105697 . -12) (f105696 . -8) (f105686 . 20) (f105686 . 16) (f105686 . 12) (f105686 . 8) (f105686 . 4) (f105686 . 0))
#    expr = (funcall f105686 (symbol->string f105696))
# emit-expr f105686
# emit-variable-ref
# env=((f105697 . -20) (f105696 . -16) (f105697 . -12) (f105696 . -8) (f105686 . 20) (f105686 . 16) (f105686 . 12) (f105686 . 8) (f105686 . 4) (f105686 . 0))
# var=f105686
    movl 18(%edi), %eax  # frame load f105686
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854558"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854558":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr (symbol->string f105696)
# symbol->string f105696
# emit-expr f105696
# emit-variable-ref
# env=((f105697 . -20) (f105696 . -16) (f105697 . -12) (f105696 . -8) (f105686 . 20) (f105686 . 16) (f105686 . 12) (f105686 . 8) (f105686 . 4) (f105686 . 0))
# var=f105696
    movl -16(%esp), %eax  # stack load f105696
# end emit-variable-ref
    movl -3(%eax), %eax
    mov %eax, -36(%esp)  # arg (symbol->string f105696)
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((f105697 . -20) (f105696 . -16) (f105697 . -12) (f105696 . -8) (f105686 . 20) (f105686 . 16) (f105686 . 12) (f105686 . 8) (f105686 . 4) (f105686 . 0))
# expr=(begin (f105686 ": ") (f105686 f105697) (f105686 "\n"))
# tail-begin (begin (f105686 ": ") (f105686 f105697) (f105686 "\n"))
#   env=((f105697 . -20) (f105696 . -16) (f105697 . -12) (f105696 . -8) (f105686 . 20) (f105686 . 16) (f105686 . 12) (f105686 . 8) (f105686 . 4) (f105686 . 0))
# emit-expr (f105686 ": ")
# funcall
#    si   =-24
#    env  = ((f105697 . -20) (f105696 . -16) (f105697 . -12) (f105696 . -8) (f105686 . 20) (f105686 . 16) (f105686 . 12) (f105686 . 8) (f105686 . 4) (f105686 . 0))
#    expr = (funcall f105686 ": ")
# emit-expr f105686
# emit-variable-ref
# env=((f105697 . -20) (f105696 . -16) (f105697 . -12) (f105696 . -8) (f105686 . 20) (f105686 . 16) (f105686 . 12) (f105686 . 8) (f105686 . 4) (f105686 . 0))
# var=f105686
    movl 18(%edi), %eax  # frame load f105686
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854559"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854559":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr ": "
# string literal
    jmp _L_854561
    .align 8,0x90
_L_854560 :
    .int 8
    .ascii ": "
_L_854561:
    movl $_L_854560, %eax
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
# env=((f105697 . -20) (f105696 . -16) (f105697 . -12) (f105696 . -8) (f105686 . 20) (f105686 . 16) (f105686 . 12) (f105686 . 8) (f105686 . 4) (f105686 . 0))
# expr=(begin (f105686 f105697) (f105686 "\n"))
# tail-begin (begin (f105686 f105697) (f105686 "\n"))
#   env=((f105697 . -20) (f105696 . -16) (f105697 . -12) (f105696 . -8) (f105686 . 20) (f105686 . 16) (f105686 . 12) (f105686 . 8) (f105686 . 4) (f105686 . 0))
# emit-expr (f105686 f105697)
# funcall
#    si   =-24
#    env  = ((f105697 . -20) (f105696 . -16) (f105697 . -12) (f105696 . -8) (f105686 . 20) (f105686 . 16) (f105686 . 12) (f105686 . 8) (f105686 . 4) (f105686 . 0))
#    expr = (funcall f105686 f105697)
# emit-expr f105686
# emit-variable-ref
# env=((f105697 . -20) (f105696 . -16) (f105697 . -12) (f105696 . -8) (f105686 . 20) (f105686 . 16) (f105686 . 12) (f105686 . 8) (f105686 . 4) (f105686 . 0))
# var=f105686
    movl 18(%edi), %eax  # frame load f105686
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854562"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854562":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f105697
# emit-variable-ref
# env=((f105697 . -20) (f105696 . -16) (f105697 . -12) (f105696 . -8) (f105686 . 20) (f105686 . 16) (f105686 . 12) (f105686 . 8) (f105686 . 4) (f105686 . 0))
# var=f105697
    movl -20(%esp), %eax  # stack load f105697
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f105697
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((f105697 . -20) (f105696 . -16) (f105697 . -12) (f105696 . -8) (f105686 . 20) (f105686 . 16) (f105686 . 12) (f105686 . 8) (f105686 . 4) (f105686 . 0))
# expr=(begin (f105686 "\n"))
# tail-begin (begin (f105686 "\n"))
#   env=((f105697 . -20) (f105696 . -16) (f105697 . -12) (f105696 . -8) (f105686 . 20) (f105686 . 16) (f105686 . 12) (f105686 . 8) (f105686 . 4) (f105686 . 0))
# emit-tail-expr
# si=-24
# env=((f105697 . -20) (f105696 . -16) (f105697 . -12) (f105696 . -8) (f105686 . 20) (f105686 . 16) (f105686 . 12) (f105686 . 8) (f105686 . 4) (f105686 . 0))
# expr=(f105686 "\n")
# emit-tail-funcall
#    si   =-24
#    env  = ((f105697 . -20) (f105696 . -16) (f105697 . -12) (f105696 . -8) (f105686 . 20) (f105686 . 16) (f105686 . 12) (f105686 . 8) (f105686 . 4) (f105686 . 0))
#    expr = (funcall f105686 "\n")
# emit-expr f105686
# emit-variable-ref
# env=((f105697 . -20) (f105696 . -16) (f105697 . -12) (f105696 . -8) (f105686 . 20) (f105686 . 16) (f105686 . 12) (f105686 . 8) (f105686 . 4) (f105686 . 0))
# var=f105686
    movl 18(%edi), %eax  # frame load f105686
# end emit-variable-ref
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr "\n"
# string literal
    jmp _L_854564
    .align 8,0x90
_L_854563 :
    .int 4
    .ascii "\n"
_L_854564:
    movl $_L_854563, %eax
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
_L_854553:
    movl %eax, -4(%esp)  # stack save
# emit-expr (closure (f105700 f105701) (f105695) (let ((f105700 f105700) (f105701 f105701)) (begin (f105695 f105700 f105701) (foreign-call "s_exit" 1))))
# emit-closure
# si = -8
# env = ((f105695 . -4) (f105686 . 0))
# expr = (closure (f105700 f105701) (f105695) (let ((f105700 f105700) (f105701 f105701)) (begin (f105695 f105700 f105701) (foreign-call "s_exit" 1))))
    movl $_L_854565, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f105695 . -4) (f105686 . 0))
# var=f105695
    movl -4(%esp), %eax  # stack load f105695
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f105695
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_854566            # jump around closure body
_L_854565:
# check argument count
    cmp $8,%eax
    je _L_854567
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_854567:
# emit-tail-expr
# si=-16
# env=((f105701 . -12) (f105700 . -8) (f105695 . 4) (f105695 . -4) (f105686 . 0))
# expr=(let ((f105700 f105700) (f105701 f105701)) (begin (f105695 f105700 f105701) (foreign-call "s_exit" 1)))
# emit-tail-let
#  si   = -16
#  env  = ((f105701 . -12) (f105700 . -8) (f105695 . 4) (f105695 . -4) (f105686 . 0))
#  bindings = ((f105700 f105700) (f105701 f105701))
#  body = (begin (f105695 f105700 f105701) (foreign-call "s_exit" 1))
# emit-expr f105700
# emit-variable-ref
# env=((f105701 . -12) (f105700 . -8) (f105695 . 4) (f105695 . -4) (f105686 . 0))
# var=f105700
    movl -8(%esp), %eax  # stack load f105700
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f105701
# emit-variable-ref
# env=((f105701 . -12) (f105700 . -8) (f105695 . 4) (f105695 . -4) (f105686 . 0))
# var=f105701
    movl -12(%esp), %eax  # stack load f105701
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f105701 . -20) (f105700 . -16) (f105701 . -12) (f105700 . -8) (f105695 . 4) (f105695 . -4) (f105686 . 0))
# expr=(begin (f105695 f105700 f105701) (foreign-call "s_exit" 1))
# tail-begin (begin (f105695 f105700 f105701) (foreign-call "s_exit" 1))
#   env=((f105701 . -20) (f105700 . -16) (f105701 . -12) (f105700 . -8) (f105695 . 4) (f105695 . -4) (f105686 . 0))
# emit-expr (f105695 f105700 f105701)
# funcall
#    si   =-24
#    env  = ((f105701 . -20) (f105700 . -16) (f105701 . -12) (f105700 . -8) (f105695 . 4) (f105695 . -4) (f105686 . 0))
#    expr = (funcall f105695 f105700 f105701)
# emit-expr f105695
# emit-variable-ref
# env=((f105701 . -20) (f105700 . -16) (f105701 . -12) (f105700 . -8) (f105695 . 4) (f105695 . -4) (f105686 . 0))
# var=f105695
    movl 2(%edi), %eax  # frame load f105695
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854568"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854568":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f105700
# emit-variable-ref
# env=((f105701 . -20) (f105700 . -16) (f105701 . -12) (f105700 . -8) (f105695 . 4) (f105695 . -4) (f105686 . 0))
# var=f105700
    movl -16(%esp), %eax  # stack load f105700
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f105700
# emit-expr f105701
# emit-variable-ref
# env=((f105701 . -20) (f105700 . -16) (f105701 . -12) (f105700 . -8) (f105695 . 4) (f105695 . -4) (f105686 . 0))
# var=f105701
    movl -20(%esp), %eax  # stack load f105701
# end emit-variable-ref
    mov %eax, -40(%esp)  # arg f105701
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((f105701 . -20) (f105700 . -16) (f105701 . -12) (f105700 . -8) (f105695 . 4) (f105695 . -4) (f105686 . 0))
# expr=(begin (foreign-call "s_exit" 1))
# tail-begin (begin (foreign-call "s_exit" 1))
#   env=((f105701 . -20) (f105700 . -16) (f105701 . -12) (f105700 . -8) (f105695 . 4) (f105695 . -4) (f105686 . 0))
# emit-tail-expr
# si=-24
# env=((f105701 . -20) (f105700 . -16) (f105701 . -12) (f105700 . -8) (f105695 . 4) (f105695 . -4) (f105686 . 0))
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
_L_854566:
     movl %eax, error
# == explicit-begins  ==>
# (let ((p (quote ()))) (begin (set! p (cons (quote procedure?) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote symbol-value) p)) (set! p (cons (quote symbol->string) p)) (set! p (cons (quote make-symbol) p)) (set! p (cons (quote symbol?) p)) (set! p (cons (quote string-set!) p)) (set! p (cons (quote string-ref) p)) (set! p (cons (quote string-length) p)) (set! p (cons (quote string?) p)) (set! p (cons (quote make-string) p)) (set! p (cons (quote vector-ref) p)) (set! p (cons (quote vector-set!) p)) (set! p (cons (quote vector-length) p)) (set! p (cons (quote make-vector) p)) (set! p (cons (quote vector?) p)) (set! p (cons (quote set-cdr!) p)) (set! p (cons (quote set-car!) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote cons) p)) (set! p (cons (quote pair?) p)) (set! p (cons (quote fx*) p)) (set! p (cons (quote fx-) p)) (set! p (cons (quote fx+) p)) (set! p (cons (quote fx>=) p)) (set! p (cons (quote fx>) p)) (set! p (cons (quote fx<=) p)) (set! p (cons (quote fx<) p)) (set! p (cons (quote fx=) p)) (set! p (cons (quote fxzero?) p)) (set! p (cons (quote fxsub1) p)) (set! p (cons (quote fxadd1) p)) (set! p (cons (quote fxlogor) p)) (set! p (cons (quote fxlogand) p)) (set! p (cons (quote fxlognot) p)) (set! p (cons (quote char=?) p)) (set! p (cons (quote eq?) p)) (set! p (cons (quote not) p)) (set! p (cons (quote boolean?) p)) (set! p (cons (quote fixnum?) p)) (set! p (cons (quote char?) p)) (set! p (cons (quote null?) p)) (set! p (cons (quote char->fixnum) p)) (set! p (cons (quote fixnum->char) p)) (lambda () p)))
# == eliminate-let*  ==>
# (let ((p (quote ()))) (begin (set! p (cons (quote procedure?) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote symbol-value) p)) (set! p (cons (quote symbol->string) p)) (set! p (cons (quote make-symbol) p)) (set! p (cons (quote symbol?) p)) (set! p (cons (quote string-set!) p)) (set! p (cons (quote string-ref) p)) (set! p (cons (quote string-length) p)) (set! p (cons (quote string?) p)) (set! p (cons (quote make-string) p)) (set! p (cons (quote vector-ref) p)) (set! p (cons (quote vector-set!) p)) (set! p (cons (quote vector-length) p)) (set! p (cons (quote make-vector) p)) (set! p (cons (quote vector?) p)) (set! p (cons (quote set-cdr!) p)) (set! p (cons (quote set-car!) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote cons) p)) (set! p (cons (quote pair?) p)) (set! p (cons (quote fx*) p)) (set! p (cons (quote fx-) p)) (set! p (cons (quote fx+) p)) (set! p (cons (quote fx>=) p)) (set! p (cons (quote fx>) p)) (set! p (cons (quote fx<=) p)) (set! p (cons (quote fx<) p)) (set! p (cons (quote fx=) p)) (set! p (cons (quote fxzero?) p)) (set! p (cons (quote fxsub1) p)) (set! p (cons (quote fxadd1) p)) (set! p (cons (quote fxlogor) p)) (set! p (cons (quote fxlogand) p)) (set! p (cons (quote fxlognot) p)) (set! p (cons (quote char=?) p)) (set! p (cons (quote eq?) p)) (set! p (cons (quote not) p)) (set! p (cons (quote boolean?) p)) (set! p (cons (quote fixnum?) p)) (set! p (cons (quote char?) p)) (set! p (cons (quote null?) p)) (set! p (cons (quote char->fixnum) p)) (set! p (cons (quote fixnum->char) p)) (lambda () p)))
# == uniquify-variables  ==>
# (let ((f105702 (quote ()))) (begin (set! f105702 (cons (quote procedure?) f105702)) (set! f105702 (cons (quote cdr) f105702)) (set! f105702 (cons (quote car) f105702)) (set! f105702 (cons (quote symbol-value) f105702)) (set! f105702 (cons (quote symbol->string) f105702)) (set! f105702 (cons (quote make-symbol) f105702)) (set! f105702 (cons (quote symbol?) f105702)) (set! f105702 (cons (quote string-set!) f105702)) (set! f105702 (cons (quote string-ref) f105702)) (set! f105702 (cons (quote string-length) f105702)) (set! f105702 (cons (quote string?) f105702)) (set! f105702 (cons (quote make-string) f105702)) (set! f105702 (cons (quote vector-ref) f105702)) (set! f105702 (cons (quote vector-set!) f105702)) (set! f105702 (cons (quote vector-length) f105702)) (set! f105702 (cons (quote make-vector) f105702)) (set! f105702 (cons (quote vector?) f105702)) (set! f105702 (cons (quote set-cdr!) f105702)) (set! f105702 (cons (quote set-car!) f105702)) (set! f105702 (cons (quote cdr) f105702)) (set! f105702 (cons (quote car) f105702)) (set! f105702 (cons (quote cons) f105702)) (set! f105702 (cons (quote pair?) f105702)) (set! f105702 (cons (quote fx*) f105702)) (set! f105702 (cons (quote fx-) f105702)) (set! f105702 (cons (quote fx+) f105702)) (set! f105702 (cons (quote fx>=) f105702)) (set! f105702 (cons (quote fx>) f105702)) (set! f105702 (cons (quote fx<=) f105702)) (set! f105702 (cons (quote fx<) f105702)) (set! f105702 (cons (quote fx=) f105702)) (set! f105702 (cons (quote fxzero?) f105702)) (set! f105702 (cons (quote fxsub1) f105702)) (set! f105702 (cons (quote fxadd1) f105702)) (set! f105702 (cons (quote fxlogor) f105702)) (set! f105702 (cons (quote fxlogand) f105702)) (set! f105702 (cons (quote fxlognot) f105702)) (set! f105702 (cons (quote char=?) f105702)) (set! f105702 (cons (quote eq?) f105702)) (set! f105702 (cons (quote not) f105702)) (set! f105702 (cons (quote boolean?) f105702)) (set! f105702 (cons (quote fixnum?) f105702)) (set! f105702 (cons (quote char?) f105702)) (set! f105702 (cons (quote null?) f105702)) (set! f105702 (cons (quote char->fixnum) f105702)) (set! f105702 (cons (quote fixnum->char) f105702)) (lambda () f105702)))
# == vectorize-letrec  ==>
# (let ((f105702 (quote ()))) (begin (set! f105702 (cons (quote procedure?) f105702)) (set! f105702 (cons (quote cdr) f105702)) (set! f105702 (cons (quote car) f105702)) (set! f105702 (cons (quote symbol-value) f105702)) (set! f105702 (cons (quote symbol->string) f105702)) (set! f105702 (cons (quote make-symbol) f105702)) (set! f105702 (cons (quote symbol?) f105702)) (set! f105702 (cons (quote string-set!) f105702)) (set! f105702 (cons (quote string-ref) f105702)) (set! f105702 (cons (quote string-length) f105702)) (set! f105702 (cons (quote string?) f105702)) (set! f105702 (cons (quote make-string) f105702)) (set! f105702 (cons (quote vector-ref) f105702)) (set! f105702 (cons (quote vector-set!) f105702)) (set! f105702 (cons (quote vector-length) f105702)) (set! f105702 (cons (quote make-vector) f105702)) (set! f105702 (cons (quote vector?) f105702)) (set! f105702 (cons (quote set-cdr!) f105702)) (set! f105702 (cons (quote set-car!) f105702)) (set! f105702 (cons (quote cdr) f105702)) (set! f105702 (cons (quote car) f105702)) (set! f105702 (cons (quote cons) f105702)) (set! f105702 (cons (quote pair?) f105702)) (set! f105702 (cons (quote fx*) f105702)) (set! f105702 (cons (quote fx-) f105702)) (set! f105702 (cons (quote fx+) f105702)) (set! f105702 (cons (quote fx>=) f105702)) (set! f105702 (cons (quote fx>) f105702)) (set! f105702 (cons (quote fx<=) f105702)) (set! f105702 (cons (quote fx<) f105702)) (set! f105702 (cons (quote fx=) f105702)) (set! f105702 (cons (quote fxzero?) f105702)) (set! f105702 (cons (quote fxsub1) f105702)) (set! f105702 (cons (quote fxadd1) f105702)) (set! f105702 (cons (quote fxlogor) f105702)) (set! f105702 (cons (quote fxlogand) f105702)) (set! f105702 (cons (quote fxlognot) f105702)) (set! f105702 (cons (quote char=?) f105702)) (set! f105702 (cons (quote eq?) f105702)) (set! f105702 (cons (quote not) f105702)) (set! f105702 (cons (quote boolean?) f105702)) (set! f105702 (cons (quote fixnum?) f105702)) (set! f105702 (cons (quote char?) f105702)) (set! f105702 (cons (quote null?) f105702)) (set! f105702 (cons (quote char->fixnum) f105702)) (set! f105702 (cons (quote fixnum->char) f105702)) (lambda () f105702)))
# == eliminate-set!  ==>
# (let ((f105702 (vector (quote ())))) (begin (vector-set! f105702 0 (cons (quote procedure?) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote cdr) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote car) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote symbol-value) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote symbol->string) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote make-symbol) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote symbol?) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote string-set!) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote string-ref) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote string-length) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote string?) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote make-string) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote vector-ref) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote vector-set!) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote vector-length) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote make-vector) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote vector?) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote set-cdr!) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote set-car!) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote cdr) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote car) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote cons) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote pair?) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote fx*) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote fx-) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote fx+) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote fx>=) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote fx>) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote fx<=) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote fx<) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote fx=) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote fxzero?) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote fxsub1) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote fxadd1) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote fxlogor) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote fxlogand) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote fxlognot) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote char=?) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote eq?) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote not) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote boolean?) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote fixnum?) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote char?) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote null?) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote char->fixnum) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote fixnum->char) (vector-ref f105702 0))) (lambda () (let () (vector-ref f105702 0)))))
# == close-free-variables  ==>
# (let ((f105702 (vector (quote ())))) (begin (vector-set! f105702 0 (cons (quote procedure?) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote cdr) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote car) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote symbol-value) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote symbol->string) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote make-symbol) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote symbol?) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote string-set!) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote string-ref) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote string-length) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote string?) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote make-string) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote vector-ref) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote vector-set!) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote vector-length) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote make-vector) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote vector?) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote set-cdr!) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote set-car!) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote cdr) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote car) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote cons) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote pair?) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote fx*) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote fx-) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote fx+) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote fx>=) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote fx>) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote fx<=) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote fx<) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote fx=) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote fxzero?) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote fxsub1) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote fxadd1) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote fxlogor) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote fxlogand) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote fxlognot) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote char=?) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote eq?) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote not) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote boolean?) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote fixnum?) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote char?) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote null?) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote char->fixnum) (vector-ref f105702 0))) (vector-set! f105702 0 (cons (quote fixnum->char) (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0)))))
# == eliminate-quote  ==>
# (let ((f105702 (vector ()))) (begin (vector-set! f105702 0 (cons (string->symbol "procedure?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "symbol-value") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "symbol->string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "make-symbol") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "symbol?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "string-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "string-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "string-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "string?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "make-string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "vector-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "vector-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "vector-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0)))))
# == eliminate-when/unless  ==>
# (let ((f105702 (vector ()))) (begin (vector-set! f105702 0 (cons (string->symbol "procedure?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "symbol-value") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "symbol->string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "make-symbol") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "symbol?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "string-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "string-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "string-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "string?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "make-string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "vector-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "vector-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "vector-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0)))))
# == eliminate-cond  ==>
# (let ((f105702 (vector ()))) (begin (vector-set! f105702 0 (cons (string->symbol "procedure?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "symbol-value") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "symbol->string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "make-symbol") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "symbol?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "string-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "string-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "string-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "string?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "make-string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "vector-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "vector-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "vector-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons (string->symbol "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0)))))
# == external-symbols  ==>
# (let ((f105702 ((primitive-ref vector) ()))) (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0)))))
# emit-expr (let ((f105702 ((primitive-ref vector) ()))) (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0)))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f105702 ((primitive-ref vector) ())))
#  body = (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
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
    je "_L_854569"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854569":
   movl %eax,  -8(%esp)  # stash funcall-oper in closure slot
# emit-expr ()
    movl $63, %eax     # immed ()
    mov %eax, -12(%esp)  # arg ()
    movl -8(%esp), %edi   # load new closure to %edi
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854570
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854570:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854571"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854571:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854573
    cmp  $0,%eax
    jge _L_854572
_L_854573:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854572:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "procedure?") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "procedure?")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "procedure?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854574"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854574":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "procedure?"
# string literal
    jmp _L_854576
    .align 8,0x90
_L_854575 :
    .int 40
    .ascii "procedure?"
_L_854576:
    movl $_L_854575, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg procedure?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854577
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854577:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854578"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854578:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854580
    cmp  $0,%eax
    jge _L_854579
_L_854580:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854579:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854581
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854581:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854582"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854582:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854584
    cmp  $0,%eax
    jge _L_854583
_L_854584:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854583:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "cdr") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "cdr")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "cdr")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854585"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854585":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cdr"
# string literal
    jmp _L_854587
    .align 8,0x90
_L_854586 :
    .int 12
    .ascii "cdr"
_L_854587:
    movl $_L_854586, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cdr
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854588
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854588:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854589"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854589:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854591
    cmp  $0,%eax
    jge _L_854590
_L_854591:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854590:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854592
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854592:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854593"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854593:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854595
    cmp  $0,%eax
    jge _L_854594
_L_854595:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854594:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "car") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "car")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "car")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854596"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854596":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "car"
# string literal
    jmp _L_854598
    .align 8,0x90
_L_854597 :
    .int 12
    .ascii "car"
_L_854598:
    movl $_L_854597, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg car
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854599
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854599:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854600"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854600:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854602
    cmp  $0,%eax
    jge _L_854601
_L_854602:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854601:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854603
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854603:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854604"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854604:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854606
    cmp  $0,%eax
    jge _L_854605
_L_854606:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854605:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "symbol-value") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "symbol-value")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol-value")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854607"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854607":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol-value"
# string literal
    jmp _L_854609
    .align 8,0x90
_L_854608 :
    .int 48
    .ascii "symbol-value"
_L_854609:
    movl $_L_854608, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol-value
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854610
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854610:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854611"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854611:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854613
    cmp  $0,%eax
    jge _L_854612
_L_854613:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854612:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854614
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854614:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854615"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854615:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854617
    cmp  $0,%eax
    jge _L_854616
_L_854617:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854616:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "symbol->string") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "symbol->string")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol->string")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854618"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854618":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol->string"
# string literal
    jmp _L_854620
    .align 8,0x90
_L_854619 :
    .int 56
    .ascii "symbol->string"
_L_854620:
    movl $_L_854619, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol->string
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854621
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854621:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854622"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854622:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854624
    cmp  $0,%eax
    jge _L_854623
_L_854624:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854623:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854625
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854625:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854626"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854626:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854628
    cmp  $0,%eax
    jge _L_854627
_L_854628:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854627:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "make-symbol") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "make-symbol")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-symbol")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854629"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854629":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-symbol"
# string literal
    jmp _L_854631
    .align 8,0x90
_L_854630 :
    .int 44
    .ascii "make-symbol"
_L_854631:
    movl $_L_854630, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-symbol
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854632
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854632:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854633"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854633:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854635
    cmp  $0,%eax
    jge _L_854634
_L_854635:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854634:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854636
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854636:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854637"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854637:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854639
    cmp  $0,%eax
    jge _L_854638
_L_854639:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854638:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "symbol?") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "symbol?")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854640"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854640":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol?"
# string literal
    jmp _L_854642
    .align 8,0x90
_L_854641 :
    .int 28
    .ascii "symbol?"
_L_854642:
    movl $_L_854641, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854643
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854643:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854644"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854644:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854646
    cmp  $0,%eax
    jge _L_854645
_L_854646:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854645:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854647
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854647:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854648"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854648:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854650
    cmp  $0,%eax
    jge _L_854649
_L_854650:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854649:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "string-set!") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "string-set!")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-set!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854651"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854651":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-set!"
# string literal
    jmp _L_854653
    .align 8,0x90
_L_854652 :
    .int 44
    .ascii "string-set!"
_L_854653:
    movl $_L_854652, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-set!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854654
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854654:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854655"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854655:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854657
    cmp  $0,%eax
    jge _L_854656
_L_854657:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854656:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854658
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854658:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854659"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854659:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854661
    cmp  $0,%eax
    jge _L_854660
_L_854661:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854660:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "string-ref") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "string-ref")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-ref")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854662"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854662":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-ref"
# string literal
    jmp _L_854664
    .align 8,0x90
_L_854663 :
    .int 40
    .ascii "string-ref"
_L_854664:
    movl $_L_854663, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-ref
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854665
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854665:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854666"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854666:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854668
    cmp  $0,%eax
    jge _L_854667
_L_854668:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854667:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854669
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854669:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854670"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854670:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854672
    cmp  $0,%eax
    jge _L_854671
_L_854672:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854671:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-length") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "string-length") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "string-length")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-length")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854673"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854673":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-length"
# string literal
    jmp _L_854675
    .align 8,0x90
_L_854674 :
    .int 52
    .ascii "string-length"
_L_854675:
    movl $_L_854674, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-length
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854676
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854676:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854677"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854677:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854679
    cmp  $0,%eax
    jge _L_854678
_L_854679:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854678:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854680
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854680:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854681"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854681:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854683
    cmp  $0,%eax
    jge _L_854682
_L_854683:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854682:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string?") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "string?") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "string?")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854684"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854684":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string?"
# string literal
    jmp _L_854686
    .align 8,0x90
_L_854685 :
    .int 28
    .ascii "string?"
_L_854686:
    movl $_L_854685, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854687
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854687:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854688"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854688:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854690
    cmp  $0,%eax
    jge _L_854689
_L_854690:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854689:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854691
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854691:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854692"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854692:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854694
    cmp  $0,%eax
    jge _L_854693
_L_854694:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854693:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-string") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "make-string") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "make-string")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-string")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854695"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854695":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-string"
# string literal
    jmp _L_854697
    .align 8,0x90
_L_854696 :
    .int 44
    .ascii "make-string"
_L_854697:
    movl $_L_854696, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-string
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854698
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854698:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854699"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854699:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854701
    cmp  $0,%eax
    jge _L_854700
_L_854701:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854700:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854702
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854702:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854703"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854703:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854705
    cmp  $0,%eax
    jge _L_854704
_L_854705:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854704:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "vector-ref") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "vector-ref")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-ref")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854706"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854706":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-ref"
# string literal
    jmp _L_854708
    .align 8,0x90
_L_854707 :
    .int 40
    .ascii "vector-ref"
_L_854708:
    movl $_L_854707, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-ref
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854709
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854709:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854710"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854710:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854712
    cmp  $0,%eax
    jge _L_854711
_L_854712:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854711:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854713
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854713:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854714"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854714:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854716
    cmp  $0,%eax
    jge _L_854715
_L_854716:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854715:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "vector-set!") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "vector-set!")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-set!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854717"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854717":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-set!"
# string literal
    jmp _L_854719
    .align 8,0x90
_L_854718 :
    .int 44
    .ascii "vector-set!"
_L_854719:
    movl $_L_854718, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-set!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854720
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854720:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854721"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854721:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854723
    cmp  $0,%eax
    jge _L_854722
_L_854723:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854722:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854724
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854724:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854725"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854725:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854727
    cmp  $0,%eax
    jge _L_854726
_L_854727:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854726:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "vector-length") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "vector-length")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-length")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854728"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854728":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-length"
# string literal
    jmp _L_854730
    .align 8,0x90
_L_854729 :
    .int 52
    .ascii "vector-length"
_L_854730:
    movl $_L_854729, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-length
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854731
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854731:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854732"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854732:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854734
    cmp  $0,%eax
    jge _L_854733
_L_854734:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854733:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854735
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854735:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854736"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854736:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854738
    cmp  $0,%eax
    jge _L_854737
_L_854738:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854737:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "make-vector") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "make-vector")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-vector")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854739"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854739":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-vector"
# string literal
    jmp _L_854741
    .align 8,0x90
_L_854740 :
    .int 44
    .ascii "make-vector"
_L_854741:
    movl $_L_854740, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-vector
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854742
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854742:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854743"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854743:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854745
    cmp  $0,%eax
    jge _L_854744
_L_854745:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854744:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854746
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854746:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854747"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854747:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854749
    cmp  $0,%eax
    jge _L_854748
_L_854749:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854748:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector?") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "vector?") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "vector?")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854750"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854750":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector?"
# string literal
    jmp _L_854752
    .align 8,0x90
_L_854751 :
    .int 28
    .ascii "vector?"
_L_854752:
    movl $_L_854751, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854753
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854753:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854754"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854754:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854756
    cmp  $0,%eax
    jge _L_854755
_L_854756:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854755:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854757
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854757:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854758"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854758:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854760
    cmp  $0,%eax
    jge _L_854759
_L_854760:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854759:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "set-cdr!") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "set-cdr!")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "set-cdr!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854761"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854761":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "set-cdr!"
# string literal
    jmp _L_854763
    .align 8,0x90
_L_854762 :
    .int 32
    .ascii "set-cdr!"
_L_854763:
    movl $_L_854762, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg set-cdr!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854764
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854764:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854765"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854765:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854767
    cmp  $0,%eax
    jge _L_854766
_L_854767:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854766:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854768
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854768:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854769"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854769:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854771
    cmp  $0,%eax
    jge _L_854770
_L_854771:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854770:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "set-car!") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "set-car!")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "set-car!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854772"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854772":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "set-car!"
# string literal
    jmp _L_854774
    .align 8,0x90
_L_854773 :
    .int 32
    .ascii "set-car!"
_L_854774:
    movl $_L_854773, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg set-car!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854775
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854775:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854776"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854776:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854778
    cmp  $0,%eax
    jge _L_854777
_L_854778:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854777:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854779
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854779:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854780"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854780:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854782
    cmp  $0,%eax
    jge _L_854781
_L_854782:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854781:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cdr") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "cdr") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "cdr")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "cdr")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854783"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854783":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cdr"
# string literal
    jmp _L_854785
    .align 8,0x90
_L_854784 :
    .int 12
    .ascii "cdr"
_L_854785:
    movl $_L_854784, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cdr
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854786
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854786:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854787"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854787:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854789
    cmp  $0,%eax
    jge _L_854788
_L_854789:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854788:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854790
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854790:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854791"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854791:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854793
    cmp  $0,%eax
    jge _L_854792
_L_854793:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854792:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "car") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "car") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "car")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "car")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854794"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854794":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "car"
# string literal
    jmp _L_854796
    .align 8,0x90
_L_854795 :
    .int 12
    .ascii "car"
_L_854796:
    movl $_L_854795, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg car
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854797
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854797:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854798"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854798:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854800
    cmp  $0,%eax
    jge _L_854799
_L_854800:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854799:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854801
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854801:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854802"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854802:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854804
    cmp  $0,%eax
    jge _L_854803
_L_854804:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854803:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cons") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "cons") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "cons")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "cons")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854805"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854805":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cons"
# string literal
    jmp _L_854807
    .align 8,0x90
_L_854806 :
    .int 16
    .ascii "cons"
_L_854807:
    movl $_L_854806, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cons
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854808
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854808:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854809"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854809:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854811
    cmp  $0,%eax
    jge _L_854810
_L_854811:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854810:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854812
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854812:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854813"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854813:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854815
    cmp  $0,%eax
    jge _L_854814
_L_854815:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854814:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "pair?") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "pair?") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "pair?")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "pair?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854816"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854816":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "pair?"
# string literal
    jmp _L_854818
    .align 8,0x90
_L_854817 :
    .int 20
    .ascii "pair?"
_L_854818:
    movl $_L_854817, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg pair?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854819
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854819:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854820"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854820:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854822
    cmp  $0,%eax
    jge _L_854821
_L_854822:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854821:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854823
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854823:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854824"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854824:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854826
    cmp  $0,%eax
    jge _L_854825
_L_854826:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854825:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx*") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "fx*") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "fx*")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx*")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854827"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854827":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx*"
# string literal
    jmp _L_854829
    .align 8,0x90
_L_854828 :
    .int 12
    .ascii "fx*"
_L_854829:
    movl $_L_854828, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx*
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854830
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854830:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854831"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854831:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854833
    cmp  $0,%eax
    jge _L_854832
_L_854833:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854832:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854834
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854834:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854835"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854835:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854837
    cmp  $0,%eax
    jge _L_854836
_L_854837:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854836:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx-") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "fx-") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "fx-")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx-")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854838"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854838":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx-"
# string literal
    jmp _L_854840
    .align 8,0x90
_L_854839 :
    .int 12
    .ascii "fx-"
_L_854840:
    movl $_L_854839, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx-
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854841
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854841:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854842"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854842:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854844
    cmp  $0,%eax
    jge _L_854843
_L_854844:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854843:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854845
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854845:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854846"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854846:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854848
    cmp  $0,%eax
    jge _L_854847
_L_854848:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854847:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx+") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "fx+") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "fx+")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx+")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854849"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854849":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx+"
# string literal
    jmp _L_854851
    .align 8,0x90
_L_854850 :
    .int 12
    .ascii "fx+"
_L_854851:
    movl $_L_854850, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx+
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854852
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854852:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854853"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854853:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854855
    cmp  $0,%eax
    jge _L_854854
_L_854855:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854854:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854856
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854856:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854857"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854857:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854859
    cmp  $0,%eax
    jge _L_854858
_L_854859:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854858:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "fx>=") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "fx>=")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx>=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854860"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854860":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx>="
# string literal
    jmp _L_854862
    .align 8,0x90
_L_854861 :
    .int 16
    .ascii "fx>="
_L_854862:
    movl $_L_854861, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx>=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854863
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854863:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854864"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854864:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854866
    cmp  $0,%eax
    jge _L_854865
_L_854866:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854865:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854867
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854867:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854868"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854868:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854870
    cmp  $0,%eax
    jge _L_854869
_L_854870:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854869:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx>") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "fx>") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "fx>")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx>")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854871"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854871":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx>"
# string literal
    jmp _L_854873
    .align 8,0x90
_L_854872 :
    .int 12
    .ascii "fx>"
_L_854873:
    movl $_L_854872, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx>
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854874
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854874:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854875"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854875:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854877
    cmp  $0,%eax
    jge _L_854876
_L_854877:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854876:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854878
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854878:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854879"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854879:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854881
    cmp  $0,%eax
    jge _L_854880
_L_854881:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854880:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "fx<=") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "fx<=")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx<=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854882"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854882":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx<="
# string literal
    jmp _L_854884
    .align 8,0x90
_L_854883 :
    .int 16
    .ascii "fx<="
_L_854884:
    movl $_L_854883, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx<=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854885
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854885:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854886"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854886:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854888
    cmp  $0,%eax
    jge _L_854887
_L_854888:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854887:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854889
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854889:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854890"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854890:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854892
    cmp  $0,%eax
    jge _L_854891
_L_854892:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854891:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx<") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "fx<") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "fx<")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx<")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854893"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854893":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx<"
# string literal
    jmp _L_854895
    .align 8,0x90
_L_854894 :
    .int 12
    .ascii "fx<"
_L_854895:
    movl $_L_854894, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx<
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854896
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854896:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854897"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854897:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854899
    cmp  $0,%eax
    jge _L_854898
_L_854899:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854898:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854900
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854900:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854901"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854901:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854903
    cmp  $0,%eax
    jge _L_854902
_L_854903:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854902:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx=") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "fx=") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "fx=")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854904"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854904":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx="
# string literal
    jmp _L_854906
    .align 8,0x90
_L_854905 :
    .int 12
    .ascii "fx="
_L_854906:
    movl $_L_854905, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854907
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854907:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854908"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854908:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854910
    cmp  $0,%eax
    jge _L_854909
_L_854910:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854909:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854911
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854911:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854912"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854912:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854914
    cmp  $0,%eax
    jge _L_854913
_L_854914:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854913:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "fxzero?") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "fxzero?")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxzero?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854915"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854915":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxzero?"
# string literal
    jmp _L_854917
    .align 8,0x90
_L_854916 :
    .int 28
    .ascii "fxzero?"
_L_854917:
    movl $_L_854916, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxzero?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854918
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854918:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854919"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854919:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854921
    cmp  $0,%eax
    jge _L_854920
_L_854921:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854920:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854922
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854922:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854923"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854923:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854925
    cmp  $0,%eax
    jge _L_854924
_L_854925:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854924:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "fxsub1") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "fxsub1")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxsub1")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854926"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854926":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxsub1"
# string literal
    jmp _L_854928
    .align 8,0x90
_L_854927 :
    .int 24
    .ascii "fxsub1"
_L_854928:
    movl $_L_854927, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxsub1
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854929
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854929:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854930"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854930:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854932
    cmp  $0,%eax
    jge _L_854931
_L_854932:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854931:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854933
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854933:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854934"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854934:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854936
    cmp  $0,%eax
    jge _L_854935
_L_854936:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854935:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "fxadd1") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "fxadd1")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxadd1")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854937"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854937":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxadd1"
# string literal
    jmp _L_854939
    .align 8,0x90
_L_854938 :
    .int 24
    .ascii "fxadd1"
_L_854939:
    movl $_L_854938, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxadd1
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854940
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854940:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854941"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854941:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854943
    cmp  $0,%eax
    jge _L_854942
_L_854943:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854942:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854944
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854944:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854945"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854945:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854947
    cmp  $0,%eax
    jge _L_854946
_L_854947:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854946:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "fxlogor") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "fxlogor")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlogor")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854948"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854948":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlogor"
# string literal
    jmp _L_854950
    .align 8,0x90
_L_854949 :
    .int 28
    .ascii "fxlogor"
_L_854950:
    movl $_L_854949, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlogor
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854951
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854951:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854952"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854952:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854954
    cmp  $0,%eax
    jge _L_854953
_L_854954:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854953:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854955
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854955:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854956"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854956:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854958
    cmp  $0,%eax
    jge _L_854957
_L_854958:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854957:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "fxlogand") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "fxlogand")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlogand")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854959"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854959":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlogand"
# string literal
    jmp _L_854961
    .align 8,0x90
_L_854960 :
    .int 32
    .ascii "fxlogand"
_L_854961:
    movl $_L_854960, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlogand
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854962
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854962:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854963"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854963:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854965
    cmp  $0,%eax
    jge _L_854964
_L_854965:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854964:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854966
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854966:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854967"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854967:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854969
    cmp  $0,%eax
    jge _L_854968
_L_854969:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854968:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "fxlognot") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "fxlognot")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlognot")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854970"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854970":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlognot"
# string literal
    jmp _L_854972
    .align 8,0x90
_L_854971 :
    .int 32
    .ascii "fxlognot"
_L_854972:
    movl $_L_854971, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlognot
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854973
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854973:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854974"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854974:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854976
    cmp  $0,%eax
    jge _L_854975
_L_854976:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854975:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854977
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854977:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854978"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854978:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854980
    cmp  $0,%eax
    jge _L_854979
_L_854980:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854979:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char=?") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "char=?") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "char=?")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "char=?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854981"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854981":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char=?"
# string literal
    jmp _L_854983
    .align 8,0x90
_L_854982 :
    .int 24
    .ascii "char=?"
_L_854983:
    movl $_L_854982, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char=?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854984
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854984:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854985"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854985:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854987
    cmp  $0,%eax
    jge _L_854986
_L_854987:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854986:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854988
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854988:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854989"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854989:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854991
    cmp  $0,%eax
    jge _L_854990
_L_854991:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854990:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "eq?") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "eq?") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "eq?")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "eq?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_854992"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_854992":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "eq?"
# string literal
    jmp _L_854994
    .align 8,0x90
_L_854993 :
    .int 12
    .ascii "eq?"
_L_854994:
    movl $_L_854993, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg eq?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854995
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854995:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_854996"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854996:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_854998
    cmp  $0,%eax
    jge _L_854997
_L_854998:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_854997:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_854999
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_854999:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_855000"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_855000:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_855002
    cmp  $0,%eax
    jge _L_855001
_L_855002:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_855001:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "not") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "not") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "not")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "not")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_855003"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_855003":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "not"
# string literal
    jmp _L_855005
    .align 8,0x90
_L_855004 :
    .int 12
    .ascii "not"
_L_855005:
    movl $_L_855004, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg not
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_855006
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_855006:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_855007"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_855007:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_855009
    cmp  $0,%eax
    jge _L_855008
_L_855009:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_855008:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_855010
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_855010:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_855011"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_855011:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_855013
    cmp  $0,%eax
    jge _L_855012
_L_855013:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_855012:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "boolean?") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "boolean?")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "boolean?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_855014"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_855014":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "boolean?"
# string literal
    jmp _L_855016
    .align 8,0x90
_L_855015 :
    .int 32
    .ascii "boolean?"
_L_855016:
    movl $_L_855015, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg boolean?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_855017
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_855017:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_855018"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_855018:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_855020
    cmp  $0,%eax
    jge _L_855019
_L_855020:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_855019:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_855021
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_855021:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_855022"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_855022:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_855024
    cmp  $0,%eax
    jge _L_855023
_L_855024:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_855023:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "fixnum?") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "fixnum?")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fixnum?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_855025"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_855025":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fixnum?"
# string literal
    jmp _L_855027
    .align 8,0x90
_L_855026 :
    .int 28
    .ascii "fixnum?"
_L_855027:
    movl $_L_855026, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fixnum?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_855028
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_855028:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_855029"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_855029:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_855031
    cmp  $0,%eax
    jge _L_855030
_L_855031:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_855030:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_855032
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_855032:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_855033"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_855033:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_855035
    cmp  $0,%eax
    jge _L_855034
_L_855035:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_855034:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char?") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "char?") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "char?")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "char?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_855036"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_855036":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char?"
# string literal
    jmp _L_855038
    .align 8,0x90
_L_855037 :
    .int 20
    .ascii "char?"
_L_855038:
    movl $_L_855037, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_855039
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_855039:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_855040"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_855040:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_855042
    cmp  $0,%eax
    jge _L_855041
_L_855042:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_855041:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_855043
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_855043:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_855044"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_855044:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_855046
    cmp  $0,%eax
    jge _L_855045
_L_855046:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_855045:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "null?") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "null?") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "null?")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "null?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_855047"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_855047":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "null?"
# string literal
    jmp _L_855049
    .align 8,0x90
_L_855048 :
    .int 20
    .ascii "null?"
_L_855049:
    movl $_L_855048, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg null?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_855050
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_855050:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_855051"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_855051:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_855053
    cmp  $0,%eax
    jge _L_855052
_L_855053:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_855052:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))) (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_855054
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_855054:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_855055"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_855055:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_855057
    cmp  $0,%eax
    jge _L_855056
_L_855057:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_855056:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "char->fixnum") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "char->fixnum")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "char->fixnum")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_855058"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_855058":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char->fixnum"
# string literal
    jmp _L_855060
    .align 8,0x90
_L_855059 :
    .int 48
    .ascii "char->fixnum"
_L_855060:
    movl $_L_855059, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char->fixnum
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_855061
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_855061:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_855062"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_855062:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_855064
    cmp  $0,%eax
    jge _L_855063
_L_855064:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_855063:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))) (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (vector-set! f105702 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0)))
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_855065
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_855065:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_855066"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_855066:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_855068
    cmp  $0,%eax
    jge _L_855067
_L_855068:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_855067:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f105702 0))
# cons arg1=((primitive-ref string->symbol) "fixnum->char") arg2=(vector-ref f105702 0)
# emit-expr ((primitive-ref string->symbol) "fixnum->char")
# funcall
#    si   =-12
#    env  = ((f105702 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fixnum->char")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_855069"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_855069":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fixnum->char"
# string literal
    jmp _L_855071
    .align 8,0x90
_L_855070 :
    .int 48
    .ascii "fixnum->char"
_L_855071:
    movl $_L_855070, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fixnum->char
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f105702 0)
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_855072
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_855072:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_855073"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_855073:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_855075
    cmp  $0,%eax
    jge _L_855074
_L_855075:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_855074:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (closure () (f105702) (let () (vector-ref f105702 0))))
# emit-begin
#   expr=(begin (closure () (f105702) (let () (vector-ref f105702 0))))
#   env=((f105702 . 0))
# emit-expr (closure () (f105702) (let () (vector-ref f105702 0)))
# emit-closure
# si = -4
# env = ((f105702 . 0))
# expr = (closure () (f105702) (let () (vector-ref f105702 0)))
    movl $_L_855076, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f105702 . 0))
# var=f105702
    movl 0(%esp), %eax  # stack load f105702
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f105702
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_855077            # jump around closure body
_L_855076:
# check argument count
    cmp $0,%eax
    je _L_855078
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_855078:
# emit-tail-expr
# si=-8
# env=((f105702 . 4) (f105702 . 0))
# expr=(let () (vector-ref f105702 0))
# emit-tail-let
#  si   = -8
#  env  = ((f105702 . 4) (f105702 . 0))
#  bindings = ()
#  body = (vector-ref f105702 0)
# emit-tail-expr
# si=-8
# env=((f105702 . 4) (f105702 . 0))
# expr=(vector-ref f105702 0)
# tail primcall
# emit-expr f105702
# emit-variable-ref
# env=((f105702 . 4) (f105702 . 0))
# var=f105702
    movl 2(%edi), %eax  # frame load f105702
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_855079
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_855079:
    movl %eax, -8(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_855080"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_855080:
# check bounds on vector index
    movl -8(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_855082
    cmp  $0,%eax
    jge _L_855081
_L_855082:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_855081:
    movl -8(%esp), %esi
    movl -1(%eax,%esi), %eax
#return from tail (vector-ref f105702 0)
    ret
    .align 4,0x90
_L_855077:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f105702 . 0))
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
    movl $_L_855083, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_855084            # jump around closure body
_L_855083:
# check argument count
    cmp $0,%eax
    je _L_855085
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_855085:
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
    je "_L_855086"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_855086":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_855088
    .align 8,0x90
_L_855087 :
    .int 28
    .ascii "funcall"
_L_855088:
    movl $_L_855087, %eax
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
    jmp _L_855090
    .align 8,0x90
_L_855089 :
    .int 100
    .ascii "arg 1 must be a procedure"
_L_855090:
    movl $_L_855089, %eax
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
_L_855084:
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
    movl $_L_855091, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_855092            # jump around closure body
_L_855091:
# check argument count
    cmp $0,%eax
    je _L_855093
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_855093:
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
    je "_L_855094"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_855094":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_855096
    .align 8,0x90
_L_855095 :
    .int 28
    .ascii "funcall"
_L_855096:
    movl $_L_855095, %eax
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
    jmp _L_855098
    .align 8,0x90
_L_855097 :
    .int 80
    .ascii "wrong number of args"
_L_855098:
    movl $_L_855097, %eax
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
_L_855092:
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
    movl $_L_855099, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_855100            # jump around closure body
_L_855099:
# check argument count
    cmp $0,%eax
    je _L_855101
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_855101:
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
    je "_L_855102"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_855102":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_855104
    .align 8,0x90
_L_855103 :
    .int 28
    .ascii "funcall"
_L_855104:
    movl $_L_855103, %eax
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
    jmp _L_855106
    .align 8,0x90
_L_855105 :
    .int 48
    .ascii "too few args"
_L_855106:
    movl $_L_855105, %eax
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
_L_855100:
     movl %eax, eh$uargcount$umin
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a fixnum"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a fixnum"))
# == uniquify-variables  ==>
# (lambda (f105703) (error (list-ref (primitives) f105703) "arg must be a fixnum"))
# == vectorize-letrec  ==>
# (lambda (f105703) (error (list-ref (primitives) f105703) "arg must be a fixnum"))
# == eliminate-set!  ==>
# (lambda (f105703) (let ((f105703 f105703)) (error (list-ref (primitives) f105703) "arg must be a fixnum")))
# == close-free-variables  ==>
# (closure (f105703) (error list-ref primitives) (let ((f105703 f105703)) (error (list-ref (primitives) f105703) "arg must be a fixnum")))
# == eliminate-quote  ==>
# (closure (f105703) (error list-ref primitives) (let ((f105703 f105703)) (error (list-ref (primitives) f105703) "arg must be a fixnum")))
# == eliminate-when/unless  ==>
# (closure (f105703) (error list-ref primitives) (let ((f105703 f105703)) (error (list-ref (primitives) f105703) "arg must be a fixnum")))
# == eliminate-cond  ==>
# (closure (f105703) (error list-ref primitives) (let ((f105703 f105703)) (error (list-ref (primitives) f105703) "arg must be a fixnum")))
# == external-symbols  ==>
# (closure (f105703) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f105703 f105703)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105703) "arg must be a fixnum")))
# emit-expr (closure (f105703) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f105703 f105703)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105703) "arg must be a fixnum")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f105703) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f105703 f105703)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105703) "arg must be a fixnum")))
    movl $_L_855107, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_855108            # jump around closure body
_L_855107:
# check argument count
    cmp $4,%eax
    je _L_855109
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_855109:
# emit-tail-expr
# si=-12
# env=((f105703 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f105703 f105703)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105703) "arg must be a fixnum"))
# emit-tail-let
#  si   = -12
#  env  = ((f105703 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f105703 f105703))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105703) "arg must be a fixnum")
# emit-expr f105703
# emit-variable-ref
# env=((f105703 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f105703
    movl -8(%esp), %eax  # stack load f105703
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f105703 . -12) (f105703 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105703) "arg must be a fixnum")
# emit-tail-funcall
#    si   =-16
#    env  = ((f105703 . -12) (f105703 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105703) "arg must be a fixnum")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f105703)
# funcall
#    si   =-20
#    env  = ((f105703 . -12) (f105703 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f105703)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_855110"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_855110":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f105703 . -12) (f105703 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_855111"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_855111":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f105703
# emit-variable-ref
# env=((f105703 . -12) (f105703 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f105703
    movl -12(%esp), %eax  # stack load f105703
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f105703
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f105703)
# emit-expr "arg must be a fixnum"
# string literal
    jmp _L_855113
    .align 8,0x90
_L_855112 :
    .int 80
    .ascii "arg must be a fixnum"
_L_855113:
    movl $_L_855112, %eax
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
_L_855108:
     movl %eax, eh$ufixnum
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a string"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a string"))
# == uniquify-variables  ==>
# (lambda (f105704) (error (list-ref (primitives) f105704) "arg must be a string"))
# == vectorize-letrec  ==>
# (lambda (f105704) (error (list-ref (primitives) f105704) "arg must be a string"))
# == eliminate-set!  ==>
# (lambda (f105704) (let ((f105704 f105704)) (error (list-ref (primitives) f105704) "arg must be a string")))
# == close-free-variables  ==>
# (closure (f105704) (error list-ref primitives) (let ((f105704 f105704)) (error (list-ref (primitives) f105704) "arg must be a string")))
# == eliminate-quote  ==>
# (closure (f105704) (error list-ref primitives) (let ((f105704 f105704)) (error (list-ref (primitives) f105704) "arg must be a string")))
# == eliminate-when/unless  ==>
# (closure (f105704) (error list-ref primitives) (let ((f105704 f105704)) (error (list-ref (primitives) f105704) "arg must be a string")))
# == eliminate-cond  ==>
# (closure (f105704) (error list-ref primitives) (let ((f105704 f105704)) (error (list-ref (primitives) f105704) "arg must be a string")))
# == external-symbols  ==>
# (closure (f105704) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f105704 f105704)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105704) "arg must be a string")))
# emit-expr (closure (f105704) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f105704 f105704)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105704) "arg must be a string")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f105704) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f105704 f105704)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105704) "arg must be a string")))
    movl $_L_855114, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_855115            # jump around closure body
_L_855114:
# check argument count
    cmp $4,%eax
    je _L_855116
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_855116:
# emit-tail-expr
# si=-12
# env=((f105704 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f105704 f105704)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105704) "arg must be a string"))
# emit-tail-let
#  si   = -12
#  env  = ((f105704 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f105704 f105704))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105704) "arg must be a string")
# emit-expr f105704
# emit-variable-ref
# env=((f105704 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f105704
    movl -8(%esp), %eax  # stack load f105704
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f105704 . -12) (f105704 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105704) "arg must be a string")
# emit-tail-funcall
#    si   =-16
#    env  = ((f105704 . -12) (f105704 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105704) "arg must be a string")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f105704)
# funcall
#    si   =-20
#    env  = ((f105704 . -12) (f105704 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f105704)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_855117"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_855117":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f105704 . -12) (f105704 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_855118"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_855118":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f105704
# emit-variable-ref
# env=((f105704 . -12) (f105704 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f105704
    movl -12(%esp), %eax  # stack load f105704
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f105704
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f105704)
# emit-expr "arg must be a string"
# string literal
    jmp _L_855120
    .align 8,0x90
_L_855119 :
    .int 80
    .ascii "arg must be a string"
_L_855120:
    movl $_L_855119, %eax
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
_L_855115:
     movl %eax, eh$ustring
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a character"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a character"))
# == uniquify-variables  ==>
# (lambda (f105705) (error (list-ref (primitives) f105705) "arg must be a character"))
# == vectorize-letrec  ==>
# (lambda (f105705) (error (list-ref (primitives) f105705) "arg must be a character"))
# == eliminate-set!  ==>
# (lambda (f105705) (let ((f105705 f105705)) (error (list-ref (primitives) f105705) "arg must be a character")))
# == close-free-variables  ==>
# (closure (f105705) (error list-ref primitives) (let ((f105705 f105705)) (error (list-ref (primitives) f105705) "arg must be a character")))
# == eliminate-quote  ==>
# (closure (f105705) (error list-ref primitives) (let ((f105705 f105705)) (error (list-ref (primitives) f105705) "arg must be a character")))
# == eliminate-when/unless  ==>
# (closure (f105705) (error list-ref primitives) (let ((f105705 f105705)) (error (list-ref (primitives) f105705) "arg must be a character")))
# == eliminate-cond  ==>
# (closure (f105705) (error list-ref primitives) (let ((f105705 f105705)) (error (list-ref (primitives) f105705) "arg must be a character")))
# == external-symbols  ==>
# (closure (f105705) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f105705 f105705)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105705) "arg must be a character")))
# emit-expr (closure (f105705) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f105705 f105705)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105705) "arg must be a character")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f105705) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f105705 f105705)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105705) "arg must be a character")))
    movl $_L_855121, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_855122            # jump around closure body
_L_855121:
# check argument count
    cmp $4,%eax
    je _L_855123
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_855123:
# emit-tail-expr
# si=-12
# env=((f105705 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f105705 f105705)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105705) "arg must be a character"))
# emit-tail-let
#  si   = -12
#  env  = ((f105705 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f105705 f105705))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105705) "arg must be a character")
# emit-expr f105705
# emit-variable-ref
# env=((f105705 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f105705
    movl -8(%esp), %eax  # stack load f105705
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f105705 . -12) (f105705 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105705) "arg must be a character")
# emit-tail-funcall
#    si   =-16
#    env  = ((f105705 . -12) (f105705 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105705) "arg must be a character")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f105705)
# funcall
#    si   =-20
#    env  = ((f105705 . -12) (f105705 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f105705)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_855124"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_855124":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f105705 . -12) (f105705 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_855125"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_855125":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f105705
# emit-variable-ref
# env=((f105705 . -12) (f105705 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f105705
    movl -12(%esp), %eax  # stack load f105705
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f105705
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f105705)
# emit-expr "arg must be a character"
# string literal
    jmp _L_855127
    .align 8,0x90
_L_855126 :
    .int 92
    .ascii "arg must be a character"
_L_855127:
    movl $_L_855126, %eax
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
_L_855122:
     movl %eax, eh$ucharacter
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a pair"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a pair"))
# == uniquify-variables  ==>
# (lambda (f105706) (error (list-ref (primitives) f105706) "arg must be a pair"))
# == vectorize-letrec  ==>
# (lambda (f105706) (error (list-ref (primitives) f105706) "arg must be a pair"))
# == eliminate-set!  ==>
# (lambda (f105706) (let ((f105706 f105706)) (error (list-ref (primitives) f105706) "arg must be a pair")))
# == close-free-variables  ==>
# (closure (f105706) (error list-ref primitives) (let ((f105706 f105706)) (error (list-ref (primitives) f105706) "arg must be a pair")))
# == eliminate-quote  ==>
# (closure (f105706) (error list-ref primitives) (let ((f105706 f105706)) (error (list-ref (primitives) f105706) "arg must be a pair")))
# == eliminate-when/unless  ==>
# (closure (f105706) (error list-ref primitives) (let ((f105706 f105706)) (error (list-ref (primitives) f105706) "arg must be a pair")))
# == eliminate-cond  ==>
# (closure (f105706) (error list-ref primitives) (let ((f105706 f105706)) (error (list-ref (primitives) f105706) "arg must be a pair")))
# == external-symbols  ==>
# (closure (f105706) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f105706 f105706)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105706) "arg must be a pair")))
# emit-expr (closure (f105706) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f105706 f105706)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105706) "arg must be a pair")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f105706) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f105706 f105706)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105706) "arg must be a pair")))
    movl $_L_855128, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_855129            # jump around closure body
_L_855128:
# check argument count
    cmp $4,%eax
    je _L_855130
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_855130:
# emit-tail-expr
# si=-12
# env=((f105706 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f105706 f105706)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105706) "arg must be a pair"))
# emit-tail-let
#  si   = -12
#  env  = ((f105706 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f105706 f105706))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105706) "arg must be a pair")
# emit-expr f105706
# emit-variable-ref
# env=((f105706 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f105706
    movl -8(%esp), %eax  # stack load f105706
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f105706 . -12) (f105706 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105706) "arg must be a pair")
# emit-tail-funcall
#    si   =-16
#    env  = ((f105706 . -12) (f105706 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105706) "arg must be a pair")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f105706)
# funcall
#    si   =-20
#    env  = ((f105706 . -12) (f105706 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f105706)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_855131"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_855131":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f105706 . -12) (f105706 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_855132"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_855132":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f105706
# emit-variable-ref
# env=((f105706 . -12) (f105706 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f105706
    movl -12(%esp), %eax  # stack load f105706
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f105706
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f105706)
# emit-expr "arg must be a pair"
# string literal
    jmp _L_855134
    .align 8,0x90
_L_855133 :
    .int 72
    .ascii "arg must be a pair"
_L_855134:
    movl $_L_855133, %eax
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
_L_855129:
     movl %eax, eh$upair
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a vector"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a vector"))
# == uniquify-variables  ==>
# (lambda (f105707) (error (list-ref (primitives) f105707) "arg must be a vector"))
# == vectorize-letrec  ==>
# (lambda (f105707) (error (list-ref (primitives) f105707) "arg must be a vector"))
# == eliminate-set!  ==>
# (lambda (f105707) (let ((f105707 f105707)) (error (list-ref (primitives) f105707) "arg must be a vector")))
# == close-free-variables  ==>
# (closure (f105707) (error list-ref primitives) (let ((f105707 f105707)) (error (list-ref (primitives) f105707) "arg must be a vector")))
# == eliminate-quote  ==>
# (closure (f105707) (error list-ref primitives) (let ((f105707 f105707)) (error (list-ref (primitives) f105707) "arg must be a vector")))
# == eliminate-when/unless  ==>
# (closure (f105707) (error list-ref primitives) (let ((f105707 f105707)) (error (list-ref (primitives) f105707) "arg must be a vector")))
# == eliminate-cond  ==>
# (closure (f105707) (error list-ref primitives) (let ((f105707 f105707)) (error (list-ref (primitives) f105707) "arg must be a vector")))
# == external-symbols  ==>
# (closure (f105707) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f105707 f105707)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105707) "arg must be a vector")))
# emit-expr (closure (f105707) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f105707 f105707)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105707) "arg must be a vector")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f105707) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f105707 f105707)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105707) "arg must be a vector")))
    movl $_L_855135, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_855136            # jump around closure body
_L_855135:
# check argument count
    cmp $4,%eax
    je _L_855137
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_855137:
# emit-tail-expr
# si=-12
# env=((f105707 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f105707 f105707)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105707) "arg must be a vector"))
# emit-tail-let
#  si   = -12
#  env  = ((f105707 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f105707 f105707))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105707) "arg must be a vector")
# emit-expr f105707
# emit-variable-ref
# env=((f105707 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f105707
    movl -8(%esp), %eax  # stack load f105707
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f105707 . -12) (f105707 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105707) "arg must be a vector")
# emit-tail-funcall
#    si   =-16
#    env  = ((f105707 . -12) (f105707 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105707) "arg must be a vector")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f105707)
# funcall
#    si   =-20
#    env  = ((f105707 . -12) (f105707 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f105707)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_855138"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_855138":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f105707 . -12) (f105707 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_855139"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_855139":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f105707
# emit-variable-ref
# env=((f105707 . -12) (f105707 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f105707
    movl -12(%esp), %eax  # stack load f105707
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f105707
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f105707)
# emit-expr "arg must be a vector"
# string literal
    jmp _L_855141
    .align 8,0x90
_L_855140 :
    .int 80
    .ascii "arg must be a vector"
_L_855141:
    movl $_L_855140, %eax
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
_L_855136:
     movl %eax, eh$uvector
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "length must be a fixnum >= 0"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "length must be a fixnum >= 0"))
# == uniquify-variables  ==>
# (lambda (f105708) (error (list-ref (primitives) f105708) "length must be a fixnum >= 0"))
# == vectorize-letrec  ==>
# (lambda (f105708) (error (list-ref (primitives) f105708) "length must be a fixnum >= 0"))
# == eliminate-set!  ==>
# (lambda (f105708) (let ((f105708 f105708)) (error (list-ref (primitives) f105708) "length must be a fixnum >= 0")))
# == close-free-variables  ==>
# (closure (f105708) (error list-ref primitives) (let ((f105708 f105708)) (error (list-ref (primitives) f105708) "length must be a fixnum >= 0")))
# == eliminate-quote  ==>
# (closure (f105708) (error list-ref primitives) (let ((f105708 f105708)) (error (list-ref (primitives) f105708) "length must be a fixnum >= 0")))
# == eliminate-when/unless  ==>
# (closure (f105708) (error list-ref primitives) (let ((f105708 f105708)) (error (list-ref (primitives) f105708) "length must be a fixnum >= 0")))
# == eliminate-cond  ==>
# (closure (f105708) (error list-ref primitives) (let ((f105708 f105708)) (error (list-ref (primitives) f105708) "length must be a fixnum >= 0")))
# == external-symbols  ==>
# (closure (f105708) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f105708 f105708)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105708) "length must be a fixnum >= 0")))
# emit-expr (closure (f105708) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f105708 f105708)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105708) "length must be a fixnum >= 0")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f105708) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f105708 f105708)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105708) "length must be a fixnum >= 0")))
    movl $_L_855142, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_855143            # jump around closure body
_L_855142:
# check argument count
    cmp $4,%eax
    je _L_855144
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_855144:
# emit-tail-expr
# si=-12
# env=((f105708 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f105708 f105708)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105708) "length must be a fixnum >= 0"))
# emit-tail-let
#  si   = -12
#  env  = ((f105708 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f105708 f105708))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105708) "length must be a fixnum >= 0")
# emit-expr f105708
# emit-variable-ref
# env=((f105708 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f105708
    movl -8(%esp), %eax  # stack load f105708
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f105708 . -12) (f105708 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105708) "length must be a fixnum >= 0")
# emit-tail-funcall
#    si   =-16
#    env  = ((f105708 . -12) (f105708 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105708) "length must be a fixnum >= 0")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f105708)
# funcall
#    si   =-20
#    env  = ((f105708 . -12) (f105708 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f105708)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_855145"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_855145":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f105708 . -12) (f105708 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_855146"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_855146":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f105708
# emit-variable-ref
# env=((f105708 . -12) (f105708 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f105708
    movl -12(%esp), %eax  # stack load f105708
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f105708
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f105708)
# emit-expr "length must be a fixnum >= 0"
# string literal
    jmp _L_855148
    .align 8,0x90
_L_855147 :
    .int 112
    .ascii "length must be a fixnum >= 0"
_L_855148:
    movl $_L_855147, %eax
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
_L_855143:
     movl %eax, eh$ulength
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == uniquify-variables  ==>
# (lambda (f105709) (error (list-ref (primitives) f105709) "index out of bounds"))
# == vectorize-letrec  ==>
# (lambda (f105709) (error (list-ref (primitives) f105709) "index out of bounds"))
# == eliminate-set!  ==>
# (lambda (f105709) (let ((f105709 f105709)) (error (list-ref (primitives) f105709) "index out of bounds")))
# == close-free-variables  ==>
# (closure (f105709) (error list-ref primitives) (let ((f105709 f105709)) (error (list-ref (primitives) f105709) "index out of bounds")))
# == eliminate-quote  ==>
# (closure (f105709) (error list-ref primitives) (let ((f105709 f105709)) (error (list-ref (primitives) f105709) "index out of bounds")))
# == eliminate-when/unless  ==>
# (closure (f105709) (error list-ref primitives) (let ((f105709 f105709)) (error (list-ref (primitives) f105709) "index out of bounds")))
# == eliminate-cond  ==>
# (closure (f105709) (error list-ref primitives) (let ((f105709 f105709)) (error (list-ref (primitives) f105709) "index out of bounds")))
# == external-symbols  ==>
# (closure (f105709) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f105709 f105709)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105709) "index out of bounds")))
# emit-expr (closure (f105709) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f105709 f105709)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105709) "index out of bounds")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f105709) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f105709 f105709)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105709) "index out of bounds")))
    movl $_L_855149, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_855150            # jump around closure body
_L_855149:
# check argument count
    cmp $4,%eax
    je _L_855151
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_855151:
# emit-tail-expr
# si=-12
# env=((f105709 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f105709 f105709)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105709) "index out of bounds"))
# emit-tail-let
#  si   = -12
#  env  = ((f105709 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f105709 f105709))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105709) "index out of bounds")
# emit-expr f105709
# emit-variable-ref
# env=((f105709 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f105709
    movl -8(%esp), %eax  # stack load f105709
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f105709 . -12) (f105709 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105709) "index out of bounds")
# emit-tail-funcall
#    si   =-16
#    env  = ((f105709 . -12) (f105709 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105709) "index out of bounds")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f105709)
# funcall
#    si   =-20
#    env  = ((f105709 . -12) (f105709 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f105709)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_855152"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_855152":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f105709 . -12) (f105709 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_855153"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_855153":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f105709
# emit-variable-ref
# env=((f105709 . -12) (f105709 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f105709
    movl -12(%esp), %eax  # stack load f105709
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f105709
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f105709)
# emit-expr "index out of bounds"
# string literal
    jmp _L_855155
    .align 8,0x90
_L_855154 :
    .int 76
    .ascii "index out of bounds"
_L_855155:
    movl $_L_855154, %eax
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
_L_855150:
     movl %eax, eh$uvector$uindex
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == uniquify-variables  ==>
# (lambda (f105710) (error (list-ref (primitives) f105710) "index out of bounds"))
# == vectorize-letrec  ==>
# (lambda (f105710) (error (list-ref (primitives) f105710) "index out of bounds"))
# == eliminate-set!  ==>
# (lambda (f105710) (let ((f105710 f105710)) (error (list-ref (primitives) f105710) "index out of bounds")))
# == close-free-variables  ==>
# (closure (f105710) (error list-ref primitives) (let ((f105710 f105710)) (error (list-ref (primitives) f105710) "index out of bounds")))
# == eliminate-quote  ==>
# (closure (f105710) (error list-ref primitives) (let ((f105710 f105710)) (error (list-ref (primitives) f105710) "index out of bounds")))
# == eliminate-when/unless  ==>
# (closure (f105710) (error list-ref primitives) (let ((f105710 f105710)) (error (list-ref (primitives) f105710) "index out of bounds")))
# == eliminate-cond  ==>
# (closure (f105710) (error list-ref primitives) (let ((f105710 f105710)) (error (list-ref (primitives) f105710) "index out of bounds")))
# == external-symbols  ==>
# (closure (f105710) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f105710 f105710)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105710) "index out of bounds")))
# emit-expr (closure (f105710) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f105710 f105710)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105710) "index out of bounds")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f105710) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f105710 f105710)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105710) "index out of bounds")))
    movl $_L_855156, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_855157            # jump around closure body
_L_855156:
# check argument count
    cmp $4,%eax
    je _L_855158
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_855158:
# emit-tail-expr
# si=-12
# env=((f105710 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f105710 f105710)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105710) "index out of bounds"))
# emit-tail-let
#  si   = -12
#  env  = ((f105710 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f105710 f105710))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105710) "index out of bounds")
# emit-expr f105710
# emit-variable-ref
# env=((f105710 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f105710
    movl -8(%esp), %eax  # stack load f105710
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f105710 . -12) (f105710 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105710) "index out of bounds")
# emit-tail-funcall
#    si   =-16
#    env  = ((f105710 . -12) (f105710 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f105710) "index out of bounds")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f105710)
# funcall
#    si   =-20
#    env  = ((f105710 . -12) (f105710 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f105710)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_855159"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_855159":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f105710 . -12) (f105710 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_855160"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_855160":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f105710
# emit-variable-ref
# env=((f105710 . -12) (f105710 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f105710
    movl -12(%esp), %eax  # stack load f105710
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f105710
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f105710)
# emit-expr "index out of bounds"
# string literal
    jmp _L_855162
    .align 8,0x90
_L_855161 :
    .int 76
    .ascii "index out of bounds"
_L_855162:
    movl $_L_855161, %eax
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
_L_855157:
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
