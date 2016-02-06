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
# (let ((f84772 (cons (make-symbol "nil" ()) ()))) (lambda () f84772))
# == vectorize-letrec  ==>
# (let ((f84772 (cons (make-symbol "nil" ()) ()))) (lambda () f84772))
# == eliminate-set!  ==>
# (let ((f84772 (cons (make-symbol "nil" ()) ()))) (lambda () (let () f84772)))
# == close-free-variables  ==>
# (let ((f84772 (cons (make-symbol "nil" ()) ()))) (closure () (f84772) (let () f84772)))
# == eliminate-quote  ==>
# (let ((f84772 (cons (make-symbol "nil" ()) ()))) (closure () (f84772) (let () f84772)))
# == eliminate-when/unless  ==>
# (let ((f84772 (cons (make-symbol "nil" ()) ()))) (closure () (f84772) (let () f84772)))
# == eliminate-cond  ==>
# (let ((f84772 (cons (make-symbol "nil" ()) ()))) (closure () (f84772) (let () f84772)))
# == external-symbols  ==>
# (let ((f84772 (cons (make-symbol "nil" ()) ()))) (closure () (f84772) (let () f84772)))
# emit-expr (let ((f84772 (cons (make-symbol "nil" ()) ()))) (closure () (f84772) (let () f84772)))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f84772 (cons (make-symbol "nil" ()) ())))
#  body = (closure () (f84772) (let () f84772))
# emit-expr (cons (make-symbol "nil" ()) ())
# cons arg1=(make-symbol "nil" ()) arg2=()
# emit-expr (make-symbol "nil" ())
# make-symbol arg1="nil" arg2=()
# emit-expr "nil"
# string literal
    jmp _L_751995
    .align 8,0x90
_L_751994 :
    .int 12
    .ascii "nil"
_L_751995:
    movl $_L_751994, %eax
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
# emit-expr (closure () (f84772) (let () f84772))
# emit-closure
# si = -4
# env = ((f84772 . 0))
# expr = (closure () (f84772) (let () f84772))
    movl $_L_751996, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f84772 . 0))
# var=f84772
    movl 0(%esp), %eax  # stack load f84772
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f84772
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_751997            # jump around closure body
_L_751996:
# check argument count
    cmp $0,%eax
    je _L_751998
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_751998:
# emit-tail-expr
# si=-8
# env=((f84772 . 4) (f84772 . 0))
# expr=(let () f84772)
# emit-tail-let
#  si   = -8
#  env  = ((f84772 . 4) (f84772 . 0))
#  bindings = ()
#  body = f84772
# emit-tail-expr
# si=-8
# env=((f84772 . 4) (f84772 . 0))
# expr=f84772
# emit-tail-variable-ref
# emit-variable-ref
# env=((f84772 . 4) (f84772 . 0))
# var=f84772
    movl 2(%edi), %eax  # frame load f84772
# end emit-variable-ref
    ret
# end emit-tail-variable ref
    .align 4,0x90
_L_751997:
     movl %eax, symbols
