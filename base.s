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
# == eliminate-shadowing  ==>
# (let ((interned-symbols (cons (make-symbol "nil" ()) ()))) (lambda () interned-symbols))
# == vectorize-letrec  ==>
# (let ((interned-symbols (cons (make-symbol "nil" ()) ()))) (lambda () interned-symbols))
# == eliminate-set!  ==>
# (let ((interned-symbols (cons (make-symbol "nil" ()) ()))) (lambda () (let () interned-symbols)))
# == close-free-variables  ==>
# (let ((interned-symbols (cons (make-symbol "nil" ()) ()))) (closure () (interned-symbols) (let () interned-symbols)))
# == eliminate-quote  ==>
# (let ((interned-symbols (cons (make-symbol "nil" ()) ()))) (closure () (interned-symbols) (let () interned-symbols)))
# == eliminate-when/unless  ==>
# (let ((interned-symbols (cons (make-symbol "nil" ()) ()))) (closure () (interned-symbols) (let () interned-symbols)))
# == eliminate-cond  ==>
# (let ((interned-symbols (cons (make-symbol "nil" ()) ()))) (closure () (interned-symbols) (let () interned-symbols)))
# == external-symbols  ==>
# (let ((interned-symbols (cons (make-symbol "nil" ()) ()))) (closure () (interned-symbols) (let () interned-symbols)))
# emit-expr (let ((interned-symbols (cons (make-symbol "nil" ()) ()))) (closure () (interned-symbols) (let () interned-symbols)))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((interned-symbols (cons (make-symbol "nil" ()) ())))
#  body = (closure () (interned-symbols) (let () interned-symbols))
# emit-expr (cons (make-symbol "nil" ()) ())
# cons arg1=(make-symbol "nil" ()) arg2=()
# emit-expr (make-symbol "nil" ())
# make-symbol arg1="nil" arg2=()
# emit-expr "nil"
# string literal
    jmp _L_12182
    .align 8,0x90
_L_12181 :
    .int 12
    .ascii "nil"
_L_12182:
    movl $_L_12181, %eax
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
# emit-expr (closure () (interned-symbols) (let () interned-symbols))
# emit-closure
# si = -4
# env = ((interned-symbols . 0))
# expr = (closure () (interned-symbols) (let () interned-symbols))
    movl $_L_12183, 0(%ebp)  # closure label
# emit-variable-ref
# env=((interned-symbols . 0))
# var=interned-symbols
    movl 0(%esp), %eax  # stack load interned-symbols
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # interned-symbols
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_12184            # jump around closure body
_L_12183:
# check argument count
    cmp $0,%eax
    je _L_12185
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_12185:
# emit-tail-expr
# si=-8
# env=((interned-symbols . 4) (interned-symbols . 0))
# expr=(let () interned-symbols)
# emit-tail-let
#  si   = -8
#  env  = ((interned-symbols . 4) (interned-symbols . 0))
#  bindings = ()
#  body = interned-symbols
# emit-tail-expr
# si=-8
# env=((interned-symbols . 4) (interned-symbols . 0))
# expr=interned-symbols
# emit-tail-variable-ref
# emit-variable-ref
# env=((interned-symbols . 4) (interned-symbols . 0))
# var=interned-symbols
    movl 2(%edi), %eax  # frame load interned-symbols
# end emit-variable-ref
    ret
# end emit-tail-variable ref
    .align 4,0x90
_L_12184:
     movl %eax, symbols
# == explicit-begins  ==>
# (letrec ((slen= (lambda (s1 s2) (fx= (string-length s1) (string-length s2)))) (si= (lambda (s1 s2 i) (char=? (string-ref s1 i) (string-ref s2 i)))) (si<n= (lambda (s1 s2 i n) (if (fx= i n) #t (if (si= s1 s2 i) (si<n= s1 s2 (fx+ i 1) n) #f)))) (ss= (lambda (s1 s2) (if (slen= s1 s2) (si<n= s1 s2 0 (string-length s1)) #f)))) ss=)
# == eliminate-let*  ==>
# (letrec ((slen= (lambda (s1 s2) (fx= (string-length s1) (string-length s2)))) (si= (lambda (s1 s2 i) (char=? (string-ref s1 i) (string-ref s2 i)))) (si<n= (lambda (s1 s2 i n) (if (fx= i n) #t (if (si= s1 s2 i) (si<n= s1 s2 (fx+ i 1) n) #f)))) (ss= (lambda (s1 s2) (if (slen= s1 s2) (si<n= s1 s2 0 (string-length s1)) #f)))) ss=)
# == eliminate-shadowing  ==>
# (letrec ((slen= (lambda (s1 s2) (fx= (string-length s1) (string-length s2)))) (si= (lambda (s1 s2 i) (char=? (string-ref s1 i) (string-ref s2 i)))) (si<n= (lambda (s1 s2 i n) (if (fx= i n) #t (if (si= s1 s2 i) (si<n= s1 s2 (fx+ i 1) n) #f)))) (ss= (lambda (s1 s2) (if (slen= s1 s2) (si<n= s1 s2 0 (string-length s1)) #f)))) ss=)
# == vectorize-letrec  ==>
# (let ((slen= (make-vector 1)) (si= (make-vector 1)) (si<n= (make-vector 1)) (ss= (make-vector 1))) (begin (begin (vector-set! slen= 0 (lambda (s1 s2) (fx= (string-length s1) (string-length s2)))) (vector-set! si= 0 (lambda (s1 s2 i) (char=? (string-ref s1 i) (string-ref s2 i)))) (vector-set! si<n= 0 (lambda (s1 s2 i n) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f)))) (vector-set! ss= 0 (lambda (s1 s2) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f)))) (vector-ref ss= 0)))
# == eliminate-set!  ==>
# (let ((slen= (make-vector 1)) (si= (make-vector 1)) (si<n= (make-vector 1)) (ss= (make-vector 1))) (begin (begin (vector-set! slen= 0 (lambda (s1 s2) (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))) (vector-set! si= 0 (lambda (s1 s2 i) (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! si<n= 0 (lambda (s1 s2 i n) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! ss= 0 (lambda (s1 s2) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f))))) (vector-ref ss= 0)))
# == close-free-variables  ==>
# (let ((slen= (make-vector 1)) (si= (make-vector 1)) (si<n= (make-vector 1)) (ss= (make-vector 1))) (begin (begin (vector-set! slen= 0 (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))) (vector-set! si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! si<n= 0 (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! ss= 0 (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f))))) (vector-ref ss= 0)))
# == eliminate-quote  ==>
# (let ((slen= (make-vector 1)) (si= (make-vector 1)) (si<n= (make-vector 1)) (ss= (make-vector 1))) (begin (begin (vector-set! slen= 0 (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))) (vector-set! si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! si<n= 0 (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! ss= 0 (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f))))) (vector-ref ss= 0)))
# == eliminate-when/unless  ==>
# (let ((slen= (make-vector 1)) (si= (make-vector 1)) (si<n= (make-vector 1)) (ss= (make-vector 1))) (begin (begin (vector-set! slen= 0 (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))) (vector-set! si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! si<n= 0 (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! ss= 0 (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f))))) (vector-ref ss= 0)))
# == eliminate-cond  ==>
# (let ((slen= (make-vector 1)) (si= (make-vector 1)) (si<n= (make-vector 1)) (ss= (make-vector 1))) (begin (begin (vector-set! slen= 0 (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))) (vector-set! si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! si<n= 0 (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! ss= 0 (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f))))) (vector-ref ss= 0)))
# == external-symbols  ==>
# (let ((slen= (make-vector 1)) (si= (make-vector 1)) (si<n= (make-vector 1)) (ss= (make-vector 1))) (begin (begin (vector-set! slen= 0 (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))) (vector-set! si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! si<n= 0 (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! ss= 0 (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f))))) (vector-ref ss= 0)))
# emit-expr (let ((slen= (make-vector 1)) (si= (make-vector 1)) (si<n= (make-vector 1)) (ss= (make-vector 1))) (begin (begin (vector-set! slen= 0 (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))) (vector-set! si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! si<n= 0 (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! ss= 0 (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f))))) (vector-ref ss= 0)))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((slen= (make-vector 1)) (si= (make-vector 1)) (si<n= (make-vector 1)) (ss= (make-vector 1)))
#  body = (begin (begin (vector-set! slen= 0 (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))) (vector-set! si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! si<n= 0 (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! ss= 0 (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f))))) (vector-ref ss= 0))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12186"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12186:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_12187
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12187:
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
    je "_L_12188"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12188:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_12189
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12189:
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
    je "_L_12190"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12190:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_12191
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12191:
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
    je "_L_12192"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12192:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_12193
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12193:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, -12(%esp)  # stack save
# emit-expr (begin (begin (vector-set! slen= 0 (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))) (vector-set! si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! si<n= 0 (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! ss= 0 (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f))))) (vector-ref ss= 0))
# emit-begin
#   expr=(begin (begin (vector-set! slen= 0 (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))) (vector-set! si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! si<n= 0 (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! ss= 0 (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f))))) (vector-ref ss= 0))
#   env=((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# emit-expr (begin (vector-set! slen= 0 (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))) (vector-set! si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! si<n= 0 (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! ss= 0 (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f)))))
# emit-begin
#   expr=(begin (vector-set! slen= 0 (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))) (vector-set! si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! si<n= 0 (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! ss= 0 (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f)))))
#   env=((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# emit-expr (vector-set! slen= 0 (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2)))))
# emit-expr slen=
# emit-variable-ref
# env=((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=slen=
    movl 0(%esp), %eax  # stack load slen=
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12194
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12194:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12195"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12195:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12197
    cmp  $0,%eax
    jge _L_12196
_L_12197:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12196:
    movl %eax, -20(%esp)
# emit-expr (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))
# emit-closure
# si = -24
# env = ((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr = (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))
    movl $_L_12198, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_12199            # jump around closure body
_L_12198:
# check argument count
    cmp $8,%eax
    je _L_12200
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_12200:
# emit-tail-expr
# si=-16
# env=((s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=(let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2)))
# emit-tail-let
#  si   = -16
#  env  = ((s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
#  bindings = ((s1 s1) (s2 s2))
#  body = (fx= (string-length s1) (string-length s2))
# emit-expr s1
# emit-variable-ref
# env=((s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s1
    movl -8(%esp), %eax  # stack load s1
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr s2
# emit-variable-ref
# env=((s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s2
    movl -12(%esp), %eax  # stack load s2
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=(fx= (string-length s1) (string-length s2))
# tail primcall
# emit-expr (string-length s2)
# emit-expr s2
# emit-variable-ref
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s2
    movl -20(%esp), %eax  # stack load s2
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_12201
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $0, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12201:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12202"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12202:
    movl %eax, -24(%esp)
# emit-expr (string-length s1)
# emit-expr s1
# emit-variable-ref
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s1
    movl -16(%esp), %eax  # stack load s1
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_12203
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $0, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12203:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12204"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12204:
    cmp -24(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
#return from tail (fx= (string-length s1) (string-length s2))
    ret
    .align 4,0x90
_L_12199:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! si<n= 0 (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! ss= 0 (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f)))))
# emit-begin
#   expr=(begin (vector-set! si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! si<n= 0 (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! ss= 0 (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f)))))
#   env=((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# emit-expr (vector-set! si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i)))))
# emit-expr si=
# emit-variable-ref
# env=((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=si=
    movl -4(%esp), %eax  # stack load si=
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12205
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12205:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12206"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12206:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12208
    cmp  $0,%eax
    jge _L_12207
_L_12208:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12207:
    movl %eax, -20(%esp)
# emit-expr (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))
# emit-closure
# si = -24
# env = ((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr = (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))
    movl $_L_12209, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_12210            # jump around closure body
_L_12209:
# check argument count
    cmp $12,%eax
    je _L_12211
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_12211:
# emit-tail-expr
# si=-20
# env=((i . -16) (s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=(let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i)))
# emit-tail-let
#  si   = -20
#  env  = ((i . -16) (s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
#  bindings = ((s1 s1) (s2 s2) (i i))
#  body = (char=? (string-ref s1 i) (string-ref s2 i))
# emit-expr s1
# emit-variable-ref
# env=((i . -16) (s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s1
    movl -8(%esp), %eax  # stack load s1
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-expr s2
# emit-variable-ref
# env=((i . -16) (s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s2
    movl -12(%esp), %eax  # stack load s2
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr i
# emit-variable-ref
# env=((i . -16) (s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=i
    movl -16(%esp), %eax  # stack load i
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-tail-expr
# si=-32
# env=((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=(char=? (string-ref s1 i) (string-ref s2 i))
# tail primcall
# char= c1=(string-ref s1 i) c2=(string-ref s2 i)
# emit-expr (string-ref s1 i)
# emit-expr s1
# emit-variable-ref
# env=((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s1
    movl -20(%esp), %eax  # stack load s1
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_12212
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $0, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12212:
    movl %eax, -32(%esp)
# emit-expr i
# emit-variable-ref
# env=((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=i
    movl -28(%esp), %eax  # stack load i
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12213"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12213:
# check bounds on string index
    movl -32(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_12215
    cmp  $0,%eax
    jge _L_12214
_L_12215:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12214:
    sar $2, %eax
    movl -32(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_12216"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $32,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12216:
    movb %ah, -32(%esp)
# emit-expr (string-ref s2 i)
# emit-expr s2
# emit-variable-ref
# env=((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s2
    movl -24(%esp), %eax  # stack load s2
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_12217
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $0, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12217:
    movl %eax, -36(%esp)
# emit-expr i
# emit-variable-ref
# env=((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=i
    movl -28(%esp), %eax  # stack load i
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12218"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12218:
# check bounds on string index
    movl -36(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_12220
    cmp  $0,%eax
    jge _L_12219
_L_12220:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12219:
    sar $2, %eax
    movl -36(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_12221"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $32,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12221:
    cmp %ah, -32(%esp)
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
#return from tail (char=? (string-ref s1 i) (string-ref s2 i))
    ret
    .align 4,0x90
_L_12210:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! si<n= 0 (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! ss= 0 (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f)))))
# emit-begin
#   expr=(begin (vector-set! si<n= 0 (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! ss= 0 (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f)))))
#   env=((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# emit-expr (vector-set! si<n= 0 (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f)))))
# emit-expr si<n=
# emit-variable-ref
# env=((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=si<n=
    movl -8(%esp), %eax  # stack load si<n=
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12222
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12222:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12223"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12223:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12225
    cmp  $0,%eax
    jge _L_12224
_L_12225:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12224:
    movl %eax, -20(%esp)
# emit-expr (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))
# emit-closure
# si = -24
# env = ((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr = (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))
    movl $_L_12226, 0(%ebp)  # closure label
# emit-variable-ref
# env=((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=si=
    movl -4(%esp), %eax  # stack load si=
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # si=
# emit-variable-ref
# env=((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=si<n=
    movl -8(%esp), %eax  # stack load si<n=
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # si<n=
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_12227            # jump around closure body
_L_12226:
# check argument count
    cmp $16,%eax
    je _L_12228
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_12228:
# emit-tail-expr
# si=-24
# env=((n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=(let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f)))
# emit-tail-let
#  si   = -24
#  env  = ((n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
#  bindings = ((s1 s1) (s2 s2) (i i) (n n))
#  body = (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))
# emit-expr s1
# emit-variable-ref
# env=((n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s1
    movl -8(%esp), %eax  # stack load s1
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr s2
# emit-variable-ref
# env=((n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s2
    movl -12(%esp), %eax  # stack load s2
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-expr i
# emit-variable-ref
# env=((n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=i
    movl -16(%esp), %eax  # stack load i
# end emit-variable-ref
    movl %eax, -32(%esp)  # stack save
# emit-expr n
# emit-variable-ref
# env=((n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=n
    movl -20(%esp), %eax  # stack load n
# end emit-variable-ref
    movl %eax, -36(%esp)  # stack save
# emit-tail-expr
# si=-40
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=(if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))
# emit-expr (fx= i n)
# emit-expr n
# emit-variable-ref
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=n
    movl -36(%esp), %eax  # stack load n
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12231"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12231:
    movl %eax, -40(%esp)