# == explicit-begins  ==>
# (letrec ((slen= (lambda (s1 s2) (fx= (string-length s1) (string-length s2)))) (si= (lambda (s1 s2 i) (char=? (string-ref s1 i) (string-ref s2 i)))) (si<n= (lambda (s1 s2 i n) (if (fx= i n) #t (if (si= s1 s2 i) (si<n= s1 s2 (fx+ i 1) n) #f)))) (ss= (lambda (s1 s2) (if (slen= s1 s2) (si<n= s1 s2 0 (string-length s1)) #f)))) ss=)
# == eliminate-let*  ==>
# (letrec ((slen= (lambda (s1 s2) (fx= (string-length s1) (string-length s2)))) (si= (lambda (s1 s2 i) (char=? (string-ref s1 i) (string-ref s2 i)))) (si<n= (lambda (s1 s2 i n) (if (fx= i n) #t (if (si= s1 s2 i) (si<n= s1 s2 (fx+ i 1) n) #f)))) (ss= (lambda (s1 s2) (if (slen= s1 s2) (si<n= s1 s2 0 (string-length s1)) #f)))) ss=)
# == uniquify-variables  ==>
# (letrec ((f84776 (lambda (f84797 f84798) (fx= (string-length f84797) (string-length f84798)))) (f84775 (lambda (f84794 f84795 f84796) (char=? (string-ref f84794 f84796) (string-ref f84795 f84796)))) (f84774 (lambda (f84790 f84791 f84792 f84793) (if (fx= f84792 f84793) #t (if (f84775 f84790 f84791 f84792) (f84774 f84790 f84791 (fx+ f84792 1) f84793) #f)))) (f84773 (lambda (f84788 f84789) (if (f84776 f84788 f84789) (f84774 f84788 f84789 0 (string-length f84788)) #f)))) f84773)
# == vectorize-letrec  ==>
# (let ((f84776 (make-vector 1)) (f84775 (make-vector 1)) (f84774 (make-vector 1)) (f84773 (make-vector 1))) (begin (begin (vector-set! f84776 0 (lambda (f84797 f84798) (fx= (string-length f84797) (string-length f84798)))) (vector-set! f84775 0 (lambda (f84794 f84795 f84796) (char=? (string-ref f84794 f84796) (string-ref f84795 f84796)))) (vector-set! f84774 0 (lambda (f84790 f84791 f84792 f84793) (if (fx= f84792 f84793) #t (if ((vector-ref f84775 0) f84790 f84791 f84792) ((vector-ref f84774 0) f84790 f84791 (fx+ f84792 1) f84793) #f)))) (vector-set! f84773 0 (lambda (f84788 f84789) (if ((vector-ref f84776 0) f84788 f84789) ((vector-ref f84774 0) f84788 f84789 0 (string-length f84788)) #f)))) (vector-ref f84773 0)))
# == eliminate-set!  ==>
# (let ((f84776 (make-vector 1)) (f84775 (make-vector 1)) (f84774 (make-vector 1)) (f84773 (make-vector 1))) (begin (begin (vector-set! f84776 0 (lambda (f84797 f84798) (let ((f84797 f84797) (f84798 f84798)) (fx= (string-length f84797) (string-length f84798))))) (vector-set! f84775 0 (lambda (f84794 f84795 f84796) (let ((f84794 f84794) (f84795 f84795) (f84796 f84796)) (char=? (string-ref f84794 f84796) (string-ref f84795 f84796))))) (vector-set! f84774 0 (lambda (f84790 f84791 f84792 f84793) (let ((f84790 f84790) (f84791 f84791) (f84792 f84792) (f84793 f84793)) (if (fx= f84792 f84793) #t (if ((vector-ref f84775 0) f84790 f84791 f84792) ((vector-ref f84774 0) f84790 f84791 (fx+ f84792 1) f84793) #f))))) (vector-set! f84773 0 (lambda (f84788 f84789) (let ((f84788 f84788) (f84789 f84789)) (if ((vector-ref f84776 0) f84788 f84789) ((vector-ref f84774 0) f84788 f84789 0 (string-length f84788)) #f))))) (vector-ref f84773 0)))
# == close-free-variables  ==>
# (let ((f84776 (make-vector 1)) (f84775 (make-vector 1)) (f84774 (make-vector 1)) (f84773 (make-vector 1))) (begin (begin (vector-set! f84776 0 (closure (f84797 f84798) () (let ((f84797 f84797) (f84798 f84798)) (fx= (string-length f84797) (string-length f84798))))) (vector-set! f84775 0 (closure (f84794 f84795 f84796) () (let ((f84794 f84794) (f84795 f84795) (f84796 f84796)) (char=? (string-ref f84794 f84796) (string-ref f84795 f84796))))) (vector-set! f84774 0 (closure (f84790 f84791 f84792 f84793) (f84775 f84774) (let ((f84790 f84790) (f84791 f84791) (f84792 f84792) (f84793 f84793)) (if (fx= f84792 f84793) #t (if ((vector-ref f84775 0) f84790 f84791 f84792) ((vector-ref f84774 0) f84790 f84791 (fx+ f84792 1) f84793) #f))))) (vector-set! f84773 0 (closure (f84788 f84789) (f84776 f84774) (let ((f84788 f84788) (f84789 f84789)) (if ((vector-ref f84776 0) f84788 f84789) ((vector-ref f84774 0) f84788 f84789 0 (string-length f84788)) #f))))) (vector-ref f84773 0)))
# == eliminate-quote  ==>
# (let ((f84776 (make-vector 1)) (f84775 (make-vector 1)) (f84774 (make-vector 1)) (f84773 (make-vector 1))) (begin (begin (vector-set! f84776 0 (closure (f84797 f84798) () (let ((f84797 f84797) (f84798 f84798)) (fx= (string-length f84797) (string-length f84798))))) (vector-set! f84775 0 (closure (f84794 f84795 f84796) () (let ((f84794 f84794) (f84795 f84795) (f84796 f84796)) (char=? (string-ref f84794 f84796) (string-ref f84795 f84796))))) (vector-set! f84774 0 (closure (f84790 f84791 f84792 f84793) (f84775 f84774) (let ((f84790 f84790) (f84791 f84791) (f84792 f84792) (f84793 f84793)) (if (fx= f84792 f84793) #t (if ((vector-ref f84775 0) f84790 f84791 f84792) ((vector-ref f84774 0) f84790 f84791 (fx+ f84792 1) f84793) #f))))) (vector-set! f84773 0 (closure (f84788 f84789) (f84776 f84774) (let ((f84788 f84788) (f84789 f84789)) (if ((vector-ref f84776 0) f84788 f84789) ((vector-ref f84774 0) f84788 f84789 0 (string-length f84788)) #f))))) (vector-ref f84773 0)))
# == eliminate-when/unless  ==>
# (let ((f84776 (make-vector 1)) (f84775 (make-vector 1)) (f84774 (make-vector 1)) (f84773 (make-vector 1))) (begin (begin (vector-set! f84776 0 (closure (f84797 f84798) () (let ((f84797 f84797) (f84798 f84798)) (fx= (string-length f84797) (string-length f84798))))) (vector-set! f84775 0 (closure (f84794 f84795 f84796) () (let ((f84794 f84794) (f84795 f84795) (f84796 f84796)) (char=? (string-ref f84794 f84796) (string-ref f84795 f84796))))) (vector-set! f84774 0 (closure (f84790 f84791 f84792 f84793) (f84775 f84774) (let ((f84790 f84790) (f84791 f84791) (f84792 f84792) (f84793 f84793)) (if (fx= f84792 f84793) #t (if ((vector-ref f84775 0) f84790 f84791 f84792) ((vector-ref f84774 0) f84790 f84791 (fx+ f84792 1) f84793) #f))))) (vector-set! f84773 0 (closure (f84788 f84789) (f84776 f84774) (let ((f84788 f84788) (f84789 f84789)) (if ((vector-ref f84776 0) f84788 f84789) ((vector-ref f84774 0) f84788 f84789 0 (string-length f84788)) #f))))) (vector-ref f84773 0)))
# == eliminate-cond  ==>
# (let ((f84776 (make-vector 1)) (f84775 (make-vector 1)) (f84774 (make-vector 1)) (f84773 (make-vector 1))) (begin (begin (vector-set! f84776 0 (closure (f84797 f84798) () (let ((f84797 f84797) (f84798 f84798)) (fx= (string-length f84797) (string-length f84798))))) (vector-set! f84775 0 (closure (f84794 f84795 f84796) () (let ((f84794 f84794) (f84795 f84795) (f84796 f84796)) (char=? (string-ref f84794 f84796) (string-ref f84795 f84796))))) (vector-set! f84774 0 (closure (f84790 f84791 f84792 f84793) (f84775 f84774) (let ((f84790 f84790) (f84791 f84791) (f84792 f84792) (f84793 f84793)) (if (fx= f84792 f84793) #t (if ((vector-ref f84775 0) f84790 f84791 f84792) ((vector-ref f84774 0) f84790 f84791 (fx+ f84792 1) f84793) #f))))) (vector-set! f84773 0 (closure (f84788 f84789) (f84776 f84774) (let ((f84788 f84788) (f84789 f84789)) (if ((vector-ref f84776 0) f84788 f84789) ((vector-ref f84774 0) f84788 f84789 0 (string-length f84788)) #f))))) (vector-ref f84773 0)))
# == external-symbols  ==>
# (let ((f84776 (make-vector 1)) (f84775 (make-vector 1)) (f84774 (make-vector 1)) (f84773 (make-vector 1))) (begin (begin (vector-set! f84776 0 (closure (f84797 f84798) () (let ((f84797 f84797) (f84798 f84798)) (fx= (string-length f84797) (string-length f84798))))) (vector-set! f84775 0 (closure (f84794 f84795 f84796) () (let ((f84794 f84794) (f84795 f84795) (f84796 f84796)) (char=? (string-ref f84794 f84796) (string-ref f84795 f84796))))) (vector-set! f84774 0 (closure (f84790 f84791 f84792 f84793) (f84775 f84774) (let ((f84790 f84790) (f84791 f84791) (f84792 f84792) (f84793 f84793)) (if (fx= f84792 f84793) #t (if ((vector-ref f84775 0) f84790 f84791 f84792) ((vector-ref f84774 0) f84790 f84791 (fx+ f84792 1) f84793) #f))))) (vector-set! f84773 0 (closure (f84788 f84789) (f84776 f84774) (let ((f84788 f84788) (f84789 f84789)) (if ((vector-ref f84776 0) f84788 f84789) ((vector-ref f84774 0) f84788 f84789 0 (string-length f84788)) #f))))) (vector-ref f84773 0)))
# emit-expr (let ((f84776 (make-vector 1)) (f84775 (make-vector 1)) (f84774 (make-vector 1)) (f84773 (make-vector 1))) (begin (begin (vector-set! f84776 0 (closure (f84797 f84798) () (let ((f84797 f84797) (f84798 f84798)) (fx= (string-length f84797) (string-length f84798))))) (vector-set! f84775 0 (closure (f84794 f84795 f84796) () (let ((f84794 f84794) (f84795 f84795) (f84796 f84796)) (char=? (string-ref f84794 f84796) (string-ref f84795 f84796))))) (vector-set! f84774 0 (closure (f84790 f84791 f84792 f84793) (f84775 f84774) (let ((f84790 f84790) (f84791 f84791) (f84792 f84792) (f84793 f84793)) (if (fx= f84792 f84793) #t (if ((vector-ref f84775 0) f84790 f84791 f84792) ((vector-ref f84774 0) f84790 f84791 (fx+ f84792 1) f84793) #f))))) (vector-set! f84773 0 (closure (f84788 f84789) (f84776 f84774) (let ((f84788 f84788) (f84789 f84789)) (if ((vector-ref f84776 0) f84788 f84789) ((vector-ref f84774 0) f84788 f84789 0 (string-length f84788)) #f))))) (vector-ref f84773 0)))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f84776 (make-vector 1)) (f84775 (make-vector 1)) (f84774 (make-vector 1)) (f84773 (make-vector 1)))
#  body = (begin (begin (vector-set! f84776 0 (closure (f84797 f84798) () (let ((f84797 f84797) (f84798 f84798)) (fx= (string-length f84797) (string-length f84798))))) (vector-set! f84775 0 (closure (f84794 f84795 f84796) () (let ((f84794 f84794) (f84795 f84795) (f84796 f84796)) (char=? (string-ref f84794 f84796) (string-ref f84795 f84796))))) (vector-set! f84774 0 (closure (f84790 f84791 f84792 f84793) (f84775 f84774) (let ((f84790 f84790) (f84791 f84791) (f84792 f84792) (f84793 f84793)) (if (fx= f84792 f84793) #t (if ((vector-ref f84775 0) f84790 f84791 f84792) ((vector-ref f84774 0) f84790 f84791 (fx+ f84792 1) f84793) #f))))) (vector-set! f84773 0 (closure (f84788 f84789) (f84776 f84774) (let ((f84788 f84788) (f84789 f84789)) (if ((vector-ref f84776 0) f84788 f84789) ((vector-ref f84774 0) f84788 f84789 0 (string-length f84788)) #f))))) (vector-ref f84773 0))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_751999"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_751999:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_752000
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752000:
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
    je "_L_752001"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752001:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_752002
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752002:
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
    je "_L_752003"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752003:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_752004
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752004:
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
    je "_L_752005"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752005:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_752006
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752006:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, -12(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f84776 0 (closure (f84797 f84798) () (let ((f84797 f84797) (f84798 f84798)) (fx= (string-length f84797) (string-length f84798))))) (vector-set! f84775 0 (closure (f84794 f84795 f84796) () (let ((f84794 f84794) (f84795 f84795) (f84796 f84796)) (char=? (string-ref f84794 f84796) (string-ref f84795 f84796))))) (vector-set! f84774 0 (closure (f84790 f84791 f84792 f84793) (f84775 f84774) (let ((f84790 f84790) (f84791 f84791) (f84792 f84792) (f84793 f84793)) (if (fx= f84792 f84793) #t (if ((vector-ref f84775 0) f84790 f84791 f84792) ((vector-ref f84774 0) f84790 f84791 (fx+ f84792 1) f84793) #f))))) (vector-set! f84773 0 (closure (f84788 f84789) (f84776 f84774) (let ((f84788 f84788) (f84789 f84789)) (if ((vector-ref f84776 0) f84788 f84789) ((vector-ref f84774 0) f84788 f84789 0 (string-length f84788)) #f))))) (vector-ref f84773 0))
# emit-begin
#   expr=(begin (begin (vector-set! f84776 0 (closure (f84797 f84798) () (let ((f84797 f84797) (f84798 f84798)) (fx= (string-length f84797) (string-length f84798))))) (vector-set! f84775 0 (closure (f84794 f84795 f84796) () (let ((f84794 f84794) (f84795 f84795) (f84796 f84796)) (char=? (string-ref f84794 f84796) (string-ref f84795 f84796))))) (vector-set! f84774 0 (closure (f84790 f84791 f84792 f84793) (f84775 f84774) (let ((f84790 f84790) (f84791 f84791) (f84792 f84792) (f84793 f84793)) (if (fx= f84792 f84793) #t (if ((vector-ref f84775 0) f84790 f84791 f84792) ((vector-ref f84774 0) f84790 f84791 (fx+ f84792 1) f84793) #f))))) (vector-set! f84773 0 (closure (f84788 f84789) (f84776 f84774) (let ((f84788 f84788) (f84789 f84789)) (if ((vector-ref f84776 0) f84788 f84789) ((vector-ref f84774 0) f84788 f84789 0 (string-length f84788)) #f))))) (vector-ref f84773 0))
#   env=((f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# emit-expr (begin (vector-set! f84776 0 (closure (f84797 f84798) () (let ((f84797 f84797) (f84798 f84798)) (fx= (string-length f84797) (string-length f84798))))) (vector-set! f84775 0 (closure (f84794 f84795 f84796) () (let ((f84794 f84794) (f84795 f84795) (f84796 f84796)) (char=? (string-ref f84794 f84796) (string-ref f84795 f84796))))) (vector-set! f84774 0 (closure (f84790 f84791 f84792 f84793) (f84775 f84774) (let ((f84790 f84790) (f84791 f84791) (f84792 f84792) (f84793 f84793)) (if (fx= f84792 f84793) #t (if ((vector-ref f84775 0) f84790 f84791 f84792) ((vector-ref f84774 0) f84790 f84791 (fx+ f84792 1) f84793) #f))))) (vector-set! f84773 0 (closure (f84788 f84789) (f84776 f84774) (let ((f84788 f84788) (f84789 f84789)) (if ((vector-ref f84776 0) f84788 f84789) ((vector-ref f84774 0) f84788 f84789 0 (string-length f84788)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f84776 0 (closure (f84797 f84798) () (let ((f84797 f84797) (f84798 f84798)) (fx= (string-length f84797) (string-length f84798))))) (vector-set! f84775 0 (closure (f84794 f84795 f84796) () (let ((f84794 f84794) (f84795 f84795) (f84796 f84796)) (char=? (string-ref f84794 f84796) (string-ref f84795 f84796))))) (vector-set! f84774 0 (closure (f84790 f84791 f84792 f84793) (f84775 f84774) (let ((f84790 f84790) (f84791 f84791) (f84792 f84792) (f84793 f84793)) (if (fx= f84792 f84793) #t (if ((vector-ref f84775 0) f84790 f84791 f84792) ((vector-ref f84774 0) f84790 f84791 (fx+ f84792 1) f84793) #f))))) (vector-set! f84773 0 (closure (f84788 f84789) (f84776 f84774) (let ((f84788 f84788) (f84789 f84789)) (if ((vector-ref f84776 0) f84788 f84789) ((vector-ref f84774 0) f84788 f84789 0 (string-length f84788)) #f)))))
#   env=((f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# emit-expr (vector-set! f84776 0 (closure (f84797 f84798) () (let ((f84797 f84797) (f84798 f84798)) (fx= (string-length f84797) (string-length f84798)))))
# emit-expr f84776
# emit-variable-ref
# env=((f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84776
    movl 0(%esp), %eax  # stack load f84776
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752007
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752007:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752008"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752008:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752010
    cmp  $0,%eax
    jge _L_752009
_L_752010:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752009:
    movl %eax, -20(%esp)
# emit-expr (closure (f84797 f84798) () (let ((f84797 f84797) (f84798 f84798)) (fx= (string-length f84797) (string-length f84798))))
# emit-closure
# si = -24
# env = ((f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# expr = (closure (f84797 f84798) () (let ((f84797 f84797) (f84798 f84798)) (fx= (string-length f84797) (string-length f84798))))
    movl $_L_752011, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_752012            # jump around closure body
_L_752011:
# check argument count
    cmp $8,%eax
    je _L_752013
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_752013:
# emit-tail-expr
# si=-16
# env=((f84798 . -12) (f84797 . -8) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# expr=(let ((f84797 f84797) (f84798 f84798)) (fx= (string-length f84797) (string-length f84798)))
# emit-tail-let
#  si   = -16
#  env  = ((f84798 . -12) (f84797 . -8) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
#  bindings = ((f84797 f84797) (f84798 f84798))
#  body = (fx= (string-length f84797) (string-length f84798))
# emit-expr f84797
# emit-variable-ref
# env=((f84798 . -12) (f84797 . -8) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84797
    movl -8(%esp), %eax  # stack load f84797
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f84798
# emit-variable-ref
# env=((f84798 . -12) (f84797 . -8) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84798
    movl -12(%esp), %eax  # stack load f84798
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f84798 . -20) (f84797 . -16) (f84798 . -12) (f84797 . -8) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# expr=(fx= (string-length f84797) (string-length f84798))
# tail primcall
# emit-expr (string-length f84798)
# emit-expr f84798
# emit-variable-ref
# env=((f84798 . -20) (f84797 . -16) (f84798 . -12) (f84797 . -8) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84798
    movl -20(%esp), %eax  # stack load f84798
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_752014
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752014:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752015"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752015:
    movl %eax, -24(%esp)
# emit-expr (string-length f84797)
# emit-expr f84797
# emit-variable-ref
# env=((f84798 . -20) (f84797 . -16) (f84798 . -12) (f84797 . -8) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84797
    movl -16(%esp), %eax  # stack load f84797
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_752016
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752016:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752017"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752017:
    cmp -24(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
#return from tail (fx= (string-length f84797) (string-length f84798))
    ret
    .align 4,0x90
_L_752012:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84775 0 (closure (f84794 f84795 f84796) () (let ((f84794 f84794) (f84795 f84795) (f84796 f84796)) (char=? (string-ref f84794 f84796) (string-ref f84795 f84796))))) (vector-set! f84774 0 (closure (f84790 f84791 f84792 f84793) (f84775 f84774) (let ((f84790 f84790) (f84791 f84791) (f84792 f84792) (f84793 f84793)) (if (fx= f84792 f84793) #t (if ((vector-ref f84775 0) f84790 f84791 f84792) ((vector-ref f84774 0) f84790 f84791 (fx+ f84792 1) f84793) #f))))) (vector-set! f84773 0 (closure (f84788 f84789) (f84776 f84774) (let ((f84788 f84788) (f84789 f84789)) (if ((vector-ref f84776 0) f84788 f84789) ((vector-ref f84774 0) f84788 f84789 0 (string-length f84788)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f84775 0 (closure (f84794 f84795 f84796) () (let ((f84794 f84794) (f84795 f84795) (f84796 f84796)) (char=? (string-ref f84794 f84796) (string-ref f84795 f84796))))) (vector-set! f84774 0 (closure (f84790 f84791 f84792 f84793) (f84775 f84774) (let ((f84790 f84790) (f84791 f84791) (f84792 f84792) (f84793 f84793)) (if (fx= f84792 f84793) #t (if ((vector-ref f84775 0) f84790 f84791 f84792) ((vector-ref f84774 0) f84790 f84791 (fx+ f84792 1) f84793) #f))))) (vector-set! f84773 0 (closure (f84788 f84789) (f84776 f84774) (let ((f84788 f84788) (f84789 f84789)) (if ((vector-ref f84776 0) f84788 f84789) ((vector-ref f84774 0) f84788 f84789 0 (string-length f84788)) #f)))))
#   env=((f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# emit-expr (vector-set! f84775 0 (closure (f84794 f84795 f84796) () (let ((f84794 f84794) (f84795 f84795) (f84796 f84796)) (char=? (string-ref f84794 f84796) (string-ref f84795 f84796)))))
# emit-expr f84775
# emit-variable-ref
# env=((f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84775
    movl -4(%esp), %eax  # stack load f84775
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752018
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752018:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752019"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752019:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752021
    cmp  $0,%eax
    jge _L_752020
_L_752021:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752020:
    movl %eax, -20(%esp)
# emit-expr (closure (f84794 f84795 f84796) () (let ((f84794 f84794) (f84795 f84795) (f84796 f84796)) (char=? (string-ref f84794 f84796) (string-ref f84795 f84796))))
# emit-closure
# si = -24
# env = ((f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# expr = (closure (f84794 f84795 f84796) () (let ((f84794 f84794) (f84795 f84795) (f84796 f84796)) (char=? (string-ref f84794 f84796) (string-ref f84795 f84796))))
    movl $_L_752022, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_752023            # jump around closure body
_L_752022:
# check argument count
    cmp $12,%eax
    je _L_752024
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_752024:
# emit-tail-expr
# si=-20
# env=((f84796 . -16) (f84795 . -12) (f84794 . -8) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# expr=(let ((f84794 f84794) (f84795 f84795) (f84796 f84796)) (char=? (string-ref f84794 f84796) (string-ref f84795 f84796)))
# emit-tail-let
#  si   = -20
#  env  = ((f84796 . -16) (f84795 . -12) (f84794 . -8) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
#  bindings = ((f84794 f84794) (f84795 f84795) (f84796 f84796))
#  body = (char=? (string-ref f84794 f84796) (string-ref f84795 f84796))
# emit-expr f84794
# emit-variable-ref
# env=((f84796 . -16) (f84795 . -12) (f84794 . -8) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84794
    movl -8(%esp), %eax  # stack load f84794
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-expr f84795
# emit-variable-ref
# env=((f84796 . -16) (f84795 . -12) (f84794 . -8) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84795
    movl -12(%esp), %eax  # stack load f84795
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f84796
# emit-variable-ref
# env=((f84796 . -16) (f84795 . -12) (f84794 . -8) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84796
    movl -16(%esp), %eax  # stack load f84796
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-tail-expr
# si=-32
# env=((f84796 . -28) (f84795 . -24) (f84794 . -20) (f84796 . -16) (f84795 . -12) (f84794 . -8) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# expr=(char=? (string-ref f84794 f84796) (string-ref f84795 f84796))
# tail primcall
# char= c1=(string-ref f84794 f84796) c2=(string-ref f84795 f84796)
# emit-expr (string-ref f84794 f84796)
# emit-expr f84794
# emit-variable-ref
# env=((f84796 . -28) (f84795 . -24) (f84794 . -20) (f84796 . -16) (f84795 . -12) (f84794 . -8) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84794
    movl -20(%esp), %eax  # stack load f84794
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_752025
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752025:
    movl %eax, -32(%esp)
# emit-expr f84796
# emit-variable-ref
# env=((f84796 . -28) (f84795 . -24) (f84794 . -20) (f84796 . -16) (f84795 . -12) (f84794 . -8) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84796
    movl -28(%esp), %eax  # stack load f84796
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752026"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752026:
# check bounds on string index
    movl -32(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_752028
    cmp  $0,%eax
    jge _L_752027
_L_752028:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752027:
    sar $2, %eax
    movl -32(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_752029"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $32,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752029:
    movb %ah, -32(%esp)
# emit-expr (string-ref f84795 f84796)
# emit-expr f84795
# emit-variable-ref
# env=((f84796 . -28) (f84795 . -24) (f84794 . -20) (f84796 . -16) (f84795 . -12) (f84794 . -8) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84795
    movl -24(%esp), %eax  # stack load f84795
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_752030
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752030:
    movl %eax, -36(%esp)
# emit-expr f84796
# emit-variable-ref
# env=((f84796 . -28) (f84795 . -24) (f84794 . -20) (f84796 . -16) (f84795 . -12) (f84794 . -8) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84796
    movl -28(%esp), %eax  # stack load f84796
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752031"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752031:
# check bounds on string index
    movl -36(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_752033
    cmp  $0,%eax
    jge _L_752032
_L_752033:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752032:
    sar $2, %eax
    movl -36(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_752034"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $32,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752034:
    cmp %ah, -32(%esp)
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
#return from tail (char=? (string-ref f84794 f84796) (string-ref f84795 f84796))
    ret
    .align 4,0x90
_L_752023:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84774 0 (closure (f84790 f84791 f84792 f84793) (f84775 f84774) (let ((f84790 f84790) (f84791 f84791) (f84792 f84792) (f84793 f84793)) (if (fx= f84792 f84793) #t (if ((vector-ref f84775 0) f84790 f84791 f84792) ((vector-ref f84774 0) f84790 f84791 (fx+ f84792 1) f84793) #f))))) (vector-set! f84773 0 (closure (f84788 f84789) (f84776 f84774) (let ((f84788 f84788) (f84789 f84789)) (if ((vector-ref f84776 0) f84788 f84789) ((vector-ref f84774 0) f84788 f84789 0 (string-length f84788)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f84774 0 (closure (f84790 f84791 f84792 f84793) (f84775 f84774) (let ((f84790 f84790) (f84791 f84791) (f84792 f84792) (f84793 f84793)) (if (fx= f84792 f84793) #t (if ((vector-ref f84775 0) f84790 f84791 f84792) ((vector-ref f84774 0) f84790 f84791 (fx+ f84792 1) f84793) #f))))) (vector-set! f84773 0 (closure (f84788 f84789) (f84776 f84774) (let ((f84788 f84788) (f84789 f84789)) (if ((vector-ref f84776 0) f84788 f84789) ((vector-ref f84774 0) f84788 f84789 0 (string-length f84788)) #f)))))
#   env=((f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# emit-expr (vector-set! f84774 0 (closure (f84790 f84791 f84792 f84793) (f84775 f84774) (let ((f84790 f84790) (f84791 f84791) (f84792 f84792) (f84793 f84793)) (if (fx= f84792 f84793) #t (if ((vector-ref f84775 0) f84790 f84791 f84792) ((vector-ref f84774 0) f84790 f84791 (fx+ f84792 1) f84793) #f)))))
# emit-expr f84774
# emit-variable-ref
# env=((f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84774
    movl -8(%esp), %eax  # stack load f84774
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752035
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752035:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752036"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752036:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752038
    cmp  $0,%eax
    jge _L_752037
_L_752038:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752037:
    movl %eax, -20(%esp)
# emit-expr (closure (f84790 f84791 f84792 f84793) (f84775 f84774) (let ((f84790 f84790) (f84791 f84791) (f84792 f84792) (f84793 f84793)) (if (fx= f84792 f84793) #t (if ((vector-ref f84775 0) f84790 f84791 f84792) ((vector-ref f84774 0) f84790 f84791 (fx+ f84792 1) f84793) #f))))
# emit-closure
# si = -24
# env = ((f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# expr = (closure (f84790 f84791 f84792 f84793) (f84775 f84774) (let ((f84790 f84790) (f84791 f84791) (f84792 f84792) (f84793 f84793)) (if (fx= f84792 f84793) #t (if ((vector-ref f84775 0) f84790 f84791 f84792) ((vector-ref f84774 0) f84790 f84791 (fx+ f84792 1) f84793) #f))))
    movl $_L_752039, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84775
    movl -4(%esp), %eax  # stack load f84775
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f84775
# emit-variable-ref
# env=((f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84774
    movl -8(%esp), %eax  # stack load f84774
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f84774
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_752040            # jump around closure body
_L_752039:
# check argument count
    cmp $16,%eax
    je _L_752041
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_752041:
# emit-tail-expr
# si=-24
# env=((f84793 . -20) (f84792 . -16) (f84791 . -12) (f84790 . -8) (f84774 . 8) (f84775 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# expr=(let ((f84790 f84790) (f84791 f84791) (f84792 f84792) (f84793 f84793)) (if (fx= f84792 f84793) #t (if ((vector-ref f84775 0) f84790 f84791 f84792) ((vector-ref f84774 0) f84790 f84791 (fx+ f84792 1) f84793) #f)))
# emit-tail-let
#  si   = -24
#  env  = ((f84793 . -20) (f84792 . -16) (f84791 . -12) (f84790 . -8) (f84774 . 8) (f84775 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
#  bindings = ((f84790 f84790) (f84791 f84791) (f84792 f84792) (f84793 f84793))
#  body = (if (fx= f84792 f84793) #t (if ((vector-ref f84775 0) f84790 f84791 f84792) ((vector-ref f84774 0) f84790 f84791 (fx+ f84792 1) f84793) #f))
# emit-expr f84790
# emit-variable-ref
# env=((f84793 . -20) (f84792 . -16) (f84791 . -12) (f84790 . -8) (f84774 . 8) (f84775 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84790
    movl -8(%esp), %eax  # stack load f84790
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f84791
# emit-variable-ref
# env=((f84793 . -20) (f84792 . -16) (f84791 . -12) (f84790 . -8) (f84774 . 8) (f84775 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84791
    movl -12(%esp), %eax  # stack load f84791
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-expr f84792
# emit-variable-ref
# env=((f84793 . -20) (f84792 . -16) (f84791 . -12) (f84790 . -8) (f84774 . 8) (f84775 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84792
    movl -16(%esp), %eax  # stack load f84792
# end emit-variable-ref
    movl %eax, -32(%esp)  # stack save
# emit-expr f84793
# emit-variable-ref
# env=((f84793 . -20) (f84792 . -16) (f84791 . -12) (f84790 . -8) (f84774 . 8) (f84775 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84793
    movl -20(%esp), %eax  # stack load f84793
# end emit-variable-ref
    movl %eax, -36(%esp)  # stack save
# emit-tail-expr
# si=-40
# env=((f84793 . -36) (f84792 . -32) (f84791 . -28) (f84790 . -24) (f84793 . -20) (f84792 . -16) (f84791 . -12) (f84790 . -8) (f84774 . 8) (f84775 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# expr=(if (fx= f84792 f84793) #t (if ((vector-ref f84775 0) f84790 f84791 f84792) ((vector-ref f84774 0) f84790 f84791 (fx+ f84792 1) f84793) #f))
# emit-expr (fx= f84792 f84793)
# emit-expr f84793
# emit-variable-ref
# env=((f84793 . -36) (f84792 . -32) (f84791 . -28) (f84790 . -24) (f84793 . -20) (f84792 . -16) (f84791 . -12) (f84790 . -8) (f84774 . 8) (f84775 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84793
    movl -36(%esp), %eax  # stack load f84793
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752044"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752044:
    movl %eax, -40(%esp)
# emit-expr f84792
# emit-variable-ref
# env=((f84793 . -36) (f84792 . -32) (f84791 . -28) (f84790 . -24) (f84793 . -20) (f84792 . -16) (f84791 . -12) (f84790 . -8) (f84774 . 8) (f84775 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84792
    movl -32(%esp), %eax  # stack load f84792
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752045"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752045:
    cmp -40(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_752042
# emit-tail-expr
# si=-40
# env=((f84793 . -36) (f84792 . -32) (f84791 . -28) (f84790 . -24) (f84793 . -20) (f84792 . -16) (f84791 . -12) (f84790 . -8) (f84774 . 8) (f84775 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# expr=#t
    movl $111, %eax     # immed #t
    ret                  # immediate tail return
    jmp _L_752043
_L_752042:
# emit-tail-expr
# si=-40
# env=((f84793 . -36) (f84792 . -32) (f84791 . -28) (f84790 . -24) (f84793 . -20) (f84792 . -16) (f84791 . -12) (f84790 . -8) (f84774 . 8) (f84775 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# expr=(if ((vector-ref f84775 0) f84790 f84791 f84792) ((vector-ref f84774 0) f84790 f84791 (fx+ f84792 1) f84793) #f)
# emit-expr ((vector-ref f84775 0) f84790 f84791 f84792)
# funcall
#    si   =-40
#    env  = ((f84793 . -36) (f84792 . -32) (f84791 . -28) (f84790 . -24) (f84793 . -20) (f84792 . -16) (f84791 . -12) (f84790 . -8) (f84774 . 8) (f84775 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
#    expr = (funcall (vector-ref f84775 0) f84790 f84791 f84792)
# emit-expr (vector-ref f84775 0)
# emit-expr f84775
# emit-variable-ref
# env=((f84793 . -36) (f84792 . -32) (f84791 . -28) (f84790 . -24) (f84793 . -20) (f84792 . -16) (f84791 . -12) (f84790 . -8) (f84774 . 8) (f84775 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84775
    movl 2(%edi), %eax  # frame load f84775
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752048
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752048:
    movl %eax, -48(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752049"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752049:
# check bounds on vector index
    movl -48(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752051
    cmp  $0,%eax
    jge _L_752050
_L_752051:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752050:
    movl -48(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752052"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752052":
   movl %eax,  -48(%esp)  # stash funcall-oper in closure slot
# emit-expr f84790
# emit-variable-ref
# env=((f84793 . -36) (f84792 . -32) (f84791 . -28) (f84790 . -24) (f84793 . -20) (f84792 . -16) (f84791 . -12) (f84790 . -8) (f84774 . 8) (f84775 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84790
    movl -24(%esp), %eax  # stack load f84790
# end emit-variable-ref
    mov %eax, -52(%esp)  # arg f84790
# emit-expr f84791
# emit-variable-ref
# env=((f84793 . -36) (f84792 . -32) (f84791 . -28) (f84790 . -24) (f84793 . -20) (f84792 . -16) (f84791 . -12) (f84790 . -8) (f84774 . 8) (f84775 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84791
    movl -28(%esp), %eax  # stack load f84791
# end emit-variable-ref
    mov %eax, -56(%esp)  # arg f84791
# emit-expr f84792
# emit-variable-ref
# env=((f84793 . -36) (f84792 . -32) (f84791 . -28) (f84790 . -24) (f84793 . -20) (f84792 . -16) (f84791 . -12) (f84790 . -8) (f84774 . 8) (f84775 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84792
    movl -32(%esp), %eax  # stack load f84792
# end emit-variable-ref
    mov %eax, -60(%esp)  # arg f84792
    movl -48(%esp), %edi   # load new closure to %edi
    add $-40, %esp   # adjust base
    movl $12,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $40, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_752046
# emit-tail-expr
# si=-40
# env=((f84793 . -36) (f84792 . -32) (f84791 . -28) (f84790 . -24) (f84793 . -20) (f84792 . -16) (f84791 . -12) (f84790 . -8) (f84774 . 8) (f84775 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# expr=((vector-ref f84774 0) f84790 f84791 (fx+ f84792 1) f84793)
# emit-tail-funcall
#    si   =-40
#    env  = ((f84793 . -36) (f84792 . -32) (f84791 . -28) (f84790 . -24) (f84793 . -20) (f84792 . -16) (f84791 . -12) (f84790 . -8) (f84774 . 8) (f84775 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
#    expr = (funcall (vector-ref f84774 0) f84790 f84791 (fx+ f84792 1) f84793)
# emit-expr (vector-ref f84774 0)
# emit-expr f84774
# emit-variable-ref
# env=((f84793 . -36) (f84792 . -32) (f84791 . -28) (f84790 . -24) (f84793 . -20) (f84792 . -16) (f84791 . -12) (f84790 . -8) (f84774 . 8) (f84775 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84774
    movl 6(%edi), %eax  # frame load f84774
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752053
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752053:
    movl %eax, -40(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752054"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752054:
# check bounds on vector index
    movl -40(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752056
    cmp  $0,%eax
    jge _L_752055
_L_752056:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752055:
    movl -40(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -40(%esp)  # stash funcall-oper in next closure slot
# emit-expr f84790
# emit-variable-ref
# env=((f84793 . -36) (f84792 . -32) (f84791 . -28) (f84790 . -24) (f84793 . -20) (f84792 . -16) (f84791 . -12) (f84790 . -8) (f84774 . 8) (f84775 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84790
    movl -24(%esp), %eax  # stack load f84790
# end emit-variable-ref
    mov %eax, -44(%esp)    # arg f84790
# emit-expr f84791
# emit-variable-ref
# env=((f84793 . -36) (f84792 . -32) (f84791 . -28) (f84790 . -24) (f84793 . -20) (f84792 . -16) (f84791 . -12) (f84790 . -8) (f84774 . 8) (f84775 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84791
    movl -28(%esp), %eax  # stack load f84791
# end emit-variable-ref
    mov %eax, -48(%esp)    # arg f84791
# emit-expr (fx+ f84792 1)
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752057"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752057:
    movl %eax, -52(%esp)  # fx+ push arg1
# emit-expr f84792
# emit-variable-ref
# env=((f84793 . -36) (f84792 . -32) (f84791 . -28) (f84790 . -24) (f84793 . -20) (f84792 . -16) (f84791 . -12) (f84790 . -8) (f84774 . 8) (f84775 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84792
    movl -32(%esp), %eax  # stack load f84792
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752058"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752058:
    addl -52(%esp), %eax  # fx+ arg1 arg2
    mov %eax, -52(%esp)    # arg (fx+ f84792 1)
# emit-expr f84793
# emit-variable-ref
# env=((f84793 . -36) (f84792 . -32) (f84791 . -28) (f84790 . -24) (f84793 . -20) (f84792 . -16) (f84791 . -12) (f84790 . -8) (f84774 . 8) (f84775 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84793
    movl -36(%esp), %eax  # stack load f84793
# end emit-variable-ref
    mov %eax, -56(%esp)    # arg f84793
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
    jmp _L_752047
_L_752046:
# emit-tail-expr
# si=-40
# env=((f84793 . -36) (f84792 . -32) (f84791 . -28) (f84790 . -24) (f84793 . -20) (f84792 . -16) (f84791 . -12) (f84790 . -8) (f84774 . 8) (f84775 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_752047:
_L_752043:
    .align 4,0x90
_L_752040:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84773 0 (closure (f84788 f84789) (f84776 f84774) (let ((f84788 f84788) (f84789 f84789)) (if ((vector-ref f84776 0) f84788 f84789) ((vector-ref f84774 0) f84788 f84789 0 (string-length f84788)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f84773 0 (closure (f84788 f84789) (f84776 f84774) (let ((f84788 f84788) (f84789 f84789)) (if ((vector-ref f84776 0) f84788 f84789) ((vector-ref f84774 0) f84788 f84789 0 (string-length f84788)) #f)))))
#   env=((f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# emit-expr (vector-set! f84773 0 (closure (f84788 f84789) (f84776 f84774) (let ((f84788 f84788) (f84789 f84789)) (if ((vector-ref f84776 0) f84788 f84789) ((vector-ref f84774 0) f84788 f84789 0 (string-length f84788)) #f))))
# emit-expr f84773
# emit-variable-ref
# env=((f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84773
    movl -12(%esp), %eax  # stack load f84773
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752059
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752059:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752060"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752060:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752062
    cmp  $0,%eax
    jge _L_752061
_L_752062:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752061:
    movl %eax, -20(%esp)
# emit-expr (closure (f84788 f84789) (f84776 f84774) (let ((f84788 f84788) (f84789 f84789)) (if ((vector-ref f84776 0) f84788 f84789) ((vector-ref f84774 0) f84788 f84789 0 (string-length f84788)) #f)))
# emit-closure
# si = -24
# env = ((f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# expr = (closure (f84788 f84789) (f84776 f84774) (let ((f84788 f84788) (f84789 f84789)) (if ((vector-ref f84776 0) f84788 f84789) ((vector-ref f84774 0) f84788 f84789 0 (string-length f84788)) #f)))
    movl $_L_752063, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84776
    movl 0(%esp), %eax  # stack load f84776
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f84776
# emit-variable-ref
# env=((f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84774
    movl -8(%esp), %eax  # stack load f84774
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f84774
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_752064            # jump around closure body
_L_752063:
# check argument count
    cmp $8,%eax
    je _L_752065
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_752065:
# emit-tail-expr
# si=-16
# env=((f84789 . -12) (f84788 . -8) (f84774 . 8) (f84776 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# expr=(let ((f84788 f84788) (f84789 f84789)) (if ((vector-ref f84776 0) f84788 f84789) ((vector-ref f84774 0) f84788 f84789 0 (string-length f84788)) #f))
# emit-tail-let
#  si   = -16
#  env  = ((f84789 . -12) (f84788 . -8) (f84774 . 8) (f84776 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
#  bindings = ((f84788 f84788) (f84789 f84789))
#  body = (if ((vector-ref f84776 0) f84788 f84789) ((vector-ref f84774 0) f84788 f84789 0 (string-length f84788)) #f)
# emit-expr f84788
# emit-variable-ref
# env=((f84789 . -12) (f84788 . -8) (f84774 . 8) (f84776 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84788
    movl -8(%esp), %eax  # stack load f84788
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f84789
# emit-variable-ref
# env=((f84789 . -12) (f84788 . -8) (f84774 . 8) (f84776 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84789
    movl -12(%esp), %eax  # stack load f84789
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f84789 . -20) (f84788 . -16) (f84789 . -12) (f84788 . -8) (f84774 . 8) (f84776 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# expr=(if ((vector-ref f84776 0) f84788 f84789) ((vector-ref f84774 0) f84788 f84789 0 (string-length f84788)) #f)
# emit-expr ((vector-ref f84776 0) f84788 f84789)
# funcall
#    si   =-24
#    env  = ((f84789 . -20) (f84788 . -16) (f84789 . -12) (f84788 . -8) (f84774 . 8) (f84776 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
#    expr = (funcall (vector-ref f84776 0) f84788 f84789)
# emit-expr (vector-ref f84776 0)
# emit-expr f84776
# emit-variable-ref
# env=((f84789 . -20) (f84788 . -16) (f84789 . -12) (f84788 . -8) (f84774 . 8) (f84776 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84776
    movl 2(%edi), %eax  # frame load f84776
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752068
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752068:
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752069"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752069:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752071
    cmp  $0,%eax
    jge _L_752070
_L_752071:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752070:
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752072"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752072":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f84788
# emit-variable-ref
# env=((f84789 . -20) (f84788 . -16) (f84789 . -12) (f84788 . -8) (f84774 . 8) (f84776 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84788
    movl -16(%esp), %eax  # stack load f84788
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f84788
# emit-expr f84789
# emit-variable-ref
# env=((f84789 . -20) (f84788 . -16) (f84789 . -12) (f84788 . -8) (f84774 . 8) (f84776 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84789
    movl -20(%esp), %eax  # stack load f84789
# end emit-variable-ref
    mov %eax, -40(%esp)  # arg f84789
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_752066
# emit-tail-expr
# si=-24
# env=((f84789 . -20) (f84788 . -16) (f84789 . -12) (f84788 . -8) (f84774 . 8) (f84776 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# expr=((vector-ref f84774 0) f84788 f84789 0 (string-length f84788))
# emit-tail-funcall
#    si   =-24
#    env  = ((f84789 . -20) (f84788 . -16) (f84789 . -12) (f84788 . -8) (f84774 . 8) (f84776 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
#    expr = (funcall (vector-ref f84774 0) f84788 f84789 0 (string-length f84788))
# emit-expr (vector-ref f84774 0)
# emit-expr f84774
# emit-variable-ref
# env=((f84789 . -20) (f84788 . -16) (f84789 . -12) (f84788 . -8) (f84774 . 8) (f84776 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84774
    movl 6(%edi), %eax  # frame load f84774
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752073
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752073:
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752074"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752074:
# check bounds on vector index
    movl -24(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752076
    cmp  $0,%eax
    jge _L_752075
_L_752076:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752075:
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr f84788
# emit-variable-ref
# env=((f84789 . -20) (f84788 . -16) (f84789 . -12) (f84788 . -8) (f84774 . 8) (f84776 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84788
    movl -16(%esp), %eax  # stack load f84788
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f84788
# emit-expr f84789
# emit-variable-ref
# env=((f84789 . -20) (f84788 . -16) (f84789 . -12) (f84788 . -8) (f84774 . 8) (f84776 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84789
    movl -20(%esp), %eax  # stack load f84789
# end emit-variable-ref
    mov %eax, -32(%esp)    # arg f84789
# emit-expr 0
    movl $0, %eax     # immed 0
    mov %eax, -36(%esp)    # arg 0
# emit-expr (string-length f84788)
# emit-expr f84788
# emit-variable-ref
# env=((f84789 . -20) (f84788 . -16) (f84789 . -12) (f84788 . -8) (f84774 . 8) (f84776 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84788
    movl -16(%esp), %eax  # stack load f84788
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_752077
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752077:
    movl -6(%eax), %eax
    mov %eax, -40(%esp)    # arg (string-length f84788)
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
    jmp _L_752067
_L_752066:
# emit-tail-expr
# si=-24
# env=((f84789 . -20) (f84788 . -16) (f84789 . -12) (f84788 . -8) (f84774 . 8) (f84776 . 4) (f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_752067:
    .align 4,0x90
_L_752064:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# emit-expr (begin (vector-ref f84773 0))
# emit-begin
#   expr=(begin (vector-ref f84773 0))
#   env=((f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# emit-expr (vector-ref f84773 0)
# emit-expr f84773
# emit-variable-ref
# env=((f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
# var=f84773
    movl -12(%esp), %eax  # stack load f84773
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752078
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752078:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752079"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752079:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752081
    cmp  $0,%eax
    jge _L_752080
_L_752081:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752080:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f84773 . -12) (f84774 . -8) (f84775 . -4) (f84776 . 0))
     movl %eax, string$e$q
# == explicit-begins  ==>
# (letrec ((str->sym (lambda (str symlist) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let* ((new-sym (make-symbol str #f)) (new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym)) (str->sym str (cdr symlist))))))) (lambda (str) (str->sym str (symbols))))
# == eliminate-let*  ==>
# (letrec ((str->sym (lambda (str symlist) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) (str->sym str (cdr symlist))))))) (lambda (str) (str->sym str (symbols))))
# == uniquify-variables  ==>
# (letrec ((f84799 (lambda (f84808 f84809) (if (string=? f84808 (symbol->string (car f84809))) (car f84809) (if (null? (cdr f84809)) (let ((f84813 (make-symbol f84808 #f))) (let ((f84815 (cons f84813 ()))) (begin (set-cdr! f84809 f84815) f84813))) (f84799 f84808 (cdr f84809))))))) (lambda (f84817) (f84799 f84817 (symbols))))
# == vectorize-letrec  ==>
# (let ((f84799 (make-vector 1))) (begin (begin (vector-set! f84799 0 (lambda (f84808 f84809) (if (string=? f84808 (symbol->string (car f84809))) (car f84809) (if (null? (cdr f84809)) (let ((f84813 (make-symbol f84808 #f))) (let ((f84815 (cons f84813 ()))) (begin (set-cdr! f84809 f84815) f84813))) ((vector-ref f84799 0) f84808 (cdr f84809))))))) (lambda (f84817) ((vector-ref f84799 0) f84817 (symbols)))))
# == eliminate-set!  ==>
# (let ((f84799 (make-vector 1))) (begin (begin (vector-set! f84799 0 (lambda (f84808 f84809) (let ((f84808 f84808) (f84809 f84809)) (if (string=? f84808 (symbol->string (car f84809))) (car f84809) (if (null? (cdr f84809)) (let ((f84813 (make-symbol f84808 #f))) (let ((f84815 (cons f84813 ()))) (begin (set-cdr! f84809 f84815) f84813))) ((vector-ref f84799 0) f84808 (cdr f84809)))))))) (lambda (f84817) (let ((f84817 f84817)) ((vector-ref f84799 0) f84817 (symbols))))))
# == close-free-variables  ==>
# (let ((f84799 (make-vector 1))) (begin (begin (vector-set! f84799 0 (closure (f84808 f84809) (string=? f84799) (let ((f84808 f84808) (f84809 f84809)) (if (string=? f84808 (symbol->string (car f84809))) (car f84809) (if (null? (cdr f84809)) (let ((f84813 (make-symbol f84808 #f))) (let ((f84815 (cons f84813 ()))) (begin (set-cdr! f84809 f84815) f84813))) ((vector-ref f84799 0) f84808 (cdr f84809)))))))) (closure (f84817) (f84799 symbols) (let ((f84817 f84817)) ((vector-ref f84799 0) f84817 (symbols))))))
# == eliminate-quote  ==>
# (let ((f84799 (make-vector 1))) (begin (begin (vector-set! f84799 0 (closure (f84808 f84809) (string=? f84799) (let ((f84808 f84808) (f84809 f84809)) (if (string=? f84808 (symbol->string (car f84809))) (car f84809) (if (null? (cdr f84809)) (let ((f84813 (make-symbol f84808 #f))) (let ((f84815 (cons f84813 ()))) (begin (set-cdr! f84809 f84815) f84813))) ((vector-ref f84799 0) f84808 (cdr f84809)))))))) (closure (f84817) (f84799 symbols) (let ((f84817 f84817)) ((vector-ref f84799 0) f84817 (symbols))))))
# == eliminate-when/unless  ==>
# (let ((f84799 (make-vector 1))) (begin (begin (vector-set! f84799 0 (closure (f84808 f84809) (string=? f84799) (let ((f84808 f84808) (f84809 f84809)) (if (string=? f84808 (symbol->string (car f84809))) (car f84809) (if (null? (cdr f84809)) (let ((f84813 (make-symbol f84808 #f))) (let ((f84815 (cons f84813 ()))) (begin (set-cdr! f84809 f84815) f84813))) ((vector-ref f84799 0) f84808 (cdr f84809)))))))) (closure (f84817) (f84799 symbols) (let ((f84817 f84817)) ((vector-ref f84799 0) f84817 (symbols))))))
# == eliminate-cond  ==>
# (let ((f84799 (make-vector 1))) (begin (begin (vector-set! f84799 0 (closure (f84808 f84809) (string=? f84799) (let ((f84808 f84808) (f84809 f84809)) (if (string=? f84808 (symbol->string (car f84809))) (car f84809) (if (null? (cdr f84809)) (let ((f84813 (make-symbol f84808 #f))) (let ((f84815 (cons f84813 ()))) (begin (set-cdr! f84809 f84815) f84813))) ((vector-ref f84799 0) f84808 (cdr f84809)))))))) (closure (f84817) (f84799 symbols) (let ((f84817 f84817)) ((vector-ref f84799 0) f84817 (symbols))))))
# == external-symbols  ==>
# (let ((f84799 (make-vector 1))) (begin (begin (vector-set! f84799 0 (closure (f84808 f84809) ((primitive-ref string=?) f84799) (let ((f84808 f84808) (f84809 f84809)) (if ((primitive-ref string=?) f84808 (symbol->string (car f84809))) (car f84809) (if (null? (cdr f84809)) (let ((f84813 (make-symbol f84808 #f))) (let ((f84815 (cons f84813 ()))) (begin (set-cdr! f84809 f84815) f84813))) ((vector-ref f84799 0) f84808 (cdr f84809)))))))) (closure (f84817) (f84799 (primitive-ref symbols)) (let ((f84817 f84817)) ((vector-ref f84799 0) f84817 ((primitive-ref symbols)))))))
# emit-expr (let ((f84799 (make-vector 1))) (begin (begin (vector-set! f84799 0 (closure (f84808 f84809) ((primitive-ref string=?) f84799) (let ((f84808 f84808) (f84809 f84809)) (if ((primitive-ref string=?) f84808 (symbol->string (car f84809))) (car f84809) (if (null? (cdr f84809)) (let ((f84813 (make-symbol f84808 #f))) (let ((f84815 (cons f84813 ()))) (begin (set-cdr! f84809 f84815) f84813))) ((vector-ref f84799 0) f84808 (cdr f84809)))))))) (closure (f84817) (f84799 (primitive-ref symbols)) (let ((f84817 f84817)) ((vector-ref f84799 0) f84817 ((primitive-ref symbols)))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f84799 (make-vector 1)))
#  body = (begin (begin (vector-set! f84799 0 (closure (f84808 f84809) ((primitive-ref string=?) f84799) (let ((f84808 f84808) (f84809 f84809)) (if ((primitive-ref string=?) f84808 (symbol->string (car f84809))) (car f84809) (if (null? (cdr f84809)) (let ((f84813 (make-symbol f84808 #f))) (let ((f84815 (cons f84813 ()))) (begin (set-cdr! f84809 f84815) f84813))) ((vector-ref f84799 0) f84808 (cdr f84809)))))))) (closure (f84817) (f84799 (primitive-ref symbols)) (let ((f84817 f84817)) ((vector-ref f84799 0) f84817 ((primitive-ref symbols))))))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752082"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752082:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_752083
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752083:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f84799 0 (closure (f84808 f84809) ((primitive-ref string=?) f84799) (let ((f84808 f84808) (f84809 f84809)) (if ((primitive-ref string=?) f84808 (symbol->string (car f84809))) (car f84809) (if (null? (cdr f84809)) (let ((f84813 (make-symbol f84808 #f))) (let ((f84815 (cons f84813 ()))) (begin (set-cdr! f84809 f84815) f84813))) ((vector-ref f84799 0) f84808 (cdr f84809)))))))) (closure (f84817) (f84799 (primitive-ref symbols)) (let ((f84817 f84817)) ((vector-ref f84799 0) f84817 ((primitive-ref symbols))))))
# emit-begin
#   expr=(begin (begin (vector-set! f84799 0 (closure (f84808 f84809) ((primitive-ref string=?) f84799) (let ((f84808 f84808) (f84809 f84809)) (if ((primitive-ref string=?) f84808 (symbol->string (car f84809))) (car f84809) (if (null? (cdr f84809)) (let ((f84813 (make-symbol f84808 #f))) (let ((f84815 (cons f84813 ()))) (begin (set-cdr! f84809 f84815) f84813))) ((vector-ref f84799 0) f84808 (cdr f84809)))))))) (closure (f84817) (f84799 (primitive-ref symbols)) (let ((f84817 f84817)) ((vector-ref f84799 0) f84817 ((primitive-ref symbols))))))
#   env=((f84799 . 0))
# emit-expr (begin (vector-set! f84799 0 (closure (f84808 f84809) ((primitive-ref string=?) f84799) (let ((f84808 f84808) (f84809 f84809)) (if ((primitive-ref string=?) f84808 (symbol->string (car f84809))) (car f84809) (if (null? (cdr f84809)) (let ((f84813 (make-symbol f84808 #f))) (let ((f84815 (cons f84813 ()))) (begin (set-cdr! f84809 f84815) f84813))) ((vector-ref f84799 0) f84808 (cdr f84809))))))))
# emit-begin
#   expr=(begin (vector-set! f84799 0 (closure (f84808 f84809) ((primitive-ref string=?) f84799) (let ((f84808 f84808) (f84809 f84809)) (if ((primitive-ref string=?) f84808 (symbol->string (car f84809))) (car f84809) (if (null? (cdr f84809)) (let ((f84813 (make-symbol f84808 #f))) (let ((f84815 (cons f84813 ()))) (begin (set-cdr! f84809 f84815) f84813))) ((vector-ref f84799 0) f84808 (cdr f84809))))))))
#   env=((f84799 . 0))
# emit-expr (vector-set! f84799 0 (closure (f84808 f84809) ((primitive-ref string=?) f84799) (let ((f84808 f84808) (f84809 f84809)) (if ((primitive-ref string=?) f84808 (symbol->string (car f84809))) (car f84809) (if (null? (cdr f84809)) (let ((f84813 (make-symbol f84808 #f))) (let ((f84815 (cons f84813 ()))) (begin (set-cdr! f84809 f84815) f84813))) ((vector-ref f84799 0) f84808 (cdr f84809)))))))
# emit-expr f84799
# emit-variable-ref
# env=((f84799 . 0))
# var=f84799
    movl 0(%esp), %eax  # stack load f84799
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752084
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752084:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752085"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752085:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752087
    cmp  $0,%eax
    jge _L_752086
_L_752087:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752086:
    movl %eax, -8(%esp)
# emit-expr (closure (f84808 f84809) ((primitive-ref string=?) f84799) (let ((f84808 f84808) (f84809 f84809)) (if ((primitive-ref string=?) f84808 (symbol->string (car f84809))) (car f84809) (if (null? (cdr f84809)) (let ((f84813 (make-symbol f84808 #f))) (let ((f84815 (cons f84813 ()))) (begin (set-cdr! f84809 f84815) f84813))) ((vector-ref f84799 0) f84808 (cdr f84809))))))
# emit-closure
# si = -12
# env = ((f84799 . 0))
# expr = (closure (f84808 f84809) ((primitive-ref string=?) f84799) (let ((f84808 f84808) (f84809 f84809)) (if ((primitive-ref string=?) f84808 (symbol->string (car f84809))) (car f84809) (if (null? (cdr f84809)) (let ((f84813 (make-symbol f84808 #f))) (let ((f84815 (cons f84813 ()))) (begin (set-cdr! f84809 f84815) f84813))) ((vector-ref f84799 0) f84808 (cdr f84809))))))
    movl $_L_752088, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref string=?) not defined in the environmnet
# emit-variable-ref
# env=((f84799 . 0))
# var=f84799
    movl 0(%esp), %eax  # stack load f84799
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f84799
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_752089            # jump around closure body
_L_752088:
# check argument count
    cmp $8,%eax
    je _L_752090
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_752090:
# emit-tail-expr
# si=-16
# env=((f84809 . -12) (f84808 . -8) (f84799 . 8) ((primitive-ref string=?) . 4) (f84799 . 0))
# expr=(let ((f84808 f84808) (f84809 f84809)) (if ((primitive-ref string=?) f84808 (symbol->string (car f84809))) (car f84809) (if (null? (cdr f84809)) (let ((f84813 (make-symbol f84808 #f))) (let ((f84815 (cons f84813 ()))) (begin (set-cdr! f84809 f84815) f84813))) ((vector-ref f84799 0) f84808 (cdr f84809)))))
# emit-tail-let
#  si   = -16
#  env  = ((f84809 . -12) (f84808 . -8) (f84799 . 8) ((primitive-ref string=?) . 4) (f84799 . 0))
#  bindings = ((f84808 f84808) (f84809 f84809))
#  body = (if ((primitive-ref string=?) f84808 (symbol->string (car f84809))) (car f84809) (if (null? (cdr f84809)) (let ((f84813 (make-symbol f84808 #f))) (let ((f84815 (cons f84813 ()))) (begin (set-cdr! f84809 f84815) f84813))) ((vector-ref f84799 0) f84808 (cdr f84809))))
# emit-expr f84808
# emit-variable-ref
# env=((f84809 . -12) (f84808 . -8) (f84799 . 8) ((primitive-ref string=?) . 4) (f84799 . 0))
# var=f84808
    movl -8(%esp), %eax  # stack load f84808
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f84809
# emit-variable-ref
# env=((f84809 . -12) (f84808 . -8) (f84799 . 8) ((primitive-ref string=?) . 4) (f84799 . 0))
# var=f84809
    movl -12(%esp), %eax  # stack load f84809
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f84809 . -20) (f84808 . -16) (f84809 . -12) (f84808 . -8) (f84799 . 8) ((primitive-ref string=?) . 4) (f84799 . 0))
# expr=(if ((primitive-ref string=?) f84808 (symbol->string (car f84809))) (car f84809) (if (null? (cdr f84809)) (let ((f84813 (make-symbol f84808 #f))) (let ((f84815 (cons f84813 ()))) (begin (set-cdr! f84809 f84815) f84813))) ((vector-ref f84799 0) f84808 (cdr f84809))))
# emit-expr ((primitive-ref string=?) f84808 (symbol->string (car f84809)))
# funcall
#    si   =-24
#    env  = ((f84809 . -20) (f84808 . -16) (f84809 . -12) (f84808 . -8) (f84799 . 8) ((primitive-ref string=?) . 4) (f84799 . 0))
#    expr = (funcall (primitive-ref string=?) f84808 (symbol->string (car f84809)))
# emit-expr (primitive-ref string=?)
    .extern string$e$q
    movl string$e$q,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752093"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752093":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f84808
# emit-variable-ref
# env=((f84809 . -20) (f84808 . -16) (f84809 . -12) (f84808 . -8) (f84799 . 8) ((primitive-ref string=?) . 4) (f84799 . 0))
# var=f84808
    movl -16(%esp), %eax  # stack load f84808
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f84808
# emit-expr (symbol->string (car f84809))
# symbol->string (car f84809)
# emit-expr (car f84809)
# emit-expr f84809
# emit-variable-ref
# env=((f84809 . -20) (f84808 . -16) (f84809 . -12) (f84808 . -8) (f84799 . 8) ((primitive-ref string=?) . 4) (f84799 . 0))
# var=f84809
    movl -20(%esp), %eax  # stack load f84809
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_752094
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752094:
    movl -1(%eax), %eax
    movl -3(%eax), %eax
    mov %eax, -40(%esp)  # arg (symbol->string (car f84809))
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_752091
# emit-tail-expr
# si=-24
# env=((f84809 . -20) (f84808 . -16) (f84809 . -12) (f84808 . -8) (f84799 . 8) ((primitive-ref string=?) . 4) (f84799 . 0))
# expr=(car f84809)
# tail primcall
# emit-expr f84809
# emit-variable-ref
# env=((f84809 . -20) (f84808 . -16) (f84809 . -12) (f84808 . -8) (f84799 . 8) ((primitive-ref string=?) . 4) (f84799 . 0))
# var=f84809
    movl -20(%esp), %eax  # stack load f84809
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_752095
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752095:
    movl -1(%eax), %eax
#return from tail (car f84809)
    ret
    jmp _L_752092
_L_752091:
# emit-tail-expr
# si=-24
# env=((f84809 . -20) (f84808 . -16) (f84809 . -12) (f84808 . -8) (f84799 . 8) ((primitive-ref string=?) . 4) (f84799 . 0))
# expr=(if (null? (cdr f84809)) (let ((f84813 (make-symbol f84808 #f))) (let ((f84815 (cons f84813 ()))) (begin (set-cdr! f84809 f84815) f84813))) ((vector-ref f84799 0) f84808 (cdr f84809)))
# emit-expr (null? (cdr f84809))
# emit-expr (cdr f84809)
# emit-expr f84809
# emit-variable-ref
# env=((f84809 . -20) (f84808 . -16) (f84809 . -12) (f84808 . -8) (f84799 . 8) ((primitive-ref string=?) . 4) (f84799 . 0))
# var=f84809
    movl -20(%esp), %eax  # stack load f84809
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_752098
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752098:
    movl 3(%eax), %eax
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_752096
# emit-tail-expr
# si=-24
# env=((f84809 . -20) (f84808 . -16) (f84809 . -12) (f84808 . -8) (f84799 . 8) ((primitive-ref string=?) . 4) (f84799 . 0))
# expr=(let ((f84813 (make-symbol f84808 #f))) (let ((f84815 (cons f84813 ()))) (begin (set-cdr! f84809 f84815) f84813)))
# emit-tail-let
#  si   = -24
#  env  = ((f84809 . -20) (f84808 . -16) (f84809 . -12) (f84808 . -8) (f84799 . 8) ((primitive-ref string=?) . 4) (f84799 . 0))
#  bindings = ((f84813 (make-symbol f84808 #f)))
#  body = (let ((f84815 (cons f84813 ()))) (begin (set-cdr! f84809 f84815) f84813))
# emit-expr (make-symbol f84808 #f)
# make-symbol arg1=f84808 arg2=#f
# emit-expr f84808
# emit-variable-ref
# env=((f84809 . -20) (f84808 . -16) (f84809 . -12) (f84808 . -8) (f84799 . 8) ((primitive-ref string=?) . 4) (f84799 . 0))
# var=f84808
    movl -16(%esp), %eax  # stack load f84808
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
# env=((f84813 . -24) (f84809 . -20) (f84808 . -16) (f84809 . -12) (f84808 . -8) (f84799 . 8) ((primitive-ref string=?) . 4) (f84799 . 0))
# expr=(let ((f84815 (cons f84813 ()))) (begin (set-cdr! f84809 f84815) f84813))
# emit-tail-let
#  si   = -28
#  env  = ((f84813 . -24) (f84809 . -20) (f84808 . -16) (f84809 . -12) (f84808 . -8) (f84799 . 8) ((primitive-ref string=?) . 4) (f84799 . 0))
#  bindings = ((f84815 (cons f84813 ())))
#  body = (begin (set-cdr! f84809 f84815) f84813)
# emit-expr (cons f84813 ())
# cons arg1=f84813 arg2=()
# emit-expr f84813
# emit-variable-ref
# env=((f84813 . -24) (f84809 . -20) (f84808 . -16) (f84809 . -12) (f84808 . -8) (f84799 . 8) ((primitive-ref string=?) . 4) (f84799 . 0))
# var=f84813
    movl -24(%esp), %eax  # stack load f84813
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
# env=((f84815 . -28) (f84813 . -24) (f84809 . -20) (f84808 . -16) (f84809 . -12) (f84808 . -8) (f84799 . 8) ((primitive-ref string=?) . 4) (f84799 . 0))
# expr=(begin (set-cdr! f84809 f84815) f84813)
# tail-begin (begin (set-cdr! f84809 f84815) f84813)
#   env=((f84815 . -28) (f84813 . -24) (f84809 . -20) (f84808 . -16) (f84809 . -12) (f84808 . -8) (f84799 . 8) ((primitive-ref string=?) . 4) (f84799 . 0))
# emit-expr (set-cdr! f84809 f84815)
# emit-expr f84809
# emit-variable-ref
# env=((f84815 . -28) (f84813 . -24) (f84809 . -20) (f84808 . -16) (f84809 . -12) (f84808 . -8) (f84799 . 8) ((primitive-ref string=?) . 4) (f84799 . 0))
# var=f84809
    movl -20(%esp), %eax  # stack load f84809
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_752099
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752099:
    movl %eax, -32(%esp)
# emit-expr f84815
# emit-variable-ref
# env=((f84815 . -28) (f84813 . -24) (f84809 . -20) (f84808 . -16) (f84809 . -12) (f84808 . -8) (f84799 . 8) ((primitive-ref string=?) . 4) (f84799 . 0))
# var=f84815
    movl -28(%esp), %eax  # stack load f84815
# end emit-variable-ref
    movl -32(%esp), %ebx
    movl %eax, 3(%ebx)
# emit-tail-expr
# si=-32
# env=((f84815 . -28) (f84813 . -24) (f84809 . -20) (f84808 . -16) (f84809 . -12) (f84808 . -8) (f84799 . 8) ((primitive-ref string=?) . 4) (f84799 . 0))
# expr=(begin f84813)
# tail-begin (begin f84813)
#   env=((f84815 . -28) (f84813 . -24) (f84809 . -20) (f84808 . -16) (f84809 . -12) (f84808 . -8) (f84799 . 8) ((primitive-ref string=?) . 4) (f84799 . 0))
# emit-tail-expr
# si=-32
# env=((f84815 . -28) (f84813 . -24) (f84809 . -20) (f84808 . -16) (f84809 . -12) (f84808 . -8) (f84799 . 8) ((primitive-ref string=?) . 4) (f84799 . 0))
# expr=f84813
# emit-tail-variable-ref
# emit-variable-ref
# env=((f84815 . -28) (f84813 . -24) (f84809 . -20) (f84808 . -16) (f84809 . -12) (f84808 . -8) (f84799 . 8) ((primitive-ref string=?) . 4) (f84799 . 0))
# var=f84813
    movl -24(%esp), %eax  # stack load f84813
# end emit-variable-ref
    ret
# end emit-tail-variable ref
     ret   # return thru stack
    jmp _L_752097
_L_752096:
# emit-tail-expr
# si=-24
# env=((f84809 . -20) (f84808 . -16) (f84809 . -12) (f84808 . -8) (f84799 . 8) ((primitive-ref string=?) . 4) (f84799 . 0))
# expr=((vector-ref f84799 0) f84808 (cdr f84809))
# emit-tail-funcall
#    si   =-24
#    env  = ((f84809 . -20) (f84808 . -16) (f84809 . -12) (f84808 . -8) (f84799 . 8) ((primitive-ref string=?) . 4) (f84799 . 0))
#    expr = (funcall (vector-ref f84799 0) f84808 (cdr f84809))
# emit-expr (vector-ref f84799 0)
# emit-expr f84799
# emit-variable-ref
# env=((f84809 . -20) (f84808 . -16) (f84809 . -12) (f84808 . -8) (f84799 . 8) ((primitive-ref string=?) . 4) (f84799 . 0))
# var=f84799
    movl 6(%edi), %eax  # frame load f84799
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752100
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752100:
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752101"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752101:
# check bounds on vector index
    movl -24(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752103
    cmp  $0,%eax
    jge _L_752102
_L_752103:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752102:
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr f84808
# emit-variable-ref
# env=((f84809 . -20) (f84808 . -16) (f84809 . -12) (f84808 . -8) (f84799 . 8) ((primitive-ref string=?) . 4) (f84799 . 0))
# var=f84808
    movl -16(%esp), %eax  # stack load f84808
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f84808
# emit-expr (cdr f84809)
# emit-expr f84809
# emit-variable-ref
# env=((f84809 . -20) (f84808 . -16) (f84809 . -12) (f84808 . -8) (f84799 . 8) ((primitive-ref string=?) . 4) (f84799 . 0))
# var=f84809
    movl -20(%esp), %eax  # stack load f84809
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_752104
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752104:
    movl 3(%eax), %eax
    mov %eax, -32(%esp)    # arg (cdr f84809)
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
_L_752097:
_L_752092:
    .align 4,0x90
_L_752089:
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f84799 . 0))
# emit-expr (begin (closure (f84817) (f84799 (primitive-ref symbols)) (let ((f84817 f84817)) ((vector-ref f84799 0) f84817 ((primitive-ref symbols))))))
# emit-begin
#   expr=(begin (closure (f84817) (f84799 (primitive-ref symbols)) (let ((f84817 f84817)) ((vector-ref f84799 0) f84817 ((primitive-ref symbols))))))
#   env=((f84799 . 0))
# emit-expr (closure (f84817) (f84799 (primitive-ref symbols)) (let ((f84817 f84817)) ((vector-ref f84799 0) f84817 ((primitive-ref symbols)))))
# emit-closure
# si = -4
# env = ((f84799 . 0))
# expr = (closure (f84817) (f84799 (primitive-ref symbols)) (let ((f84817 f84817)) ((vector-ref f84799 0) f84817 ((primitive-ref symbols)))))
    movl $_L_752105, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f84799 . 0))
# var=f84799
    movl 0(%esp), %eax  # stack load f84799
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f84799
# WARNING: free var (primitive-ref symbols) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_752106            # jump around closure body
_L_752105:
# check argument count
    cmp $4,%eax
    je _L_752107
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_752107:
# emit-tail-expr
# si=-12
# env=((f84817 . -8) ((primitive-ref symbols) . 8) (f84799 . 4) (f84799 . 0))
# expr=(let ((f84817 f84817)) ((vector-ref f84799 0) f84817 ((primitive-ref symbols))))
# emit-tail-let
#  si   = -12
#  env  = ((f84817 . -8) ((primitive-ref symbols) . 8) (f84799 . 4) (f84799 . 0))
#  bindings = ((f84817 f84817))
#  body = ((vector-ref f84799 0) f84817 ((primitive-ref symbols)))
# emit-expr f84817
# emit-variable-ref
# env=((f84817 . -8) ((primitive-ref symbols) . 8) (f84799 . 4) (f84799 . 0))
# var=f84817
    movl -8(%esp), %eax  # stack load f84817
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f84817 . -12) (f84817 . -8) ((primitive-ref symbols) . 8) (f84799 . 4) (f84799 . 0))
# expr=((vector-ref f84799 0) f84817 ((primitive-ref symbols)))
# emit-tail-funcall
#    si   =-16
#    env  = ((f84817 . -12) (f84817 . -8) ((primitive-ref symbols) . 8) (f84799 . 4) (f84799 . 0))
#    expr = (funcall (vector-ref f84799 0) f84817 ((primitive-ref symbols)))
# emit-expr (vector-ref f84799 0)
# emit-expr f84799
# emit-variable-ref
# env=((f84817 . -12) (f84817 . -8) ((primitive-ref symbols) . 8) (f84799 . 4) (f84799 . 0))
# var=f84799
    movl 2(%edi), %eax  # frame load f84799
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752108
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752108:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752109"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752109:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752111
    cmp  $0,%eax
    jge _L_752110
_L_752111:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752110:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr f84817
# emit-variable-ref
# env=((f84817 . -12) (f84817 . -8) ((primitive-ref symbols) . 8) (f84799 . 4) (f84799 . 0))
# var=f84817
    movl -12(%esp), %eax  # stack load f84817
# end emit-variable-ref
    mov %eax, -20(%esp)    # arg f84817
# emit-expr ((primitive-ref symbols))
# funcall
#    si   =-24
#    env  = ((f84817 . -12) (f84817 . -8) ((primitive-ref symbols) . 8) (f84799 . 4) (f84799 . 0))
#    expr = (funcall (primitive-ref symbols))
# emit-expr (primitive-ref symbols)
    .extern symbols
    movl symbols,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752112"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752112":
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
_L_752106:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f84799 . 0))
     movl %eax, string$m$gsymbol
# == explicit-begins  ==>
# (lambda (lst elt) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt))))
# == eliminate-let*  ==>
# (lambda (lst elt) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt))))
# == uniquify-variables  ==>
# (lambda (f84818 f84819) (if (null? f84818) (cons e nil) (cons (car f84818) (append1 (cdr f84818) f84819))))
# == vectorize-letrec  ==>
# (lambda (f84818 f84819) (if (null? f84818) (cons e nil) (cons (car f84818) (append1 (cdr f84818) f84819))))
# == eliminate-set!  ==>
# (lambda (f84818 f84819) (let ((f84818 f84818) (f84819 f84819)) (if (null? f84818) (cons e nil) (cons (car f84818) (append1 (cdr f84818) f84819)))))
# == close-free-variables  ==>
# (closure (f84818 f84819) (e nil append1) (let ((f84818 f84818) (f84819 f84819)) (if (null? f84818) (cons e nil) (cons (car f84818) (append1 (cdr f84818) f84819)))))
# == eliminate-quote  ==>
# (closure (f84818 f84819) (e nil append1) (let ((f84818 f84818) (f84819 f84819)) (if (null? f84818) (cons e nil) (cons (car f84818) (append1 (cdr f84818) f84819)))))
# == eliminate-when/unless  ==>
# (closure (f84818 f84819) (e nil append1) (let ((f84818 f84818) (f84819 f84819)) (if (null? f84818) (cons e nil) (cons (car f84818) (append1 (cdr f84818) f84819)))))
# == eliminate-cond  ==>
# (closure (f84818 f84819) (e nil append1) (let ((f84818 f84818) (f84819 f84819)) (if (null? f84818) (cons e nil) (cons (car f84818) (append1 (cdr f84818) f84819)))))
# == external-symbols  ==>
# (closure (f84818 f84819) (e nil (primitive-ref append1)) (let ((f84818 f84818) (f84819 f84819)) (if (null? f84818) (cons e nil) (cons (car f84818) ((primitive-ref append1) (cdr f84818) f84819)))))
# emit-expr (closure (f84818 f84819) (e nil (primitive-ref append1)) (let ((f84818 f84818) (f84819 f84819)) (if (null? f84818) (cons e nil) (cons (car f84818) ((primitive-ref append1) (cdr f84818) f84819)))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f84818 f84819) (e nil (primitive-ref append1)) (let ((f84818 f84818) (f84819 f84819)) (if (null? f84818) (cons e nil) (cons (car f84818) ((primitive-ref append1) (cdr f84818) f84819)))))
    movl $_L_752113, 0(%ebp)  # closure label
# WARNING: free var e not defined in the environmnet
# WARNING: free var nil not defined in the environmnet
# WARNING: free var (primitive-ref append1) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_752114            # jump around closure body
_L_752113:
# check argument count
    cmp $8,%eax
    je _L_752115
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_752115:
# emit-tail-expr
# si=-16
# env=((f84819 . -12) (f84818 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(let ((f84818 f84818) (f84819 f84819)) (if (null? f84818) (cons e nil) (cons (car f84818) ((primitive-ref append1) (cdr f84818) f84819))))
# emit-tail-let
#  si   = -16
#  env  = ((f84819 . -12) (f84818 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
#  bindings = ((f84818 f84818) (f84819 f84819))
#  body = (if (null? f84818) (cons e nil) (cons (car f84818) ((primitive-ref append1) (cdr f84818) f84819)))
# emit-expr f84818
# emit-variable-ref
# env=((f84819 . -12) (f84818 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f84818
    movl -8(%esp), %eax  # stack load f84818
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f84819
# emit-variable-ref
# env=((f84819 . -12) (f84818 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f84819
    movl -12(%esp), %eax  # stack load f84819
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f84819 . -20) (f84818 . -16) (f84819 . -12) (f84818 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(if (null? f84818) (cons e nil) (cons (car f84818) ((primitive-ref append1) (cdr f84818) f84819)))
# emit-expr (null? f84818)
# emit-expr f84818
# emit-variable-ref
# env=((f84819 . -20) (f84818 . -16) (f84819 . -12) (f84818 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f84818
    movl -16(%esp), %eax  # stack load f84818
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_752116
# emit-tail-expr
# si=-24
# env=((f84819 . -20) (f84818 . -16) (f84819 . -12) (f84818 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(cons e nil)
# tail primcall
# cons arg1=e arg2=nil
# emit-expr e
# emit-variable-ref
# env=((f84819 . -20) (f84818 . -16) (f84819 . -12) (f84818 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=e
    movl 2(%edi), %eax  # frame load e
# end emit-variable-ref
    movl %eax, -24(%esp)
# emit-expr nil
# emit-variable-ref
# env=((f84819 . -20) (f84818 . -16) (f84819 . -12) (f84818 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
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
    jmp _L_752117
_L_752116:
# emit-tail-expr
# si=-24
# env=((f84819 . -20) (f84818 . -16) (f84819 . -12) (f84818 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(cons (car f84818) ((primitive-ref append1) (cdr f84818) f84819))
# tail primcall
# cons arg1=(car f84818) arg2=((primitive-ref append1) (cdr f84818) f84819)
# emit-expr (car f84818)
# emit-expr f84818
# emit-variable-ref
# env=((f84819 . -20) (f84818 . -16) (f84819 . -12) (f84818 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f84818
    movl -16(%esp), %eax  # stack load f84818
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_752118
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752118:
    movl -1(%eax), %eax
    movl %eax, -24(%esp)
# emit-expr ((primitive-ref append1) (cdr f84818) f84819)
# funcall
#    si   =-28
#    env  = ((f84819 . -20) (f84818 . -16) (f84819 . -12) (f84818 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
#    expr = (funcall (primitive-ref append1) (cdr f84818) f84819)
# emit-expr (primitive-ref append1)
    .extern append1
    movl append1,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752119"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752119":
   movl %eax,  -36(%esp)  # stash funcall-oper in closure slot
# emit-expr (cdr f84818)
# emit-expr f84818
# emit-variable-ref
# env=((f84819 . -20) (f84818 . -16) (f84819 . -12) (f84818 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f84818
    movl -16(%esp), %eax  # stack load f84818
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_752120
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752120:
    movl 3(%eax), %eax
    mov %eax, -40(%esp)  # arg (cdr f84818)
# emit-expr f84819
# emit-variable-ref
# env=((f84819 . -20) (f84818 . -16) (f84819 . -12) (f84818 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f84819
    movl -20(%esp), %eax  # stack load f84819
# end emit-variable-ref
    mov %eax, -44(%esp)  # arg f84819
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
#return from tail (cons (car f84818) ((primitive-ref append1) (cdr f84818) f84819))
    ret
_L_752117:
    .align 4,0x90
_L_752114:
     movl %eax, append1
# == explicit-begins  ==>
# (lambda (l k) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1))))
# == eliminate-let*  ==>
# (lambda (l k) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1))))
# == uniquify-variables  ==>
# (lambda (f84820 f84821) (if (fx= f84821 0) (car f84820) (list-ref (cdr f84820) (fx- f84821 1))))
# == vectorize-letrec  ==>
# (lambda (f84820 f84821) (if (fx= f84821 0) (car f84820) (list-ref (cdr f84820) (fx- f84821 1))))
# == eliminate-set!  ==>
# (lambda (f84820 f84821) (let ((f84820 f84820) (f84821 f84821)) (if (fx= f84821 0) (car f84820) (list-ref (cdr f84820) (fx- f84821 1)))))
# == close-free-variables  ==>
# (closure (f84820 f84821) (list-ref) (let ((f84820 f84820) (f84821 f84821)) (if (fx= f84821 0) (car f84820) (list-ref (cdr f84820) (fx- f84821 1)))))
# == eliminate-quote  ==>
# (closure (f84820 f84821) (list-ref) (let ((f84820 f84820) (f84821 f84821)) (if (fx= f84821 0) (car f84820) (list-ref (cdr f84820) (fx- f84821 1)))))
# == eliminate-when/unless  ==>
# (closure (f84820 f84821) (list-ref) (let ((f84820 f84820) (f84821 f84821)) (if (fx= f84821 0) (car f84820) (list-ref (cdr f84820) (fx- f84821 1)))))
# == eliminate-cond  ==>
# (closure (f84820 f84821) (list-ref) (let ((f84820 f84820) (f84821 f84821)) (if (fx= f84821 0) (car f84820) (list-ref (cdr f84820) (fx- f84821 1)))))
# == external-symbols  ==>
# (closure (f84820 f84821) ((primitive-ref list-ref)) (let ((f84820 f84820) (f84821 f84821)) (if (fx= f84821 0) (car f84820) ((primitive-ref list-ref) (cdr f84820) (fx- f84821 1)))))
# emit-expr (closure (f84820 f84821) ((primitive-ref list-ref)) (let ((f84820 f84820) (f84821 f84821)) (if (fx= f84821 0) (car f84820) ((primitive-ref list-ref) (cdr f84820) (fx- f84821 1)))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f84820 f84821) ((primitive-ref list-ref)) (let ((f84820 f84820) (f84821 f84821)) (if (fx= f84821 0) (car f84820) ((primitive-ref list-ref) (cdr f84820) (fx- f84821 1)))))
    movl $_L_752121, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_752122            # jump around closure body
_L_752121:
# check argument count
    cmp $8,%eax
    je _L_752123
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_752123:
# emit-tail-expr
# si=-16
# env=((f84821 . -12) (f84820 . -8) ((primitive-ref list-ref) . 4))
# expr=(let ((f84820 f84820) (f84821 f84821)) (if (fx= f84821 0) (car f84820) ((primitive-ref list-ref) (cdr f84820) (fx- f84821 1))))
# emit-tail-let
#  si   = -16
#  env  = ((f84821 . -12) (f84820 . -8) ((primitive-ref list-ref) . 4))
#  bindings = ((f84820 f84820) (f84821 f84821))
#  body = (if (fx= f84821 0) (car f84820) ((primitive-ref list-ref) (cdr f84820) (fx- f84821 1)))
# emit-expr f84820
# emit-variable-ref
# env=((f84821 . -12) (f84820 . -8) ((primitive-ref list-ref) . 4))
# var=f84820
    movl -8(%esp), %eax  # stack load f84820
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f84821
# emit-variable-ref
# env=((f84821 . -12) (f84820 . -8) ((primitive-ref list-ref) . 4))
# var=f84821
    movl -12(%esp), %eax  # stack load f84821
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f84821 . -20) (f84820 . -16) (f84821 . -12) (f84820 . -8) ((primitive-ref list-ref) . 4))
# expr=(if (fx= f84821 0) (car f84820) ((primitive-ref list-ref) (cdr f84820) (fx- f84821 1)))
# emit-expr (fx= f84821 0)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752126"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752126:
    movl %eax, -24(%esp)
# emit-expr f84821
# emit-variable-ref
# env=((f84821 . -20) (f84820 . -16) (f84821 . -12) (f84820 . -8) ((primitive-ref list-ref) . 4))
# var=f84821
    movl -20(%esp), %eax  # stack load f84821
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752127"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752127:
    cmp -24(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_752124
# emit-tail-expr
# si=-24
# env=((f84821 . -20) (f84820 . -16) (f84821 . -12) (f84820 . -8) ((primitive-ref list-ref) . 4))
# expr=(car f84820)
# tail primcall
# emit-expr f84820
# emit-variable-ref
# env=((f84821 . -20) (f84820 . -16) (f84821 . -12) (f84820 . -8) ((primitive-ref list-ref) . 4))
# var=f84820
    movl -16(%esp), %eax  # stack load f84820
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_752128
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752128:
    movl -1(%eax), %eax
#return from tail (car f84820)
    ret
    jmp _L_752125
_L_752124:
# emit-tail-expr
# si=-24
# env=((f84821 . -20) (f84820 . -16) (f84821 . -12) (f84820 . -8) ((primitive-ref list-ref) . 4))
# expr=((primitive-ref list-ref) (cdr f84820) (fx- f84821 1))
# emit-tail-funcall
#    si   =-24
#    env  = ((f84821 . -20) (f84820 . -16) (f84821 . -12) (f84820 . -8) ((primitive-ref list-ref) . 4))
#    expr = (funcall (primitive-ref list-ref) (cdr f84820) (fx- f84821 1))
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr (cdr f84820)
# emit-expr f84820
# emit-variable-ref
# env=((f84821 . -20) (f84820 . -16) (f84821 . -12) (f84820 . -8) ((primitive-ref list-ref) . 4))
# var=f84820
    movl -16(%esp), %eax  # stack load f84820
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_752129
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752129:
    movl 3(%eax), %eax
    mov %eax, -28(%esp)    # arg (cdr f84820)
# emit-expr (fx- f84821 1)
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752130"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $84,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752130:
    movl %eax, -32(%esp)
# emit-expr f84821
# emit-variable-ref
# env=((f84821 . -20) (f84820 . -16) (f84821 . -12) (f84820 . -8) ((primitive-ref list-ref) . 4))
# var=f84821
    movl -20(%esp), %eax  # stack load f84821
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752131"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $84,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752131:
    subl -32(%esp), %eax
    mov %eax, -32(%esp)    # arg (fx- f84821 1)
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
_L_752125:
    .align 4,0x90
_L_752122:
     movl %eax, list$mref
# == explicit-begins  ==>
# (lambda (l) (if (null? l) 0 (fxadd1 (list-length (cdr l)))))
# == eliminate-let*  ==>
# (lambda (l) (if (null? l) 0 (fxadd1 (list-length (cdr l)))))
# == uniquify-variables  ==>
# (lambda (f84822) (if (null? f84822) 0 (fxadd1 (list-length (cdr f84822)))))
# == vectorize-letrec  ==>
# (lambda (f84822) (if (null? f84822) 0 (fxadd1 (list-length (cdr f84822)))))
# == eliminate-set!  ==>
# (lambda (f84822) (let ((f84822 f84822)) (if (null? f84822) 0 (fxadd1 (list-length (cdr f84822))))))
# == close-free-variables  ==>
# (closure (f84822) (list-length) (let ((f84822 f84822)) (if (null? f84822) 0 (fxadd1 (list-length (cdr f84822))))))
# == eliminate-quote  ==>
# (closure (f84822) (list-length) (let ((f84822 f84822)) (if (null? f84822) 0 (fxadd1 (list-length (cdr f84822))))))
# == eliminate-when/unless  ==>
# (closure (f84822) (list-length) (let ((f84822 f84822)) (if (null? f84822) 0 (fxadd1 (list-length (cdr f84822))))))
# == eliminate-cond  ==>
# (closure (f84822) (list-length) (let ((f84822 f84822)) (if (null? f84822) 0 (fxadd1 (list-length (cdr f84822))))))
# == external-symbols  ==>
# (closure (f84822) ((primitive-ref list-length)) (let ((f84822 f84822)) (if (null? f84822) 0 (fxadd1 ((primitive-ref list-length) (cdr f84822))))))
# emit-expr (closure (f84822) ((primitive-ref list-length)) (let ((f84822 f84822)) (if (null? f84822) 0 (fxadd1 ((primitive-ref list-length) (cdr f84822))))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f84822) ((primitive-ref list-length)) (let ((f84822 f84822)) (if (null? f84822) 0 (fxadd1 ((primitive-ref list-length) (cdr f84822))))))
    movl $_L_752132, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref list-length) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_752133            # jump around closure body
_L_752132:
# check argument count
    cmp $4,%eax
    je _L_752134
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_752134:
# emit-tail-expr
# si=-12
# env=((f84822 . -8) ((primitive-ref list-length) . 4))
# expr=(let ((f84822 f84822)) (if (null? f84822) 0 (fxadd1 ((primitive-ref list-length) (cdr f84822)))))
# emit-tail-let
#  si   = -12
#  env  = ((f84822 . -8) ((primitive-ref list-length) . 4))
#  bindings = ((f84822 f84822))
#  body = (if (null? f84822) 0 (fxadd1 ((primitive-ref list-length) (cdr f84822))))
# emit-expr f84822
# emit-variable-ref
# env=((f84822 . -8) ((primitive-ref list-length) . 4))
# var=f84822
    movl -8(%esp), %eax  # stack load f84822
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f84822 . -12) (f84822 . -8) ((primitive-ref list-length) . 4))
# expr=(if (null? f84822) 0 (fxadd1 ((primitive-ref list-length) (cdr f84822))))
# emit-expr (null? f84822)
# emit-expr f84822
# emit-variable-ref
# env=((f84822 . -12) (f84822 . -8) ((primitive-ref list-length) . 4))
# var=f84822
    movl -12(%esp), %eax  # stack load f84822
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_752135
# emit-tail-expr
# si=-16
# env=((f84822 . -12) (f84822 . -8) ((primitive-ref list-length) . 4))
# expr=0
    movl $0, %eax     # immed 0
    ret                  # immediate tail return
    jmp _L_752136
_L_752135:
# emit-tail-expr
# si=-16
# env=((f84822 . -12) (f84822 . -8) ((primitive-ref list-length) . 4))
# expr=(fxadd1 ((primitive-ref list-length) (cdr f84822)))
# tail primcall
# emit-expr ((primitive-ref list-length) (cdr f84822))
# funcall
#    si   =-16
#    env  = ((f84822 . -12) (f84822 . -8) ((primitive-ref list-length) . 4))
#    expr = (funcall (primitive-ref list-length) (cdr f84822))
# emit-expr (primitive-ref list-length)
    .extern list$mlength
    movl list$mlength,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752137"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752137":
   movl %eax,  -24(%esp)  # stash funcall-oper in closure slot
# emit-expr (cdr f84822)
# emit-expr f84822
# emit-variable-ref
# env=((f84822 . -12) (f84822 . -8) ((primitive-ref list-length) . 4))
# var=f84822
    movl -12(%esp), %eax  # stack load f84822
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_752138
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752138:
    movl 3(%eax), %eax
    mov %eax, -28(%esp)  # arg (cdr f84822)
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
    je "_L_752139"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $48,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752139:
     addl $4, %eax
#return from tail (fxadd1 ((primitive-ref list-length) (cdr f84822)))
    ret
_L_752136:
    .align 4,0x90
_L_752133:
     movl %eax, list$mlength
# == explicit-begins  ==>
# (letrec ((fill-vector (lambda (v k args) (if (null? args) v (begin (vector-set! v k (car args)) (fill-vector v (fxadd1 k) (cdr args))))))) (lambda args (let ((v (make-vector (list-length args)))) (fill-vector v 0 args))))
# == eliminate-let*  ==>
# (letrec ((fill-vector (lambda (v k args) (if (null? args) v (begin (vector-set! v k (car args)) (fill-vector v (fxadd1 k) (cdr args))))))) (lambda args (let ((v (make-vector (list-length args)))) (fill-vector v 0 args))))
# == uniquify-variables  ==>
# (letrec ((f84823 (lambda (f84827 f84828 f84829) (if (null? f84829) f84827 (begin (vector-set! f84827 f84828 (car f84829)) (f84823 f84827 (fxadd1 f84828) (cdr f84829))))))) (lambda f84833 (let ((f84835 (make-vector (list-length f84833)))) (f84823 f84835 0 f84833))))
# == vectorize-letrec  ==>
# (let ((f84823 (make-vector 1))) (begin (begin (vector-set! f84823 0 (lambda (f84827 f84828 f84829) (if (null? f84829) f84827 (begin (vector-set! f84827 f84828 (car f84829)) ((vector-ref f84823 0) f84827 (fxadd1 f84828) (cdr f84829))))))) (lambda f84833 (let ((f84835 (make-vector (list-length f84833)))) ((vector-ref f84823 0) f84835 0 f84833)))))
# == eliminate-set!  ==>
# (let ((f84823 (make-vector 1))) (begin (begin (vector-set! f84823 0 (lambda (f84827 f84828 f84829) (let ((f84827 f84827) (f84828 f84828) (f84829 f84829)) (if (null? f84829) f84827 (begin (vector-set! f84827 f84828 (car f84829)) ((vector-ref f84823 0) f84827 (fxadd1 f84828) (cdr f84829)))))))) (lambda f84833 (let () (let ((f84835 (make-vector (list-length f84833)))) ((vector-ref f84823 0) f84835 0 f84833))))))
# == close-free-variables  ==>
# (let ((f84823 (make-vector 1))) (begin (begin (vector-set! f84823 0 (closure (f84827 f84828 f84829) (f84823) (let ((f84827 f84827) (f84828 f84828) (f84829 f84829)) (if (null? f84829) f84827 (begin (vector-set! f84827 f84828 (car f84829)) ((vector-ref f84823 0) f84827 (fxadd1 f84828) (cdr f84829)))))))) (closure f84833 (f84823) (let () (let ((f84835 (make-vector (list-length f84833)))) ((vector-ref f84823 0) f84835 0 f84833))))))
# == eliminate-quote  ==>
# (let ((f84823 (make-vector 1))) (begin (begin (vector-set! f84823 0 (closure (f84827 f84828 f84829) (f84823) (let ((f84827 f84827) (f84828 f84828) (f84829 f84829)) (if (null? f84829) f84827 (begin (vector-set! f84827 f84828 (car f84829)) ((vector-ref f84823 0) f84827 (fxadd1 f84828) (cdr f84829)))))))) (closure f84833 (f84823) (let () (let ((f84835 (make-vector (list-length f84833)))) ((vector-ref f84823 0) f84835 0 f84833))))))
# == eliminate-when/unless  ==>
# (let ((f84823 (make-vector 1))) (begin (begin (vector-set! f84823 0 (closure (f84827 f84828 f84829) (f84823) (let ((f84827 f84827) (f84828 f84828) (f84829 f84829)) (if (null? f84829) f84827 (begin (vector-set! f84827 f84828 (car f84829)) ((vector-ref f84823 0) f84827 (fxadd1 f84828) (cdr f84829)))))))) (closure f84833 (f84823) (let () (let ((f84835 (make-vector (list-length f84833)))) ((vector-ref f84823 0) f84835 0 f84833))))))
# == eliminate-cond  ==>
# (let ((f84823 (make-vector 1))) (begin (begin (vector-set! f84823 0 (closure (f84827 f84828 f84829) (f84823) (let ((f84827 f84827) (f84828 f84828) (f84829 f84829)) (if (null? f84829) f84827 (begin (vector-set! f84827 f84828 (car f84829)) ((vector-ref f84823 0) f84827 (fxadd1 f84828) (cdr f84829)))))))) (closure f84833 (f84823) (let () (let ((f84835 (make-vector (list-length f84833)))) ((vector-ref f84823 0) f84835 0 f84833))))))
# == external-symbols  ==>
# (let ((f84823 (make-vector 1))) (begin (begin (vector-set! f84823 0 (closure (f84827 f84828 f84829) (f84823) (let ((f84827 f84827) (f84828 f84828) (f84829 f84829)) (if (null? f84829) f84827 (begin (vector-set! f84827 f84828 (car f84829)) ((vector-ref f84823 0) f84827 (fxadd1 f84828) (cdr f84829)))))))) (closure f84833 (f84823) (let () (let ((f84835 (make-vector ((primitive-ref list-length) f84833)))) ((vector-ref f84823 0) f84835 0 f84833))))))
# emit-expr (let ((f84823 (make-vector 1))) (begin (begin (vector-set! f84823 0 (closure (f84827 f84828 f84829) (f84823) (let ((f84827 f84827) (f84828 f84828) (f84829 f84829)) (if (null? f84829) f84827 (begin (vector-set! f84827 f84828 (car f84829)) ((vector-ref f84823 0) f84827 (fxadd1 f84828) (cdr f84829)))))))) (closure f84833 (f84823) (let () (let ((f84835 (make-vector ((primitive-ref list-length) f84833)))) ((vector-ref f84823 0) f84835 0 f84833))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f84823 (make-vector 1)))
#  body = (begin (begin (vector-set! f84823 0 (closure (f84827 f84828 f84829) (f84823) (let ((f84827 f84827) (f84828 f84828) (f84829 f84829)) (if (null? f84829) f84827 (begin (vector-set! f84827 f84828 (car f84829)) ((vector-ref f84823 0) f84827 (fxadd1 f84828) (cdr f84829)))))))) (closure f84833 (f84823) (let () (let ((f84835 (make-vector ((primitive-ref list-length) f84833)))) ((vector-ref f84823 0) f84835 0 f84833)))))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752140"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752140:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_752141
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752141:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f84823 0 (closure (f84827 f84828 f84829) (f84823) (let ((f84827 f84827) (f84828 f84828) (f84829 f84829)) (if (null? f84829) f84827 (begin (vector-set! f84827 f84828 (car f84829)) ((vector-ref f84823 0) f84827 (fxadd1 f84828) (cdr f84829)))))))) (closure f84833 (f84823) (let () (let ((f84835 (make-vector ((primitive-ref list-length) f84833)))) ((vector-ref f84823 0) f84835 0 f84833)))))
# emit-begin
#   expr=(begin (begin (vector-set! f84823 0 (closure (f84827 f84828 f84829) (f84823) (let ((f84827 f84827) (f84828 f84828) (f84829 f84829)) (if (null? f84829) f84827 (begin (vector-set! f84827 f84828 (car f84829)) ((vector-ref f84823 0) f84827 (fxadd1 f84828) (cdr f84829)))))))) (closure f84833 (f84823) (let () (let ((f84835 (make-vector ((primitive-ref list-length) f84833)))) ((vector-ref f84823 0) f84835 0 f84833)))))
#   env=((f84823 . 0))
# emit-expr (begin (vector-set! f84823 0 (closure (f84827 f84828 f84829) (f84823) (let ((f84827 f84827) (f84828 f84828) (f84829 f84829)) (if (null? f84829) f84827 (begin (vector-set! f84827 f84828 (car f84829)) ((vector-ref f84823 0) f84827 (fxadd1 f84828) (cdr f84829))))))))
# emit-begin
#   expr=(begin (vector-set! f84823 0 (closure (f84827 f84828 f84829) (f84823) (let ((f84827 f84827) (f84828 f84828) (f84829 f84829)) (if (null? f84829) f84827 (begin (vector-set! f84827 f84828 (car f84829)) ((vector-ref f84823 0) f84827 (fxadd1 f84828) (cdr f84829))))))))
#   env=((f84823 . 0))
# emit-expr (vector-set! f84823 0 (closure (f84827 f84828 f84829) (f84823) (let ((f84827 f84827) (f84828 f84828) (f84829 f84829)) (if (null? f84829) f84827 (begin (vector-set! f84827 f84828 (car f84829)) ((vector-ref f84823 0) f84827 (fxadd1 f84828) (cdr f84829)))))))
# emit-expr f84823
# emit-variable-ref
# env=((f84823 . 0))
# var=f84823
    movl 0(%esp), %eax  # stack load f84823
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752142
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752142:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752143"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752143:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752145
    cmp  $0,%eax
    jge _L_752144
_L_752145:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752144:
    movl %eax, -8(%esp)
# emit-expr (closure (f84827 f84828 f84829) (f84823) (let ((f84827 f84827) (f84828 f84828) (f84829 f84829)) (if (null? f84829) f84827 (begin (vector-set! f84827 f84828 (car f84829)) ((vector-ref f84823 0) f84827 (fxadd1 f84828) (cdr f84829))))))
# emit-closure
# si = -12
# env = ((f84823 . 0))
# expr = (closure (f84827 f84828 f84829) (f84823) (let ((f84827 f84827) (f84828 f84828) (f84829 f84829)) (if (null? f84829) f84827 (begin (vector-set! f84827 f84828 (car f84829)) ((vector-ref f84823 0) f84827 (fxadd1 f84828) (cdr f84829))))))
    movl $_L_752146, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f84823 . 0))
# var=f84823
    movl 0(%esp), %eax  # stack load f84823
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f84823
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_752147            # jump around closure body
_L_752146:
# check argument count
    cmp $12,%eax
    je _L_752148
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_752148:
# emit-tail-expr
# si=-20
# env=((f84829 . -16) (f84828 . -12) (f84827 . -8) (f84823 . 4) (f84823 . 0))
# expr=(let ((f84827 f84827) (f84828 f84828) (f84829 f84829)) (if (null? f84829) f84827 (begin (vector-set! f84827 f84828 (car f84829)) ((vector-ref f84823 0) f84827 (fxadd1 f84828) (cdr f84829)))))
# emit-tail-let
#  si   = -20
#  env  = ((f84829 . -16) (f84828 . -12) (f84827 . -8) (f84823 . 4) (f84823 . 0))
#  bindings = ((f84827 f84827) (f84828 f84828) (f84829 f84829))
#  body = (if (null? f84829) f84827 (begin (vector-set! f84827 f84828 (car f84829)) ((vector-ref f84823 0) f84827 (fxadd1 f84828) (cdr f84829))))
# emit-expr f84827
# emit-variable-ref
# env=((f84829 . -16) (f84828 . -12) (f84827 . -8) (f84823 . 4) (f84823 . 0))
# var=f84827
    movl -8(%esp), %eax  # stack load f84827
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-expr f84828
# emit-variable-ref
# env=((f84829 . -16) (f84828 . -12) (f84827 . -8) (f84823 . 4) (f84823 . 0))
# var=f84828
    movl -12(%esp), %eax  # stack load f84828
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f84829
# emit-variable-ref
# env=((f84829 . -16) (f84828 . -12) (f84827 . -8) (f84823 . 4) (f84823 . 0))
# var=f84829
    movl -16(%esp), %eax  # stack load f84829
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-tail-expr
# si=-32
# env=((f84829 . -28) (f84828 . -24) (f84827 . -20) (f84829 . -16) (f84828 . -12) (f84827 . -8) (f84823 . 4) (f84823 . 0))
# expr=(if (null? f84829) f84827 (begin (vector-set! f84827 f84828 (car f84829)) ((vector-ref f84823 0) f84827 (fxadd1 f84828) (cdr f84829))))
# emit-expr (null? f84829)
# emit-expr f84829
# emit-variable-ref
# env=((f84829 . -28) (f84828 . -24) (f84827 . -20) (f84829 . -16) (f84828 . -12) (f84827 . -8) (f84823 . 4) (f84823 . 0))
# var=f84829
    movl -28(%esp), %eax  # stack load f84829
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_752149
# emit-tail-expr
# si=-32
# env=((f84829 . -28) (f84828 . -24) (f84827 . -20) (f84829 . -16) (f84828 . -12) (f84827 . -8) (f84823 . 4) (f84823 . 0))
# expr=f84827
# emit-tail-variable-ref
# emit-variable-ref
# env=((f84829 . -28) (f84828 . -24) (f84827 . -20) (f84829 . -16) (f84828 . -12) (f84827 . -8) (f84823 . 4) (f84823 . 0))
# var=f84827
    movl -20(%esp), %eax  # stack load f84827
# end emit-variable-ref
    ret
# end emit-tail-variable ref
    jmp _L_752150
_L_752149:
# emit-tail-expr
# si=-32
# env=((f84829 . -28) (f84828 . -24) (f84827 . -20) (f84829 . -16) (f84828 . -12) (f84827 . -8) (f84823 . 4) (f84823 . 0))
# expr=(begin (vector-set! f84827 f84828 (car f84829)) ((vector-ref f84823 0) f84827 (fxadd1 f84828) (cdr f84829)))
# tail-begin (begin (vector-set! f84827 f84828 (car f84829)) ((vector-ref f84823 0) f84827 (fxadd1 f84828) (cdr f84829)))
#   env=((f84829 . -28) (f84828 . -24) (f84827 . -20) (f84829 . -16) (f84828 . -12) (f84827 . -8) (f84823 . 4) (f84823 . 0))
# emit-expr (vector-set! f84827 f84828 (car f84829))
# emit-expr f84827
# emit-variable-ref
# env=((f84829 . -28) (f84828 . -24) (f84827 . -20) (f84829 . -16) (f84828 . -12) (f84827 . -8) (f84823 . 4) (f84823 . 0))
# var=f84827
    movl -20(%esp), %eax  # stack load f84827
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752151
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752151:
    movl %eax, -32(%esp)
# emit-expr f84828
# emit-variable-ref
# env=((f84829 . -28) (f84828 . -24) (f84827 . -20) (f84829 . -16) (f84828 . -12) (f84827 . -8) (f84823 . 4) (f84823 . 0))
# var=f84828
    movl -24(%esp), %eax  # stack load f84828
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752152"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752152:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752154
    cmp  $0,%eax
    jge _L_752153
_L_752154:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752153:
    movl %eax, -36(%esp)
# emit-expr (car f84829)
# emit-expr f84829
# emit-variable-ref
# env=((f84829 . -28) (f84828 . -24) (f84827 . -20) (f84829 . -16) (f84828 . -12) (f84827 . -8) (f84823 . 4) (f84823 . 0))
# var=f84829
    movl -28(%esp), %eax  # stack load f84829
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_752155
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752155:
    movl -1(%eax), %eax
    movl -32(%esp), %ebx
    movl -36(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-tail-expr
# si=-32
# env=((f84829 . -28) (f84828 . -24) (f84827 . -20) (f84829 . -16) (f84828 . -12) (f84827 . -8) (f84823 . 4) (f84823 . 0))
# expr=(begin ((vector-ref f84823 0) f84827 (fxadd1 f84828) (cdr f84829)))
# tail-begin (begin ((vector-ref f84823 0) f84827 (fxadd1 f84828) (cdr f84829)))
#   env=((f84829 . -28) (f84828 . -24) (f84827 . -20) (f84829 . -16) (f84828 . -12) (f84827 . -8) (f84823 . 4) (f84823 . 0))
# emit-tail-expr
# si=-32
# env=((f84829 . -28) (f84828 . -24) (f84827 . -20) (f84829 . -16) (f84828 . -12) (f84827 . -8) (f84823 . 4) (f84823 . 0))
# expr=((vector-ref f84823 0) f84827 (fxadd1 f84828) (cdr f84829))
# emit-tail-funcall
#    si   =-32
#    env  = ((f84829 . -28) (f84828 . -24) (f84827 . -20) (f84829 . -16) (f84828 . -12) (f84827 . -8) (f84823 . 4) (f84823 . 0))
#    expr = (funcall (vector-ref f84823 0) f84827 (fxadd1 f84828) (cdr f84829))
# emit-expr (vector-ref f84823 0)
# emit-expr f84823
# emit-variable-ref
# env=((f84829 . -28) (f84828 . -24) (f84827 . -20) (f84829 . -16) (f84828 . -12) (f84827 . -8) (f84823 . 4) (f84823 . 0))
# var=f84823
    movl 2(%edi), %eax  # frame load f84823
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752156
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752156:
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752157"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752157:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752159
    cmp  $0,%eax
    jge _L_752158
_L_752159:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752158:
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -32(%esp)  # stash funcall-oper in next closure slot
# emit-expr f84827
# emit-variable-ref
# env=((f84829 . -28) (f84828 . -24) (f84827 . -20) (f84829 . -16) (f84828 . -12) (f84827 . -8) (f84823 . 4) (f84823 . 0))
# var=f84827
    movl -20(%esp), %eax  # stack load f84827
# end emit-variable-ref
    mov %eax, -36(%esp)    # arg f84827
# emit-expr (fxadd1 f84828)
# emit-expr f84828
# emit-variable-ref
# env=((f84829 . -28) (f84828 . -24) (f84827 . -20) (f84829 . -16) (f84828 . -12) (f84827 . -8) (f84823 . 4) (f84823 . 0))
# var=f84828
    movl -24(%esp), %eax  # stack load f84828
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752160"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $48,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752160:
     addl $4, %eax
    mov %eax, -40(%esp)    # arg (fxadd1 f84828)
# emit-expr (cdr f84829)
# emit-expr f84829
# emit-variable-ref
# env=((f84829 . -28) (f84828 . -24) (f84827 . -20) (f84829 . -16) (f84828 . -12) (f84827 . -8) (f84823 . 4) (f84823 . 0))
# var=f84829
    movl -28(%esp), %eax  # stack load f84829
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_752161
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752161:
    movl 3(%eax), %eax
    mov %eax, -44(%esp)    # arg (cdr f84829)
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
_L_752150:
    .align 4,0x90
_L_752147:
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f84823 . 0))
# emit-expr (begin (closure f84833 (f84823) (let () (let ((f84835 (make-vector ((primitive-ref list-length) f84833)))) ((vector-ref f84823 0) f84835 0 f84833)))))
# emit-begin
#   expr=(begin (closure f84833 (f84823) (let () (let ((f84835 (make-vector ((primitive-ref list-length) f84833)))) ((vector-ref f84823 0) f84835 0 f84833)))))
#   env=((f84823 . 0))
# emit-expr (closure f84833 (f84823) (let () (let ((f84835 (make-vector ((primitive-ref list-length) f84833)))) ((vector-ref f84823 0) f84835 0 f84833))))
# emit-closure
# si = -4
# env = ((f84823 . 0))
# expr = (closure f84833 (f84823) (let () (let ((f84835 (make-vector ((primitive-ref list-length) f84833)))) ((vector-ref f84823 0) f84835 0 f84833))))
    movl $_L_752162, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f84823 . 0))
# var=f84823
    movl 0(%esp), %eax  # stack load f84823
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f84823
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_752163            # jump around closure body
_L_752162:
# check argument count
    cmp $0,%eax
    jge _L_752164
# invoke error handler eh_argcount_min
    .extern eh$uargcount$umin
    movl eh$uargcount$umin, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_752164:
# emit-build-varargs-list
    movl $63, %esi       # args <- () 
    lea -4(%esp),%edi    # edi <- esp-4
    subl %eax, %edi      # edi <- esp-4-eax    addr of arg[K+N] on stack
_L_752166:
    lea -4(%esp),%ebx    # addr of arg[K] on stack
    cmp %edi, %ebx       # while edi <> esp+(si+4)
    je _L_752165
    movl (%edi),%ebx     # arg i -> car
    movl %ebx, 0(%ebp)
    movl %esi, 4(%ebp)  # esi -> cdr
    movl %ebp, %esi
    addl $1, %esi       # tag as pair
    addl $8,%ebp         # bump heap ptr
    addl $4,%edi         # move to next previous arg from the end
    jmp _L_752166
_L_752165:
    movl %esi, -8(%esp)  # set args
# emit-tail-expr
# si=-12
# env=((f84833 . -8) (f84823 . 4) (f84823 . 0))
# expr=(let () (let ((f84835 (make-vector ((primitive-ref list-length) f84833)))) ((vector-ref f84823 0) f84835 0 f84833)))
# emit-tail-let
#  si   = -12
#  env  = ((f84833 . -8) (f84823 . 4) (f84823 . 0))
#  bindings = ()
#  body = (let ((f84835 (make-vector ((primitive-ref list-length) f84833)))) ((vector-ref f84823 0) f84835 0 f84833))
# emit-tail-expr
# si=-12
# env=((f84833 . -8) (f84823 . 4) (f84823 . 0))
# expr=(let ((f84835 (make-vector ((primitive-ref list-length) f84833)))) ((vector-ref f84823 0) f84835 0 f84833))
# emit-tail-let
#  si   = -12
#  env  = ((f84833 . -8) (f84823 . 4) (f84823 . 0))
#  bindings = ((f84835 (make-vector ((primitive-ref list-length) f84833))))
#  body = ((vector-ref f84823 0) f84835 0 f84833)
# emit-expr (make-vector ((primitive-ref list-length) f84833))
# make-vector ((primitive-ref list-length) f84833)
# emit-expr ((primitive-ref list-length) f84833)
# funcall
#    si   =-12
#    env  = ((f84833 . -8) (f84823 . 4) (f84823 . 0))
#    expr = (funcall (primitive-ref list-length) f84833)
# emit-expr (primitive-ref list-length)
    .extern list$mlength
    movl list$mlength,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752167"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752167":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr f84833
# emit-variable-ref
# env=((f84833 . -8) (f84823 . 4) (f84823 . 0))
# var=f84833
    movl -8(%esp), %eax  # stack load f84833
# end emit-variable-ref
    mov %eax, -24(%esp)  # arg f84833
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
    je "_L_752168"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752168:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_752169
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752169:
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
# env=((f84835 . -12) (f84833 . -8) (f84823 . 4) (f84823 . 0))
# expr=((vector-ref f84823 0) f84835 0 f84833)
# emit-tail-funcall
#    si   =-16
#    env  = ((f84835 . -12) (f84833 . -8) (f84823 . 4) (f84823 . 0))
#    expr = (funcall (vector-ref f84823 0) f84835 0 f84833)
# emit-expr (vector-ref f84823 0)
# emit-expr f84823
# emit-variable-ref
# env=((f84835 . -12) (f84833 . -8) (f84823 . 4) (f84823 . 0))
# var=f84823
    movl 2(%edi), %eax  # frame load f84823
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752170
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752170:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752171"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752171:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752173
    cmp  $0,%eax
    jge _L_752172
_L_752173:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752172:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr f84835
# emit-variable-ref
# env=((f84835 . -12) (f84833 . -8) (f84823 . 4) (f84823 . 0))
# var=f84835
    movl -12(%esp), %eax  # stack load f84835
# end emit-variable-ref
    mov %eax, -20(%esp)    # arg f84835
# emit-expr 0
    movl $0, %eax     # immed 0
    mov %eax, -24(%esp)    # arg 0
# emit-expr f84833
# emit-variable-ref
# env=((f84835 . -12) (f84833 . -8) (f84823 . 4) (f84823 . 0))
# var=f84833
    movl -8(%esp), %eax  # stack load f84833
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f84833
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
_L_752163:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f84823 . 0))
     movl %eax, vector
# == explicit-begins  ==>
# (let* ((write-stderr (lambda (s) (foreign-call "s_write" 2 s (string-length s)))) (write-errmsg (lambda (sym emsg) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))))) (lambda (sym emsg) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))
# == eliminate-let*  ==>
# (let ((write-stderr (lambda (s) (foreign-call "s_write" 2 s (string-length s))))) (let ((write-errmsg (lambda (sym emsg) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))))) (lambda (sym emsg) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1)))))
# == uniquify-variables  ==>
# (let ((f84836 (lambda (f84837) (foreign-call "s_write" 2 f84837 (string-length f84837))))) (let ((f84845 (lambda (f84846 f84847) (begin (f84836 "error:") (f84836 (symbol->string f84846)) (f84836 ": ") (f84836 f84847) (f84836 "\n"))))) (lambda (f84850 f84851) (begin (f84845 f84850 f84851) (foreign-call "s_exit" 1)))))
# == vectorize-letrec  ==>
# (let ((f84836 (lambda (f84837) (foreign-call "s_write" 2 f84837 (string-length f84837))))) (let ((f84845 (lambda (f84846 f84847) (begin (f84836 "error:") (f84836 (symbol->string f84846)) (f84836 ": ") (f84836 f84847) (f84836 "\n"))))) (lambda (f84850 f84851) (begin (f84845 f84850 f84851) (foreign-call "s_exit" 1)))))
# == eliminate-set!  ==>
# (let ((f84836 (lambda (f84837) (let ((f84837 f84837)) (foreign-call "s_write" 2 f84837 (string-length f84837)))))) (let ((f84845 (lambda (f84846 f84847) (let ((f84846 f84846) (f84847 f84847)) (begin (f84836 "error:") (f84836 (symbol->string f84846)) (f84836 ": ") (f84836 f84847) (f84836 "\n")))))) (lambda (f84850 f84851) (let ((f84850 f84850) (f84851 f84851)) (begin (f84845 f84850 f84851) (foreign-call "s_exit" 1))))))
# == close-free-variables  ==>
# (let ((f84836 (closure (f84837) () (let ((f84837 f84837)) (foreign-call "s_write" 2 f84837 (string-length f84837)))))) (let ((f84845 (closure (f84846 f84847) (f84836 f84836 f84836 f84836 f84836) (let ((f84846 f84846) (f84847 f84847)) (begin (f84836 "error:") (f84836 (symbol->string f84846)) (f84836 ": ") (f84836 f84847) (f84836 "\n")))))) (closure (f84850 f84851) (f84845) (let ((f84850 f84850) (f84851 f84851)) (begin (f84845 f84850 f84851) (foreign-call "s_exit" 1))))))
# == eliminate-quote  ==>
# (let ((f84836 (closure (f84837) () (let ((f84837 f84837)) (foreign-call "s_write" 2 f84837 (string-length f84837)))))) (let ((f84845 (closure (f84846 f84847) (f84836 f84836 f84836 f84836 f84836) (let ((f84846 f84846) (f84847 f84847)) (begin (f84836 "error:") (f84836 (symbol->string f84846)) (f84836 ": ") (f84836 f84847) (f84836 "\n")))))) (closure (f84850 f84851) (f84845) (let ((f84850 f84850) (f84851 f84851)) (begin (f84845 f84850 f84851) (foreign-call "s_exit" 1))))))
# == eliminate-when/unless  ==>
# (let ((f84836 (closure (f84837) () (let ((f84837 f84837)) (foreign-call "s_write" 2 f84837 (string-length f84837)))))) (let ((f84845 (closure (f84846 f84847) (f84836 f84836 f84836 f84836 f84836) (let ((f84846 f84846) (f84847 f84847)) (begin (f84836 "error:") (f84836 (symbol->string f84846)) (f84836 ": ") (f84836 f84847) (f84836 "\n")))))) (closure (f84850 f84851) (f84845) (let ((f84850 f84850) (f84851 f84851)) (begin (f84845 f84850 f84851) (foreign-call "s_exit" 1))))))
# == eliminate-cond  ==>
# (let ((f84836 (closure (f84837) () (let ((f84837 f84837)) (foreign-call "s_write" 2 f84837 (string-length f84837)))))) (let ((f84845 (closure (f84846 f84847) (f84836 f84836 f84836 f84836 f84836) (let ((f84846 f84846) (f84847 f84847)) (begin (f84836 "error:") (f84836 (symbol->string f84846)) (f84836 ": ") (f84836 f84847) (f84836 "\n")))))) (closure (f84850 f84851) (f84845) (let ((f84850 f84850) (f84851 f84851)) (begin (f84845 f84850 f84851) (foreign-call "s_exit" 1))))))
# == external-symbols  ==>
# (let ((f84836 (closure (f84837) () (let ((f84837 f84837)) (foreign-call "s_write" 2 f84837 (string-length f84837)))))) (let ((f84845 (closure (f84846 f84847) (f84836 f84836 f84836 f84836 f84836) (let ((f84846 f84846) (f84847 f84847)) (begin (f84836 "error:") (f84836 (symbol->string f84846)) (f84836 ": ") (f84836 f84847) (f84836 "\n")))))) (closure (f84850 f84851) (f84845) (let ((f84850 f84850) (f84851 f84851)) (begin (f84845 f84850 f84851) (foreign-call "s_exit" 1))))))
# emit-expr (let ((f84836 (closure (f84837) () (let ((f84837 f84837)) (foreign-call "s_write" 2 f84837 (string-length f84837)))))) (let ((f84845 (closure (f84846 f84847) (f84836 f84836 f84836 f84836 f84836) (let ((f84846 f84846) (f84847 f84847)) (begin (f84836 "error:") (f84836 (symbol->string f84846)) (f84836 ": ") (f84836 f84847) (f84836 "\n")))))) (closure (f84850 f84851) (f84845) (let ((f84850 f84850) (f84851 f84851)) (begin (f84845 f84850 f84851) (foreign-call "s_exit" 1))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f84836 (closure (f84837) () (let ((f84837 f84837)) (foreign-call "s_write" 2 f84837 (string-length f84837))))))
#  body = (let ((f84845 (closure (f84846 f84847) (f84836 f84836 f84836 f84836 f84836) (let ((f84846 f84846) (f84847 f84847)) (begin (f84836 "error:") (f84836 (symbol->string f84846)) (f84836 ": ") (f84836 f84847) (f84836 "\n")))))) (closure (f84850 f84851) (f84845) (let ((f84850 f84850) (f84851 f84851)) (begin (f84845 f84850 f84851) (foreign-call "s_exit" 1)))))
# emit-expr (closure (f84837) () (let ((f84837 f84837)) (foreign-call "s_write" 2 f84837 (string-length f84837))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f84837) () (let ((f84837 f84837)) (foreign-call "s_write" 2 f84837 (string-length f84837))))
    movl $_L_752174, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_752175            # jump around closure body
_L_752174:
# check argument count
    cmp $4,%eax
    je _L_752176
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_752176:
# emit-tail-expr
# si=-12
# env=((f84837 . -8))
# expr=(let ((f84837 f84837)) (foreign-call "s_write" 2 f84837 (string-length f84837)))
# emit-tail-let
#  si   = -12
#  env  = ((f84837 . -8))
#  bindings = ((f84837 f84837))
#  body = (foreign-call "s_write" 2 f84837 (string-length f84837))
# emit-expr f84837
# emit-variable-ref
# env=((f84837 . -8))
# var=f84837
    movl -8(%esp), %eax  # stack load f84837
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f84837 . -12) (f84837 . -8))
# expr=(foreign-call "s_write" 2 f84837 (string-length f84837))
    movl %ecx,-16(%esp)
    movl %esp,-20(%esp)
# emit-expr (string-length f84837)
# emit-expr f84837
# emit-variable-ref
# env=((f84837 . -12) (f84837 . -8))
# var=f84837
    movl -12(%esp), %eax  # stack load f84837
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_752177
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752177:
    movl -6(%eax), %eax
    movl %eax, -24(%esp)
# emit-expr f84837
# emit-variable-ref
# env=((f84837 . -12) (f84837 . -8))
# var=f84837
    movl -12(%esp), %eax  # stack load f84837
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
_L_752175:
    movl %eax, 0(%esp)  # stack save
# emit-expr (let ((f84845 (closure (f84846 f84847) (f84836 f84836 f84836 f84836 f84836) (let ((f84846 f84846) (f84847 f84847)) (begin (f84836 "error:") (f84836 (symbol->string f84846)) (f84836 ": ") (f84836 f84847) (f84836 "\n")))))) (closure (f84850 f84851) (f84845) (let ((f84850 f84850) (f84851 f84851)) (begin (f84845 f84850 f84851) (foreign-call "s_exit" 1)))))
# emit-let
#  si   = -4
#  env  = ((f84836 . 0))
#  bindings = ((f84845 (closure (f84846 f84847) (f84836 f84836 f84836 f84836 f84836) (let ((f84846 f84846) (f84847 f84847)) (begin (f84836 "error:") (f84836 (symbol->string f84846)) (f84836 ": ") (f84836 f84847) (f84836 "\n"))))))
#  body = (closure (f84850 f84851) (f84845) (let ((f84850 f84850) (f84851 f84851)) (begin (f84845 f84850 f84851) (foreign-call "s_exit" 1))))
# emit-expr (closure (f84846 f84847) (f84836 f84836 f84836 f84836 f84836) (let ((f84846 f84846) (f84847 f84847)) (begin (f84836 "error:") (f84836 (symbol->string f84846)) (f84836 ": ") (f84836 f84847) (f84836 "\n"))))
# emit-closure
# si = -4
# env = ((f84836 . 0))
# expr = (closure (f84846 f84847) (f84836 f84836 f84836 f84836 f84836) (let ((f84846 f84846) (f84847 f84847)) (begin (f84836 "error:") (f84836 (symbol->string f84846)) (f84836 ": ") (f84836 f84847) (f84836 "\n"))))
    movl $_L_752178, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f84836 . 0))
# var=f84836
    movl 0(%esp), %eax  # stack load f84836
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f84836
# emit-variable-ref
# env=((f84836 . 0))
# var=f84836
    movl 0(%esp), %eax  # stack load f84836
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f84836
# emit-variable-ref
# env=((f84836 . 0))
# var=f84836
    movl 0(%esp), %eax  # stack load f84836
# end emit-variable-ref
   movl  %eax, 12(%ebp)  # f84836
# emit-variable-ref
# env=((f84836 . 0))
# var=f84836
    movl 0(%esp), %eax  # stack load f84836
# end emit-variable-ref
   movl  %eax, 16(%ebp)  # f84836
# emit-variable-ref
# env=((f84836 . 0))
# var=f84836
    movl 0(%esp), %eax  # stack load f84836
# end emit-variable-ref
   movl  %eax, 20(%ebp)  # f84836
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $24, %ebp     # bump ebp
    jmp _L_752179            # jump around closure body
_L_752178:
# check argument count
    cmp $8,%eax
    je _L_752180
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_752180:
# emit-tail-expr
# si=-16
# env=((f84847 . -12) (f84846 . -8) (f84836 . 20) (f84836 . 16) (f84836 . 12) (f84836 . 8) (f84836 . 4) (f84836 . 0))
# expr=(let ((f84846 f84846) (f84847 f84847)) (begin (f84836 "error:") (f84836 (symbol->string f84846)) (f84836 ": ") (f84836 f84847) (f84836 "\n")))
# emit-tail-let
#  si   = -16
#  env  = ((f84847 . -12) (f84846 . -8) (f84836 . 20) (f84836 . 16) (f84836 . 12) (f84836 . 8) (f84836 . 4) (f84836 . 0))
#  bindings = ((f84846 f84846) (f84847 f84847))
#  body = (begin (f84836 "error:") (f84836 (symbol->string f84846)) (f84836 ": ") (f84836 f84847) (f84836 "\n"))
# emit-expr f84846
# emit-variable-ref
# env=((f84847 . -12) (f84846 . -8) (f84836 . 20) (f84836 . 16) (f84836 . 12) (f84836 . 8) (f84836 . 4) (f84836 . 0))
# var=f84846
    movl -8(%esp), %eax  # stack load f84846
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f84847
# emit-variable-ref
# env=((f84847 . -12) (f84846 . -8) (f84836 . 20) (f84836 . 16) (f84836 . 12) (f84836 . 8) (f84836 . 4) (f84836 . 0))
# var=f84847
    movl -12(%esp), %eax  # stack load f84847
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f84847 . -20) (f84846 . -16) (f84847 . -12) (f84846 . -8) (f84836 . 20) (f84836 . 16) (f84836 . 12) (f84836 . 8) (f84836 . 4) (f84836 . 0))
# expr=(begin (f84836 "error:") (f84836 (symbol->string f84846)) (f84836 ": ") (f84836 f84847) (f84836 "\n"))
# tail-begin (begin (f84836 "error:") (f84836 (symbol->string f84846)) (f84836 ": ") (f84836 f84847) (f84836 "\n"))
#   env=((f84847 . -20) (f84846 . -16) (f84847 . -12) (f84846 . -8) (f84836 . 20) (f84836 . 16) (f84836 . 12) (f84836 . 8) (f84836 . 4) (f84836 . 0))
# emit-expr (f84836 "error:")
# funcall
#    si   =-24
#    env  = ((f84847 . -20) (f84846 . -16) (f84847 . -12) (f84846 . -8) (f84836 . 20) (f84836 . 16) (f84836 . 12) (f84836 . 8) (f84836 . 4) (f84836 . 0))
#    expr = (funcall f84836 "error:")
# emit-expr f84836
# emit-variable-ref
# env=((f84847 . -20) (f84846 . -16) (f84847 . -12) (f84846 . -8) (f84836 . 20) (f84836 . 16) (f84836 . 12) (f84836 . 8) (f84836 . 4) (f84836 . 0))
# var=f84836
    movl 18(%edi), %eax  # frame load f84836
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752181"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752181":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr "error:"
# string literal
    jmp _L_752183
    .align 8,0x90
_L_752182 :
    .int 24
    .ascii "error:"
_L_752183:
    movl $_L_752182, %eax
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
# env=((f84847 . -20) (f84846 . -16) (f84847 . -12) (f84846 . -8) (f84836 . 20) (f84836 . 16) (f84836 . 12) (f84836 . 8) (f84836 . 4) (f84836 . 0))
# expr=(begin (f84836 (symbol->string f84846)) (f84836 ": ") (f84836 f84847) (f84836 "\n"))
# tail-begin (begin (f84836 (symbol->string f84846)) (f84836 ": ") (f84836 f84847) (f84836 "\n"))
#   env=((f84847 . -20) (f84846 . -16) (f84847 . -12) (f84846 . -8) (f84836 . 20) (f84836 . 16) (f84836 . 12) (f84836 . 8) (f84836 . 4) (f84836 . 0))
# emit-expr (f84836 (symbol->string f84846))
# funcall
#    si   =-24
#    env  = ((f84847 . -20) (f84846 . -16) (f84847 . -12) (f84846 . -8) (f84836 . 20) (f84836 . 16) (f84836 . 12) (f84836 . 8) (f84836 . 4) (f84836 . 0))
#    expr = (funcall f84836 (symbol->string f84846))
# emit-expr f84836
# emit-variable-ref
# env=((f84847 . -20) (f84846 . -16) (f84847 . -12) (f84846 . -8) (f84836 . 20) (f84836 . 16) (f84836 . 12) (f84836 . 8) (f84836 . 4) (f84836 . 0))
# var=f84836
    movl 18(%edi), %eax  # frame load f84836
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752184"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752184":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr (symbol->string f84846)
# symbol->string f84846
# emit-expr f84846
# emit-variable-ref
# env=((f84847 . -20) (f84846 . -16) (f84847 . -12) (f84846 . -8) (f84836 . 20) (f84836 . 16) (f84836 . 12) (f84836 . 8) (f84836 . 4) (f84836 . 0))
# var=f84846
    movl -16(%esp), %eax  # stack load f84846
# end emit-variable-ref
    movl -3(%eax), %eax
    mov %eax, -36(%esp)  # arg (symbol->string f84846)
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((f84847 . -20) (f84846 . -16) (f84847 . -12) (f84846 . -8) (f84836 . 20) (f84836 . 16) (f84836 . 12) (f84836 . 8) (f84836 . 4) (f84836 . 0))
# expr=(begin (f84836 ": ") (f84836 f84847) (f84836 "\n"))
# tail-begin (begin (f84836 ": ") (f84836 f84847) (f84836 "\n"))
#   env=((f84847 . -20) (f84846 . -16) (f84847 . -12) (f84846 . -8) (f84836 . 20) (f84836 . 16) (f84836 . 12) (f84836 . 8) (f84836 . 4) (f84836 . 0))
# emit-expr (f84836 ": ")
# funcall
#    si   =-24
#    env  = ((f84847 . -20) (f84846 . -16) (f84847 . -12) (f84846 . -8) (f84836 . 20) (f84836 . 16) (f84836 . 12) (f84836 . 8) (f84836 . 4) (f84836 . 0))
#    expr = (funcall f84836 ": ")
# emit-expr f84836
# emit-variable-ref
# env=((f84847 . -20) (f84846 . -16) (f84847 . -12) (f84846 . -8) (f84836 . 20) (f84836 . 16) (f84836 . 12) (f84836 . 8) (f84836 . 4) (f84836 . 0))
# var=f84836
    movl 18(%edi), %eax  # frame load f84836
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752185"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752185":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr ": "
# string literal
    jmp _L_752187
    .align 8,0x90
_L_752186 :
    .int 8
    .ascii ": "
_L_752187:
    movl $_L_752186, %eax
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
# env=((f84847 . -20) (f84846 . -16) (f84847 . -12) (f84846 . -8) (f84836 . 20) (f84836 . 16) (f84836 . 12) (f84836 . 8) (f84836 . 4) (f84836 . 0))
# expr=(begin (f84836 f84847) (f84836 "\n"))
# tail-begin (begin (f84836 f84847) (f84836 "\n"))
#   env=((f84847 . -20) (f84846 . -16) (f84847 . -12) (f84846 . -8) (f84836 . 20) (f84836 . 16) (f84836 . 12) (f84836 . 8) (f84836 . 4) (f84836 . 0))
# emit-expr (f84836 f84847)
# funcall
#    si   =-24
#    env  = ((f84847 . -20) (f84846 . -16) (f84847 . -12) (f84846 . -8) (f84836 . 20) (f84836 . 16) (f84836 . 12) (f84836 . 8) (f84836 . 4) (f84836 . 0))
#    expr = (funcall f84836 f84847)
# emit-expr f84836
# emit-variable-ref
# env=((f84847 . -20) (f84846 . -16) (f84847 . -12) (f84846 . -8) (f84836 . 20) (f84836 . 16) (f84836 . 12) (f84836 . 8) (f84836 . 4) (f84836 . 0))
# var=f84836
    movl 18(%edi), %eax  # frame load f84836
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752188"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752188":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f84847
# emit-variable-ref
# env=((f84847 . -20) (f84846 . -16) (f84847 . -12) (f84846 . -8) (f84836 . 20) (f84836 . 16) (f84836 . 12) (f84836 . 8) (f84836 . 4) (f84836 . 0))
# var=f84847
    movl -20(%esp), %eax  # stack load f84847
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f84847
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((f84847 . -20) (f84846 . -16) (f84847 . -12) (f84846 . -8) (f84836 . 20) (f84836 . 16) (f84836 . 12) (f84836 . 8) (f84836 . 4) (f84836 . 0))
# expr=(begin (f84836 "\n"))
# tail-begin (begin (f84836 "\n"))
#   env=((f84847 . -20) (f84846 . -16) (f84847 . -12) (f84846 . -8) (f84836 . 20) (f84836 . 16) (f84836 . 12) (f84836 . 8) (f84836 . 4) (f84836 . 0))
# emit-tail-expr
# si=-24
# env=((f84847 . -20) (f84846 . -16) (f84847 . -12) (f84846 . -8) (f84836 . 20) (f84836 . 16) (f84836 . 12) (f84836 . 8) (f84836 . 4) (f84836 . 0))
# expr=(f84836 "\n")
# emit-tail-funcall
#    si   =-24
#    env  = ((f84847 . -20) (f84846 . -16) (f84847 . -12) (f84846 . -8) (f84836 . 20) (f84836 . 16) (f84836 . 12) (f84836 . 8) (f84836 . 4) (f84836 . 0))
#    expr = (funcall f84836 "\n")
# emit-expr f84836
# emit-variable-ref
# env=((f84847 . -20) (f84846 . -16) (f84847 . -12) (f84846 . -8) (f84836 . 20) (f84836 . 16) (f84836 . 12) (f84836 . 8) (f84836 . 4) (f84836 . 0))
# var=f84836
    movl 18(%edi), %eax  # frame load f84836
# end emit-variable-ref
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr "\n"
# string literal
    jmp _L_752190
    .align 8,0x90
_L_752189 :
    .int 4
    .ascii "\n"
_L_752190:
    movl $_L_752189, %eax
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
_L_752179:
    movl %eax, -4(%esp)  # stack save
# emit-expr (closure (f84850 f84851) (f84845) (let ((f84850 f84850) (f84851 f84851)) (begin (f84845 f84850 f84851) (foreign-call "s_exit" 1))))
# emit-closure
# si = -8
# env = ((f84845 . -4) (f84836 . 0))
# expr = (closure (f84850 f84851) (f84845) (let ((f84850 f84850) (f84851 f84851)) (begin (f84845 f84850 f84851) (foreign-call "s_exit" 1))))
    movl $_L_752191, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f84845 . -4) (f84836 . 0))
# var=f84845
    movl -4(%esp), %eax  # stack load f84845
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f84845
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_752192            # jump around closure body
_L_752191:
# check argument count
    cmp $8,%eax
    je _L_752193
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_752193:
# emit-tail-expr
# si=-16
# env=((f84851 . -12) (f84850 . -8) (f84845 . 4) (f84845 . -4) (f84836 . 0))
# expr=(let ((f84850 f84850) (f84851 f84851)) (begin (f84845 f84850 f84851) (foreign-call "s_exit" 1)))
# emit-tail-let
#  si   = -16
#  env  = ((f84851 . -12) (f84850 . -8) (f84845 . 4) (f84845 . -4) (f84836 . 0))
#  bindings = ((f84850 f84850) (f84851 f84851))
#  body = (begin (f84845 f84850 f84851) (foreign-call "s_exit" 1))
# emit-expr f84850
# emit-variable-ref
# env=((f84851 . -12) (f84850 . -8) (f84845 . 4) (f84845 . -4) (f84836 . 0))
# var=f84850
    movl -8(%esp), %eax  # stack load f84850
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f84851
# emit-variable-ref
# env=((f84851 . -12) (f84850 . -8) (f84845 . 4) (f84845 . -4) (f84836 . 0))
# var=f84851
    movl -12(%esp), %eax  # stack load f84851
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f84851 . -20) (f84850 . -16) (f84851 . -12) (f84850 . -8) (f84845 . 4) (f84845 . -4) (f84836 . 0))
# expr=(begin (f84845 f84850 f84851) (foreign-call "s_exit" 1))
# tail-begin (begin (f84845 f84850 f84851) (foreign-call "s_exit" 1))
#   env=((f84851 . -20) (f84850 . -16) (f84851 . -12) (f84850 . -8) (f84845 . 4) (f84845 . -4) (f84836 . 0))
# emit-expr (f84845 f84850 f84851)
# funcall
#    si   =-24
#    env  = ((f84851 . -20) (f84850 . -16) (f84851 . -12) (f84850 . -8) (f84845 . 4) (f84845 . -4) (f84836 . 0))
#    expr = (funcall f84845 f84850 f84851)
# emit-expr f84845
# emit-variable-ref
# env=((f84851 . -20) (f84850 . -16) (f84851 . -12) (f84850 . -8) (f84845 . 4) (f84845 . -4) (f84836 . 0))
# var=f84845
    movl 2(%edi), %eax  # frame load f84845
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752194"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752194":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f84850
# emit-variable-ref
# env=((f84851 . -20) (f84850 . -16) (f84851 . -12) (f84850 . -8) (f84845 . 4) (f84845 . -4) (f84836 . 0))
# var=f84850
    movl -16(%esp), %eax  # stack load f84850
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f84850
# emit-expr f84851
# emit-variable-ref
# env=((f84851 . -20) (f84850 . -16) (f84851 . -12) (f84850 . -8) (f84845 . 4) (f84845 . -4) (f84836 . 0))
# var=f84851
    movl -20(%esp), %eax  # stack load f84851
# end emit-variable-ref
    mov %eax, -40(%esp)  # arg f84851
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((f84851 . -20) (f84850 . -16) (f84851 . -12) (f84850 . -8) (f84845 . 4) (f84845 . -4) (f84836 . 0))
# expr=(begin (foreign-call "s_exit" 1))
# tail-begin (begin (foreign-call "s_exit" 1))
#   env=((f84851 . -20) (f84850 . -16) (f84851 . -12) (f84850 . -8) (f84845 . 4) (f84845 . -4) (f84836 . 0))
# emit-tail-expr
# si=-24
# env=((f84851 . -20) (f84850 . -16) (f84851 . -12) (f84850 . -8) (f84845 . 4) (f84845 . -4) (f84836 . 0))
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
_L_752192:
     movl %eax, error
# == explicit-begins  ==>
# (let ((p (quote ()))) (begin (set! p (cons (quote procedure?) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote symbol-value) p)) (set! p (cons (quote symbol->string) p)) (set! p (cons (quote make-symbol) p)) (set! p (cons (quote symbol?) p)) (set! p (cons (quote string-set!) p)) (set! p (cons (quote string-ref) p)) (set! p (cons (quote string-length) p)) (set! p (cons (quote string?) p)) (set! p (cons (quote make-string) p)) (set! p (cons (quote vector-ref) p)) (set! p (cons (quote vector-set!) p)) (set! p (cons (quote vector-length) p)) (set! p (cons (quote make-vector) p)) (set! p (cons (quote vector?) p)) (set! p (cons (quote set-cdr!) p)) (set! p (cons (quote set-car!) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote cons) p)) (set! p (cons (quote pair?) p)) (set! p (cons (quote fx*) p)) (set! p (cons (quote fx-) p)) (set! p (cons (quote fx+) p)) (set! p (cons (quote fx>=) p)) (set! p (cons (quote fx>) p)) (set! p (cons (quote fx<=) p)) (set! p (cons (quote fx<) p)) (set! p (cons (quote fx=) p)) (set! p (cons (quote fxzero?) p)) (set! p (cons (quote fxsub1) p)) (set! p (cons (quote fxadd1) p)) (set! p (cons (quote fxlogor) p)) (set! p (cons (quote fxlogand) p)) (set! p (cons (quote fxlognot) p)) (set! p (cons (quote char=?) p)) (set! p (cons (quote eq?) p)) (set! p (cons (quote not) p)) (set! p (cons (quote boolean?) p)) (set! p (cons (quote fixnum?) p)) (set! p (cons (quote char?) p)) (set! p (cons (quote null?) p)) (set! p (cons (quote char->fixnum) p)) (set! p (cons (quote fixnum->char) p)) (lambda () p)))
# == eliminate-let*  ==>
# (let ((p (quote ()))) (begin (set! p (cons (quote procedure?) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote symbol-value) p)) (set! p (cons (quote symbol->string) p)) (set! p (cons (quote make-symbol) p)) (set! p (cons (quote symbol?) p)) (set! p (cons (quote string-set!) p)) (set! p (cons (quote string-ref) p)) (set! p (cons (quote string-length) p)) (set! p (cons (quote string?) p)) (set! p (cons (quote make-string) p)) (set! p (cons (quote vector-ref) p)) (set! p (cons (quote vector-set!) p)) (set! p (cons (quote vector-length) p)) (set! p (cons (quote make-vector) p)) (set! p (cons (quote vector?) p)) (set! p (cons (quote set-cdr!) p)) (set! p (cons (quote set-car!) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote cons) p)) (set! p (cons (quote pair?) p)) (set! p (cons (quote fx*) p)) (set! p (cons (quote fx-) p)) (set! p (cons (quote fx+) p)) (set! p (cons (quote fx>=) p)) (set! p (cons (quote fx>) p)) (set! p (cons (quote fx<=) p)) (set! p (cons (quote fx<) p)) (set! p (cons (quote fx=) p)) (set! p (cons (quote fxzero?) p)) (set! p (cons (quote fxsub1) p)) (set! p (cons (quote fxadd1) p)) (set! p (cons (quote fxlogor) p)) (set! p (cons (quote fxlogand) p)) (set! p (cons (quote fxlognot) p)) (set! p (cons (quote char=?) p)) (set! p (cons (quote eq?) p)) (set! p (cons (quote not) p)) (set! p (cons (quote boolean?) p)) (set! p (cons (quote fixnum?) p)) (set! p (cons (quote char?) p)) (set! p (cons (quote null?) p)) (set! p (cons (quote char->fixnum) p)) (set! p (cons (quote fixnum->char) p)) (lambda () p)))
# == uniquify-variables  ==>
# (let ((f84852 (quote ()))) (begin (set! f84852 (cons (quote procedure?) f84852)) (set! f84852 (cons (quote cdr) f84852)) (set! f84852 (cons (quote car) f84852)) (set! f84852 (cons (quote symbol-value) f84852)) (set! f84852 (cons (quote symbol->string) f84852)) (set! f84852 (cons (quote make-symbol) f84852)) (set! f84852 (cons (quote symbol?) f84852)) (set! f84852 (cons (quote string-set!) f84852)) (set! f84852 (cons (quote string-ref) f84852)) (set! f84852 (cons (quote string-length) f84852)) (set! f84852 (cons (quote string?) f84852)) (set! f84852 (cons (quote make-string) f84852)) (set! f84852 (cons (quote vector-ref) f84852)) (set! f84852 (cons (quote vector-set!) f84852)) (set! f84852 (cons (quote vector-length) f84852)) (set! f84852 (cons (quote make-vector) f84852)) (set! f84852 (cons (quote vector?) f84852)) (set! f84852 (cons (quote set-cdr!) f84852)) (set! f84852 (cons (quote set-car!) f84852)) (set! f84852 (cons (quote cdr) f84852)) (set! f84852 (cons (quote car) f84852)) (set! f84852 (cons (quote cons) f84852)) (set! f84852 (cons (quote pair?) f84852)) (set! f84852 (cons (quote fx*) f84852)) (set! f84852 (cons (quote fx-) f84852)) (set! f84852 (cons (quote fx+) f84852)) (set! f84852 (cons (quote fx>=) f84852)) (set! f84852 (cons (quote fx>) f84852)) (set! f84852 (cons (quote fx<=) f84852)) (set! f84852 (cons (quote fx<) f84852)) (set! f84852 (cons (quote fx=) f84852)) (set! f84852 (cons (quote fxzero?) f84852)) (set! f84852 (cons (quote fxsub1) f84852)) (set! f84852 (cons (quote fxadd1) f84852)) (set! f84852 (cons (quote fxlogor) f84852)) (set! f84852 (cons (quote fxlogand) f84852)) (set! f84852 (cons (quote fxlognot) f84852)) (set! f84852 (cons (quote char=?) f84852)) (set! f84852 (cons (quote eq?) f84852)) (set! f84852 (cons (quote not) f84852)) (set! f84852 (cons (quote boolean?) f84852)) (set! f84852 (cons (quote fixnum?) f84852)) (set! f84852 (cons (quote char?) f84852)) (set! f84852 (cons (quote null?) f84852)) (set! f84852 (cons (quote char->fixnum) f84852)) (set! f84852 (cons (quote fixnum->char) f84852)) (lambda () f84852)))
# == vectorize-letrec  ==>
# (let ((f84852 (quote ()))) (begin (set! f84852 (cons (quote procedure?) f84852)) (set! f84852 (cons (quote cdr) f84852)) (set! f84852 (cons (quote car) f84852)) (set! f84852 (cons (quote symbol-value) f84852)) (set! f84852 (cons (quote symbol->string) f84852)) (set! f84852 (cons (quote make-symbol) f84852)) (set! f84852 (cons (quote symbol?) f84852)) (set! f84852 (cons (quote string-set!) f84852)) (set! f84852 (cons (quote string-ref) f84852)) (set! f84852 (cons (quote string-length) f84852)) (set! f84852 (cons (quote string?) f84852)) (set! f84852 (cons (quote make-string) f84852)) (set! f84852 (cons (quote vector-ref) f84852)) (set! f84852 (cons (quote vector-set!) f84852)) (set! f84852 (cons (quote vector-length) f84852)) (set! f84852 (cons (quote make-vector) f84852)) (set! f84852 (cons (quote vector?) f84852)) (set! f84852 (cons (quote set-cdr!) f84852)) (set! f84852 (cons (quote set-car!) f84852)) (set! f84852 (cons (quote cdr) f84852)) (set! f84852 (cons (quote car) f84852)) (set! f84852 (cons (quote cons) f84852)) (set! f84852 (cons (quote pair?) f84852)) (set! f84852 (cons (quote fx*) f84852)) (set! f84852 (cons (quote fx-) f84852)) (set! f84852 (cons (quote fx+) f84852)) (set! f84852 (cons (quote fx>=) f84852)) (set! f84852 (cons (quote fx>) f84852)) (set! f84852 (cons (quote fx<=) f84852)) (set! f84852 (cons (quote fx<) f84852)) (set! f84852 (cons (quote fx=) f84852)) (set! f84852 (cons (quote fxzero?) f84852)) (set! f84852 (cons (quote fxsub1) f84852)) (set! f84852 (cons (quote fxadd1) f84852)) (set! f84852 (cons (quote fxlogor) f84852)) (set! f84852 (cons (quote fxlogand) f84852)) (set! f84852 (cons (quote fxlognot) f84852)) (set! f84852 (cons (quote char=?) f84852)) (set! f84852 (cons (quote eq?) f84852)) (set! f84852 (cons (quote not) f84852)) (set! f84852 (cons (quote boolean?) f84852)) (set! f84852 (cons (quote fixnum?) f84852)) (set! f84852 (cons (quote char?) f84852)) (set! f84852 (cons (quote null?) f84852)) (set! f84852 (cons (quote char->fixnum) f84852)) (set! f84852 (cons (quote fixnum->char) f84852)) (lambda () f84852)))
# == eliminate-set!  ==>
# (let ((f84852 (vector (quote ())))) (begin (vector-set! f84852 0 (cons (quote procedure?) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote cdr) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote car) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote symbol-value) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote symbol->string) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote make-symbol) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote symbol?) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote string-set!) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote string-ref) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote string-length) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote string?) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote make-string) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote vector-ref) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote vector-set!) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote vector-length) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote make-vector) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote vector?) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote set-cdr!) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote set-car!) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote cdr) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote car) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote cons) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote pair?) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote fx*) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote fx-) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote fx+) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote fx>=) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote fx>) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote fx<=) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote fx<) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote fx=) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote fxzero?) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote fxsub1) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote fxadd1) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote fxlogor) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote fxlogand) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote fxlognot) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote char=?) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote eq?) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote not) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote boolean?) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote fixnum?) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote char?) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote null?) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote char->fixnum) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote fixnum->char) (vector-ref f84852 0))) (lambda () (let () (vector-ref f84852 0)))))
# == close-free-variables  ==>
# (let ((f84852 (vector (quote ())))) (begin (vector-set! f84852 0 (cons (quote procedure?) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote cdr) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote car) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote symbol-value) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote symbol->string) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote make-symbol) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote symbol?) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote string-set!) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote string-ref) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote string-length) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote string?) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote make-string) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote vector-ref) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote vector-set!) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote vector-length) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote make-vector) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote vector?) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote set-cdr!) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote set-car!) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote cdr) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote car) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote cons) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote pair?) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote fx*) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote fx-) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote fx+) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote fx>=) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote fx>) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote fx<=) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote fx<) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote fx=) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote fxzero?) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote fxsub1) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote fxadd1) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote fxlogor) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote fxlogand) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote fxlognot) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote char=?) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote eq?) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote not) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote boolean?) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote fixnum?) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote char?) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote null?) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote char->fixnum) (vector-ref f84852 0))) (vector-set! f84852 0 (cons (quote fixnum->char) (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0)))))
# == eliminate-quote  ==>
# (let ((f84852 (vector ()))) (begin (vector-set! f84852 0 (cons (string->symbol "procedure?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "symbol-value") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "symbol->string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "make-symbol") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "symbol?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "string-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "string-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "string-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "string?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "make-string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "vector-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "vector-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "vector-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0)))))
# == eliminate-when/unless  ==>
# (let ((f84852 (vector ()))) (begin (vector-set! f84852 0 (cons (string->symbol "procedure?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "symbol-value") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "symbol->string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "make-symbol") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "symbol?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "string-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "string-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "string-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "string?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "make-string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "vector-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "vector-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "vector-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0)))))
# == eliminate-cond  ==>
# (let ((f84852 (vector ()))) (begin (vector-set! f84852 0 (cons (string->symbol "procedure?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "symbol-value") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "symbol->string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "make-symbol") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "symbol?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "string-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "string-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "string-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "string?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "make-string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "vector-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "vector-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "vector-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons (string->symbol "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0)))))
# == external-symbols  ==>
# (let ((f84852 ((primitive-ref vector) ()))) (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0)))))
# emit-expr (let ((f84852 ((primitive-ref vector) ()))) (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0)))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f84852 ((primitive-ref vector) ())))
#  body = (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
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
    je "_L_752195"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752195":
   movl %eax,  -8(%esp)  # stash funcall-oper in closure slot
# emit-expr ()
    movl $63, %eax     # immed ()
    mov %eax, -12(%esp)  # arg ()
    movl -8(%esp), %edi   # load new closure to %edi
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752196
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752196:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752197"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752197:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752199
    cmp  $0,%eax
    jge _L_752198
_L_752199:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752198:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "procedure?") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "procedure?")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "procedure?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752200"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752200":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "procedure?"
# string literal
    jmp _L_752202
    .align 8,0x90
_L_752201 :
    .int 40
    .ascii "procedure?"
_L_752202:
    movl $_L_752201, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg procedure?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752203
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752203:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752204"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752204:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752206
    cmp  $0,%eax
    jge _L_752205
_L_752206:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752205:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752207
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752207:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752208"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752208:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752210
    cmp  $0,%eax
    jge _L_752209
_L_752210:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752209:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "cdr") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "cdr")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "cdr")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752211"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752211":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cdr"
# string literal
    jmp _L_752213
    .align 8,0x90
_L_752212 :
    .int 12
    .ascii "cdr"
_L_752213:
    movl $_L_752212, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cdr
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752214
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752214:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752215"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752215:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752217
    cmp  $0,%eax
    jge _L_752216
_L_752217:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752216:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752218
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752218:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752219"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752219:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752221
    cmp  $0,%eax
    jge _L_752220
_L_752221:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752220:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "car") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "car")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "car")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752222"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752222":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "car"
# string literal
    jmp _L_752224
    .align 8,0x90
_L_752223 :
    .int 12
    .ascii "car"
_L_752224:
    movl $_L_752223, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg car
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752225
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752225:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752226"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752226:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752228
    cmp  $0,%eax
    jge _L_752227
_L_752228:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752227:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752229
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752229:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752230"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752230:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752232
    cmp  $0,%eax
    jge _L_752231