# emit-expr i
# emit-variable-ref
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=i
    movl -32(%esp), %eax  # stack load i
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12232"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12232:
    cmp -40(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_12229
# emit-tail-expr
# si=-40
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=#t
    movl $111, %eax     # immed #t
    ret                  # immediate tail return
    jmp _L_12230
_L_12229:
# emit-tail-expr
# si=-40
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=(if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f)
# emit-expr ((vector-ref si= 0) s1 s2 i)
# funcall
#    si   =-40
#    env  = ((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
#    expr = (funcall (vector-ref si= 0) s1 s2 i)
# emit-expr (vector-ref si= 0)
# emit-expr si=
# emit-variable-ref
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=si=
    movl 2(%edi), %eax  # frame load si=
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12235
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12235:
    movl %eax, -48(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12236"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12236:
# check bounds on vector index
    movl -48(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12238
    cmp  $0,%eax
    jge _L_12237
_L_12238:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12237:
    movl -48(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12239"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12239":
   movl %eax,  -48(%esp)  # stash funcall-oper in closure slot
# emit-expr s1
# emit-variable-ref
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s1
    movl -24(%esp), %eax  # stack load s1
# end emit-variable-ref
    mov %eax, -52(%esp)  # arg s1
# emit-expr s2
# emit-variable-ref
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s2
    movl -28(%esp), %eax  # stack load s2
# end emit-variable-ref
    mov %eax, -56(%esp)  # arg s2
# emit-expr i
# emit-variable-ref
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=i
    movl -32(%esp), %eax  # stack load i
# end emit-variable-ref
    mov %eax, -60(%esp)  # arg i
    movl -48(%esp), %edi   # load new closure to %edi
    add $-40, %esp   # adjust base
    movl $12,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $40, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_12233
# emit-tail-expr
# si=-40
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=((vector-ref si<n= 0) s1 s2 (fx+ i 1) n)
# emit-tail-funcall
#    si   =-40
#    env  = ((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
#    expr = (funcall (vector-ref si<n= 0) s1 s2 (fx+ i 1) n)
# emit-expr (vector-ref si<n= 0)
# emit-expr si<n=
# emit-variable-ref
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=si<n=
    movl 6(%edi), %eax  # frame load si<n=
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12240
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12240:
    movl %eax, -40(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12241"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12241:
# check bounds on vector index
    movl -40(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12243
    cmp  $0,%eax
    jge _L_12242
_L_12243:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12242:
    movl -40(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -40(%esp)  # stash funcall-oper in next closure slot
# emit-expr s1
# emit-variable-ref
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s1
    movl -24(%esp), %eax  # stack load s1
# end emit-variable-ref
    mov %eax, -44(%esp)    # arg s1
# emit-expr s2
# emit-variable-ref
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s2
    movl -28(%esp), %eax  # stack load s2
# end emit-variable-ref
    mov %eax, -48(%esp)    # arg s2
# emit-expr (fx+ i 1)
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12244"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12244:
    movl %eax, -52(%esp)  # fx+ push arg1
# emit-expr i
# emit-variable-ref
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=i
    movl -32(%esp), %eax  # stack load i
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12245"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12245:
    addl -52(%esp), %eax  # fx+ arg1 arg2
    mov %eax, -52(%esp)    # arg (fx+ i 1)
# emit-expr n
# emit-variable-ref
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
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
    movl $16,%eax   # save arg count
    jmp *-2(%edi)  # tail-funcall
    jmp _L_12234
_L_12233:
# emit-tail-expr
# si=-40
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_12234:
_L_12230:
    .align 4,0x90
_L_12227:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! ss= 0 (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f)))))
# emit-begin
#   expr=(begin (vector-set! ss= 0 (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f)))))
#   env=((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# emit-expr (vector-set! ss= 0 (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f))))
# emit-expr ss=
# emit-variable-ref
# env=((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=ss=
    movl -12(%esp), %eax  # stack load ss=
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12246
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12246:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12247"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12247:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12249
    cmp  $0,%eax
    jge _L_12248
_L_12249:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12248:
    movl %eax, -20(%esp)
# emit-expr (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f)))
# emit-closure
# si = -24
# env = ((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr = (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f)))
    movl $_L_12250, 0(%ebp)  # closure label
# emit-variable-ref
# env=((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=slen=
    movl 0(%esp), %eax  # stack load slen=
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # slen=
# emit-variable-ref
# env=((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=si<n=
    movl -8(%esp), %eax  # stack load si<n=
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # si<n=
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_12251            # jump around closure body
_L_12250:
# check argument count
    cmp $8,%eax
    je _L_12252
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_12252:
# emit-tail-expr
# si=-16
# env=((s2 . -12) (s1 . -8) (si<n= . 8) (slen= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=(let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f))
# emit-tail-let
#  si   = -16
#  env  = ((s2 . -12) (s1 . -8) (si<n= . 8) (slen= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
#  bindings = ((s1 s1) (s2 s2))
#  body = (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f)
# emit-expr s1
# emit-variable-ref
# env=((s2 . -12) (s1 . -8) (si<n= . 8) (slen= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s1
    movl -8(%esp), %eax  # stack load s1
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr s2
# emit-variable-ref
# env=((s2 . -12) (s1 . -8) (si<n= . 8) (slen= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s2
    movl -12(%esp), %eax  # stack load s2
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (slen= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=(if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f)
# emit-expr ((vector-ref slen= 0) s1 s2)
# funcall
#    si   =-24
#    env  = ((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (slen= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
#    expr = (funcall (vector-ref slen= 0) s1 s2)
# emit-expr (vector-ref slen= 0)
# emit-expr slen=
# emit-variable-ref
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (slen= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=slen=
    movl 2(%edi), %eax  # frame load slen=
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12255
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12255:
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12256"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12256:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12258
    cmp  $0,%eax
    jge _L_12257
_L_12258:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12257:
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12259"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12259":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr s1
# emit-variable-ref
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (slen= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s1
    movl -16(%esp), %eax  # stack load s1
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg s1
# emit-expr s2
# emit-variable-ref
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (slen= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s2
    movl -20(%esp), %eax  # stack load s2
# end emit-variable-ref
    mov %eax, -40(%esp)  # arg s2
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_12253
# emit-tail-expr
# si=-24
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (slen= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=((vector-ref si<n= 0) s1 s2 0 (string-length s1))
# emit-tail-funcall
#    si   =-24
#    env  = ((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (slen= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
#    expr = (funcall (vector-ref si<n= 0) s1 s2 0 (string-length s1))
# emit-expr (vector-ref si<n= 0)
# emit-expr si<n=
# emit-variable-ref
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (slen= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=si<n=
    movl 6(%edi), %eax  # frame load si<n=
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12260
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12260:
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12261"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12261:
# check bounds on vector index
    movl -24(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12263
    cmp  $0,%eax
    jge _L_12262
_L_12263:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12262:
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr s1
# emit-variable-ref
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (slen= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s1
    movl -16(%esp), %eax  # stack load s1
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg s1
# emit-expr s2
# emit-variable-ref
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (slen= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
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
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (slen= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s1
    movl -16(%esp), %eax  # stack load s1
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_12264
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $0, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12264:
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
    movl $16,%eax   # save arg count
    jmp *-2(%edi)  # tail-funcall
    jmp _L_12254
_L_12253:
# emit-tail-expr
# si=-24
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (slen= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_12254:
    .align 4,0x90
_L_12251:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# emit-expr (begin (vector-ref ss= 0))
# emit-begin
#   expr=(begin (vector-ref ss= 0))
#   env=((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# emit-expr (vector-ref ss= 0)
# emit-expr ss=
# emit-variable-ref
# env=((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=ss=
    movl -12(%esp), %eax  # stack load ss=
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12265
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12265:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12266"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12266:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12268
    cmp  $0,%eax
    jge _L_12267
_L_12268:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12267:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
     movl %eax, string$e$q
# == explicit-begins  ==>
# (letrec ((str->sym (lambda (str symlist) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let* ((new-sym (make-symbol str #f)) (new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym)) (str->sym str (cdr symlist))))))) (lambda (str) (str->sym str (symbols))))
# == eliminate-let*  ==>
# (letrec ((str->sym (lambda (str symlist) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) (str->sym str (cdr symlist))))))) (lambda (str) (str->sym str (symbols))))
# == eliminate-shadowing  ==>
# (letrec ((str->sym (lambda (str symlist) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) (str->sym str (cdr symlist))))))) (lambda (str) (str->sym str (symbols))))
# == vectorize-letrec  ==>
# (let ((str->sym (make-vector 1))) (begin (begin (vector-set! str->sym 0 (lambda (str symlist) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist))))))) (lambda (str) ((vector-ref str->sym 0) str (symbols)))))
# == eliminate-set!  ==>
# (let ((str->sym (make-vector 1))) (begin (begin (vector-set! str->sym 0 (lambda (str symlist) (let ((str str) (symlist symlist)) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist)))))))) (lambda (str) (let ((str str)) ((vector-ref str->sym 0) str (symbols))))))
# == close-free-variables  ==>
# (let ((str->sym (make-vector 1))) (begin (begin (vector-set! str->sym 0 (closure (str symlist) (string=? str->sym) (let ((str str) (symlist symlist)) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist)))))))) (closure (str) (str->sym symbols) (let ((str str)) ((vector-ref str->sym 0) str (symbols))))))
# == eliminate-quote  ==>
# (let ((str->sym (make-vector 1))) (begin (begin (vector-set! str->sym 0 (closure (str symlist) (string=? str->sym) (let ((str str) (symlist symlist)) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist)))))))) (closure (str) (str->sym symbols) (let ((str str)) ((vector-ref str->sym 0) str (symbols))))))
# == eliminate-when/unless  ==>
# (let ((str->sym (make-vector 1))) (begin (begin (vector-set! str->sym 0 (closure (str symlist) (string=? str->sym) (let ((str str) (symlist symlist)) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist)))))))) (closure (str) (str->sym symbols) (let ((str str)) ((vector-ref str->sym 0) str (symbols))))))
# == eliminate-cond  ==>
# (let ((str->sym (make-vector 1))) (begin (begin (vector-set! str->sym 0 (closure (str symlist) (string=? str->sym) (let ((str str) (symlist symlist)) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist)))))))) (closure (str) (str->sym symbols) (let ((str str)) ((vector-ref str->sym 0) str (symbols))))))
# == external-symbols  ==>
# (let ((str->sym (make-vector 1))) (begin (begin (vector-set! str->sym 0 (closure (str symlist) ((primitive-ref string=?) str->sym) (let ((str str) (symlist symlist)) (if ((primitive-ref string=?) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist)))))))) (closure (str) (str->sym (primitive-ref symbols)) (let ((str str)) ((vector-ref str->sym 0) str ((primitive-ref symbols)))))))
# emit-expr (let ((str->sym (make-vector 1))) (begin (begin (vector-set! str->sym 0 (closure (str symlist) ((primitive-ref string=?) str->sym) (let ((str str) (symlist symlist)) (if ((primitive-ref string=?) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist)))))))) (closure (str) (str->sym (primitive-ref symbols)) (let ((str str)) ((vector-ref str->sym 0) str ((primitive-ref symbols)))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((str->sym (make-vector 1)))
#  body = (begin (begin (vector-set! str->sym 0 (closure (str symlist) ((primitive-ref string=?) str->sym) (let ((str str) (symlist symlist)) (if ((primitive-ref string=?) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist)))))))) (closure (str) (str->sym (primitive-ref symbols)) (let ((str str)) ((vector-ref str->sym 0) str ((primitive-ref symbols))))))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12269"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12269:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_12270
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12270:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (begin (vector-set! str->sym 0 (closure (str symlist) ((primitive-ref string=?) str->sym) (let ((str str) (symlist symlist)) (if ((primitive-ref string=?) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist)))))))) (closure (str) (str->sym (primitive-ref symbols)) (let ((str str)) ((vector-ref str->sym 0) str ((primitive-ref symbols))))))
# emit-begin
#   expr=(begin (begin (vector-set! str->sym 0 (closure (str symlist) ((primitive-ref string=?) str->sym) (let ((str str) (symlist symlist)) (if ((primitive-ref string=?) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist)))))))) (closure (str) (str->sym (primitive-ref symbols)) (let ((str str)) ((vector-ref str->sym 0) str ((primitive-ref symbols))))))
#   env=((str->sym . 0))
# emit-expr (begin (vector-set! str->sym 0 (closure (str symlist) ((primitive-ref string=?) str->sym) (let ((str str) (symlist symlist)) (if ((primitive-ref string=?) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist))))))))
# emit-begin
#   expr=(begin (vector-set! str->sym 0 (closure (str symlist) ((primitive-ref string=?) str->sym) (let ((str str) (symlist symlist)) (if ((primitive-ref string=?) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist))))))))
#   env=((str->sym . 0))
# emit-expr (vector-set! str->sym 0 (closure (str symlist) ((primitive-ref string=?) str->sym) (let ((str str) (symlist symlist)) (if ((primitive-ref string=?) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist)))))))
# emit-expr str->sym
# emit-variable-ref
# env=((str->sym . 0))
# var=str->sym
    movl 0(%esp), %eax  # stack load str->sym
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12271
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12271:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12272"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12272:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12274
    cmp  $0,%eax
    jge _L_12273
_L_12274:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12273:
    movl %eax, -8(%esp)
# emit-expr (closure (str symlist) ((primitive-ref string=?) str->sym) (let ((str str) (symlist symlist)) (if ((primitive-ref string=?) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist))))))
# emit-closure
# si = -12
# env = ((str->sym . 0))
# expr = (closure (str symlist) ((primitive-ref string=?) str->sym) (let ((str str) (symlist symlist)) (if ((primitive-ref string=?) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist))))))
    movl $_L_12275, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref string=?) not defined in the environmnet
# emit-variable-ref
# env=((str->sym . 0))
# var=str->sym
    movl 0(%esp), %eax  # stack load str->sym
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # str->sym
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_12276            # jump around closure body
_L_12275:
# check argument count
    cmp $8,%eax
    je _L_12277
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_12277:
# emit-tail-expr
# si=-16
# env=((symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# expr=(let ((str str) (symlist symlist)) (if ((primitive-ref string=?) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist)))))
# emit-tail-let
#  si   = -16
#  env  = ((symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
#  bindings = ((str str) (symlist symlist))
#  body = (if ((primitive-ref string=?) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist))))
# emit-expr str
# emit-variable-ref
# env=((symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# var=str
    movl -8(%esp), %eax  # stack load str
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr symlist
# emit-variable-ref
# env=((symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# var=symlist
    movl -12(%esp), %eax  # stack load symlist
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# expr=(if ((primitive-ref string=?) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist))))
# emit-expr ((primitive-ref string=?) str (symbol->string (car symlist)))
# funcall
#    si   =-24
#    env  = ((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
#    expr = (funcall (primitive-ref string=?) str (symbol->string (car symlist)))
# emit-expr (primitive-ref string=?)
    .extern string$e$q
    movl string$e$q,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12280"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12280":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr str
# emit-variable-ref
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# var=str
    movl -16(%esp), %eax  # stack load str
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg str
# emit-expr (symbol->string (car symlist))
# symbol->string (car symlist)
# emit-expr (car symlist)
# emit-expr symlist
# emit-variable-ref
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# var=symlist
    movl -20(%esp), %eax  # stack load symlist
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_12281
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12281:
    movl -1(%eax), %eax
    movl -3(%eax), %eax
    mov %eax, -40(%esp)  # arg (symbol->string (car symlist))
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_12278
# emit-tail-expr
# si=-24
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# expr=(car symlist)
# tail primcall
# emit-expr symlist
# emit-variable-ref
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# var=symlist
    movl -20(%esp), %eax  # stack load symlist
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_12282
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12282:
    movl -1(%eax), %eax
#return from tail (car symlist)
    ret
    jmp _L_12279
_L_12278:
# emit-tail-expr
# si=-24
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# expr=(if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist)))
# emit-expr (null? (cdr symlist))
# emit-expr (cdr symlist)
# emit-expr symlist
# emit-variable-ref
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# var=symlist
    movl -20(%esp), %eax  # stack load symlist
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_12285
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12285:
    movl 3(%eax), %eax
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_12283
# emit-tail-expr
# si=-24
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# expr=(let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym)))
# emit-tail-let
#  si   = -24
#  env  = ((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
#  bindings = ((new-sym (make-symbol str #f)))
#  body = (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))
# emit-expr (make-symbol str #f)
# make-symbol arg1=str arg2=#f
# emit-expr str
# emit-variable-ref
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
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
# env=((new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# expr=(let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))
# emit-tail-let
#  si   = -28
#  env  = ((new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
#  bindings = ((new-cdr (cons new-sym ())))
#  body = (begin (set-cdr! symlist new-cdr) new-sym)
# emit-expr (cons new-sym ())
# cons arg1=new-sym arg2=()
# emit-expr new-sym
# emit-variable-ref
# env=((new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
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
# env=((new-cdr . -28) (new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# expr=(begin (set-cdr! symlist new-cdr) new-sym)
# tail-begin (begin (set-cdr! symlist new-cdr) new-sym)
#   env=((new-cdr . -28) (new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# emit-expr (set-cdr! symlist new-cdr)
# emit-expr symlist
# emit-variable-ref
# env=((new-cdr . -28) (new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# var=symlist
    movl -20(%esp), %eax  # stack load symlist
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_12286
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12286:
    movl %eax, -32(%esp)
# emit-expr new-cdr
# emit-variable-ref
# env=((new-cdr . -28) (new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# var=new-cdr
    movl -28(%esp), %eax  # stack load new-cdr
# end emit-variable-ref
    movl -32(%esp), %ebx
    movl %eax, 3(%ebx)
# emit-tail-expr
# si=-32
# env=((new-cdr . -28) (new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# expr=(begin new-sym)
# tail-begin (begin new-sym)
#   env=((new-cdr . -28) (new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# emit-tail-expr
# si=-32
# env=((new-cdr . -28) (new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# expr=new-sym
# emit-tail-variable-ref
# emit-variable-ref
# env=((new-cdr . -28) (new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# var=new-sym
    movl -24(%esp), %eax  # stack load new-sym
# end emit-variable-ref
    ret
# end emit-tail-variable ref
     ret   # return thru stack
    jmp _L_12284
_L_12283:
# emit-tail-expr
# si=-24
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# expr=((vector-ref str->sym 0) str (cdr symlist))
# emit-tail-funcall
#    si   =-24
#    env  = ((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
#    expr = (funcall (vector-ref str->sym 0) str (cdr symlist))
# emit-expr (vector-ref str->sym 0)
# emit-expr str->sym
# emit-variable-ref
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# var=str->sym
    movl 6(%edi), %eax  # frame load str->sym
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12287
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12287:
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12288"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12288:
# check bounds on vector index
    movl -24(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12290
    cmp  $0,%eax
    jge _L_12289
_L_12290:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12289:
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr str
# emit-variable-ref
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# var=str
    movl -16(%esp), %eax  # stack load str
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg str
# emit-expr (cdr symlist)
# emit-expr symlist
# emit-variable-ref
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# var=symlist
    movl -20(%esp), %eax  # stack load symlist
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_12291
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12291:
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
    movl $8,%eax   # save arg count
    jmp *-2(%edi)  # tail-funcall
_L_12284:
_L_12279:
    .align 4,0x90
_L_12276:
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((str->sym . 0))
# emit-expr (begin (closure (str) (str->sym (primitive-ref symbols)) (let ((str str)) ((vector-ref str->sym 0) str ((primitive-ref symbols))))))
# emit-begin
#   expr=(begin (closure (str) (str->sym (primitive-ref symbols)) (let ((str str)) ((vector-ref str->sym 0) str ((primitive-ref symbols))))))
#   env=((str->sym . 0))
# emit-expr (closure (str) (str->sym (primitive-ref symbols)) (let ((str str)) ((vector-ref str->sym 0) str ((primitive-ref symbols)))))
# emit-closure
# si = -4
# env = ((str->sym . 0))
# expr = (closure (str) (str->sym (primitive-ref symbols)) (let ((str str)) ((vector-ref str->sym 0) str ((primitive-ref symbols)))))
    movl $_L_12292, 0(%ebp)  # closure label
# emit-variable-ref
# env=((str->sym . 0))
# var=str->sym
    movl 0(%esp), %eax  # stack load str->sym
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # str->sym
# WARNING: free var (primitive-ref symbols) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_12293            # jump around closure body
_L_12292:
# check argument count
    cmp $4,%eax
    je _L_12294
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_12294:
# emit-tail-expr
# si=-12
# env=((str . -8) ((primitive-ref symbols) . 8) (str->sym . 4) (str->sym . 0))
# expr=(let ((str str)) ((vector-ref str->sym 0) str ((primitive-ref symbols))))
# emit-tail-let
#  si   = -12
#  env  = ((str . -8) ((primitive-ref symbols) . 8) (str->sym . 4) (str->sym . 0))
#  bindings = ((str str))
#  body = ((vector-ref str->sym 0) str ((primitive-ref symbols)))
# emit-expr str
# emit-variable-ref
# env=((str . -8) ((primitive-ref symbols) . 8) (str->sym . 4) (str->sym . 0))
# var=str
    movl -8(%esp), %eax  # stack load str
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((str . -12) (str . -8) ((primitive-ref symbols) . 8) (str->sym . 4) (str->sym . 0))
# expr=((vector-ref str->sym 0) str ((primitive-ref symbols)))
# emit-tail-funcall
#    si   =-16
#    env  = ((str . -12) (str . -8) ((primitive-ref symbols) . 8) (str->sym . 4) (str->sym . 0))
#    expr = (funcall (vector-ref str->sym 0) str ((primitive-ref symbols)))
# emit-expr (vector-ref str->sym 0)
# emit-expr str->sym
# emit-variable-ref
# env=((str . -12) (str . -8) ((primitive-ref symbols) . 8) (str->sym . 4) (str->sym . 0))
# var=str->sym
    movl 2(%edi), %eax  # frame load str->sym
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12295
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12295:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12296"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12296:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12298
    cmp  $0,%eax
    jge _L_12297
_L_12298:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12297:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr str
# emit-variable-ref
# env=((str . -12) (str . -8) ((primitive-ref symbols) . 8) (str->sym . 4) (str->sym . 0))
# var=str
    movl -12(%esp), %eax  # stack load str
# end emit-variable-ref
    mov %eax, -20(%esp)    # arg str
# emit-expr ((primitive-ref symbols))
# funcall
#    si   =-24
#    env  = ((str . -12) (str . -8) ((primitive-ref symbols) . 8) (str->sym . 4) (str->sym . 0))
#    expr = (funcall (primitive-ref symbols))
# emit-expr (primitive-ref symbols)
    .extern symbols
    movl symbols,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12299"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12299":
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
_L_12293:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((str->sym . 0))
     movl %eax, string$m$gsymbol
# == explicit-begins  ==>
# (lambda (lst elt) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt))))
# == eliminate-let*  ==>
# (lambda (lst elt) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt))))
# == eliminate-shadowing  ==>
# (lambda (lst elt) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt))))
# == vectorize-letrec  ==>
# (lambda (lst elt) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt))))
# == eliminate-set!  ==>
# (lambda (lst elt) (let ((lst lst) (elt elt)) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt)))))
# == close-free-variables  ==>
# (closure (lst elt) (e nil append1) (let ((lst lst) (elt elt)) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt)))))
# == eliminate-quote  ==>
# (closure (lst elt) (e nil append1) (let ((lst lst) (elt elt)) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt)))))
# == eliminate-when/unless  ==>
# (closure (lst elt) (e nil append1) (let ((lst lst) (elt elt)) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt)))))
# == eliminate-cond  ==>
# (closure (lst elt) (e nil append1) (let ((lst lst) (elt elt)) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt)))))
# == external-symbols  ==>
# (closure (lst elt) (e nil (primitive-ref append1)) (let ((lst lst) (elt elt)) (if (null? lst) (cons e nil) (cons (car lst) ((primitive-ref append1) (cdr lst) elt)))))
# emit-expr (closure (lst elt) (e nil (primitive-ref append1)) (let ((lst lst) (elt elt)) (if (null? lst) (cons e nil) (cons (car lst) ((primitive-ref append1) (cdr lst) elt)))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (lst elt) (e nil (primitive-ref append1)) (let ((lst lst) (elt elt)) (if (null? lst) (cons e nil) (cons (car lst) ((primitive-ref append1) (cdr lst) elt)))))
    movl $_L_12300, 0(%ebp)  # closure label
# WARNING: free var e not defined in the environmnet
# WARNING: free var nil not defined in the environmnet
# WARNING: free var (primitive-ref append1) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_12301            # jump around closure body
_L_12300:
# check argument count
    cmp $8,%eax
    je _L_12302
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_12302:
# emit-tail-expr
# si=-16
# env=((elt . -12) (lst . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(let ((lst lst) (elt elt)) (if (null? lst) (cons e nil) (cons (car lst) ((primitive-ref append1) (cdr lst) elt))))
# emit-tail-let
#  si   = -16
#  env  = ((elt . -12) (lst . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
#  bindings = ((lst lst) (elt elt))
#  body = (if (null? lst) (cons e nil) (cons (car lst) ((primitive-ref append1) (cdr lst) elt)))
# emit-expr lst
# emit-variable-ref
# env=((elt . -12) (lst . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=lst
    movl -8(%esp), %eax  # stack load lst
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr elt
# emit-variable-ref
# env=((elt . -12) (lst . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=elt
    movl -12(%esp), %eax  # stack load elt
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((elt . -20) (lst . -16) (elt . -12) (lst . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(if (null? lst) (cons e nil) (cons (car lst) ((primitive-ref append1) (cdr lst) elt)))
# emit-expr (null? lst)
# emit-expr lst
# emit-variable-ref
# env=((elt . -20) (lst . -16) (elt . -12) (lst . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=lst
    movl -16(%esp), %eax  # stack load lst
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_12303
# emit-tail-expr
# si=-24
# env=((elt . -20) (lst . -16) (elt . -12) (lst . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(cons e nil)
# tail primcall
# cons arg1=e arg2=nil
# emit-expr e
# emit-variable-ref
# env=((elt . -20) (lst . -16) (elt . -12) (lst . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=e
    movl 2(%edi), %eax  # frame load e
# end emit-variable-ref
    movl %eax, -24(%esp)
# emit-expr nil
# emit-variable-ref
# env=((elt . -20) (lst . -16) (elt . -12) (lst . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
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
    jmp _L_12304
_L_12303:
# emit-tail-expr
# si=-24
# env=((elt . -20) (lst . -16) (elt . -12) (lst . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(cons (car lst) ((primitive-ref append1) (cdr lst) elt))
# tail primcall
# cons arg1=(car lst) arg2=((primitive-ref append1) (cdr lst) elt)
# emit-expr (car lst)
# emit-expr lst
# emit-variable-ref
# env=((elt . -20) (lst . -16) (elt . -12) (lst . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=lst
    movl -16(%esp), %eax  # stack load lst
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_12305
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12305:
    movl -1(%eax), %eax
    movl %eax, -24(%esp)
# emit-expr ((primitive-ref append1) (cdr lst) elt)
# funcall
#    si   =-28
#    env  = ((elt . -20) (lst . -16) (elt . -12) (lst . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
#    expr = (funcall (primitive-ref append1) (cdr lst) elt)
# emit-expr (primitive-ref append1)
    .extern append1
    movl append1,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12306"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12306":
   movl %eax,  -36(%esp)  # stash funcall-oper in closure slot
# emit-expr (cdr lst)
# emit-expr lst
# emit-variable-ref
# env=((elt . -20) (lst . -16) (elt . -12) (lst . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=lst
    movl -16(%esp), %eax  # stack load lst
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_12307
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12307:
    movl 3(%eax), %eax
    mov %eax, -40(%esp)  # arg (cdr lst)
# emit-expr elt
# emit-variable-ref
# env=((elt . -20) (lst . -16) (elt . -12) (lst . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=elt
    movl -20(%esp), %eax  # stack load elt
# end emit-variable-ref
    mov %eax, -44(%esp)  # arg elt
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
#return from tail (cons (car lst) ((primitive-ref append1) (cdr lst) elt))
    ret
_L_12304:
    .align 4,0x90
_L_12301:
     movl %eax, append1
# == explicit-begins  ==>
# (lambda (l k) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1))))
# == eliminate-let*  ==>
# (lambda (l k) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1))))
# == eliminate-shadowing  ==>
# (lambda (l k) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1))))
# == vectorize-letrec  ==>
# (lambda (l k) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1))))
# == eliminate-set!  ==>
# (lambda (l k) (let ((l l) (k k)) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1)))))
# == close-free-variables  ==>
# (closure (l k) (list-ref) (let ((l l) (k k)) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1)))))
# == eliminate-quote  ==>
# (closure (l k) (list-ref) (let ((l l) (k k)) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1)))))
# == eliminate-when/unless  ==>
# (closure (l k) (list-ref) (let ((l l) (k k)) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1)))))
# == eliminate-cond  ==>
# (closure (l k) (list-ref) (let ((l l) (k k)) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1)))))
# == external-symbols  ==>
# (closure (l k) ((primitive-ref list-ref)) (let ((l l) (k k)) (if (fx= k 0) (car l) ((primitive-ref list-ref) (cdr l) (fx- k 1)))))
# emit-expr (closure (l k) ((primitive-ref list-ref)) (let ((l l) (k k)) (if (fx= k 0) (car l) ((primitive-ref list-ref) (cdr l) (fx- k 1)))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (l k) ((primitive-ref list-ref)) (let ((l l) (k k)) (if (fx= k 0) (car l) ((primitive-ref list-ref) (cdr l) (fx- k 1)))))
    movl $_L_12308, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_12309            # jump around closure body
_L_12308:
# check argument count
    cmp $8,%eax
    je _L_12310
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_12310:
# emit-tail-expr
# si=-16
# env=((k . -12) (l . -8) ((primitive-ref list-ref) . 4))
# expr=(let ((l l) (k k)) (if (fx= k 0) (car l) ((primitive-ref list-ref) (cdr l) (fx- k 1))))
# emit-tail-let
#  si   = -16
#  env  = ((k . -12) (l . -8) ((primitive-ref list-ref) . 4))
#  bindings = ((l l) (k k))
#  body = (if (fx= k 0) (car l) ((primitive-ref list-ref) (cdr l) (fx- k 1)))
# emit-expr l
# emit-variable-ref
# env=((k . -12) (l . -8) ((primitive-ref list-ref) . 4))
# var=l
    movl -8(%esp), %eax  # stack load l
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr k
# emit-variable-ref
# env=((k . -12) (l . -8) ((primitive-ref list-ref) . 4))
# var=k
    movl -12(%esp), %eax  # stack load k
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((k . -20) (l . -16) (k . -12) (l . -8) ((primitive-ref list-ref) . 4))
# expr=(if (fx= k 0) (car l) ((primitive-ref list-ref) (cdr l) (fx- k 1)))
# emit-expr (fx= k 0)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12313"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12313:
    movl %eax, -24(%esp)
# emit-expr k
# emit-variable-ref
# env=((k . -20) (l . -16) (k . -12) (l . -8) ((primitive-ref list-ref) . 4))
# var=k
    movl -20(%esp), %eax  # stack load k
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12314"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12314:
    cmp -24(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_12311
# emit-tail-expr
# si=-24
# env=((k . -20) (l . -16) (k . -12) (l . -8) ((primitive-ref list-ref) . 4))
# expr=(car l)
# tail primcall
# emit-expr l
# emit-variable-ref
# env=((k . -20) (l . -16) (k . -12) (l . -8) ((primitive-ref list-ref) . 4))
# var=l
    movl -16(%esp), %eax  # stack load l
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_12315
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12315:
    movl -1(%eax), %eax
#return from tail (car l)
    ret
    jmp _L_12312
_L_12311:
# emit-tail-expr
# si=-24
# env=((k . -20) (l . -16) (k . -12) (l . -8) ((primitive-ref list-ref) . 4))
# expr=((primitive-ref list-ref) (cdr l) (fx- k 1))
# emit-tail-funcall
#    si   =-24
#    env  = ((k . -20) (l . -16) (k . -12) (l . -8) ((primitive-ref list-ref) . 4))
#    expr = (funcall (primitive-ref list-ref) (cdr l) (fx- k 1))
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr (cdr l)
# emit-expr l
# emit-variable-ref
# env=((k . -20) (l . -16) (k . -12) (l . -8) ((primitive-ref list-ref) . 4))
# var=l
    movl -16(%esp), %eax  # stack load l
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_12316
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12316:
    movl 3(%eax), %eax
    mov %eax, -28(%esp)    # arg (cdr l)
# emit-expr (fx- k 1)
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12317"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $84,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12317:
    movl %eax, -32(%esp)
# emit-expr k
# emit-variable-ref
# env=((k . -20) (l . -16) (k . -12) (l . -8) ((primitive-ref list-ref) . 4))
# var=k
    movl -20(%esp), %eax  # stack load k
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12318"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $84,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12318:
    subl -32(%esp), %eax
    mov %eax, -32(%esp)    # arg (fx- k 1)
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
_L_12312:
    .align 4,0x90
_L_12309:
     movl %eax, list$mref
# == explicit-begins  ==>
# (let* ((write-stderr (lambda (s) (foreign-call "s_write" 2 s (string-length s)))) (write-errmsg (lambda (sym emsg) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))))) (lambda (sym emsg) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))
# == eliminate-let*  ==>
# (let ((write-stderr (lambda (s) (foreign-call "s_write" 2 s (string-length s))))) (let ((write-errmsg (lambda (sym emsg) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))))) (lambda (sym emsg) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1)))))
# == eliminate-shadowing  ==>
# (let ((write-stderr (lambda (s) (foreign-call "s_write" 2 s (string-length s))))) (let ((write-errmsg (lambda (sym emsg) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))))) (lambda (sym emsg) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1)))))
# == vectorize-letrec  ==>
# (let ((write-stderr (lambda (s) (foreign-call "s_write" 2 s (string-length s))))) (let ((write-errmsg (lambda (sym emsg) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))))) (lambda (sym emsg) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1)))))
# == eliminate-set!  ==>
# (let ((write-stderr (lambda (s) (let ((s s)) (foreign-call "s_write" 2 s (string-length s)))))) (let ((write-errmsg (lambda (sym emsg) (let ((sym sym) (emsg emsg)) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n")))))) (lambda (sym emsg) (let ((sym sym) (emsg emsg)) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))))
# == close-free-variables  ==>
# (let ((write-stderr (closure (s) () (let ((s s)) (foreign-call "s_write" 2 s (string-length s)))))) (let ((write-errmsg (closure (sym emsg) (write-stderr write-stderr write-stderr write-stderr write-stderr) (let ((sym sym) (emsg emsg)) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n")))))) (closure (sym emsg) (write-errmsg) (let ((sym sym) (emsg emsg)) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))))
# == eliminate-quote  ==>
# (let ((write-stderr (closure (s) () (let ((s s)) (foreign-call "s_write" 2 s (string-length s)))))) (let ((write-errmsg (closure (sym emsg) (write-stderr write-stderr write-stderr write-stderr write-stderr) (let ((sym sym) (emsg emsg)) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n")))))) (closure (sym emsg) (write-errmsg) (let ((sym sym) (emsg emsg)) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))))
# == eliminate-when/unless  ==>
# (let ((write-stderr (closure (s) () (let ((s s)) (foreign-call "s_write" 2 s (string-length s)))))) (let ((write-errmsg (closure (sym emsg) (write-stderr write-stderr write-stderr write-stderr write-stderr) (let ((sym sym) (emsg emsg)) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n")))))) (closure (sym emsg) (write-errmsg) (let ((sym sym) (emsg emsg)) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))))
# == eliminate-cond  ==>
# (let ((write-stderr (closure (s) () (let ((s s)) (foreign-call "s_write" 2 s (string-length s)))))) (let ((write-errmsg (closure (sym emsg) (write-stderr write-stderr write-stderr write-stderr write-stderr) (let ((sym sym) (emsg emsg)) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n")))))) (closure (sym emsg) (write-errmsg) (let ((sym sym) (emsg emsg)) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))))
# == external-symbols  ==>
# (let ((write-stderr (closure (s) () (let ((s s)) (foreign-call "s_write" 2 s (string-length s)))))) (let ((write-errmsg (closure (sym emsg) (write-stderr write-stderr write-stderr write-stderr write-stderr) (let ((sym sym) (emsg emsg)) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n")))))) (closure (sym emsg) (write-errmsg) (let ((sym sym) (emsg emsg)) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))))
# emit-expr (let ((write-stderr (closure (s) () (let ((s s)) (foreign-call "s_write" 2 s (string-length s)))))) (let ((write-errmsg (closure (sym emsg) (write-stderr write-stderr write-stderr write-stderr write-stderr) (let ((sym sym) (emsg emsg)) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n")))))) (closure (sym emsg) (write-errmsg) (let ((sym sym) (emsg emsg)) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((write-stderr (closure (s) () (let ((s s)) (foreign-call "s_write" 2 s (string-length s))))))
#  body = (let ((write-errmsg (closure (sym emsg) (write-stderr write-stderr write-stderr write-stderr write-stderr) (let ((sym sym) (emsg emsg)) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n")))))) (closure (sym emsg) (write-errmsg) (let ((sym sym) (emsg emsg)) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1)))))
# emit-expr (closure (s) () (let ((s s)) (foreign-call "s_write" 2 s (string-length s))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (s) () (let ((s s)) (foreign-call "s_write" 2 s (string-length s))))
    movl $_L_12319, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_12320            # jump around closure body
_L_12319:
# check argument count
    cmp $4,%eax
    je _L_12321
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_12321:
# emit-tail-expr
# si=-12
# env=((s . -8))
# expr=(let ((s s)) (foreign-call "s_write" 2 s (string-length s)))
# emit-tail-let
#  si   = -12
#  env  = ((s . -8))
#  bindings = ((s s))
#  body = (foreign-call "s_write" 2 s (string-length s))
# emit-expr s
# emit-variable-ref
# env=((s . -8))
# var=s
    movl -8(%esp), %eax  # stack load s
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((s . -12) (s . -8))
# expr=(foreign-call "s_write" 2 s (string-length s))
    movl %ecx,-16(%esp)
    movl %esp,-20(%esp)
# emit-expr (string-length s)
# emit-expr s
# emit-variable-ref
# env=((s . -12) (s . -8))
# var=s
    movl -12(%esp), %eax  # stack load s
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_12322
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $0, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12322:
    movl -6(%eax), %eax
    movl %eax, -24(%esp)
# emit-expr s
# emit-variable-ref
# env=((s . -12) (s . -8))
# var=s
    movl -12(%esp), %eax  # stack load s
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
_L_12320:
    movl %eax, 0(%esp)  # stack save
# emit-expr (let ((write-errmsg (closure (sym emsg) (write-stderr write-stderr write-stderr write-stderr write-stderr) (let ((sym sym) (emsg emsg)) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n")))))) (closure (sym emsg) (write-errmsg) (let ((sym sym) (emsg emsg)) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1)))))
# emit-let
#  si   = -4
#  env  = ((write-stderr . 0))
#  bindings = ((write-errmsg (closure (sym emsg) (write-stderr write-stderr write-stderr write-stderr write-stderr) (let ((sym sym) (emsg emsg)) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))))))
#  body = (closure (sym emsg) (write-errmsg) (let ((sym sym) (emsg emsg)) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))
# emit-expr (closure (sym emsg) (write-stderr write-stderr write-stderr write-stderr write-stderr) (let ((sym sym) (emsg emsg)) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))))
# emit-closure
# si = -4
# env = ((write-stderr . 0))
# expr = (closure (sym emsg) (write-stderr write-stderr write-stderr write-stderr write-stderr) (let ((sym sym) (emsg emsg)) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))))
    movl $_L_12323, 0(%ebp)  # closure label
# emit-variable-ref
# env=((write-stderr . 0))
# var=write-stderr
    movl 0(%esp), %eax  # stack load write-stderr
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # write-stderr
# emit-variable-ref
# env=((write-stderr . 0))
# var=write-stderr
    movl 0(%esp), %eax  # stack load write-stderr
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # write-stderr
# emit-variable-ref
# env=((write-stderr . 0))
# var=write-stderr
    movl 0(%esp), %eax  # stack load write-stderr
# end emit-variable-ref
   movl  %eax, 12(%ebp)  # write-stderr
# emit-variable-ref
# env=((write-stderr . 0))
# var=write-stderr
    movl 0(%esp), %eax  # stack load write-stderr
# end emit-variable-ref
   movl  %eax, 16(%ebp)  # write-stderr
# emit-variable-ref
# env=((write-stderr . 0))
# var=write-stderr
    movl 0(%esp), %eax  # stack load write-stderr
# end emit-variable-ref
   movl  %eax, 20(%ebp)  # write-stderr
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $24, %ebp     # bump ebp
    jmp _L_12324            # jump around closure body
_L_12323:
# check argument count
    cmp $8,%eax
    je _L_12325
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_12325:
# emit-tail-expr
# si=-16
# env=((emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# expr=(let ((sym sym) (emsg emsg)) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n")))
# emit-tail-let
#  si   = -16
#  env  = ((emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
#  bindings = ((sym sym) (emsg emsg))
#  body = (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))
# emit-expr sym
# emit-variable-ref
# env=((emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# var=sym
    movl -8(%esp), %eax  # stack load sym
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr emsg
# emit-variable-ref
# env=((emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# var=emsg
    movl -12(%esp), %eax  # stack load emsg
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# expr=(begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))
# tail-begin (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))
#   env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# emit-expr (write-stderr "error:")
# funcall
#    si   =-24
#    env  = ((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
#    expr = (funcall write-stderr "error:")
# emit-expr write-stderr
# emit-variable-ref
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# var=write-stderr
    movl 18(%edi), %eax  # frame load write-stderr
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12326"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12326":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr "error:"
# string literal
    jmp _L_12328
    .align 8,0x90
_L_12327 :
    .int 24
    .ascii "error:"
_L_12328:
    movl $_L_12327, %eax
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
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# expr=(begin (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))
# tail-begin (begin (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))
#   env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# emit-expr (write-stderr (symbol->string sym))
# funcall
#    si   =-24
#    env  = ((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
#    expr = (funcall write-stderr (symbol->string sym))
# emit-expr write-stderr
# emit-variable-ref
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# var=write-stderr
    movl 18(%edi), %eax  # frame load write-stderr
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12329"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12329":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr (symbol->string sym)
# symbol->string sym
# emit-expr sym
# emit-variable-ref
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# var=sym
    movl -16(%esp), %eax  # stack load sym
# end emit-variable-ref
    movl -3(%eax), %eax
    mov %eax, -36(%esp)  # arg (symbol->string sym)
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# expr=(begin (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))
# tail-begin (begin (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))
#   env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# emit-expr (write-stderr ": ")
# funcall
#    si   =-24
#    env  = ((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
#    expr = (funcall write-stderr ": ")
# emit-expr write-stderr
# emit-variable-ref
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# var=write-stderr
    movl 18(%edi), %eax  # frame load write-stderr
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12330"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12330":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr ": "
# string literal
    jmp _L_12332
    .align 8,0x90
_L_12331 :
    .int 8
    .ascii ": "
_L_12332:
    movl $_L_12331, %eax
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
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# expr=(begin (write-stderr emsg) (write-stderr "\n"))
# tail-begin (begin (write-stderr emsg) (write-stderr "\n"))
#   env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# emit-expr (write-stderr emsg)
# funcall
#    si   =-24
#    env  = ((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
#    expr = (funcall write-stderr emsg)
# emit-expr write-stderr
# emit-variable-ref
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# var=write-stderr
    movl 18(%edi), %eax  # frame load write-stderr
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12333"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12333":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr emsg
# emit-variable-ref
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# var=emsg
    movl -20(%esp), %eax  # stack load emsg
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg emsg
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# expr=(begin (write-stderr "\n"))
# tail-begin (begin (write-stderr "\n"))
#   env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# emit-tail-expr
# si=-24
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# expr=(write-stderr "\n")
# emit-tail-funcall
#    si   =-24
#    env  = ((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
#    expr = (funcall write-stderr "\n")
# emit-expr write-stderr
# emit-variable-ref
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# var=write-stderr
    movl 18(%edi), %eax  # frame load write-stderr
# end emit-variable-ref
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr "\n"
# string literal
    jmp _L_12335
    .align 8,0x90
_L_12334 :
    .int 4
    .ascii "\n"
_L_12335:
    movl $_L_12334, %eax
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
_L_12324:
    movl %eax, -4(%esp)  # stack save
# emit-expr (closure (sym emsg) (write-errmsg) (let ((sym sym) (emsg emsg)) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))
# emit-closure
# si = -8
# env = ((write-errmsg . -4) (write-stderr . 0))
# expr = (closure (sym emsg) (write-errmsg) (let ((sym sym) (emsg emsg)) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))
    movl $_L_12336, 0(%ebp)  # closure label
# emit-variable-ref
# env=((write-errmsg . -4) (write-stderr . 0))
# var=write-errmsg
    movl -4(%esp), %eax  # stack load write-errmsg
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # write-errmsg
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_12337            # jump around closure body
_L_12336:
# check argument count
    cmp $8,%eax
    je _L_12338
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_12338:
# emit-tail-expr
# si=-16
# env=((emsg . -12) (sym . -8) (write-errmsg . 4) (write-errmsg . -4) (write-stderr . 0))
# expr=(let ((sym sym) (emsg emsg)) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1)))
# emit-tail-let
#  si   = -16
#  env  = ((emsg . -12) (sym . -8) (write-errmsg . 4) (write-errmsg . -4) (write-stderr . 0))
#  bindings = ((sym sym) (emsg emsg))
#  body = (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))
# emit-expr sym
# emit-variable-ref
# env=((emsg . -12) (sym . -8) (write-errmsg . 4) (write-errmsg . -4) (write-stderr . 0))
# var=sym
    movl -8(%esp), %eax  # stack load sym
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr emsg
# emit-variable-ref
# env=((emsg . -12) (sym . -8) (write-errmsg . 4) (write-errmsg . -4) (write-stderr . 0))
# var=emsg
    movl -12(%esp), %eax  # stack load emsg
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-errmsg . 4) (write-errmsg . -4) (write-stderr . 0))
# expr=(begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))
# tail-begin (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))
#   env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-errmsg . 4) (write-errmsg . -4) (write-stderr . 0))
# emit-expr (write-errmsg sym emsg)
# funcall
#    si   =-24
#    env  = ((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-errmsg . 4) (write-errmsg . -4) (write-stderr . 0))
#    expr = (funcall write-errmsg sym emsg)
# emit-expr write-errmsg
# emit-variable-ref
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-errmsg . 4) (write-errmsg . -4) (write-stderr . 0))
# var=write-errmsg
    movl 2(%edi), %eax  # frame load write-errmsg
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12339"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12339":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr sym
# emit-variable-ref
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-errmsg . 4) (write-errmsg . -4) (write-stderr . 0))
# var=sym
    movl -16(%esp), %eax  # stack load sym
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg sym
# emit-expr emsg
# emit-variable-ref
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-errmsg . 4) (write-errmsg . -4) (write-stderr . 0))
# var=emsg
    movl -20(%esp), %eax  # stack load emsg
# end emit-variable-ref
    mov %eax, -40(%esp)  # arg emsg
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-errmsg . 4) (write-errmsg . -4) (write-stderr . 0))
# expr=(begin (foreign-call "s_exit" 1))
# tail-begin (begin (foreign-call "s_exit" 1))
#   env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-errmsg . 4) (write-errmsg . -4) (write-stderr . 0))
# emit-tail-expr
# si=-24
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-errmsg . 4) (write-errmsg . -4) (write-stderr . 0))
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
_L_12337:
     movl %eax, error
# == explicit-begins  ==>
# (let ((p (quote ()))) (begin (set! p (cons (quote procedure?) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote symbol-value) p)) (set! p (cons (quote symbol->string) p)) (set! p (cons (quote make-symbol) p)) (set! p (cons (quote symbol?) p)) (set! p (cons (quote string-set!) p)) (set! p (cons (quote string-ref) p)) (set! p (cons (quote string-length) p)) (set! p (cons (quote string?) p)) (set! p (cons (quote make-string) p)) (set! p (cons (quote vector) p)) (set! p (cons (quote vector-ref) p)) (set! p (cons (quote vector-set!) p)) (set! p (cons (quote vector-length) p)) (set! p (cons (quote make-vector) p)) (set! p (cons (quote vector?) p)) (set! p (cons (quote set-cdr!) p)) (set! p (cons (quote set-car!) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote cons) p)) (set! p (cons (quote pair?) p)) (set! p (cons (quote fx*) p)) (set! p (cons (quote fx-) p)) (set! p (cons (quote fx+) p)) (set! p (cons (quote fx>=) p)) (set! p (cons (quote fx>) p)) (set! p (cons (quote fx<=) p)) (set! p (cons (quote fx<) p)) (set! p (cons (quote fx=) p)) (set! p (cons (quote fxzero?) p)) (set! p (cons (quote fxsub1) p)) (set! p (cons (quote fxadd1) p)) (set! p (cons (quote fxlogor) p)) (set! p (cons (quote fxlogand) p)) (set! p (cons (quote fxlognot) p)) (set! p (cons (quote char=?) p)) (set! p (cons (quote eq?) p)) (set! p (cons (quote not) p)) (set! p (cons (quote boolean?) p)) (set! p (cons (quote fixnum?) p)) (set! p (cons (quote char?) p)) (set! p (cons (quote null?) p)) (set! p (cons (quote char->fixnum) p)) (set! p (cons (quote fixnum->char) p)) (lambda () p)))
# == eliminate-let*  ==>
# (let ((p (quote ()))) (begin (set! p (cons (quote procedure?) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote symbol-value) p)) (set! p (cons (quote symbol->string) p)) (set! p (cons (quote make-symbol) p)) (set! p (cons (quote symbol?) p)) (set! p (cons (quote string-set!) p)) (set! p (cons (quote string-ref) p)) (set! p (cons (quote string-length) p)) (set! p (cons (quote string?) p)) (set! p (cons (quote make-string) p)) (set! p (cons (quote vector) p)) (set! p (cons (quote vector-ref) p)) (set! p (cons (quote vector-set!) p)) (set! p (cons (quote vector-length) p)) (set! p (cons (quote make-vector) p)) (set! p (cons (quote vector?) p)) (set! p (cons (quote set-cdr!) p)) (set! p (cons (quote set-car!) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote cons) p)) (set! p (cons (quote pair?) p)) (set! p (cons (quote fx*) p)) (set! p (cons (quote fx-) p)) (set! p (cons (quote fx+) p)) (set! p (cons (quote fx>=) p)) (set! p (cons (quote fx>) p)) (set! p (cons (quote fx<=) p)) (set! p (cons (quote fx<) p)) (set! p (cons (quote fx=) p)) (set! p (cons (quote fxzero?) p)) (set! p (cons (quote fxsub1) p)) (set! p (cons (quote fxadd1) p)) (set! p (cons (quote fxlogor) p)) (set! p (cons (quote fxlogand) p)) (set! p (cons (quote fxlognot) p)) (set! p (cons (quote char=?) p)) (set! p (cons (quote eq?) p)) (set! p (cons (quote not) p)) (set! p (cons (quote boolean?) p)) (set! p (cons (quote fixnum?) p)) (set! p (cons (quote char?) p)) (set! p (cons (quote null?) p)) (set! p (cons (quote char->fixnum) p)) (set! p (cons (quote fixnum->char) p)) (lambda () p)))
# == eliminate-shadowing  ==>
# (let ((p (quote ()))) (begin (set! p (cons (quote procedure?) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote symbol-value) p)) (set! p (cons (quote symbol->string) p)) (set! p (cons (quote make-symbol) p)) (set! p (cons (quote symbol?) p)) (set! p (cons (quote string-set!) p)) (set! p (cons (quote string-ref) p)) (set! p (cons (quote string-length) p)) (set! p (cons (quote string?) p)) (set! p (cons (quote make-string) p)) (set! p (cons (quote vector) p)) (set! p (cons (quote vector-ref) p)) (set! p (cons (quote vector-set!) p)) (set! p (cons (quote vector-length) p)) (set! p (cons (quote make-vector) p)) (set! p (cons (quote vector?) p)) (set! p (cons (quote set-cdr!) p)) (set! p (cons (quote set-car!) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote cons) p)) (set! p (cons (quote pair?) p)) (set! p (cons (quote fx*) p)) (set! p (cons (quote fx-) p)) (set! p (cons (quote fx+) p)) (set! p (cons (quote fx>=) p)) (set! p (cons (quote fx>) p)) (set! p (cons (quote fx<=) p)) (set! p (cons (quote fx<) p)) (set! p (cons (quote fx=) p)) (set! p (cons (quote fxzero?) p)) (set! p (cons (quote fxsub1) p)) (set! p (cons (quote fxadd1) p)) (set! p (cons (quote fxlogor) p)) (set! p (cons (quote fxlogand) p)) (set! p (cons (quote fxlognot) p)) (set! p (cons (quote char=?) p)) (set! p (cons (quote eq?) p)) (set! p (cons (quote not) p)) (set! p (cons (quote boolean?) p)) (set! p (cons (quote fixnum?) p)) (set! p (cons (quote char?) p)) (set! p (cons (quote null?) p)) (set! p (cons (quote char->fixnum) p)) (set! p (cons (quote fixnum->char) p)) (lambda () p)))
# == vectorize-letrec  ==>
# (let ((p (quote ()))) (begin (set! p (cons (quote procedure?) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote symbol-value) p)) (set! p (cons (quote symbol->string) p)) (set! p (cons (quote make-symbol) p)) (set! p (cons (quote symbol?) p)) (set! p (cons (quote string-set!) p)) (set! p (cons (quote string-ref) p)) (set! p (cons (quote string-length) p)) (set! p (cons (quote string?) p)) (set! p (cons (quote make-string) p)) (set! p (cons (quote vector) p)) (set! p (cons (quote vector-ref) p)) (set! p (cons (quote vector-set!) p)) (set! p (cons (quote vector-length) p)) (set! p (cons (quote make-vector) p)) (set! p (cons (quote vector?) p)) (set! p (cons (quote set-cdr!) p)) (set! p (cons (quote set-car!) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote cons) p)) (set! p (cons (quote pair?) p)) (set! p (cons (quote fx*) p)) (set! p (cons (quote fx-) p)) (set! p (cons (quote fx+) p)) (set! p (cons (quote fx>=) p)) (set! p (cons (quote fx>) p)) (set! p (cons (quote fx<=) p)) (set! p (cons (quote fx<) p)) (set! p (cons (quote fx=) p)) (set! p (cons (quote fxzero?) p)) (set! p (cons (quote fxsub1) p)) (set! p (cons (quote fxadd1) p)) (set! p (cons (quote fxlogor) p)) (set! p (cons (quote fxlogand) p)) (set! p (cons (quote fxlognot) p)) (set! p (cons (quote char=?) p)) (set! p (cons (quote eq?) p)) (set! p (cons (quote not) p)) (set! p (cons (quote boolean?) p)) (set! p (cons (quote fixnum?) p)) (set! p (cons (quote char?) p)) (set! p (cons (quote null?) p)) (set! p (cons (quote char->fixnum) p)) (set! p (cons (quote fixnum->char) p)) (lambda () p)))
# == eliminate-set!  ==>
# (let ((p (vector (quote ())))) (begin (vector-set! p 0 (cons (quote procedure?) (vector-ref p 0))) (vector-set! p 0 (cons (quote cdr) (vector-ref p 0))) (vector-set! p 0 (cons (quote car) (vector-ref p 0))) (vector-set! p 0 (cons (quote symbol-value) (vector-ref p 0))) (vector-set! p 0 (cons (quote symbol->string) (vector-ref p 0))) (vector-set! p 0 (cons (quote make-symbol) (vector-ref p 0))) (vector-set! p 0 (cons (quote symbol?) (vector-ref p 0))) (vector-set! p 0 (cons (quote string-set!) (vector-ref p 0))) (vector-set! p 0 (cons (quote string-ref) (vector-ref p 0))) (vector-set! p 0 (cons (quote string-length) (vector-ref p 0))) (vector-set! p 0 (cons (quote string?) (vector-ref p 0))) (vector-set! p 0 (cons (quote make-string) (vector-ref p 0))) (vector-set! p 0 (cons (quote vector) (vector-ref p 0))) (vector-set! p 0 (cons (quote vector-ref) (vector-ref p 0))) (vector-set! p 0 (cons (quote vector-set!) (vector-ref p 0))) (vector-set! p 0 (cons (quote vector-length) (vector-ref p 0))) (vector-set! p 0 (cons (quote make-vector) (vector-ref p 0))) (vector-set! p 0 (cons (quote vector?) (vector-ref p 0))) (vector-set! p 0 (cons (quote set-cdr!) (vector-ref p 0))) (vector-set! p 0 (cons (quote set-car!) (vector-ref p 0))) (vector-set! p 0 (cons (quote cdr) (vector-ref p 0))) (vector-set! p 0 (cons (quote car) (vector-ref p 0))) (vector-set! p 0 (cons (quote cons) (vector-ref p 0))) (vector-set! p 0 (cons (quote pair?) (vector-ref p 0))) (vector-set! p 0 (cons (quote fx*) (vector-ref p 0))) (vector-set! p 0 (cons (quote fx-) (vector-ref p 0))) (vector-set! p 0 (cons (quote fx+) (vector-ref p 0))) (vector-set! p 0 (cons (quote fx>=) (vector-ref p 0))) (vector-set! p 0 (cons (quote fx>) (vector-ref p 0))) (vector-set! p 0 (cons (quote fx<=) (vector-ref p 0))) (vector-set! p 0 (cons (quote fx<) (vector-ref p 0))) (vector-set! p 0 (cons (quote fx=) (vector-ref p 0))) (vector-set! p 0 (cons (quote fxzero?) (vector-ref p 0))) (vector-set! p 0 (cons (quote fxsub1) (vector-ref p 0))) (vector-set! p 0 (cons (quote fxadd1) (vector-ref p 0))) (vector-set! p 0 (cons (quote fxlogor) (vector-ref p 0))) (vector-set! p 0 (cons (quote fxlogand) (vector-ref p 0))) (vector-set! p 0 (cons (quote fxlognot) (vector-ref p 0))) (vector-set! p 0 (cons (quote char=?) (vector-ref p 0))) (vector-set! p 0 (cons (quote eq?) (vector-ref p 0))) (vector-set! p 0 (cons (quote not) (vector-ref p 0))) (vector-set! p 0 (cons (quote boolean?) (vector-ref p 0))) (vector-set! p 0 (cons (quote fixnum?) (vector-ref p 0))) (vector-set! p 0 (cons (quote char?) (vector-ref p 0))) (vector-set! p 0 (cons (quote null?) (vector-ref p 0))) (vector-set! p 0 (cons (quote char->fixnum) (vector-ref p 0))) (vector-set! p 0 (cons (quote fixnum->char) (vector-ref p 0))) (lambda () (let () (vector-ref p 0)))))
# == close-free-variables  ==>
# (let ((p (vector (quote ())))) (begin (vector-set! p 0 (cons (quote procedure?) (vector-ref p 0))) (vector-set! p 0 (cons (quote cdr) (vector-ref p 0))) (vector-set! p 0 (cons (quote car) (vector-ref p 0))) (vector-set! p 0 (cons (quote symbol-value) (vector-ref p 0))) (vector-set! p 0 (cons (quote symbol->string) (vector-ref p 0))) (vector-set! p 0 (cons (quote make-symbol) (vector-ref p 0))) (vector-set! p 0 (cons (quote symbol?) (vector-ref p 0))) (vector-set! p 0 (cons (quote string-set!) (vector-ref p 0))) (vector-set! p 0 (cons (quote string-ref) (vector-ref p 0))) (vector-set! p 0 (cons (quote string-length) (vector-ref p 0))) (vector-set! p 0 (cons (quote string?) (vector-ref p 0))) (vector-set! p 0 (cons (quote make-string) (vector-ref p 0))) (vector-set! p 0 (cons (quote vector) (vector-ref p 0))) (vector-set! p 0 (cons (quote vector-ref) (vector-ref p 0))) (vector-set! p 0 (cons (quote vector-set!) (vector-ref p 0))) (vector-set! p 0 (cons (quote vector-length) (vector-ref p 0))) (vector-set! p 0 (cons (quote make-vector) (vector-ref p 0))) (vector-set! p 0 (cons (quote vector?) (vector-ref p 0))) (vector-set! p 0 (cons (quote set-cdr!) (vector-ref p 0))) (vector-set! p 0 (cons (quote set-car!) (vector-ref p 0))) (vector-set! p 0 (cons (quote cdr) (vector-ref p 0))) (vector-set! p 0 (cons (quote car) (vector-ref p 0))) (vector-set! p 0 (cons (quote cons) (vector-ref p 0))) (vector-set! p 0 (cons (quote pair?) (vector-ref p 0))) (vector-set! p 0 (cons (quote fx*) (vector-ref p 0))) (vector-set! p 0 (cons (quote fx-) (vector-ref p 0))) (vector-set! p 0 (cons (quote fx+) (vector-ref p 0))) (vector-set! p 0 (cons (quote fx>=) (vector-ref p 0))) (vector-set! p 0 (cons (quote fx>) (vector-ref p 0))) (vector-set! p 0 (cons (quote fx<=) (vector-ref p 0))) (vector-set! p 0 (cons (quote fx<) (vector-ref p 0))) (vector-set! p 0 (cons (quote fx=) (vector-ref p 0))) (vector-set! p 0 (cons (quote fxzero?) (vector-ref p 0))) (vector-set! p 0 (cons (quote fxsub1) (vector-ref p 0))) (vector-set! p 0 (cons (quote fxadd1) (vector-ref p 0))) (vector-set! p 0 (cons (quote fxlogor) (vector-ref p 0))) (vector-set! p 0 (cons (quote fxlogand) (vector-ref p 0))) (vector-set! p 0 (cons (quote fxlognot) (vector-ref p 0))) (vector-set! p 0 (cons (quote char=?) (vector-ref p 0))) (vector-set! p 0 (cons (quote eq?) (vector-ref p 0))) (vector-set! p 0 (cons (quote not) (vector-ref p 0))) (vector-set! p 0 (cons (quote boolean?) (vector-ref p 0))) (vector-set! p 0 (cons (quote fixnum?) (vector-ref p 0))) (vector-set! p 0 (cons (quote char?) (vector-ref p 0))) (vector-set! p 0 (cons (quote null?) (vector-ref p 0))) (vector-set! p 0 (cons (quote char->fixnum) (vector-ref p 0))) (vector-set! p 0 (cons (quote fixnum->char) (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0)))))
# == eliminate-quote  ==>
# (let ((p (vector ()))) (begin (vector-set! p 0 (cons (string->symbol "procedure?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "cdr") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "car") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "symbol-value") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "symbol->string") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "make-symbol") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "string-length") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "string?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "make-string") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "vector") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "vector?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "cdr") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "car") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "cons") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "pair?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx*") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx-") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx+") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx>") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx<") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx=") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "char=?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "eq?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "not") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "char?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "null?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0)))))
# == eliminate-when/unless  ==>
# (let ((p (vector ()))) (begin (vector-set! p 0 (cons (string->symbol "procedure?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "cdr") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "car") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "symbol-value") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "symbol->string") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "make-symbol") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "string-length") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "string?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "make-string") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "vector") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "vector?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "cdr") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "car") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "cons") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "pair?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx*") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx-") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx+") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx>") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx<") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx=") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "char=?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "eq?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "not") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "char?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "null?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0)))))
# == eliminate-cond  ==>
# (let ((p (vector ()))) (begin (vector-set! p 0 (cons (string->symbol "procedure?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "cdr") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "car") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "symbol-value") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "symbol->string") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "make-symbol") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "string-length") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "string?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "make-string") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "vector") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "vector?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "cdr") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "car") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "cons") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "pair?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx*") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx-") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx+") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx>") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx<") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx=") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "char=?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "eq?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "not") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "char?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "null?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0)))))
# == external-symbols  ==>
# (let ((p (vector ()))) (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0)))))
# emit-expr (let ((p (vector ()))) (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0)))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((p (vector ())))
#  body = (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-expr (vector ())
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12340"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12340:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_12341
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12341:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12342
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12342:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12343"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12343:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12345
    cmp  $0,%eax
    jge _L_12344
_L_12345:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12344:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "procedure?") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "procedure?") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "procedure?")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "procedure?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12346"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12346":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "procedure?"
# string literal
    jmp _L_12348
    .align 8,0x90