_L_752232:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752231:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "symbol-value") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "symbol-value")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol-value")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752233"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752233":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol-value"
# string literal
    jmp _L_752235
    .align 8,0x90
_L_752234 :
    .int 48
    .ascii "symbol-value"
_L_752235:
    movl $_L_752234, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol-value
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752236
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752236:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752237"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752237:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752239
    cmp  $0,%eax
    jge _L_752238
_L_752239:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752238:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752240
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752240:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752241"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752241:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752243
    cmp  $0,%eax
    jge _L_752242
_L_752243:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752242:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "symbol->string") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "symbol->string")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol->string")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752244"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752244":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol->string"
# string literal
    jmp _L_752246
    .align 8,0x90
_L_752245 :
    .int 56
    .ascii "symbol->string"
_L_752246:
    movl $_L_752245, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol->string
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752247
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752247:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752248"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752248:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752250
    cmp  $0,%eax
    jge _L_752249
_L_752250:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752249:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752251
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752251:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752252"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752252:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752254
    cmp  $0,%eax
    jge _L_752253
_L_752254:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752253:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "make-symbol") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "make-symbol")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-symbol")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752255"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752255":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-symbol"
# string literal
    jmp _L_752257
    .align 8,0x90
_L_752256 :
    .int 44
    .ascii "make-symbol"
_L_752257:
    movl $_L_752256, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-symbol
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752258
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752258:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752259"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752259:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752261
    cmp  $0,%eax
    jge _L_752260
_L_752261:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752260:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752262
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752262:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752263"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752263:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752265
    cmp  $0,%eax
    jge _L_752264
_L_752265:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752264:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "symbol?") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "symbol?")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752266"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752266":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol?"
# string literal
    jmp _L_752268
    .align 8,0x90
_L_752267 :
    .int 28
    .ascii "symbol?"
_L_752268:
    movl $_L_752267, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752269
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752269:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752270"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752270:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752272
    cmp  $0,%eax
    jge _L_752271
_L_752272:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752271:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752273
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752273:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752274"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752274:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752276
    cmp  $0,%eax
    jge _L_752275
_L_752276:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752275:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "string-set!") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "string-set!")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-set!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752277"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752277":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-set!"
# string literal
    jmp _L_752279
    .align 8,0x90
_L_752278 :
    .int 44
    .ascii "string-set!"
_L_752279:
    movl $_L_752278, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-set!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752280
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752280:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752281"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752281:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752283
    cmp  $0,%eax
    jge _L_752282
_L_752283:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752282:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752284
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752284:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752285"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752285:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752287
    cmp  $0,%eax
    jge _L_752286