_L_12347 :
    .int 40
    .ascii "procedure?"
_L_12348:
    movl $_L_12347, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg procedure?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12349
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12349:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12350"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12350:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12352
    cmp  $0,%eax
    jge _L_12351
_L_12352:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12351:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12353
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12353:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12354"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12354:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12356
    cmp  $0,%eax
    jge _L_12355
_L_12356:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12355:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "cdr") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "cdr")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "cdr")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12357"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12357":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cdr"
# string literal
    jmp _L_12359
    .align 8,0x90
_L_12358 :
    .int 12
    .ascii "cdr"
_L_12359:
    movl $_L_12358, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cdr
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12360
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12360:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12361"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12361:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12363
    cmp  $0,%eax
    jge _L_12362
_L_12363:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12362:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12364
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12364:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12365"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12365:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12367
    cmp  $0,%eax
    jge _L_12366
_L_12367:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12366:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "car") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "car")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "car")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12368"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12368":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "car"
# string literal
    jmp _L_12370
    .align 8,0x90
_L_12369 :
    .int 12
    .ascii "car"
_L_12370:
    movl $_L_12369, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg car
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12371
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12371:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12372"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12372:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12374
    cmp  $0,%eax
    jge _L_12373
_L_12374:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12373:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12375
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12375:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12376"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12376:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12378
    cmp  $0,%eax
    jge _L_12377
_L_12378:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12377:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "symbol-value") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "symbol-value")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol-value")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12379"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12379":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol-value"
# string literal
    jmp _L_12381
    .align 8,0x90
_L_12380 :
    .int 48
    .ascii "symbol-value"
_L_12381:
    movl $_L_12380, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol-value
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12382
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12382:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12383"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12383:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12385
    cmp  $0,%eax
    jge _L_12384
_L_12385:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12384:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12386
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12386:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12387"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12387:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12389
    cmp  $0,%eax
    jge _L_12388
_L_12389:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12388:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "symbol->string") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "symbol->string")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol->string")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12390"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12390":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol->string"
# string literal
    jmp _L_12392
    .align 8,0x90
_L_12391 :
    .int 56
    .ascii "symbol->string"
_L_12392:
    movl $_L_12391, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol->string
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12393
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12393:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12394"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12394:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12396
    cmp  $0,%eax
    jge _L_12395
_L_12396:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12395:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12397
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12397:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12398"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12398:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12400
    cmp  $0,%eax
    jge _L_12399
_L_12400:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12399:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "make-symbol") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "make-symbol")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-symbol")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12401"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12401":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-symbol"
# string literal
    jmp _L_12403
    .align 8,0x90
_L_12402 :
    .int 44
    .ascii "make-symbol"