_L_752287:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752286:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "string-ref") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "string-ref")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-ref")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752288"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752288":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-ref"
# string literal
    jmp _L_752290
    .align 8,0x90
_L_752289 :
    .int 40
    .ascii "string-ref"
_L_752290:
    movl $_L_752289, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-ref
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752291
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752291:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752292"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752292:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752294
    cmp  $0,%eax
    jge _L_752293
_L_752294:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752293:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752295
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752295:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752296"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752296:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752298
    cmp  $0,%eax
    jge _L_752297
_L_752298:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752297:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-length") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "string-length") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "string-length")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-length")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752299"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752299":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-length"
# string literal
    jmp _L_752301
    .align 8,0x90
_L_752300 :
    .int 52
    .ascii "string-length"
_L_752301:
    movl $_L_752300, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-length
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752302
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752302:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752303"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752303:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752305
    cmp  $0,%eax
    jge _L_752304
_L_752305:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752304:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752306
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752306:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752307"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752307:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752309
    cmp  $0,%eax
    jge _L_752308
_L_752309:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752308:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string?") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "string?") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "string?")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752310"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752310":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string?"
# string literal
    jmp _L_752312
    .align 8,0x90
_L_752311 :
    .int 28
    .ascii "string?"
_L_752312:
    movl $_L_752311, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752313
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752313:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752314"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752314:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752316
    cmp  $0,%eax
    jge _L_752315