_L_12403:
    movl $_L_12402, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-symbol
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12404
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12404:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12405"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12405:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12407
    cmp  $0,%eax
    jge _L_12406
_L_12407:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12406:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12408
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12408:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12409"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12409:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12411
    cmp  $0,%eax
    jge _L_12410
_L_12411:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12410:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "symbol?") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "symbol?")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12412"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12412":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol?"
# string literal
    jmp _L_12414
    .align 8,0x90
_L_12413 :
    .int 28
    .ascii "symbol?"
_L_12414:
    movl $_L_12413, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12415
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12415:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12416"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12416:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12418
    cmp  $0,%eax
    jge _L_12417
_L_12418:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12417:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12419
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12419:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12420"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12420:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12422
    cmp  $0,%eax
    jge _L_12421
_L_12422:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12421:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "string-set!") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "string-set!")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-set!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12423"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12423":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-set!"
# string literal
    jmp _L_12425
    .align 8,0x90
_L_12424 :
    .int 44
    .ascii "string-set!"
_L_12425:
    movl $_L_12424, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-set!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12426
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12426:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12427"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12427:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12429
    cmp  $0,%eax
    jge _L_12428
_L_12429:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12428:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12430
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12430:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12431"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12431:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12433
    cmp  $0,%eax
    jge _L_12432
_L_12433:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12432:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "string-ref") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "string-ref")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-ref")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12434"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12434":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-ref"
# string literal
    jmp _L_12436
    .align 8,0x90
_L_12435 :
    .int 40
    .ascii "string-ref"
_L_12436:
    movl $_L_12435, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-ref
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12437
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12437:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12438"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12438:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12440
    cmp  $0,%eax
    jge _L_12439
_L_12440:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12439:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12441
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12441:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12442"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12442:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12444
    cmp  $0,%eax
    jge _L_12443
_L_12444:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12443:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "string-length") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "string-length")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-length")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12445"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12445":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-length"
# string literal
    jmp _L_12447
    .align 8,0x90
_L_12446 :
    .int 52
    .ascii "string-length"
_L_12447:
    movl $_L_12446, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-length
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12448
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12448:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12449"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12449:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12451
    cmp  $0,%eax
    jge _L_12450
_L_12451:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12450:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12452
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12452:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12453"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12453:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12455
    cmp  $0,%eax
    jge _L_12454
_L_12455:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12454:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "string?") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "string?")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "string?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12456"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12456":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string?"
# string literal
    jmp _L_12458
    .align 8,0x90
_L_12457 :
    .int 28
    .ascii "string?"
_L_12458:
    movl $_L_12457, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12459
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12459:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12460"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12460:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12462
    cmp  $0,%eax
    jge _L_12461
_L_12462:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12461:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12463
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12463:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12464"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12464:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12466
    cmp  $0,%eax
    jge _L_12465
_L_12466:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12465:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "make-string") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "make-string")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-string")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12467"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12467":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-string"
# string literal
    jmp _L_12469
    .align 8,0x90
_L_12468 :
    .int 44
    .ascii "make-string"
_L_12469:
    movl $_L_12468, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-string
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12470
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12470:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12471"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12471:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12473
    cmp  $0,%eax
    jge _L_12472
_L_12473:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12472:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12474
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12474:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12475"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12475:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12477
    cmp  $0,%eax
    jge _L_12476
_L_12477:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12476:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "vector") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "vector")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12478"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12478":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector"
# string literal
    jmp _L_12480
    .align 8,0x90
_L_12479 :
    .int 24
    .ascii "vector"
_L_12480:
    movl $_L_12479, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12481
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12481:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12482"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12482:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12484
    cmp  $0,%eax
    jge _L_12483
_L_12484:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12483:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12485
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12485:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12486"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12486:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12488
    cmp  $0,%eax
    jge _L_12487
_L_12488:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12487:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "vector-ref") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "vector-ref")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-ref")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12489"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12489":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-ref"
# string literal
    jmp _L_12491
    .align 8,0x90
_L_12490 :
    .int 40
    .ascii "vector-ref"
_L_12491:
    movl $_L_12490, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-ref
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12492
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12492:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12493"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12493:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12495
    cmp  $0,%eax
    jge _L_12494
_L_12495:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12494:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12496
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12496:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12497"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12497:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12499
    cmp  $0,%eax
    jge _L_12498
_L_12499:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12498:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "vector-set!") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "vector-set!")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-set!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12500"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12500":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-set!"
# string literal
    jmp _L_12502
    .align 8,0x90
_L_12501 :
    .int 44
    .ascii "vector-set!"
_L_12502:
    movl $_L_12501, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-set!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12503
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12503:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12504"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12504:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12506
    cmp  $0,%eax
    jge _L_12505
_L_12506:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12505:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12507
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12507:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12508"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12508:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12510
    cmp  $0,%eax
    jge _L_12509
_L_12510:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12509:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "vector-length") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "vector-length")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-length")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12511"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12511":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-length"
# string literal
    jmp _L_12513
    .align 8,0x90
_L_12512 :
    .int 52
    .ascii "vector-length"
_L_12513:
    movl $_L_12512, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-length
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12514
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12514:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12515"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12515:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12517
    cmp  $0,%eax
    jge _L_12516
_L_12517:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12516:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12518
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12518:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12519"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12519:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12521
    cmp  $0,%eax
    jge _L_12520
_L_12521:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12520:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "make-vector") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "make-vector")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-vector")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12522"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12522":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-vector"
# string literal
    jmp _L_12524
    .align 8,0x90
_L_12523 :
    .int 44
    .ascii "make-vector"
_L_12524:
    movl $_L_12523, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-vector
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12525
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12525:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12526"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12526:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12528
    cmp  $0,%eax
    jge _L_12527
_L_12528:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12527:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12529
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12529:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12530"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12530:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12532
    cmp  $0,%eax
    jge _L_12531
_L_12532:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12531:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "vector?") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "vector?")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12533"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12533":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector?"
# string literal
    jmp _L_12535
    .align 8,0x90
_L_12534 :
    .int 28
    .ascii "vector?"
_L_12535:
    movl $_L_12534, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12536
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12536:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12537"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12537:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12539
    cmp  $0,%eax
    jge _L_12538
_L_12539:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12538:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12540
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12540:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12541"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12541:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12543
    cmp  $0,%eax
    jge _L_12542