_L_752316:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752315:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752317
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752317:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752318"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752318:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752320
    cmp  $0,%eax
    jge _L_752319
_L_752320:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752319:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-string") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "make-string") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "make-string")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-string")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752321"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752321":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-string"
# string literal
    jmp _L_752323
    .align 8,0x90
_L_752322 :
    .int 44
    .ascii "make-string"
_L_752323:
    movl $_L_752322, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-string
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752324
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752324:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752325"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752325:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752327
    cmp  $0,%eax
    jge _L_752326
_L_752327:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752326:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752328
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752328:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752329"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752329:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752331
    cmp  $0,%eax
    jge _L_752330
_L_752331:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752330:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "vector-ref") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "vector-ref")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-ref")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752332"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752332":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-ref"
# string literal
    jmp _L_752334
    .align 8,0x90
_L_752333 :
    .int 40
    .ascii "vector-ref"
_L_752334:
    movl $_L_752333, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-ref
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752335
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752335:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752336"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752336:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752338
    cmp  $0,%eax
    jge _L_752337
_L_752338:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752337:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752339
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752339:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752340"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752340:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752342
    cmp  $0,%eax
    jge _L_752341
_L_752342:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752341:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "vector-set!") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "vector-set!")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-set!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752343"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752343":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-set!"
# string literal
    jmp _L_752345
    .align 8,0x90
_L_752344 :
    .int 44
    .ascii "vector-set!"
_L_752345:
    movl $_L_752344, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-set!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752346
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752346:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752347"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752347:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752349
    cmp  $0,%eax
    jge _L_752348
_L_752349:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752348:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752350
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752350:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752351"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752351:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752353
    cmp  $0,%eax
    jge _L_752352
_L_752353:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752352:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "vector-length") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "vector-length")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-length")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752354"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752354":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-length"
# string literal
    jmp _L_752356
    .align 8,0x90
_L_752355 :
    .int 52
    .ascii "vector-length"
_L_752356:
    movl $_L_752355, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-length
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752357
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752357:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752358"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752358:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752360
    cmp  $0,%eax
    jge _L_752359
_L_752360:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752359:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752361
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752361:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752362"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752362:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752364
    cmp  $0,%eax
    jge _L_752363
_L_752364:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752363:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "make-vector") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "make-vector")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-vector")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752365"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752365":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-vector"
# string literal
    jmp _L_752367
    .align 8,0x90
_L_752366 :
    .int 44
    .ascii "make-vector"
_L_752367:
    movl $_L_752366, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-vector
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752368
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752368:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752369"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752369:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752371
    cmp  $0,%eax
    jge _L_752370
_L_752371:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752370:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752372
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752372:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752373"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752373:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752375
    cmp  $0,%eax
    jge _L_752374
_L_752375:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752374:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector?") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "vector?") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "vector?")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752376"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752376":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector?"
# string literal
    jmp _L_752378
    .align 8,0x90
_L_752377 :
    .int 28
    .ascii "vector?"
_L_752378:
    movl $_L_752377, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752379
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752379:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752380"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752380:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752382
    cmp  $0,%eax
    jge _L_752381
_L_752382:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752381:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752383
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752383:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752384"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752384:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752386
    cmp  $0,%eax
    jge _L_752385
_L_752386:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752385:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "set-cdr!") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "set-cdr!")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "set-cdr!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752387"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752387":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "set-cdr!"
# string literal
    jmp _L_752389
    .align 8,0x90
_L_752388 :
    .int 32
    .ascii "set-cdr!"
_L_752389:
    movl $_L_752388, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg set-cdr!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752390
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752390:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752391"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752391:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752393
    cmp  $0,%eax
    jge _L_752392
_L_752393:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752392:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752394
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752394:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752395"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752395:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752397
    cmp  $0,%eax
    jge _L_752396
_L_752397:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752396:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "set-car!") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "set-car!")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "set-car!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752398"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752398":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "set-car!"
# string literal
    jmp _L_752400
    .align 8,0x90
_L_752399 :
    .int 32
    .ascii "set-car!"
_L_752400:
    movl $_L_752399, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg set-car!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752401
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752401:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752402"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752402:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752404
    cmp  $0,%eax
    jge _L_752403
_L_752404:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752403:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752405
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752405:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752406"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752406:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752408
    cmp  $0,%eax
    jge _L_752407
_L_752408:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752407:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cdr") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "cdr") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "cdr")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "cdr")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752409"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752409":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cdr"
# string literal
    jmp _L_752411
    .align 8,0x90
_L_752410 :
    .int 12
    .ascii "cdr"
_L_752411:
    movl $_L_752410, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cdr
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752412
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752412:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752413"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752413:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752415
    cmp  $0,%eax
    jge _L_752414
_L_752415:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752414:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752416
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752416:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752417"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752417:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752419
    cmp  $0,%eax
    jge _L_752418
_L_752419:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752418:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "car") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "car") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "car")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "car")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752420"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752420":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "car"
# string literal
    jmp _L_752422
    .align 8,0x90
_L_752421 :
    .int 12
    .ascii "car"
_L_752422:
    movl $_L_752421, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg car
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752423
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752423:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752424"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752424:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752426
    cmp  $0,%eax
    jge _L_752425
_L_752426:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752425:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752427
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752427:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752428"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752428:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752430
    cmp  $0,%eax
    jge _L_752429
_L_752430:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752429:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cons") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "cons") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "cons")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "cons")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752431"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752431":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cons"
# string literal
    jmp _L_752433
    .align 8,0x90
_L_752432 :
    .int 16
    .ascii "cons"
_L_752433:
    movl $_L_752432, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cons
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752434
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752434:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752435"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752435:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752437
    cmp  $0,%eax
    jge _L_752436
_L_752437:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752436:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752438
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752438:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752439"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752439:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752441
    cmp  $0,%eax
    jge _L_752440
_L_752441:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752440:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "pair?") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "pair?") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "pair?")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "pair?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752442"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752442":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "pair?"
# string literal
    jmp _L_752444
    .align 8,0x90
_L_752443 :
    .int 20
    .ascii "pair?"
_L_752444:
    movl $_L_752443, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg pair?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752445
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752445:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752446"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752446:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752448
    cmp  $0,%eax
    jge _L_752447
_L_752448:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752447:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752449
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752449:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752450"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752450:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752452
    cmp  $0,%eax
    jge _L_752451
_L_752452:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752451:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx*") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "fx*") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "fx*")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx*")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752453"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752453":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx*"
# string literal
    jmp _L_752455
    .align 8,0x90
_L_752454 :
    .int 12
    .ascii "fx*"
_L_752455:
    movl $_L_752454, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx*
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752456
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752456:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752457"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752457:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752459
    cmp  $0,%eax
    jge _L_752458
_L_752459:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752458:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752460
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752460:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752461"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752461:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752463
    cmp  $0,%eax
    jge _L_752462
_L_752463:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752462:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx-") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "fx-") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "fx-")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx-")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752464"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752464":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx-"
# string literal
    jmp _L_752466
    .align 8,0x90
_L_752465 :
    .int 12
    .ascii "fx-"
_L_752466:
    movl $_L_752465, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx-
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752467
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752467:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752468"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752468:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752470
    cmp  $0,%eax
    jge _L_752469
_L_752470:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752469:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752471
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752471:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752472"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752472:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752474
    cmp  $0,%eax
    jge _L_752473
_L_752474:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752473:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx+") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "fx+") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "fx+")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx+")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752475"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752475":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx+"
# string literal
    jmp _L_752477
    .align 8,0x90
_L_752476 :
    .int 12
    .ascii "fx+"
_L_752477:
    movl $_L_752476, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx+
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752478
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752478:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752479"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752479:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752481
    cmp  $0,%eax
    jge _L_752480
_L_752481:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752480:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752482
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752482:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752483"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752483:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752485
    cmp  $0,%eax
    jge _L_752484
_L_752485:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752484:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "fx>=") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "fx>=")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx>=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752486"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752486":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx>="
# string literal
    jmp _L_752488
    .align 8,0x90
_L_752487 :
    .int 16
    .ascii "fx>="
_L_752488:
    movl $_L_752487, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx>=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752489
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752489:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752490"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752490:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752492
    cmp  $0,%eax
    jge _L_752491
_L_752492:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752491:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752493
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752493:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752494"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752494:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752496
    cmp  $0,%eax
    jge _L_752495
_L_752496:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752495:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx>") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "fx>") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "fx>")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx>")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752497"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752497":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx>"
# string literal
    jmp _L_752499
    .align 8,0x90
_L_752498 :
    .int 12
    .ascii "fx>"
_L_752499:
    movl $_L_752498, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx>
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752500
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752500:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752501"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752501:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752503
    cmp  $0,%eax
    jge _L_752502
_L_752503:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752502:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752504
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752504:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752505"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752505:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752507
    cmp  $0,%eax
    jge _L_752506
_L_752507:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752506:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "fx<=") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "fx<=")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx<=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752508"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752508":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx<="
# string literal
    jmp _L_752510
    .align 8,0x90
_L_752509 :
    .int 16
    .ascii "fx<="
_L_752510:
    movl $_L_752509, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx<=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752511
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752511:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752512"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752512:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752514
    cmp  $0,%eax
    jge _L_752513
_L_752514:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752513:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752515
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752515:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752516"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752516:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752518
    cmp  $0,%eax
    jge _L_752517
_L_752518:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752517:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx<") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "fx<") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "fx<")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx<")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752519"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752519":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx<"
# string literal
    jmp _L_752521
    .align 8,0x90
_L_752520 :
    .int 12
    .ascii "fx<"
_L_752521:
    movl $_L_752520, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx<
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752522
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752522:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752523"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752523:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752525
    cmp  $0,%eax
    jge _L_752524
_L_752525:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752524:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752526
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752526:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752527"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752527:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752529
    cmp  $0,%eax
    jge _L_752528
_L_752529:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752528:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx=") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "fx=") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "fx=")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752530"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752530":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx="
# string literal
    jmp _L_752532
    .align 8,0x90
_L_752531 :
    .int 12
    .ascii "fx="
_L_752532:
    movl $_L_752531, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752533
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752533:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752534"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752534:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752536
    cmp  $0,%eax
    jge _L_752535
_L_752536:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752535:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752537
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752537:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752538"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752538:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752540
    cmp  $0,%eax
    jge _L_752539
_L_752540:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752539:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "fxzero?") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "fxzero?")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxzero?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752541"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752541":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxzero?"
# string literal
    jmp _L_752543
    .align 8,0x90
_L_752542 :
    .int 28
    .ascii "fxzero?"
_L_752543:
    movl $_L_752542, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxzero?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752544
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752544:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752545"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752545:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752547
    cmp  $0,%eax
    jge _L_752546
_L_752547:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752546:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752548
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752548:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752549"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752549:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752551
    cmp  $0,%eax
    jge _L_752550
_L_752551:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752550:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "fxsub1") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "fxsub1")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxsub1")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752552"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752552":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxsub1"
# string literal
    jmp _L_752554
    .align 8,0x90
_L_752553 :
    .int 24
    .ascii "fxsub1"
_L_752554:
    movl $_L_752553, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxsub1
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752555
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752555:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752556"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752556:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752558
    cmp  $0,%eax
    jge _L_752557
_L_752558:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752557:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752559
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752559:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752560"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752560:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752562
    cmp  $0,%eax
    jge _L_752561
_L_752562:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752561:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "fxadd1") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "fxadd1")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxadd1")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752563"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752563":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxadd1"
# string literal
    jmp _L_752565
    .align 8,0x90
_L_752564 :
    .int 24
    .ascii "fxadd1"
_L_752565:
    movl $_L_752564, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxadd1
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752566
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752566:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752567"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752567:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752569
    cmp  $0,%eax
    jge _L_752568
_L_752569:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752568:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752570
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752570:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752571"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752571:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752573
    cmp  $0,%eax
    jge _L_752572
_L_752573:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752572:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "fxlogor") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "fxlogor")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlogor")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752574"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752574":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlogor"
# string literal
    jmp _L_752576
    .align 8,0x90
_L_752575 :
    .int 28
    .ascii "fxlogor"
_L_752576:
    movl $_L_752575, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlogor
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752577
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752577:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752578"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752578:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752580
    cmp  $0,%eax
    jge _L_752579
_L_752580:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752579:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752581
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752581:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752582"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752582:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752584
    cmp  $0,%eax
    jge _L_752583
_L_752584:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752583:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "fxlogand") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "fxlogand")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlogand")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752585"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752585":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlogand"
# string literal
    jmp _L_752587
    .align 8,0x90
_L_752586 :
    .int 32
    .ascii "fxlogand"
_L_752587:
    movl $_L_752586, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlogand
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752588
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752588:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752589"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752589:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752591
    cmp  $0,%eax
    jge _L_752590
_L_752591:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752590:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752592
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752592:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752593"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752593:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752595
    cmp  $0,%eax
    jge _L_752594
_L_752595:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752594:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "fxlognot") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "fxlognot")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlognot")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752596"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752596":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlognot"
# string literal
    jmp _L_752598
    .align 8,0x90
_L_752597 :
    .int 32
    .ascii "fxlognot"
_L_752598:
    movl $_L_752597, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlognot
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752599
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752599:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752600"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752600:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752602
    cmp  $0,%eax
    jge _L_752601
_L_752602:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752601:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752603
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752603:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752604"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752604:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752606
    cmp  $0,%eax
    jge _L_752605
_L_752606:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752605:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char=?") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "char=?") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "char=?")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "char=?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752607"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752607":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char=?"
# string literal
    jmp _L_752609
    .align 8,0x90
_L_752608 :
    .int 24
    .ascii "char=?"
_L_752609:
    movl $_L_752608, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char=?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752610
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752610:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752611"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752611:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752613
    cmp  $0,%eax
    jge _L_752612
_L_752613:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752612:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752614
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752614:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752615"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752615:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752617
    cmp  $0,%eax
    jge _L_752616
_L_752617:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752616:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "eq?") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "eq?") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "eq?")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "eq?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752618"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752618":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "eq?"
# string literal
    jmp _L_752620
    .align 8,0x90
_L_752619 :
    .int 12
    .ascii "eq?"
_L_752620:
    movl $_L_752619, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg eq?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752621
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752621:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752622"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752622:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752624
    cmp  $0,%eax
    jge _L_752623
_L_752624:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752623:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752625
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752625:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752626"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752626:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752628
    cmp  $0,%eax
    jge _L_752627
_L_752628:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752627:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "not") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "not") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "not")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "not")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752629"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752629":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "not"
# string literal
    jmp _L_752631
    .align 8,0x90
_L_752630 :
    .int 12
    .ascii "not"
_L_752631:
    movl $_L_752630, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg not
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752632
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752632:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752633"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752633:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752635
    cmp  $0,%eax
    jge _L_752634
_L_752635:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752634:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752636
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752636:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752637"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752637:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752639
    cmp  $0,%eax
    jge _L_752638
_L_752639:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752638:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "boolean?") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "boolean?")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "boolean?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752640"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752640":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "boolean?"
# string literal
    jmp _L_752642
    .align 8,0x90
_L_752641 :
    .int 32
    .ascii "boolean?"
_L_752642:
    movl $_L_752641, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg boolean?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752643
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752643:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752644"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752644:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752646
    cmp  $0,%eax
    jge _L_752645
_L_752646:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752645:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752647
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752647:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752648"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752648:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752650
    cmp  $0,%eax
    jge _L_752649
_L_752650:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752649:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "fixnum?") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "fixnum?")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fixnum?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752651"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752651":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fixnum?"
# string literal
    jmp _L_752653
    .align 8,0x90
_L_752652 :
    .int 28
    .ascii "fixnum?"
_L_752653:
    movl $_L_752652, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fixnum?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752654
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752654:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752655"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752655:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752657
    cmp  $0,%eax
    jge _L_752656
_L_752657:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752656:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752658
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752658:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752659"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752659:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752661
    cmp  $0,%eax
    jge _L_752660
_L_752661:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752660:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char?") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "char?") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "char?")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "char?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752662"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752662":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char?"
# string literal
    jmp _L_752664
    .align 8,0x90
_L_752663 :
    .int 20
    .ascii "char?"
_L_752664:
    movl $_L_752663, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752665
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752665:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752666"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752666:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752668
    cmp  $0,%eax
    jge _L_752667
_L_752668:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752667:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752669
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752669:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752670"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752670:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752672
    cmp  $0,%eax
    jge _L_752671
_L_752672:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752671:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "null?") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "null?") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "null?")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "null?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752673"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752673":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "null?"
# string literal
    jmp _L_752675
    .align 8,0x90
_L_752674 :
    .int 20
    .ascii "null?"
_L_752675:
    movl $_L_752674, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg null?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752676
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752676:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752677"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752677:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752679
    cmp  $0,%eax
    jge _L_752678
_L_752679:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752678:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))) (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752680
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752680:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752681"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752681:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752683
    cmp  $0,%eax
    jge _L_752682
_L_752683:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752682:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "char->fixnum") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "char->fixnum")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "char->fixnum")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752684"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752684":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char->fixnum"
# string literal
    jmp _L_752686
    .align 8,0x90
_L_752685 :
    .int 48
    .ascii "char->fixnum"
_L_752686:
    movl $_L_752685, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char->fixnum
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752687
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752687:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752688"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752688:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752690
    cmp  $0,%eax
    jge _L_752689
_L_752690:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752689:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))) (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (vector-set! f84852 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0)))
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752691
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752691:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752692"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752692:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752694
    cmp  $0,%eax
    jge _L_752693
_L_752694:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752693:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f84852 0))
# cons arg1=((primitive-ref string->symbol) "fixnum->char") arg2=(vector-ref f84852 0)
# emit-expr ((primitive-ref string->symbol) "fixnum->char")
# funcall
#    si   =-12
#    env  = ((f84852 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fixnum->char")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752695"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752695":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fixnum->char"
# string literal
    jmp _L_752697
    .align 8,0x90