_L_12543:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12542:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "set-cdr!") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "set-cdr!")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "set-cdr!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12544"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12544":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "set-cdr!"
# string literal
    jmp _L_12546
    .align 8,0x90
_L_12545 :
    .int 32
    .ascii "set-cdr!"
_L_12546:
    movl $_L_12545, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg set-cdr!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12547
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12547:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12548"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12548:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12550
    cmp  $0,%eax
    jge _L_12549
_L_12550:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12549:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12551
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12551:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12552"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12552:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12554
    cmp  $0,%eax
    jge _L_12553
_L_12554:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12553:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "set-car!") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "set-car!")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "set-car!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12555"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12555":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "set-car!"
# string literal
    jmp _L_12557
    .align 8,0x90
_L_12556 :
    .int 32
    .ascii "set-car!"
_L_12557:
    movl $_L_12556, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg set-car!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12558
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12558:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12559"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12559:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12561
    cmp  $0,%eax
    jge _L_12560
_L_12561:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12560:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12562
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12562:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12563"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12563:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12565
    cmp  $0,%eax
    jge _L_12564
_L_12565:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12564:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "cdr") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "cdr")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "cdr")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12566"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12566":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cdr"
# string literal
    jmp _L_12568
    .align 8,0x90
_L_12567 :
    .int 12
    .ascii "cdr"
_L_12568:
    movl $_L_12567, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cdr
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12569
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12569:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12570"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12570:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12572
    cmp  $0,%eax
    jge _L_12571
_L_12572:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12571:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12573
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12573:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12574"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12574:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12576
    cmp  $0,%eax
    jge _L_12575
_L_12576:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12575:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "car") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "car")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "car")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12577"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12577":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "car"
# string literal
    jmp _L_12579
    .align 8,0x90
_L_12578 :
    .int 12
    .ascii "car"
_L_12579:
    movl $_L_12578, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg car
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12580
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12580:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12581"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12581:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12583
    cmp  $0,%eax
    jge _L_12582
_L_12583:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12582:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12584
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12584:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12585"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12585:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12587
    cmp  $0,%eax
    jge _L_12586
_L_12587:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12586:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "cons") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "cons")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "cons")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12588"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12588":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cons"
# string literal
    jmp _L_12590
    .align 8,0x90
_L_12589 :
    .int 16
    .ascii "cons"
_L_12590:
    movl $_L_12589, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cons
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12591
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12591:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12592"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12592:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12594
    cmp  $0,%eax
    jge _L_12593
_L_12594:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12593:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12595
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12595:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12596"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12596:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12598
    cmp  $0,%eax
    jge _L_12597
_L_12598:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12597:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "pair?") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "pair?")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "pair?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12599"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12599":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "pair?"
# string literal
    jmp _L_12601
    .align 8,0x90
_L_12600 :
    .int 20
    .ascii "pair?"
_L_12601:
    movl $_L_12600, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg pair?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12602
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12602:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12603"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12603:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12605
    cmp  $0,%eax
    jge _L_12604
_L_12605:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12604:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12606
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12606:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12607"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12607:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12609
    cmp  $0,%eax
    jge _L_12608
_L_12609:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12608:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "fx*") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "fx*")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx*")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12610"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12610":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx*"
# string literal
    jmp _L_12612
    .align 8,0x90
_L_12611 :
    .int 12
    .ascii "fx*"
_L_12612:
    movl $_L_12611, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx*
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12613
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12613:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12614"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12614:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12616
    cmp  $0,%eax
    jge _L_12615
_L_12616:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12615:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12617
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12617:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12618"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12618:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12620
    cmp  $0,%eax
    jge _L_12619
_L_12620:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12619:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "fx-") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "fx-")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx-")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12621"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12621":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx-"
# string literal
    jmp _L_12623
    .align 8,0x90
_L_12622 :
    .int 12
    .ascii "fx-"
_L_12623:
    movl $_L_12622, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx-
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12624
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12624:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12625"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12625:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12627
    cmp  $0,%eax
    jge _L_12626
_L_12627:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12626:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12628
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12628:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12629"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12629:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12631
    cmp  $0,%eax
    jge _L_12630
_L_12631:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12630:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "fx+") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "fx+")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx+")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12632"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12632":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx+"
# string literal
    jmp _L_12634
    .align 8,0x90
_L_12633 :
    .int 12
    .ascii "fx+"
_L_12634:
    movl $_L_12633, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx+
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12635
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12635:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12636"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12636:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12638
    cmp  $0,%eax
    jge _L_12637
_L_12638:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12637:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12639
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12639:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12640"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12640:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12642
    cmp  $0,%eax
    jge _L_12641
_L_12642:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12641:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "fx>=") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "fx>=")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx>=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12643"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12643":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx>="
# string literal
    jmp _L_12645
    .align 8,0x90
_L_12644 :
    .int 16
    .ascii "fx>="
_L_12645:
    movl $_L_12644, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx>=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12646
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12646:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12647"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12647:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12649
    cmp  $0,%eax
    jge _L_12648
_L_12649:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12648:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12650
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12650:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12651"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12651:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12653
    cmp  $0,%eax
    jge _L_12652
_L_12653:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12652:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "fx>") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "fx>")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx>")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12654"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12654":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx>"
# string literal
    jmp _L_12656
    .align 8,0x90
_L_12655 :
    .int 12
    .ascii "fx>"
_L_12656:
    movl $_L_12655, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx>
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12657
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12657:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12658"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12658:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12660
    cmp  $0,%eax
    jge _L_12659
_L_12660:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12659:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12661
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12661:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12662"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12662:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12664
    cmp  $0,%eax
    jge _L_12663
_L_12664:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12663:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "fx<=") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "fx<=")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx<=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12665"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12665":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx<="
# string literal
    jmp _L_12667
    .align 8,0x90
_L_12666 :
    .int 16
    .ascii "fx<="
_L_12667:
    movl $_L_12666, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx<=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12668
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12668:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12669"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12669:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12671
    cmp  $0,%eax
    jge _L_12670
_L_12671:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12670:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12672
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12672:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12673"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12673:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12675
    cmp  $0,%eax
    jge _L_12674
_L_12675:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12674:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "fx<") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "fx<")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx<")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12676"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12676":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx<"
# string literal
    jmp _L_12678
    .align 8,0x90
_L_12677 :
    .int 12
    .ascii "fx<"
_L_12678:
    movl $_L_12677, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx<
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12679
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12679:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12680"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12680:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12682
    cmp  $0,%eax
    jge _L_12681
_L_12682:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12681:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12683
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12683:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12684"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12684:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12686
    cmp  $0,%eax
    jge _L_12685
_L_12686:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12685:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "fx=") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "fx=")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12687"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12687":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx="
# string literal
    jmp _L_12689
    .align 8,0x90
_L_12688 :
    .int 12
    .ascii "fx="
_L_12689:
    movl $_L_12688, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12690
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12690:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12691"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12691:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12693
    cmp  $0,%eax
    jge _L_12692
_L_12693:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12692:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12694
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12694:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12695"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12695:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12697
    cmp  $0,%eax
    jge _L_12696
_L_12697:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12696:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "fxzero?") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "fxzero?")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxzero?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12698"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12698":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxzero?"
# string literal
    jmp _L_12700
    .align 8,0x90
_L_12699 :
    .int 28
    .ascii "fxzero?"
_L_12700:
    movl $_L_12699, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxzero?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12701
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12701:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12702"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12702:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12704
    cmp  $0,%eax
    jge _L_12703
_L_12704:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12703:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12705
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12705:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12706"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12706:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12708
    cmp  $0,%eax
    jge _L_12707
_L_12708:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12707:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "fxsub1") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "fxsub1")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxsub1")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12709"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12709":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxsub1"
# string literal
    jmp _L_12711
    .align 8,0x90
_L_12710 :
    .int 24
    .ascii "fxsub1"
_L_12711:
    movl $_L_12710, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxsub1
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12712
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12712:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12713"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12713:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12715
    cmp  $0,%eax
    jge _L_12714
_L_12715:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12714:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12716
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12716:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12717"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12717:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12719
    cmp  $0,%eax
    jge _L_12718
_L_12719:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12718:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "fxadd1") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "fxadd1")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxadd1")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12720"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12720":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxadd1"
# string literal
    jmp _L_12722
    .align 8,0x90
_L_12721 :
    .int 24
    .ascii "fxadd1"
_L_12722:
    movl $_L_12721, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxadd1
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12723
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12723:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12724"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12724:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12726
    cmp  $0,%eax
    jge _L_12725
_L_12726:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12725:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12727
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12727:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12728"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12728:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12730
    cmp  $0,%eax
    jge _L_12729
_L_12730:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12729:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "fxlogor") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "fxlogor")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlogor")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12731"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12731":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlogor"
# string literal
    jmp _L_12733
    .align 8,0x90
_L_12732 :
    .int 28
    .ascii "fxlogor"
_L_12733:
    movl $_L_12732, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlogor
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12734
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12734:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12735"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12735:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12737
    cmp  $0,%eax
    jge _L_12736
_L_12737:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12736:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12738
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12738:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12739"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12739:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12741
    cmp  $0,%eax
    jge _L_12740
_L_12741:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12740:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "fxlogand") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "fxlogand")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlogand")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12742"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12742":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlogand"
# string literal
    jmp _L_12744
    .align 8,0x90
_L_12743 :
    .int 32
    .ascii "fxlogand"
_L_12744:
    movl $_L_12743, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlogand
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12745
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12745:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12746"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12746:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12748
    cmp  $0,%eax
    jge _L_12747
_L_12748:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12747:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12749
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12749:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12750"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12750:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12752
    cmp  $0,%eax
    jge _L_12751
_L_12752:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12751:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "fxlognot") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "fxlognot")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlognot")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12753"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12753":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlognot"
# string literal
    jmp _L_12755
    .align 8,0x90
_L_12754 :
    .int 32
    .ascii "fxlognot"
_L_12755:
    movl $_L_12754, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlognot
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12756
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12756:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12757"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12757:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12759
    cmp  $0,%eax
    jge _L_12758
_L_12759:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12758:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12760
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12760:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12761"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12761:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12763
    cmp  $0,%eax
    jge _L_12762
_L_12763:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12762:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "char=?") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "char=?")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "char=?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12764"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12764":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char=?"
# string literal
    jmp _L_12766
    .align 8,0x90
_L_12765 :
    .int 24
    .ascii "char=?"
_L_12766:
    movl $_L_12765, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char=?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12767
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12767:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12768"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12768:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12770
    cmp  $0,%eax
    jge _L_12769
_L_12770:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12769:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12771
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12771:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12772"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12772:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12774
    cmp  $0,%eax
    jge _L_12773
_L_12774:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12773:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "eq?") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "eq?")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "eq?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12775"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12775":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "eq?"
# string literal
    jmp _L_12777
    .align 8,0x90
_L_12776 :
    .int 12
    .ascii "eq?"
_L_12777:
    movl $_L_12776, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg eq?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12778
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12778:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12779"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12779:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12781
    cmp  $0,%eax
    jge _L_12780
_L_12781:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12780:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12782
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12782:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12783"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12783:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12785
    cmp  $0,%eax
    jge _L_12784
_L_12785:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12784:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "not") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "not")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "not")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12786"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12786":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "not"
# string literal
    jmp _L_12788
    .align 8,0x90
_L_12787 :
    .int 12
    .ascii "not"
_L_12788:
    movl $_L_12787, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg not
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12789
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12789:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12790"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12790:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12792
    cmp  $0,%eax
    jge _L_12791
_L_12792:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12791:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12793
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12793:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12794"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12794:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12796
    cmp  $0,%eax
    jge _L_12795
_L_12796:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12795:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "boolean?") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "boolean?")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "boolean?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12797"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12797":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "boolean?"
# string literal
    jmp _L_12799
    .align 8,0x90
_L_12798 :
    .int 32
    .ascii "boolean?"
_L_12799:
    movl $_L_12798, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg boolean?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12800
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12800:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12801"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12801:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12803
    cmp  $0,%eax
    jge _L_12802
_L_12803:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12802:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12804
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12804:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12805"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12805:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12807
    cmp  $0,%eax
    jge _L_12806
_L_12807:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12806:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "fixnum?") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "fixnum?")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "fixnum?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12808"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12808":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fixnum?"
# string literal
    jmp _L_12810
    .align 8,0x90
_L_12809 :
    .int 28
    .ascii "fixnum?"
_L_12810:
    movl $_L_12809, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fixnum?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12811
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12811:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12812"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12812:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12814
    cmp  $0,%eax
    jge _L_12813
_L_12814:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12813:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12815
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12815:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12816"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12816:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12818
    cmp  $0,%eax
    jge _L_12817
_L_12818:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12817:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "char?") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "char?")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "char?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12819"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12819":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char?"
# string literal
    jmp _L_12821
    .align 8,0x90
_L_12820 :
    .int 20
    .ascii "char?"
_L_12821:
    movl $_L_12820, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12822
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12822:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12823"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12823:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12825
    cmp  $0,%eax
    jge _L_12824
_L_12825:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12824:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12826
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12826:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12827"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12827:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12829
    cmp  $0,%eax
    jge _L_12828
_L_12829:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12828:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "null?") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "null?")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "null?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12830"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12830":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "null?"
# string literal
    jmp _L_12832
    .align 8,0x90
_L_12831 :
    .int 20
    .ascii "null?"
_L_12832:
    movl $_L_12831, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg null?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12833
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12833:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12834"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12834:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12836
    cmp  $0,%eax
    jge _L_12835
_L_12836:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12835:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12837
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12837:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12838"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12838:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12840
    cmp  $0,%eax
    jge _L_12839
_L_12840:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12839:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "char->fixnum") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "char->fixnum")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "char->fixnum")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12841"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12841":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char->fixnum"
# string literal
    jmp _L_12843
    .align 8,0x90
_L_12842 :
    .int 48
    .ascii "char->fixnum"
_L_12843:
    movl $_L_12842, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char->fixnum
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12844
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12844:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12845"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12845:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12847
    cmp  $0,%eax
    jge _L_12846
_L_12847:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12846:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12848
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12848:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12849"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12849:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12851
    cmp  $0,%eax
    jge _L_12850
_L_12851:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12850:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "fixnum->char") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "fixnum->char")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "fixnum->char")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12852"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12852":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fixnum->char"
# string literal
    jmp _L_12854
    .align 8,0x90
_L_12853 :
    .int 48
    .ascii "fixnum->char"
_L_12854:
    movl $_L_12853, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fixnum->char
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12855
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12855:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12856"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12856:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12858
    cmp  $0,%eax
    jge _L_12857