_L_752696 :
    .int 48
    .ascii "fixnum->char"
_L_752697:
    movl $_L_752696, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fixnum->char
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f84852 0)
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752698
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752698:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752699"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752699:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752701
    cmp  $0,%eax
    jge _L_752700
_L_752701:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752700:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (closure () (f84852) (let () (vector-ref f84852 0))))
# emit-begin
#   expr=(begin (closure () (f84852) (let () (vector-ref f84852 0))))
#   env=((f84852 . 0))
# emit-expr (closure () (f84852) (let () (vector-ref f84852 0)))
# emit-closure
# si = -4
# env = ((f84852 . 0))
# expr = (closure () (f84852) (let () (vector-ref f84852 0)))
    movl $_L_752702, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f84852 . 0))
# var=f84852
    movl 0(%esp), %eax  # stack load f84852
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f84852
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_752703            # jump around closure body
_L_752702:
# check argument count
    cmp $0,%eax
    je _L_752704
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_752704:
# emit-tail-expr
# si=-8
# env=((f84852 . 4) (f84852 . 0))
# expr=(let () (vector-ref f84852 0))
# emit-tail-let
#  si   = -8
#  env  = ((f84852 . 4) (f84852 . 0))
#  bindings = ()
#  body = (vector-ref f84852 0)
# emit-tail-expr
# si=-8
# env=((f84852 . 4) (f84852 . 0))
# expr=(vector-ref f84852 0)
# tail primcall
# emit-expr f84852
# emit-variable-ref
# env=((f84852 . 4) (f84852 . 0))
# var=f84852
    movl 2(%edi), %eax  # frame load f84852
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_752705
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752705:
    movl %eax, -8(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_752706"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_752706:
# check bounds on vector index
    movl -8(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_752708
    cmp  $0,%eax
    jge _L_752707
_L_752708:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_752707:
    movl -8(%esp), %esi
    movl -1(%eax,%esi), %eax
#return from tail (vector-ref f84852 0)
    ret
    .align 4,0x90
_L_752703:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f84852 . 0))
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
    movl $_L_752709, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_752710            # jump around closure body
_L_752709:
# check argument count
    cmp $0,%eax
    je _L_752711
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_752711:
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
    je "_L_752712"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752712":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_752714
    .align 8,0x90
_L_752713 :
    .int 28
    .ascii "funcall"
_L_752714:
    movl $_L_752713, %eax
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
    jmp _L_752716
    .align 8,0x90
_L_752715 :
    .int 100
    .ascii "arg 1 must be a procedure"
_L_752716:
    movl $_L_752715, %eax
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
_L_752710:
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
    movl $_L_752717, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_752718            # jump around closure body
_L_752717:
# check argument count
    cmp $0,%eax
    je _L_752719
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_752719:
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
    je "_L_752720"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752720":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_752722
    .align 8,0x90
_L_752721 :
    .int 28
    .ascii "funcall"
_L_752722:
    movl $_L_752721, %eax
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
    jmp _L_752724
    .align 8,0x90
_L_752723 :
    .int 80
    .ascii "wrong number of args"
_L_752724:
    movl $_L_752723, %eax
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
_L_752718:
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
    movl $_L_752725, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_752726            # jump around closure body
_L_752725:
# check argument count
    cmp $0,%eax
    je _L_752727
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_752727:
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
    je "_L_752728"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752728":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_752730
    .align 8,0x90
_L_752729 :
    .int 28
    .ascii "funcall"
_L_752730:
    movl $_L_752729, %eax
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
    jmp _L_752732
    .align 8,0x90
_L_752731 :
    .int 48
    .ascii "too few args"
_L_752732:
    movl $_L_752731, %eax
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
_L_752726:
     movl %eax, eh$uargcount$umin
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a fixnum"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a fixnum"))
# == uniquify-variables  ==>
# (lambda (f84853) (error (list-ref (primitives) f84853) "arg must be a fixnum"))
# == vectorize-letrec  ==>
# (lambda (f84853) (error (list-ref (primitives) f84853) "arg must be a fixnum"))
# == eliminate-set!  ==>
# (lambda (f84853) (let ((f84853 f84853)) (error (list-ref (primitives) f84853) "arg must be a fixnum")))
# == close-free-variables  ==>
# (closure (f84853) (error list-ref primitives) (let ((f84853 f84853)) (error (list-ref (primitives) f84853) "arg must be a fixnum")))
# == eliminate-quote  ==>
# (closure (f84853) (error list-ref primitives) (let ((f84853 f84853)) (error (list-ref (primitives) f84853) "arg must be a fixnum")))
# == eliminate-when/unless  ==>
# (closure (f84853) (error list-ref primitives) (let ((f84853 f84853)) (error (list-ref (primitives) f84853) "arg must be a fixnum")))
# == eliminate-cond  ==>
# (closure (f84853) (error list-ref primitives) (let ((f84853 f84853)) (error (list-ref (primitives) f84853) "arg must be a fixnum")))
# == external-symbols  ==>
# (closure (f84853) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f84853 f84853)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84853) "arg must be a fixnum")))
# emit-expr (closure (f84853) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f84853 f84853)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84853) "arg must be a fixnum")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f84853) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f84853 f84853)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84853) "arg must be a fixnum")))
    movl $_L_752733, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_752734            # jump around closure body
_L_752733:
# check argument count
    cmp $4,%eax
    je _L_752735
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_752735:
# emit-tail-expr
# si=-12
# env=((f84853 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f84853 f84853)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84853) "arg must be a fixnum"))
# emit-tail-let
#  si   = -12
#  env  = ((f84853 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f84853 f84853))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84853) "arg must be a fixnum")
# emit-expr f84853
# emit-variable-ref
# env=((f84853 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f84853
    movl -8(%esp), %eax  # stack load f84853
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f84853 . -12) (f84853 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84853) "arg must be a fixnum")
# emit-tail-funcall
#    si   =-16
#    env  = ((f84853 . -12) (f84853 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84853) "arg must be a fixnum")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f84853)
# funcall
#    si   =-20
#    env  = ((f84853 . -12) (f84853 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f84853)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752736"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752736":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f84853 . -12) (f84853 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752737"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752737":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f84853
# emit-variable-ref
# env=((f84853 . -12) (f84853 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f84853
    movl -12(%esp), %eax  # stack load f84853
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f84853
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f84853)
# emit-expr "arg must be a fixnum"
# string literal
    jmp _L_752739
    .align 8,0x90
_L_752738 :
    .int 80
    .ascii "arg must be a fixnum"
_L_752739:
    movl $_L_752738, %eax
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
_L_752734:
     movl %eax, eh$ufixnum
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a string"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a string"))
# == uniquify-variables  ==>
# (lambda (f84854) (error (list-ref (primitives) f84854) "arg must be a string"))
# == vectorize-letrec  ==>
# (lambda (f84854) (error (list-ref (primitives) f84854) "arg must be a string"))
# == eliminate-set!  ==>
# (lambda (f84854) (let ((f84854 f84854)) (error (list-ref (primitives) f84854) "arg must be a string")))
# == close-free-variables  ==>
# (closure (f84854) (error list-ref primitives) (let ((f84854 f84854)) (error (list-ref (primitives) f84854) "arg must be a string")))
# == eliminate-quote  ==>
# (closure (f84854) (error list-ref primitives) (let ((f84854 f84854)) (error (list-ref (primitives) f84854) "arg must be a string")))
# == eliminate-when/unless  ==>
# (closure (f84854) (error list-ref primitives) (let ((f84854 f84854)) (error (list-ref (primitives) f84854) "arg must be a string")))
# == eliminate-cond  ==>
# (closure (f84854) (error list-ref primitives) (let ((f84854 f84854)) (error (list-ref (primitives) f84854) "arg must be a string")))
# == external-symbols  ==>
# (closure (f84854) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f84854 f84854)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84854) "arg must be a string")))
# emit-expr (closure (f84854) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f84854 f84854)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84854) "arg must be a string")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f84854) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f84854 f84854)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84854) "arg must be a string")))
    movl $_L_752740, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_752741            # jump around closure body
_L_752740:
# check argument count
    cmp $4,%eax
    je _L_752742
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_752742:
# emit-tail-expr
# si=-12
# env=((f84854 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f84854 f84854)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84854) "arg must be a string"))
# emit-tail-let
#  si   = -12
#  env  = ((f84854 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f84854 f84854))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84854) "arg must be a string")
# emit-expr f84854
# emit-variable-ref
# env=((f84854 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f84854
    movl -8(%esp), %eax  # stack load f84854
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f84854 . -12) (f84854 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84854) "arg must be a string")
# emit-tail-funcall
#    si   =-16
#    env  = ((f84854 . -12) (f84854 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84854) "arg must be a string")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f84854)
# funcall
#    si   =-20
#    env  = ((f84854 . -12) (f84854 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f84854)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752743"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752743":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f84854 . -12) (f84854 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752744"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752744":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f84854
# emit-variable-ref
# env=((f84854 . -12) (f84854 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f84854
    movl -12(%esp), %eax  # stack load f84854
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f84854
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f84854)
# emit-expr "arg must be a string"
# string literal
    jmp _L_752746
    .align 8,0x90
_L_752745 :
    .int 80
    .ascii "arg must be a string"
_L_752746:
    movl $_L_752745, %eax
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
_L_752741:
     movl %eax, eh$ustring
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a character"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a character"))
# == uniquify-variables  ==>
# (lambda (f84855) (error (list-ref (primitives) f84855) "arg must be a character"))
# == vectorize-letrec  ==>
# (lambda (f84855) (error (list-ref (primitives) f84855) "arg must be a character"))
# == eliminate-set!  ==>
# (lambda (f84855) (let ((f84855 f84855)) (error (list-ref (primitives) f84855) "arg must be a character")))
# == close-free-variables  ==>
# (closure (f84855) (error list-ref primitives) (let ((f84855 f84855)) (error (list-ref (primitives) f84855) "arg must be a character")))
# == eliminate-quote  ==>
# (closure (f84855) (error list-ref primitives) (let ((f84855 f84855)) (error (list-ref (primitives) f84855) "arg must be a character")))
# == eliminate-when/unless  ==>
# (closure (f84855) (error list-ref primitives) (let ((f84855 f84855)) (error (list-ref (primitives) f84855) "arg must be a character")))
# == eliminate-cond  ==>
# (closure (f84855) (error list-ref primitives) (let ((f84855 f84855)) (error (list-ref (primitives) f84855) "arg must be a character")))
# == external-symbols  ==>
# (closure (f84855) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f84855 f84855)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84855) "arg must be a character")))
# emit-expr (closure (f84855) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f84855 f84855)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84855) "arg must be a character")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f84855) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f84855 f84855)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84855) "arg must be a character")))
    movl $_L_752747, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_752748            # jump around closure body
_L_752747:
# check argument count
    cmp $4,%eax
    je _L_752749
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_752749:
# emit-tail-expr
# si=-12
# env=((f84855 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f84855 f84855)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84855) "arg must be a character"))
# emit-tail-let
#  si   = -12
#  env  = ((f84855 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f84855 f84855))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84855) "arg must be a character")
# emit-expr f84855
# emit-variable-ref
# env=((f84855 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f84855
    movl -8(%esp), %eax  # stack load f84855
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f84855 . -12) (f84855 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84855) "arg must be a character")
# emit-tail-funcall
#    si   =-16
#    env  = ((f84855 . -12) (f84855 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84855) "arg must be a character")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f84855)
# funcall
#    si   =-20
#    env  = ((f84855 . -12) (f84855 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f84855)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752750"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752750":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f84855 . -12) (f84855 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752751"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752751":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f84855
# emit-variable-ref
# env=((f84855 . -12) (f84855 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f84855
    movl -12(%esp), %eax  # stack load f84855
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f84855
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f84855)
# emit-expr "arg must be a character"
# string literal
    jmp _L_752753
    .align 8,0x90
_L_752752 :
    .int 92
    .ascii "arg must be a character"
_L_752753:
    movl $_L_752752, %eax
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
_L_752748:
     movl %eax, eh$ucharacter
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a pair"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a pair"))
# == uniquify-variables  ==>
# (lambda (f84856) (error (list-ref (primitives) f84856) "arg must be a pair"))
# == vectorize-letrec  ==>
# (lambda (f84856) (error (list-ref (primitives) f84856) "arg must be a pair"))
# == eliminate-set!  ==>
# (lambda (f84856) (let ((f84856 f84856)) (error (list-ref (primitives) f84856) "arg must be a pair")))
# == close-free-variables  ==>
# (closure (f84856) (error list-ref primitives) (let ((f84856 f84856)) (error (list-ref (primitives) f84856) "arg must be a pair")))
# == eliminate-quote  ==>
# (closure (f84856) (error list-ref primitives) (let ((f84856 f84856)) (error (list-ref (primitives) f84856) "arg must be a pair")))
# == eliminate-when/unless  ==>
# (closure (f84856) (error list-ref primitives) (let ((f84856 f84856)) (error (list-ref (primitives) f84856) "arg must be a pair")))
# == eliminate-cond  ==>
# (closure (f84856) (error list-ref primitives) (let ((f84856 f84856)) (error (list-ref (primitives) f84856) "arg must be a pair")))
# == external-symbols  ==>
# (closure (f84856) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f84856 f84856)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84856) "arg must be a pair")))
# emit-expr (closure (f84856) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f84856 f84856)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84856) "arg must be a pair")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f84856) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f84856 f84856)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84856) "arg must be a pair")))
    movl $_L_752754, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_752755            # jump around closure body
_L_752754:
# check argument count
    cmp $4,%eax
    je _L_752756
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_752756:
# emit-tail-expr
# si=-12
# env=((f84856 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f84856 f84856)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84856) "arg must be a pair"))
# emit-tail-let
#  si   = -12
#  env  = ((f84856 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f84856 f84856))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84856) "arg must be a pair")
# emit-expr f84856
# emit-variable-ref
# env=((f84856 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f84856
    movl -8(%esp), %eax  # stack load f84856
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f84856 . -12) (f84856 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84856) "arg must be a pair")
# emit-tail-funcall
#    si   =-16
#    env  = ((f84856 . -12) (f84856 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84856) "arg must be a pair")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f84856)
# funcall
#    si   =-20
#    env  = ((f84856 . -12) (f84856 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f84856)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752757"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752757":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f84856 . -12) (f84856 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752758"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752758":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f84856
# emit-variable-ref
# env=((f84856 . -12) (f84856 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f84856
    movl -12(%esp), %eax  # stack load f84856
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f84856
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f84856)
# emit-expr "arg must be a pair"
# string literal
    jmp _L_752760
    .align 8,0x90
_L_752759 :
    .int 72
    .ascii "arg must be a pair"
_L_752760:
    movl $_L_752759, %eax
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
_L_752755:
     movl %eax, eh$upair
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a vector"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a vector"))
# == uniquify-variables  ==>
# (lambda (f84857) (error (list-ref (primitives) f84857) "arg must be a vector"))
# == vectorize-letrec  ==>
# (lambda (f84857) (error (list-ref (primitives) f84857) "arg must be a vector"))
# == eliminate-set!  ==>
# (lambda (f84857) (let ((f84857 f84857)) (error (list-ref (primitives) f84857) "arg must be a vector")))
# == close-free-variables  ==>
# (closure (f84857) (error list-ref primitives) (let ((f84857 f84857)) (error (list-ref (primitives) f84857) "arg must be a vector")))
# == eliminate-quote  ==>
# (closure (f84857) (error list-ref primitives) (let ((f84857 f84857)) (error (list-ref (primitives) f84857) "arg must be a vector")))
# == eliminate-when/unless  ==>
# (closure (f84857) (error list-ref primitives) (let ((f84857 f84857)) (error (list-ref (primitives) f84857) "arg must be a vector")))
# == eliminate-cond  ==>
# (closure (f84857) (error list-ref primitives) (let ((f84857 f84857)) (error (list-ref (primitives) f84857) "arg must be a vector")))
# == external-symbols  ==>
# (closure (f84857) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f84857 f84857)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84857) "arg must be a vector")))
# emit-expr (closure (f84857) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f84857 f84857)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84857) "arg must be a vector")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f84857) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f84857 f84857)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84857) "arg must be a vector")))
    movl $_L_752761, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_752762            # jump around closure body
_L_752761:
# check argument count
    cmp $4,%eax
    je _L_752763
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_752763:
# emit-tail-expr
# si=-12
# env=((f84857 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f84857 f84857)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84857) "arg must be a vector"))
# emit-tail-let
#  si   = -12
#  env  = ((f84857 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f84857 f84857))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84857) "arg must be a vector")
# emit-expr f84857
# emit-variable-ref
# env=((f84857 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f84857
    movl -8(%esp), %eax  # stack load f84857
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f84857 . -12) (f84857 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84857) "arg must be a vector")
# emit-tail-funcall
#    si   =-16
#    env  = ((f84857 . -12) (f84857 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84857) "arg must be a vector")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f84857)
# funcall
#    si   =-20
#    env  = ((f84857 . -12) (f84857 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f84857)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752764"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752764":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f84857 . -12) (f84857 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752765"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752765":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f84857
# emit-variable-ref
# env=((f84857 . -12) (f84857 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f84857
    movl -12(%esp), %eax  # stack load f84857
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f84857
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f84857)
# emit-expr "arg must be a vector"
# string literal
    jmp _L_752767
    .align 8,0x90
_L_752766 :
    .int 80
    .ascii "arg must be a vector"
_L_752767:
    movl $_L_752766, %eax
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
_L_752762:
     movl %eax, eh$uvector
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "length must be a fixnum >= 0"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "length must be a fixnum >= 0"))
# == uniquify-variables  ==>
# (lambda (f84858) (error (list-ref (primitives) f84858) "length must be a fixnum >= 0"))
# == vectorize-letrec  ==>
# (lambda (f84858) (error (list-ref (primitives) f84858) "length must be a fixnum >= 0"))
# == eliminate-set!  ==>
# (lambda (f84858) (let ((f84858 f84858)) (error (list-ref (primitives) f84858) "length must be a fixnum >= 0")))
# == close-free-variables  ==>
# (closure (f84858) (error list-ref primitives) (let ((f84858 f84858)) (error (list-ref (primitives) f84858) "length must be a fixnum >= 0")))
# == eliminate-quote  ==>
# (closure (f84858) (error list-ref primitives) (let ((f84858 f84858)) (error (list-ref (primitives) f84858) "length must be a fixnum >= 0")))
# == eliminate-when/unless  ==>
# (closure (f84858) (error list-ref primitives) (let ((f84858 f84858)) (error (list-ref (primitives) f84858) "length must be a fixnum >= 0")))
# == eliminate-cond  ==>
# (closure (f84858) (error list-ref primitives) (let ((f84858 f84858)) (error (list-ref (primitives) f84858) "length must be a fixnum >= 0")))
# == external-symbols  ==>
# (closure (f84858) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f84858 f84858)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84858) "length must be a fixnum >= 0")))
# emit-expr (closure (f84858) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f84858 f84858)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84858) "length must be a fixnum >= 0")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f84858) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f84858 f84858)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84858) "length must be a fixnum >= 0")))
    movl $_L_752768, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_752769            # jump around closure body
_L_752768:
# check argument count
    cmp $4,%eax
    je _L_752770
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_752770:
# emit-tail-expr
# si=-12
# env=((f84858 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f84858 f84858)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84858) "length must be a fixnum >= 0"))
# emit-tail-let
#  si   = -12
#  env  = ((f84858 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f84858 f84858))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84858) "length must be a fixnum >= 0")
# emit-expr f84858
# emit-variable-ref
# env=((f84858 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f84858
    movl -8(%esp), %eax  # stack load f84858
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f84858 . -12) (f84858 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84858) "length must be a fixnum >= 0")
# emit-tail-funcall
#    si   =-16
#    env  = ((f84858 . -12) (f84858 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84858) "length must be a fixnum >= 0")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f84858)
# funcall
#    si   =-20
#    env  = ((f84858 . -12) (f84858 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f84858)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752771"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752771":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f84858 . -12) (f84858 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752772"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752772":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f84858
# emit-variable-ref
# env=((f84858 . -12) (f84858 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f84858
    movl -12(%esp), %eax  # stack load f84858
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f84858
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f84858)
# emit-expr "length must be a fixnum >= 0"
# string literal
    jmp _L_752774
    .align 8,0x90
_L_752773 :
    .int 112
    .ascii "length must be a fixnum >= 0"
_L_752774:
    movl $_L_752773, %eax
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
_L_752769:
     movl %eax, eh$ulength
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == uniquify-variables  ==>
# (lambda (f84859) (error (list-ref (primitives) f84859) "index out of bounds"))
# == vectorize-letrec  ==>
# (lambda (f84859) (error (list-ref (primitives) f84859) "index out of bounds"))
# == eliminate-set!  ==>
# (lambda (f84859) (let ((f84859 f84859)) (error (list-ref (primitives) f84859) "index out of bounds")))
# == close-free-variables  ==>
# (closure (f84859) (error list-ref primitives) (let ((f84859 f84859)) (error (list-ref (primitives) f84859) "index out of bounds")))
# == eliminate-quote  ==>
# (closure (f84859) (error list-ref primitives) (let ((f84859 f84859)) (error (list-ref (primitives) f84859) "index out of bounds")))
# == eliminate-when/unless  ==>
# (closure (f84859) (error list-ref primitives) (let ((f84859 f84859)) (error (list-ref (primitives) f84859) "index out of bounds")))
# == eliminate-cond  ==>
# (closure (f84859) (error list-ref primitives) (let ((f84859 f84859)) (error (list-ref (primitives) f84859) "index out of bounds")))
# == external-symbols  ==>
# (closure (f84859) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f84859 f84859)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84859) "index out of bounds")))
# emit-expr (closure (f84859) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f84859 f84859)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84859) "index out of bounds")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f84859) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f84859 f84859)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84859) "index out of bounds")))
    movl $_L_752775, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_752776            # jump around closure body
_L_752775:
# check argument count
    cmp $4,%eax
    je _L_752777
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_752777:
# emit-tail-expr
# si=-12
# env=((f84859 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f84859 f84859)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84859) "index out of bounds"))
# emit-tail-let
#  si   = -12
#  env  = ((f84859 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f84859 f84859))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84859) "index out of bounds")
# emit-expr f84859
# emit-variable-ref
# env=((f84859 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f84859
    movl -8(%esp), %eax  # stack load f84859
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f84859 . -12) (f84859 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84859) "index out of bounds")
# emit-tail-funcall
#    si   =-16
#    env  = ((f84859 . -12) (f84859 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84859) "index out of bounds")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f84859)
# funcall
#    si   =-20
#    env  = ((f84859 . -12) (f84859 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f84859)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752778"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752778":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f84859 . -12) (f84859 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752779"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752779":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f84859
# emit-variable-ref
# env=((f84859 . -12) (f84859 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f84859
    movl -12(%esp), %eax  # stack load f84859
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f84859
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f84859)
# emit-expr "index out of bounds"
# string literal
    jmp _L_752781
    .align 8,0x90
_L_752780 :
    .int 76
    .ascii "index out of bounds"
_L_752781:
    movl $_L_752780, %eax
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
_L_752776:
     movl %eax, eh$uvector$uindex
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == uniquify-variables  ==>
# (lambda (f84860) (error (list-ref (primitives) f84860) "index out of bounds"))
# == vectorize-letrec  ==>
# (lambda (f84860) (error (list-ref (primitives) f84860) "index out of bounds"))
# == eliminate-set!  ==>
# (lambda (f84860) (let ((f84860 f84860)) (error (list-ref (primitives) f84860) "index out of bounds")))
# == close-free-variables  ==>
# (closure (f84860) (error list-ref primitives) (let ((f84860 f84860)) (error (list-ref (primitives) f84860) "index out of bounds")))
# == eliminate-quote  ==>
# (closure (f84860) (error list-ref primitives) (let ((f84860 f84860)) (error (list-ref (primitives) f84860) "index out of bounds")))
# == eliminate-when/unless  ==>
# (closure (f84860) (error list-ref primitives) (let ((f84860 f84860)) (error (list-ref (primitives) f84860) "index out of bounds")))
# == eliminate-cond  ==>
# (closure (f84860) (error list-ref primitives) (let ((f84860 f84860)) (error (list-ref (primitives) f84860) "index out of bounds")))
# == external-symbols  ==>
# (closure (f84860) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f84860 f84860)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84860) "index out of bounds")))
# emit-expr (closure (f84860) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f84860 f84860)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84860) "index out of bounds")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f84860) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f84860 f84860)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84860) "index out of bounds")))
    movl $_L_752782, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_752783            # jump around closure body
_L_752782:
# check argument count
    cmp $4,%eax
    je _L_752784
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_752784:
# emit-tail-expr
# si=-12
# env=((f84860 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f84860 f84860)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84860) "index out of bounds"))
# emit-tail-let
#  si   = -12
#  env  = ((f84860 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f84860 f84860))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84860) "index out of bounds")
# emit-expr f84860
# emit-variable-ref
# env=((f84860 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f84860
    movl -8(%esp), %eax  # stack load f84860
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f84860 . -12) (f84860 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84860) "index out of bounds")
# emit-tail-funcall
#    si   =-16
#    env  = ((f84860 . -12) (f84860 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f84860) "index out of bounds")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f84860)
# funcall
#    si   =-20
#    env  = ((f84860 . -12) (f84860 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f84860)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752785"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752785":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f84860 . -12) (f84860 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_752786"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_752786":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f84860
# emit-variable-ref
# env=((f84860 . -12) (f84860 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f84860
    movl -12(%esp), %eax  # stack load f84860
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f84860
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f84860)
# emit-expr "index out of bounds"
# string literal
    jmp _L_752788
    .align 8,0x90
_L_752787 :
    .int 76
    .ascii "index out of bounds"
_L_752788:
    movl $_L_752787, %eax
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
_L_752783:
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