_L_12858:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12857:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (closure () (p) (let () (vector-ref p 0)))
# emit-closure
# si = -4
# env = ((p . 0))
# expr = (closure () (p) (let () (vector-ref p 0)))
    movl $_L_12859, 0(%ebp)  # closure label
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # p
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_12860            # jump around closure body
_L_12859:
# check argument count
    cmp $0,%eax
    je _L_12861
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_12861:
# emit-tail-expr
# si=-8
# env=((p . 4) (p . 0))
# expr=(let () (vector-ref p 0))
# emit-tail-let
#  si   = -8
#  env  = ((p . 4) (p . 0))
#  bindings = ()
#  body = (vector-ref p 0)
# emit-tail-expr
# si=-8
# env=((p . 4) (p . 0))
# expr=(vector-ref p 0)
# tail primcall
# emit-expr p
# emit-variable-ref
# env=((p . 4) (p . 0))
# var=p
    movl 2(%edi), %eax  # frame load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_12862
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12862:
    movl %eax, -8(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12863"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12863:
# check bounds on vector index
    movl -8(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_12865
    cmp  $0,%eax
    jge _L_12864
_L_12865:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12864:
    movl -8(%esp), %esi
    movl -1(%eax,%esi), %eax
#return from tail (vector-ref p 0)
    ret
    .align 4,0x90
_L_12860:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((p . 0))
     movl %eax, primitives
# == explicit-begins  ==>
# (lambda () (error (quote funcall) "arg 1 must be a procedure"))
# == eliminate-let*  ==>
# (lambda () (error (quote funcall) "arg 1 must be a procedure"))
# == eliminate-shadowing  ==>
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
    movl $_L_12866, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_12867            # jump around closure body
_L_12866:
# check argument count
    cmp $0,%eax
    je _L_12868
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_12868:
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
    je "_L_12869"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12869":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_12871
    .align 8,0x90
_L_12870 :
    .int 28
    .ascii "funcall"
_L_12871:
    movl $_L_12870, %eax
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
    jmp _L_12873
    .align 8,0x90
_L_12872 :
    .int 100
    .ascii "arg 1 must be a procedure"
_L_12873:
    movl $_L_12872, %eax
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
_L_12867:
     movl %eax, eh$uprocedure
# == explicit-begins  ==>
# (lambda () (error (quote funcall) "wrong number of args"))
# == eliminate-let*  ==>
# (lambda () (error (quote funcall) "wrong number of args"))
# == eliminate-shadowing  ==>
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
    movl $_L_12874, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_12875            # jump around closure body
_L_12874:
# check argument count
    cmp $0,%eax
    je _L_12876
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_12876:
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
    je "_L_12877"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12877":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_12879
    .align 8,0x90
_L_12878 :
    .int 28
    .ascii "funcall"
_L_12879:
    movl $_L_12878, %eax
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
    jmp _L_12881
    .align 8,0x90
_L_12880 :
    .int 80
    .ascii "wrong number of args"
_L_12881:
    movl $_L_12880, %eax
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
_L_12875:
     movl %eax, eh$uargcount
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a fixnum"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a fixnum"))
# == eliminate-shadowing  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a fixnum"))
# == vectorize-letrec  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a fixnum"))
# == eliminate-set!  ==>
# (lambda (i) (let ((i i)) (error (list-ref (primitives) i) "arg must be a fixnum")))
# == close-free-variables  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a fixnum")))
# == eliminate-quote  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a fixnum")))
# == eliminate-when/unless  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a fixnum")))
# == eliminate-cond  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a fixnum")))
# == external-symbols  ==>
# (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a fixnum")))
# emit-expr (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a fixnum")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a fixnum")))
    movl $_L_12882, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_12883            # jump around closure body
_L_12882:
# check argument count
    cmp $4,%eax
    je _L_12884
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_12884:
# emit-tail-expr
# si=-12
# env=((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a fixnum"))
# emit-tail-let
#  si   = -12
#  env  = ((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((i i))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a fixnum")
# emit-expr i
# emit-variable-ref
# env=((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=i
    movl -8(%esp), %eax  # stack load i
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a fixnum")
# emit-tail-funcall
#    si   =-16
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a fixnum")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) i)
# funcall
#    si   =-20
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) i)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12885"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12885":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12886"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12886":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr i
# emit-variable-ref
# env=((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=i
    movl -12(%esp), %eax  # stack load i
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg i
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) i)
# emit-expr "arg must be a fixnum"
# string literal
    jmp _L_12888
    .align 8,0x90
_L_12887 :
    .int 80
    .ascii "arg must be a fixnum"
_L_12888:
    movl $_L_12887, %eax
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
_L_12883:
     movl %eax, eh$ufixnum
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a string"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a string"))
# == eliminate-shadowing  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a string"))
# == vectorize-letrec  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a string"))
# == eliminate-set!  ==>
# (lambda (i) (let ((i i)) (error (list-ref (primitives) i) "arg must be a string")))
# == close-free-variables  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a string")))
# == eliminate-quote  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a string")))
# == eliminate-when/unless  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a string")))
# == eliminate-cond  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a string")))
# == external-symbols  ==>
# (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a string")))
# emit-expr (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a string")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a string")))
    movl $_L_12889, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_12890            # jump around closure body
_L_12889:
# check argument count
    cmp $4,%eax
    je _L_12891
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_12891:
# emit-tail-expr
# si=-12
# env=((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a string"))
# emit-tail-let
#  si   = -12
#  env  = ((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((i i))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a string")
# emit-expr i
# emit-variable-ref
# env=((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=i
    movl -8(%esp), %eax  # stack load i
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a string")
# emit-tail-funcall
#    si   =-16
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a string")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) i)
# funcall
#    si   =-20
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) i)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12892"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12892":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12893"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12893":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr i
# emit-variable-ref
# env=((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=i
    movl -12(%esp), %eax  # stack load i
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg i
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) i)
# emit-expr "arg must be a string"
# string literal
    jmp _L_12895
    .align 8,0x90
_L_12894 :
    .int 80
    .ascii "arg must be a string"
_L_12895:
    movl $_L_12894, %eax
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
_L_12890:
     movl %eax, eh$ustring
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a character"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a character"))
# == eliminate-shadowing  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a character"))
# == vectorize-letrec  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a character"))
# == eliminate-set!  ==>
# (lambda (i) (let ((i i)) (error (list-ref (primitives) i) "arg must be a character")))
# == close-free-variables  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a character")))
# == eliminate-quote  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a character")))
# == eliminate-when/unless  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a character")))
# == eliminate-cond  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a character")))
# == external-symbols  ==>
# (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a character")))
# emit-expr (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a character")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a character")))
    movl $_L_12896, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_12897            # jump around closure body
_L_12896:
# check argument count
    cmp $4,%eax
    je _L_12898
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_12898:
# emit-tail-expr
# si=-12
# env=((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a character"))
# emit-tail-let
#  si   = -12
#  env  = ((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((i i))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a character")
# emit-expr i
# emit-variable-ref
# env=((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=i
    movl -8(%esp), %eax  # stack load i
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a character")
# emit-tail-funcall
#    si   =-16
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a character")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) i)
# funcall
#    si   =-20
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) i)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12899"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12899":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12900"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12900":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr i
# emit-variable-ref
# env=((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=i
    movl -12(%esp), %eax  # stack load i
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg i
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) i)
# emit-expr "arg must be a character"
# string literal
    jmp _L_12902
    .align 8,0x90
_L_12901 :
    .int 92
    .ascii "arg must be a character"
_L_12902:
    movl $_L_12901, %eax
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
_L_12897:
     movl %eax, eh$ucharacter
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a pair"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a pair"))
# == eliminate-shadowing  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a pair"))
# == vectorize-letrec  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a pair"))
# == eliminate-set!  ==>
# (lambda (i) (let ((i i)) (error (list-ref (primitives) i) "arg must be a pair")))
# == close-free-variables  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a pair")))
# == eliminate-quote  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a pair")))
# == eliminate-when/unless  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a pair")))
# == eliminate-cond  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a pair")))
# == external-symbols  ==>
# (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a pair")))
# emit-expr (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a pair")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a pair")))
    movl $_L_12903, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_12904            # jump around closure body
_L_12903:
# check argument count
    cmp $4,%eax
    je _L_12905
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_12905:
# emit-tail-expr
# si=-12
# env=((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a pair"))
# emit-tail-let
#  si   = -12
#  env  = ((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((i i))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a pair")
# emit-expr i
# emit-variable-ref
# env=((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=i
    movl -8(%esp), %eax  # stack load i
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a pair")
# emit-tail-funcall
#    si   =-16
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a pair")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) i)
# funcall
#    si   =-20
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) i)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12906"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12906":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12907"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12907":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr i
# emit-variable-ref
# env=((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=i
    movl -12(%esp), %eax  # stack load i
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg i
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) i)
# emit-expr "arg must be a pair"
# string literal
    jmp _L_12909
    .align 8,0x90
_L_12908 :
    .int 72
    .ascii "arg must be a pair"
_L_12909:
    movl $_L_12908, %eax
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
_L_12904:
     movl %eax, eh$upair
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a vector"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a vector"))
# == eliminate-shadowing  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a vector"))
# == vectorize-letrec  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a vector"))
# == eliminate-set!  ==>
# (lambda (i) (let ((i i)) (error (list-ref (primitives) i) "arg must be a vector")))
# == close-free-variables  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a vector")))
# == eliminate-quote  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a vector")))
# == eliminate-when/unless  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a vector")))
# == eliminate-cond  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a vector")))
# == external-symbols  ==>
# (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a vector")))
# emit-expr (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a vector")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a vector")))
    movl $_L_12910, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_12911            # jump around closure body
_L_12910:
# check argument count
    cmp $4,%eax
    je _L_12912
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_12912:
# emit-tail-expr
# si=-12
# env=((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a vector"))
# emit-tail-let
#  si   = -12
#  env  = ((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((i i))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a vector")
# emit-expr i
# emit-variable-ref
# env=((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=i
    movl -8(%esp), %eax  # stack load i
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a vector")
# emit-tail-funcall
#    si   =-16
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a vector")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) i)
# funcall
#    si   =-20
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) i)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12913"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12913":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12914"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12914":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr i
# emit-variable-ref
# env=((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=i
    movl -12(%esp), %eax  # stack load i
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg i
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) i)
# emit-expr "arg must be a vector"
# string literal
    jmp _L_12916
    .align 8,0x90
_L_12915 :
    .int 80
    .ascii "arg must be a vector"
_L_12916:
    movl $_L_12915, %eax
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
_L_12911:
     movl %eax, eh$uvector
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "length must be a fixnum >= 0"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "length must be a fixnum >= 0"))
# == eliminate-shadowing  ==>
# (lambda (i) (error (list-ref (primitives) i) "length must be a fixnum >= 0"))
# == vectorize-letrec  ==>
# (lambda (i) (error (list-ref (primitives) i) "length must be a fixnum >= 0"))
# == eliminate-set!  ==>
# (lambda (i) (let ((i i)) (error (list-ref (primitives) i) "length must be a fixnum >= 0")))
# == close-free-variables  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "length must be a fixnum >= 0")))
# == eliminate-quote  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "length must be a fixnum >= 0")))
# == eliminate-when/unless  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "length must be a fixnum >= 0")))
# == eliminate-cond  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "length must be a fixnum >= 0")))
# == external-symbols  ==>
# (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "length must be a fixnum >= 0")))
# emit-expr (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "length must be a fixnum >= 0")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "length must be a fixnum >= 0")))
    movl $_L_12917, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_12918            # jump around closure body
_L_12917:
# check argument count
    cmp $4,%eax
    je _L_12919
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_12919:
# emit-tail-expr
# si=-12
# env=((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "length must be a fixnum >= 0"))
# emit-tail-let
#  si   = -12
#  env  = ((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((i i))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "length must be a fixnum >= 0")
# emit-expr i
# emit-variable-ref
# env=((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=i
    movl -8(%esp), %eax  # stack load i
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "length must be a fixnum >= 0")
# emit-tail-funcall
#    si   =-16
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "length must be a fixnum >= 0")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) i)
# funcall
#    si   =-20
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) i)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12920"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12920":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12921"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12921":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr i
# emit-variable-ref
# env=((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=i
    movl -12(%esp), %eax  # stack load i
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg i
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) i)
# emit-expr "length must be a fixnum >= 0"
# string literal
    jmp _L_12923
    .align 8,0x90
_L_12922 :
    .int 112
    .ascii "length must be a fixnum >= 0"
_L_12923:
    movl $_L_12922, %eax
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
_L_12918:
     movl %eax, eh$ulength
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == eliminate-shadowing  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == vectorize-letrec  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == eliminate-set!  ==>
# (lambda (i) (let ((i i)) (error (list-ref (primitives) i) "index out of bounds")))
# == close-free-variables  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "index out of bounds")))
# == eliminate-quote  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "index out of bounds")))
# == eliminate-when/unless  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "index out of bounds")))
# == eliminate-cond  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "index out of bounds")))
# == external-symbols  ==>
# (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "index out of bounds")))
# emit-expr (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "index out of bounds")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "index out of bounds")))
    movl $_L_12924, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_12925            # jump around closure body
_L_12924:
# check argument count
    cmp $4,%eax
    je _L_12926
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_12926:
# emit-tail-expr
# si=-12
# env=((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "index out of bounds"))
# emit-tail-let
#  si   = -12
#  env  = ((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((i i))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "index out of bounds")
# emit-expr i
# emit-variable-ref
# env=((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=i
    movl -8(%esp), %eax  # stack load i
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "index out of bounds")
# emit-tail-funcall
#    si   =-16
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "index out of bounds")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) i)
# funcall
#    si   =-20
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) i)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12927"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12927":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12928"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12928":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr i
# emit-variable-ref
# env=((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=i
    movl -12(%esp), %eax  # stack load i
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg i
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) i)
# emit-expr "index out of bounds"
# string literal
    jmp _L_12930
    .align 8,0x90
_L_12929 :
    .int 76
    .ascii "index out of bounds"
_L_12930:
    movl $_L_12929, %eax
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
_L_12925:
     movl %eax, eh$uvector$uindex
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == eliminate-shadowing  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == vectorize-letrec  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == eliminate-set!  ==>
# (lambda (i) (let ((i i)) (error (list-ref (primitives) i) "index out of bounds")))
# == close-free-variables  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "index out of bounds")))
# == eliminate-quote  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "index out of bounds")))
# == eliminate-when/unless  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "index out of bounds")))
# == eliminate-cond  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "index out of bounds")))
# == external-symbols  ==>
# (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "index out of bounds")))
# emit-expr (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "index out of bounds")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "index out of bounds")))
    movl $_L_12931, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_12932            # jump around closure body
_L_12931:
# check argument count
    cmp $4,%eax
    je _L_12933
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_12933:
# emit-tail-expr
# si=-12
# env=((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "index out of bounds"))
# emit-tail-let
#  si   = -12
#  env  = ((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((i i))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "index out of bounds")
# emit-expr i
# emit-variable-ref
# env=((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=i
    movl -8(%esp), %eax  # stack load i
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "index out of bounds")
# emit-tail-funcall
#    si   =-16
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "index out of bounds")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) i)
# funcall
#    si   =-20
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) i)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12934"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12934":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12935"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12935":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr i
# emit-variable-ref
# env=((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=i
    movl -12(%esp), %eax  # stack load i
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg i
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) i)
# emit-expr "index out of bounds"
# string literal
    jmp _L_12937
    .align 8,0x90
_L_12936 :
    .int 76
    .ascii "index out of bounds"
_L_12937:
    movl $_L_12936, %eax
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
_L_12932:
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
