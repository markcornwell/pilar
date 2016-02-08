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
# (let ((f207 (cons (make-symbol "nil" ()) ()))) (lambda () f207))
# == vectorize-letrec  ==>
# (let ((f207 (cons (make-symbol "nil" ()) ()))) (lambda () f207))
# == eliminate-set!  ==>
# (let ((f207 (cons (make-symbol "nil" ()) ()))) (lambda () (let () f207)))
# == close-free-variables  ==>
# (let ((f207 (cons (make-symbol "nil" ()) ()))) (closure () (f207) (let () f207)))
# == eliminate-quote  ==>
# (let ((f207 (cons (make-symbol "nil" ()) ()))) (closure () (f207) (let () f207)))
# == eliminate-when/unless  ==>
# (let ((f207 (cons (make-symbol "nil" ()) ()))) (closure () (f207) (let () f207)))
# == eliminate-cond  ==>
# (let ((f207 (cons (make-symbol "nil" ()) ()))) (closure () (f207) (let () f207)))
# == external-symbols  ==>
# (let ((f207 (cons (make-symbol "nil" ()) ()))) (closure () (f207) (let () f207)))
# emit-expr (let ((f207 (cons (make-symbol "nil" ()) ()))) (closure () (f207) (let () f207)))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f207 (cons (make-symbol "nil" ()) ())))
#  body = (closure () (f207) (let () f207))
# emit-expr (cons (make-symbol "nil" ()) ())
# cons arg1=(make-symbol "nil" ()) arg2=()
# emit-expr (make-symbol "nil" ())
# make-symbol arg1="nil" arg2=()
# emit-expr "nil"
# string literal
    jmp _L_1679
    .align 8,0x90
_L_1678 :
    .int 12
    .ascii "nil"
_L_1679:
    movl $_L_1678, %eax
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
# emit-expr (closure () (f207) (let () f207))
# emit-closure
# si = -4
# env = ((f207 . 0))
# expr = (closure () (f207) (let () f207))
    movl $_L_1680, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f207 . 0))
# var=f207
    movl 0(%esp), %eax  # stack load f207
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f207
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_1681            # jump around closure body
_L_1680:
# check argument count
    cmp $0,%eax
    je _L_1682
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_1682:
# emit-tail-expr
# si=-8
# env=((f207 . 4) (f207 . 0))
# expr=(let () f207)
# emit-tail-let
#  si   = -8
#  env  = ((f207 . 4) (f207 . 0))
#  bindings = ()
#  body = f207
# emit-tail-expr
# si=-8
# env=((f207 . 4) (f207 . 0))
# expr=f207
# emit-tail-variable-ref
# emit-variable-ref
# env=((f207 . 4) (f207 . 0))
# var=f207
    movl 2(%edi), %eax  # frame load f207
# end emit-variable-ref
    ret
# end emit-tail-variable ref
    .align 4,0x90
_L_1681:
     movl %eax, symbols
# == explicit-begins  ==>
# (letrec ((slen= (lambda (s1 s2) (fx= (string-length s1) (string-length s2)))) (si= (lambda (s1 s2 i) (char=? (string-ref s1 i) (string-ref s2 i)))) (si<n= (lambda (s1 s2 i n) (if (fx= i n) #t (if (si= s1 s2 i) (si<n= s1 s2 (fx+ i 1) n) #f)))) (ss= (lambda (s1 s2) (if (slen= s1 s2) (si<n= s1 s2 0 (string-length s1)) #f)))) ss=)
# == eliminate-let*  ==>
# (letrec ((slen= (lambda (s1 s2) (fx= (string-length s1) (string-length s2)))) (si= (lambda (s1 s2 i) (char=? (string-ref s1 i) (string-ref s2 i)))) (si<n= (lambda (s1 s2 i n) (if (fx= i n) #t (if (si= s1 s2 i) (si<n= s1 s2 (fx+ i 1) n) #f)))) (ss= (lambda (s1 s2) (if (slen= s1 s2) (si<n= s1 s2 0 (string-length s1)) #f)))) ss=)
# == uniquify-variables  ==>
# (letrec ((f211 (lambda (f232 f233) (fx= (string-length f232) (string-length f233)))) (f210 (lambda (f229 f230 f231) (char=? (string-ref f229 f231) (string-ref f230 f231)))) (f209 (lambda (f225 f226 f227 f228) (if (fx= f227 f228) #t (if (f210 f225 f226 f227) (f209 f225 f226 (fx+ f227 1) f228) #f)))) (f208 (lambda (f223 f224) (if (f211 f223 f224) (f209 f223 f224 0 (string-length f223)) #f)))) f208)
# == vectorize-letrec  ==>
# (let ((f211 (make-vector 1)) (f210 (make-vector 1)) (f209 (make-vector 1)) (f208 (make-vector 1))) (begin (begin (vector-set! f211 0 (lambda (f232 f233) (fx= (string-length f232) (string-length f233)))) (vector-set! f210 0 (lambda (f229 f230 f231) (char=? (string-ref f229 f231) (string-ref f230 f231)))) (vector-set! f209 0 (lambda (f225 f226 f227 f228) (if (fx= f227 f228) #t (if ((vector-ref f210 0) f225 f226 f227) ((vector-ref f209 0) f225 f226 (fx+ f227 1) f228) #f)))) (vector-set! f208 0 (lambda (f223 f224) (if ((vector-ref f211 0) f223 f224) ((vector-ref f209 0) f223 f224 0 (string-length f223)) #f)))) (vector-ref f208 0)))
# == eliminate-set!  ==>
# (let ((f211 (make-vector 1)) (f210 (make-vector 1)) (f209 (make-vector 1)) (f208 (make-vector 1))) (begin (begin (vector-set! f211 0 (lambda (f232 f233) (let ((f232 f232) (f233 f233)) (fx= (string-length f232) (string-length f233))))) (vector-set! f210 0 (lambda (f229 f230 f231) (let ((f229 f229) (f230 f230) (f231 f231)) (char=? (string-ref f229 f231) (string-ref f230 f231))))) (vector-set! f209 0 (lambda (f225 f226 f227 f228) (let ((f225 f225) (f226 f226) (f227 f227) (f228 f228)) (if (fx= f227 f228) #t (if ((vector-ref f210 0) f225 f226 f227) ((vector-ref f209 0) f225 f226 (fx+ f227 1) f228) #f))))) (vector-set! f208 0 (lambda (f223 f224) (let ((f223 f223) (f224 f224)) (if ((vector-ref f211 0) f223 f224) ((vector-ref f209 0) f223 f224 0 (string-length f223)) #f))))) (vector-ref f208 0)))
# == close-free-variables  ==>
# (let ((f211 (make-vector 1)) (f210 (make-vector 1)) (f209 (make-vector 1)) (f208 (make-vector 1))) (begin (begin (vector-set! f211 0 (closure (f232 f233) () (let ((f232 f232) (f233 f233)) (fx= (string-length f232) (string-length f233))))) (vector-set! f210 0 (closure (f229 f230 f231) () (let ((f229 f229) (f230 f230) (f231 f231)) (char=? (string-ref f229 f231) (string-ref f230 f231))))) (vector-set! f209 0 (closure (f225 f226 f227 f228) (f210 f209) (let ((f225 f225) (f226 f226) (f227 f227) (f228 f228)) (if (fx= f227 f228) #t (if ((vector-ref f210 0) f225 f226 f227) ((vector-ref f209 0) f225 f226 (fx+ f227 1) f228) #f))))) (vector-set! f208 0 (closure (f223 f224) (f211 f209) (let ((f223 f223) (f224 f224)) (if ((vector-ref f211 0) f223 f224) ((vector-ref f209 0) f223 f224 0 (string-length f223)) #f))))) (vector-ref f208 0)))
# == eliminate-quote  ==>
# (let ((f211 (make-vector 1)) (f210 (make-vector 1)) (f209 (make-vector 1)) (f208 (make-vector 1))) (begin (begin (vector-set! f211 0 (closure (f232 f233) () (let ((f232 f232) (f233 f233)) (fx= (string-length f232) (string-length f233))))) (vector-set! f210 0 (closure (f229 f230 f231) () (let ((f229 f229) (f230 f230) (f231 f231)) (char=? (string-ref f229 f231) (string-ref f230 f231))))) (vector-set! f209 0 (closure (f225 f226 f227 f228) (f210 f209) (let ((f225 f225) (f226 f226) (f227 f227) (f228 f228)) (if (fx= f227 f228) #t (if ((vector-ref f210 0) f225 f226 f227) ((vector-ref f209 0) f225 f226 (fx+ f227 1) f228) #f))))) (vector-set! f208 0 (closure (f223 f224) (f211 f209) (let ((f223 f223) (f224 f224)) (if ((vector-ref f211 0) f223 f224) ((vector-ref f209 0) f223 f224 0 (string-length f223)) #f))))) (vector-ref f208 0)))
# == eliminate-when/unless  ==>
# (let ((f211 (make-vector 1)) (f210 (make-vector 1)) (f209 (make-vector 1)) (f208 (make-vector 1))) (begin (begin (vector-set! f211 0 (closure (f232 f233) () (let ((f232 f232) (f233 f233)) (fx= (string-length f232) (string-length f233))))) (vector-set! f210 0 (closure (f229 f230 f231) () (let ((f229 f229) (f230 f230) (f231 f231)) (char=? (string-ref f229 f231) (string-ref f230 f231))))) (vector-set! f209 0 (closure (f225 f226 f227 f228) (f210 f209) (let ((f225 f225) (f226 f226) (f227 f227) (f228 f228)) (if (fx= f227 f228) #t (if ((vector-ref f210 0) f225 f226 f227) ((vector-ref f209 0) f225 f226 (fx+ f227 1) f228) #f))))) (vector-set! f208 0 (closure (f223 f224) (f211 f209) (let ((f223 f223) (f224 f224)) (if ((vector-ref f211 0) f223 f224) ((vector-ref f209 0) f223 f224 0 (string-length f223)) #f))))) (vector-ref f208 0)))
# == eliminate-cond  ==>
# (let ((f211 (make-vector 1)) (f210 (make-vector 1)) (f209 (make-vector 1)) (f208 (make-vector 1))) (begin (begin (vector-set! f211 0 (closure (f232 f233) () (let ((f232 f232) (f233 f233)) (fx= (string-length f232) (string-length f233))))) (vector-set! f210 0 (closure (f229 f230 f231) () (let ((f229 f229) (f230 f230) (f231 f231)) (char=? (string-ref f229 f231) (string-ref f230 f231))))) (vector-set! f209 0 (closure (f225 f226 f227 f228) (f210 f209) (let ((f225 f225) (f226 f226) (f227 f227) (f228 f228)) (if (fx= f227 f228) #t (if ((vector-ref f210 0) f225 f226 f227) ((vector-ref f209 0) f225 f226 (fx+ f227 1) f228) #f))))) (vector-set! f208 0 (closure (f223 f224) (f211 f209) (let ((f223 f223) (f224 f224)) (if ((vector-ref f211 0) f223 f224) ((vector-ref f209 0) f223 f224 0 (string-length f223)) #f))))) (vector-ref f208 0)))
# == external-symbols  ==>
# (let ((f211 (make-vector 1)) (f210 (make-vector 1)) (f209 (make-vector 1)) (f208 (make-vector 1))) (begin (begin (vector-set! f211 0 (closure (f232 f233) () (let ((f232 f232) (f233 f233)) (fx= (string-length f232) (string-length f233))))) (vector-set! f210 0 (closure (f229 f230 f231) () (let ((f229 f229) (f230 f230) (f231 f231)) (char=? (string-ref f229 f231) (string-ref f230 f231))))) (vector-set! f209 0 (closure (f225 f226 f227 f228) (f210 f209) (let ((f225 f225) (f226 f226) (f227 f227) (f228 f228)) (if (fx= f227 f228) #t (if ((vector-ref f210 0) f225 f226 f227) ((vector-ref f209 0) f225 f226 (fx+ f227 1) f228) #f))))) (vector-set! f208 0 (closure (f223 f224) (f211 f209) (let ((f223 f223) (f224 f224)) (if ((vector-ref f211 0) f223 f224) ((vector-ref f209 0) f223 f224 0 (string-length f223)) #f))))) (vector-ref f208 0)))
# emit-expr (let ((f211 (make-vector 1)) (f210 (make-vector 1)) (f209 (make-vector 1)) (f208 (make-vector 1))) (begin (begin (vector-set! f211 0 (closure (f232 f233) () (let ((f232 f232) (f233 f233)) (fx= (string-length f232) (string-length f233))))) (vector-set! f210 0 (closure (f229 f230 f231) () (let ((f229 f229) (f230 f230) (f231 f231)) (char=? (string-ref f229 f231) (string-ref f230 f231))))) (vector-set! f209 0 (closure (f225 f226 f227 f228) (f210 f209) (let ((f225 f225) (f226 f226) (f227 f227) (f228 f228)) (if (fx= f227 f228) #t (if ((vector-ref f210 0) f225 f226 f227) ((vector-ref f209 0) f225 f226 (fx+ f227 1) f228) #f))))) (vector-set! f208 0 (closure (f223 f224) (f211 f209) (let ((f223 f223) (f224 f224)) (if ((vector-ref f211 0) f223 f224) ((vector-ref f209 0) f223 f224 0 (string-length f223)) #f))))) (vector-ref f208 0)))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f211 (make-vector 1)) (f210 (make-vector 1)) (f209 (make-vector 1)) (f208 (make-vector 1)))
#  body = (begin (begin (vector-set! f211 0 (closure (f232 f233) () (let ((f232 f232) (f233 f233)) (fx= (string-length f232) (string-length f233))))) (vector-set! f210 0 (closure (f229 f230 f231) () (let ((f229 f229) (f230 f230) (f231 f231)) (char=? (string-ref f229 f231) (string-ref f230 f231))))) (vector-set! f209 0 (closure (f225 f226 f227 f228) (f210 f209) (let ((f225 f225) (f226 f226) (f227 f227) (f228 f228)) (if (fx= f227 f228) #t (if ((vector-ref f210 0) f225 f226 f227) ((vector-ref f209 0) f225 f226 (fx+ f227 1) f228) #f))))) (vector-set! f208 0 (closure (f223 f224) (f211 f209) (let ((f223 f223) (f224 f224)) (if ((vector-ref f211 0) f223 f224) ((vector-ref f209 0) f223 f224 0 (string-length f223)) #f))))) (vector-ref f208 0))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1683"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1683:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_1684
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1684:
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
    je "_L_1685"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1685:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_1686
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1686:
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
    je "_L_1687"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1687:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_1688
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1688:
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
    je "_L_1689"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1689:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_1690
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1690:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, -12(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f211 0 (closure (f232 f233) () (let ((f232 f232) (f233 f233)) (fx= (string-length f232) (string-length f233))))) (vector-set! f210 0 (closure (f229 f230 f231) () (let ((f229 f229) (f230 f230) (f231 f231)) (char=? (string-ref f229 f231) (string-ref f230 f231))))) (vector-set! f209 0 (closure (f225 f226 f227 f228) (f210 f209) (let ((f225 f225) (f226 f226) (f227 f227) (f228 f228)) (if (fx= f227 f228) #t (if ((vector-ref f210 0) f225 f226 f227) ((vector-ref f209 0) f225 f226 (fx+ f227 1) f228) #f))))) (vector-set! f208 0 (closure (f223 f224) (f211 f209) (let ((f223 f223) (f224 f224)) (if ((vector-ref f211 0) f223 f224) ((vector-ref f209 0) f223 f224 0 (string-length f223)) #f))))) (vector-ref f208 0))
# emit-begin
#   expr=(begin (begin (vector-set! f211 0 (closure (f232 f233) () (let ((f232 f232) (f233 f233)) (fx= (string-length f232) (string-length f233))))) (vector-set! f210 0 (closure (f229 f230 f231) () (let ((f229 f229) (f230 f230) (f231 f231)) (char=? (string-ref f229 f231) (string-ref f230 f231))))) (vector-set! f209 0 (closure (f225 f226 f227 f228) (f210 f209) (let ((f225 f225) (f226 f226) (f227 f227) (f228 f228)) (if (fx= f227 f228) #t (if ((vector-ref f210 0) f225 f226 f227) ((vector-ref f209 0) f225 f226 (fx+ f227 1) f228) #f))))) (vector-set! f208 0 (closure (f223 f224) (f211 f209) (let ((f223 f223) (f224 f224)) (if ((vector-ref f211 0) f223 f224) ((vector-ref f209 0) f223 f224 0 (string-length f223)) #f))))) (vector-ref f208 0))
#   env=((f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# emit-expr (begin (vector-set! f211 0 (closure (f232 f233) () (let ((f232 f232) (f233 f233)) (fx= (string-length f232) (string-length f233))))) (vector-set! f210 0 (closure (f229 f230 f231) () (let ((f229 f229) (f230 f230) (f231 f231)) (char=? (string-ref f229 f231) (string-ref f230 f231))))) (vector-set! f209 0 (closure (f225 f226 f227 f228) (f210 f209) (let ((f225 f225) (f226 f226) (f227 f227) (f228 f228)) (if (fx= f227 f228) #t (if ((vector-ref f210 0) f225 f226 f227) ((vector-ref f209 0) f225 f226 (fx+ f227 1) f228) #f))))) (vector-set! f208 0 (closure (f223 f224) (f211 f209) (let ((f223 f223) (f224 f224)) (if ((vector-ref f211 0) f223 f224) ((vector-ref f209 0) f223 f224 0 (string-length f223)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f211 0 (closure (f232 f233) () (let ((f232 f232) (f233 f233)) (fx= (string-length f232) (string-length f233))))) (vector-set! f210 0 (closure (f229 f230 f231) () (let ((f229 f229) (f230 f230) (f231 f231)) (char=? (string-ref f229 f231) (string-ref f230 f231))))) (vector-set! f209 0 (closure (f225 f226 f227 f228) (f210 f209) (let ((f225 f225) (f226 f226) (f227 f227) (f228 f228)) (if (fx= f227 f228) #t (if ((vector-ref f210 0) f225 f226 f227) ((vector-ref f209 0) f225 f226 (fx+ f227 1) f228) #f))))) (vector-set! f208 0 (closure (f223 f224) (f211 f209) (let ((f223 f223) (f224 f224)) (if ((vector-ref f211 0) f223 f224) ((vector-ref f209 0) f223 f224 0 (string-length f223)) #f)))))
#   env=((f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# emit-expr (vector-set! f211 0 (closure (f232 f233) () (let ((f232 f232) (f233 f233)) (fx= (string-length f232) (string-length f233)))))
# emit-expr f211
# emit-variable-ref
# env=((f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f211
    movl 0(%esp), %eax  # stack load f211
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_1691
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1691:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1692"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1692:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_1694
    cmp  $0,%eax
    jge _L_1693
_L_1694:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1693:
    movl %eax, -20(%esp)
# emit-expr (closure (f232 f233) () (let ((f232 f232) (f233 f233)) (fx= (string-length f232) (string-length f233))))
# emit-closure
# si = -24
# env = ((f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# expr = (closure (f232 f233) () (let ((f232 f232) (f233 f233)) (fx= (string-length f232) (string-length f233))))
    movl $_L_1695, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_1696            # jump around closure body
_L_1695:
# check argument count
    cmp $8,%eax
    je _L_1697
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_1697:
# emit-tail-expr
# si=-16
# env=((f233 . -12) (f232 . -8) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# expr=(let ((f232 f232) (f233 f233)) (fx= (string-length f232) (string-length f233)))
# emit-tail-let
#  si   = -16
#  env  = ((f233 . -12) (f232 . -8) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
#  bindings = ((f232 f232) (f233 f233))
#  body = (fx= (string-length f232) (string-length f233))
# emit-expr f232
# emit-variable-ref
# env=((f233 . -12) (f232 . -8) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f232
    movl -8(%esp), %eax  # stack load f232
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f233
# emit-variable-ref
# env=((f233 . -12) (f232 . -8) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f233
    movl -12(%esp), %eax  # stack load f233
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f233 . -20) (f232 . -16) (f233 . -12) (f232 . -8) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# expr=(fx= (string-length f232) (string-length f233))
# tail primcall
# emit-expr (string-length f233)
# emit-expr f233
# emit-variable-ref
# env=((f233 . -20) (f232 . -16) (f233 . -12) (f232 . -8) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f233
    movl -20(%esp), %eax  # stack load f233
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_1698
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1698:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1699"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1699:
    movl %eax, -24(%esp)
# emit-expr (string-length f232)
# emit-expr f232
# emit-variable-ref
# env=((f233 . -20) (f232 . -16) (f233 . -12) (f232 . -8) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f232
    movl -16(%esp), %eax  # stack load f232
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_1700
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1700:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1701"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1701:
    cmp -24(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
#return from tail (fx= (string-length f232) (string-length f233))
    ret
    .align 4,0x90
_L_1696:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f210 0 (closure (f229 f230 f231) () (let ((f229 f229) (f230 f230) (f231 f231)) (char=? (string-ref f229 f231) (string-ref f230 f231))))) (vector-set! f209 0 (closure (f225 f226 f227 f228) (f210 f209) (let ((f225 f225) (f226 f226) (f227 f227) (f228 f228)) (if (fx= f227 f228) #t (if ((vector-ref f210 0) f225 f226 f227) ((vector-ref f209 0) f225 f226 (fx+ f227 1) f228) #f))))) (vector-set! f208 0 (closure (f223 f224) (f211 f209) (let ((f223 f223) (f224 f224)) (if ((vector-ref f211 0) f223 f224) ((vector-ref f209 0) f223 f224 0 (string-length f223)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f210 0 (closure (f229 f230 f231) () (let ((f229 f229) (f230 f230) (f231 f231)) (char=? (string-ref f229 f231) (string-ref f230 f231))))) (vector-set! f209 0 (closure (f225 f226 f227 f228) (f210 f209) (let ((f225 f225) (f226 f226) (f227 f227) (f228 f228)) (if (fx= f227 f228) #t (if ((vector-ref f210 0) f225 f226 f227) ((vector-ref f209 0) f225 f226 (fx+ f227 1) f228) #f))))) (vector-set! f208 0 (closure (f223 f224) (f211 f209) (let ((f223 f223) (f224 f224)) (if ((vector-ref f211 0) f223 f224) ((vector-ref f209 0) f223 f224 0 (string-length f223)) #f)))))
#   env=((f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# emit-expr (vector-set! f210 0 (closure (f229 f230 f231) () (let ((f229 f229) (f230 f230) (f231 f231)) (char=? (string-ref f229 f231) (string-ref f230 f231)))))
# emit-expr f210
# emit-variable-ref
# env=((f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f210
    movl -4(%esp), %eax  # stack load f210
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_1702
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1702:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1703"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1703:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_1705
    cmp  $0,%eax
    jge _L_1704
_L_1705:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1704:
    movl %eax, -20(%esp)
# emit-expr (closure (f229 f230 f231) () (let ((f229 f229) (f230 f230) (f231 f231)) (char=? (string-ref f229 f231) (string-ref f230 f231))))
# emit-closure
# si = -24
# env = ((f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# expr = (closure (f229 f230 f231) () (let ((f229 f229) (f230 f230) (f231 f231)) (char=? (string-ref f229 f231) (string-ref f230 f231))))
    movl $_L_1706, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_1707            # jump around closure body
_L_1706:
# check argument count
    cmp $12,%eax
    je _L_1708
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_1708:
# emit-tail-expr
# si=-20
# env=((f231 . -16) (f230 . -12) (f229 . -8) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# expr=(let ((f229 f229) (f230 f230) (f231 f231)) (char=? (string-ref f229 f231) (string-ref f230 f231)))
# emit-tail-let
#  si   = -20
#  env  = ((f231 . -16) (f230 . -12) (f229 . -8) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
#  bindings = ((f229 f229) (f230 f230) (f231 f231))
#  body = (char=? (string-ref f229 f231) (string-ref f230 f231))
# emit-expr f229
# emit-variable-ref
# env=((f231 . -16) (f230 . -12) (f229 . -8) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f229
    movl -8(%esp), %eax  # stack load f229
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-expr f230
# emit-variable-ref
# env=((f231 . -16) (f230 . -12) (f229 . -8) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f230
    movl -12(%esp), %eax  # stack load f230
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f231
# emit-variable-ref
# env=((f231 . -16) (f230 . -12) (f229 . -8) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f231
    movl -16(%esp), %eax  # stack load f231
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-tail-expr
# si=-32
# env=((f231 . -28) (f230 . -24) (f229 . -20) (f231 . -16) (f230 . -12) (f229 . -8) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# expr=(char=? (string-ref f229 f231) (string-ref f230 f231))
# tail primcall
# char= c1=(string-ref f229 f231) c2=(string-ref f230 f231)
# emit-expr (string-ref f229 f231)
# emit-expr f229
# emit-variable-ref
# env=((f231 . -28) (f230 . -24) (f229 . -20) (f231 . -16) (f230 . -12) (f229 . -8) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f229
    movl -20(%esp), %eax  # stack load f229
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_1709
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1709:
    movl %eax, -32(%esp)
# emit-expr f231
# emit-variable-ref
# env=((f231 . -28) (f230 . -24) (f229 . -20) (f231 . -16) (f230 . -12) (f229 . -8) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f231
    movl -28(%esp), %eax  # stack load f231
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1710"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1710:
# check bounds on string index
    movl -32(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_1712
    cmp  $0,%eax
    jge _L_1711
_L_1712:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1711:
    sar $2, %eax
    movl -32(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_1713"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $32,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1713:
    movb %ah, -32(%esp)
# emit-expr (string-ref f230 f231)
# emit-expr f230
# emit-variable-ref
# env=((f231 . -28) (f230 . -24) (f229 . -20) (f231 . -16) (f230 . -12) (f229 . -8) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f230
    movl -24(%esp), %eax  # stack load f230
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_1714
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1714:
    movl %eax, -36(%esp)
# emit-expr f231
# emit-variable-ref
# env=((f231 . -28) (f230 . -24) (f229 . -20) (f231 . -16) (f230 . -12) (f229 . -8) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f231
    movl -28(%esp), %eax  # stack load f231
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1715"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1715:
# check bounds on string index
    movl -36(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_1717
    cmp  $0,%eax
    jge _L_1716
_L_1717:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1716:
    sar $2, %eax
    movl -36(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_1718"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $32,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1718:
    cmp %ah, -32(%esp)
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
#return from tail (char=? (string-ref f229 f231) (string-ref f230 f231))
    ret
    .align 4,0x90
_L_1707:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f209 0 (closure (f225 f226 f227 f228) (f210 f209) (let ((f225 f225) (f226 f226) (f227 f227) (f228 f228)) (if (fx= f227 f228) #t (if ((vector-ref f210 0) f225 f226 f227) ((vector-ref f209 0) f225 f226 (fx+ f227 1) f228) #f))))) (vector-set! f208 0 (closure (f223 f224) (f211 f209) (let ((f223 f223) (f224 f224)) (if ((vector-ref f211 0) f223 f224) ((vector-ref f209 0) f223 f224 0 (string-length f223)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f209 0 (closure (f225 f226 f227 f228) (f210 f209) (let ((f225 f225) (f226 f226) (f227 f227) (f228 f228)) (if (fx= f227 f228) #t (if ((vector-ref f210 0) f225 f226 f227) ((vector-ref f209 0) f225 f226 (fx+ f227 1) f228) #f))))) (vector-set! f208 0 (closure (f223 f224) (f211 f209) (let ((f223 f223) (f224 f224)) (if ((vector-ref f211 0) f223 f224) ((vector-ref f209 0) f223 f224 0 (string-length f223)) #f)))))
#   env=((f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# emit-expr (vector-set! f209 0 (closure (f225 f226 f227 f228) (f210 f209) (let ((f225 f225) (f226 f226) (f227 f227) (f228 f228)) (if (fx= f227 f228) #t (if ((vector-ref f210 0) f225 f226 f227) ((vector-ref f209 0) f225 f226 (fx+ f227 1) f228) #f)))))
# emit-expr f209
# emit-variable-ref
# env=((f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f209
    movl -8(%esp), %eax  # stack load f209
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_1719
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1719:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1720"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1720:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_1722
    cmp  $0,%eax
    jge _L_1721
_L_1722:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1721:
    movl %eax, -20(%esp)
# emit-expr (closure (f225 f226 f227 f228) (f210 f209) (let ((f225 f225) (f226 f226) (f227 f227) (f228 f228)) (if (fx= f227 f228) #t (if ((vector-ref f210 0) f225 f226 f227) ((vector-ref f209 0) f225 f226 (fx+ f227 1) f228) #f))))
# emit-closure
# si = -24
# env = ((f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# expr = (closure (f225 f226 f227 f228) (f210 f209) (let ((f225 f225) (f226 f226) (f227 f227) (f228 f228)) (if (fx= f227 f228) #t (if ((vector-ref f210 0) f225 f226 f227) ((vector-ref f209 0) f225 f226 (fx+ f227 1) f228) #f))))
    movl $_L_1723, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f210
    movl -4(%esp), %eax  # stack load f210
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f210
# emit-variable-ref
# env=((f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f209
    movl -8(%esp), %eax  # stack load f209
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f209
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_1724            # jump around closure body
_L_1723:
# check argument count
    cmp $16,%eax
    je _L_1725
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_1725:
# emit-tail-expr
# si=-24
# env=((f228 . -20) (f227 . -16) (f226 . -12) (f225 . -8) (f209 . 8) (f210 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# expr=(let ((f225 f225) (f226 f226) (f227 f227) (f228 f228)) (if (fx= f227 f228) #t (if ((vector-ref f210 0) f225 f226 f227) ((vector-ref f209 0) f225 f226 (fx+ f227 1) f228) #f)))
# emit-tail-let
#  si   = -24
#  env  = ((f228 . -20) (f227 . -16) (f226 . -12) (f225 . -8) (f209 . 8) (f210 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
#  bindings = ((f225 f225) (f226 f226) (f227 f227) (f228 f228))
#  body = (if (fx= f227 f228) #t (if ((vector-ref f210 0) f225 f226 f227) ((vector-ref f209 0) f225 f226 (fx+ f227 1) f228) #f))
# emit-expr f225
# emit-variable-ref
# env=((f228 . -20) (f227 . -16) (f226 . -12) (f225 . -8) (f209 . 8) (f210 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f225
    movl -8(%esp), %eax  # stack load f225
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f226
# emit-variable-ref
# env=((f228 . -20) (f227 . -16) (f226 . -12) (f225 . -8) (f209 . 8) (f210 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f226
    movl -12(%esp), %eax  # stack load f226
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-expr f227
# emit-variable-ref
# env=((f228 . -20) (f227 . -16) (f226 . -12) (f225 . -8) (f209 . 8) (f210 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f227
    movl -16(%esp), %eax  # stack load f227
# end emit-variable-ref
    movl %eax, -32(%esp)  # stack save
# emit-expr f228
# emit-variable-ref
# env=((f228 . -20) (f227 . -16) (f226 . -12) (f225 . -8) (f209 . 8) (f210 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f228
    movl -20(%esp), %eax  # stack load f228
# end emit-variable-ref
    movl %eax, -36(%esp)  # stack save
# emit-tail-expr
# si=-40
# env=((f228 . -36) (f227 . -32) (f226 . -28) (f225 . -24) (f228 . -20) (f227 . -16) (f226 . -12) (f225 . -8) (f209 . 8) (f210 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# expr=(if (fx= f227 f228) #t (if ((vector-ref f210 0) f225 f226 f227) ((vector-ref f209 0) f225 f226 (fx+ f227 1) f228) #f))
# emit-expr (fx= f227 f228)
# emit-expr f228
# emit-variable-ref
# env=((f228 . -36) (f227 . -32) (f226 . -28) (f225 . -24) (f228 . -20) (f227 . -16) (f226 . -12) (f225 . -8) (f209 . 8) (f210 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f228
    movl -36(%esp), %eax  # stack load f228
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1728"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1728:
    movl %eax, -40(%esp)
# emit-expr f227
# emit-variable-ref
# env=((f228 . -36) (f227 . -32) (f226 . -28) (f225 . -24) (f228 . -20) (f227 . -16) (f226 . -12) (f225 . -8) (f209 . 8) (f210 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f227
    movl -32(%esp), %eax  # stack load f227
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1729"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1729:
    cmp -40(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_1726
# emit-tail-expr
# si=-40
# env=((f228 . -36) (f227 . -32) (f226 . -28) (f225 . -24) (f228 . -20) (f227 . -16) (f226 . -12) (f225 . -8) (f209 . 8) (f210 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# expr=#t
    movl $111, %eax     # immed #t
    ret                  # immediate tail return
    jmp _L_1727
_L_1726:
# emit-tail-expr
# si=-40
# env=((f228 . -36) (f227 . -32) (f226 . -28) (f225 . -24) (f228 . -20) (f227 . -16) (f226 . -12) (f225 . -8) (f209 . 8) (f210 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# expr=(if ((vector-ref f210 0) f225 f226 f227) ((vector-ref f209 0) f225 f226 (fx+ f227 1) f228) #f)
# emit-expr ((vector-ref f210 0) f225 f226 f227)
# funcall
#    si   =-40
#    env  = ((f228 . -36) (f227 . -32) (f226 . -28) (f225 . -24) (f228 . -20) (f227 . -16) (f226 . -12) (f225 . -8) (f209 . 8) (f210 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
#    expr = (funcall (vector-ref f210 0) f225 f226 f227)
# emit-expr (vector-ref f210 0)
# emit-expr f210
# emit-variable-ref
# env=((f228 . -36) (f227 . -32) (f226 . -28) (f225 . -24) (f228 . -20) (f227 . -16) (f226 . -12) (f225 . -8) (f209 . 8) (f210 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f210
    movl 2(%edi), %eax  # frame load f210
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_1732
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1732:
    movl %eax, -48(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1733"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1733:
# check bounds on vector index
    movl -48(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_1735
    cmp  $0,%eax
    jge _L_1734
_L_1735:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1734:
    movl -48(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_1736"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_1736":
   movl %eax,  -48(%esp)  # stash funcall-oper in closure slot
# emit-expr f225
# emit-variable-ref
# env=((f228 . -36) (f227 . -32) (f226 . -28) (f225 . -24) (f228 . -20) (f227 . -16) (f226 . -12) (f225 . -8) (f209 . 8) (f210 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f225
    movl -24(%esp), %eax  # stack load f225
# end emit-variable-ref
    mov %eax, -52(%esp)  # arg f225
# emit-expr f226
# emit-variable-ref
# env=((f228 . -36) (f227 . -32) (f226 . -28) (f225 . -24) (f228 . -20) (f227 . -16) (f226 . -12) (f225 . -8) (f209 . 8) (f210 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f226
    movl -28(%esp), %eax  # stack load f226
# end emit-variable-ref
    mov %eax, -56(%esp)  # arg f226
# emit-expr f227
# emit-variable-ref
# env=((f228 . -36) (f227 . -32) (f226 . -28) (f225 . -24) (f228 . -20) (f227 . -16) (f226 . -12) (f225 . -8) (f209 . 8) (f210 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f227
    movl -32(%esp), %eax  # stack load f227
# end emit-variable-ref
    mov %eax, -60(%esp)  # arg f227
    movl -48(%esp), %edi   # load new closure to %edi
    add $-40, %esp   # adjust base
    movl $12,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $40, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_1730
# emit-tail-expr
# si=-40
# env=((f228 . -36) (f227 . -32) (f226 . -28) (f225 . -24) (f228 . -20) (f227 . -16) (f226 . -12) (f225 . -8) (f209 . 8) (f210 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# expr=((vector-ref f209 0) f225 f226 (fx+ f227 1) f228)
# emit-tail-funcall
#    si   =-40
#    env  = ((f228 . -36) (f227 . -32) (f226 . -28) (f225 . -24) (f228 . -20) (f227 . -16) (f226 . -12) (f225 . -8) (f209 . 8) (f210 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
#    expr = (funcall (vector-ref f209 0) f225 f226 (fx+ f227 1) f228)
# emit-expr (vector-ref f209 0)
# emit-expr f209
# emit-variable-ref
# env=((f228 . -36) (f227 . -32) (f226 . -28) (f225 . -24) (f228 . -20) (f227 . -16) (f226 . -12) (f225 . -8) (f209 . 8) (f210 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f209
    movl 6(%edi), %eax  # frame load f209
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_1737
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1737:
    movl %eax, -40(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1738"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1738:
# check bounds on vector index
    movl -40(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_1740
    cmp  $0,%eax
    jge _L_1739
_L_1740:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1739:
    movl -40(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -40(%esp)  # stash funcall-oper in next closure slot
# emit-expr f225
# emit-variable-ref
# env=((f228 . -36) (f227 . -32) (f226 . -28) (f225 . -24) (f228 . -20) (f227 . -16) (f226 . -12) (f225 . -8) (f209 . 8) (f210 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f225
    movl -24(%esp), %eax  # stack load f225
# end emit-variable-ref
    mov %eax, -44(%esp)    # arg f225
# emit-expr f226
# emit-variable-ref
# env=((f228 . -36) (f227 . -32) (f226 . -28) (f225 . -24) (f228 . -20) (f227 . -16) (f226 . -12) (f225 . -8) (f209 . 8) (f210 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f226
    movl -28(%esp), %eax  # stack load f226
# end emit-variable-ref
    mov %eax, -48(%esp)    # arg f226
# emit-expr (fx+ f227 1)
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1741"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1741:
    movl %eax, -52(%esp)  # fx+ push arg1
# emit-expr f227
# emit-variable-ref
# env=((f228 . -36) (f227 . -32) (f226 . -28) (f225 . -24) (f228 . -20) (f227 . -16) (f226 . -12) (f225 . -8) (f209 . 8) (f210 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f227
    movl -32(%esp), %eax  # stack load f227
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1742"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1742:
    addl -52(%esp), %eax  # fx+ arg1 arg2
    mov %eax, -52(%esp)    # arg (fx+ f227 1)
# emit-expr f228
# emit-variable-ref
# env=((f228 . -36) (f227 . -32) (f226 . -28) (f225 . -24) (f228 . -20) (f227 . -16) (f226 . -12) (f225 . -8) (f209 . 8) (f210 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f228
    movl -36(%esp), %eax  # stack load f228
# end emit-variable-ref
    mov %eax, -56(%esp)    # arg f228
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
    jmp _L_1731
_L_1730:
# emit-tail-expr
# si=-40
# env=((f228 . -36) (f227 . -32) (f226 . -28) (f225 . -24) (f228 . -20) (f227 . -16) (f226 . -12) (f225 . -8) (f209 . 8) (f210 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_1731:
_L_1727:
    .align 4,0x90
_L_1724:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f208 0 (closure (f223 f224) (f211 f209) (let ((f223 f223) (f224 f224)) (if ((vector-ref f211 0) f223 f224) ((vector-ref f209 0) f223 f224 0 (string-length f223)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f208 0 (closure (f223 f224) (f211 f209) (let ((f223 f223) (f224 f224)) (if ((vector-ref f211 0) f223 f224) ((vector-ref f209 0) f223 f224 0 (string-length f223)) #f)))))
#   env=((f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# emit-expr (vector-set! f208 0 (closure (f223 f224) (f211 f209) (let ((f223 f223) (f224 f224)) (if ((vector-ref f211 0) f223 f224) ((vector-ref f209 0) f223 f224 0 (string-length f223)) #f))))
# emit-expr f208
# emit-variable-ref
# env=((f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f208
    movl -12(%esp), %eax  # stack load f208
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_1743
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1743:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1744"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1744:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_1746
    cmp  $0,%eax
    jge _L_1745
_L_1746:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1745:
    movl %eax, -20(%esp)
# emit-expr (closure (f223 f224) (f211 f209) (let ((f223 f223) (f224 f224)) (if ((vector-ref f211 0) f223 f224) ((vector-ref f209 0) f223 f224 0 (string-length f223)) #f)))
# emit-closure
# si = -24
# env = ((f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# expr = (closure (f223 f224) (f211 f209) (let ((f223 f223) (f224 f224)) (if ((vector-ref f211 0) f223 f224) ((vector-ref f209 0) f223 f224 0 (string-length f223)) #f)))
    movl $_L_1747, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f211
    movl 0(%esp), %eax  # stack load f211
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f211
# emit-variable-ref
# env=((f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f209
    movl -8(%esp), %eax  # stack load f209
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f209
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_1748            # jump around closure body
_L_1747:
# check argument count
    cmp $8,%eax
    je _L_1749
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_1749:
# emit-tail-expr
# si=-16
# env=((f224 . -12) (f223 . -8) (f209 . 8) (f211 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# expr=(let ((f223 f223) (f224 f224)) (if ((vector-ref f211 0) f223 f224) ((vector-ref f209 0) f223 f224 0 (string-length f223)) #f))
# emit-tail-let
#  si   = -16
#  env  = ((f224 . -12) (f223 . -8) (f209 . 8) (f211 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
#  bindings = ((f223 f223) (f224 f224))
#  body = (if ((vector-ref f211 0) f223 f224) ((vector-ref f209 0) f223 f224 0 (string-length f223)) #f)
# emit-expr f223
# emit-variable-ref
# env=((f224 . -12) (f223 . -8) (f209 . 8) (f211 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f223
    movl -8(%esp), %eax  # stack load f223
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f224
# emit-variable-ref
# env=((f224 . -12) (f223 . -8) (f209 . 8) (f211 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f224
    movl -12(%esp), %eax  # stack load f224
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f224 . -20) (f223 . -16) (f224 . -12) (f223 . -8) (f209 . 8) (f211 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# expr=(if ((vector-ref f211 0) f223 f224) ((vector-ref f209 0) f223 f224 0 (string-length f223)) #f)
# emit-expr ((vector-ref f211 0) f223 f224)
# funcall
#    si   =-24
#    env  = ((f224 . -20) (f223 . -16) (f224 . -12) (f223 . -8) (f209 . 8) (f211 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
#    expr = (funcall (vector-ref f211 0) f223 f224)
# emit-expr (vector-ref f211 0)
# emit-expr f211
# emit-variable-ref
# env=((f224 . -20) (f223 . -16) (f224 . -12) (f223 . -8) (f209 . 8) (f211 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f211
    movl 2(%edi), %eax  # frame load f211
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_1752
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1752:
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1753"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1753:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_1755
    cmp  $0,%eax
    jge _L_1754
_L_1755:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1754:
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_1756"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_1756":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f223
# emit-variable-ref
# env=((f224 . -20) (f223 . -16) (f224 . -12) (f223 . -8) (f209 . 8) (f211 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f223
    movl -16(%esp), %eax  # stack load f223
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f223
# emit-expr f224
# emit-variable-ref
# env=((f224 . -20) (f223 . -16) (f224 . -12) (f223 . -8) (f209 . 8) (f211 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f224
    movl -20(%esp), %eax  # stack load f224
# end emit-variable-ref
    mov %eax, -40(%esp)  # arg f224
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_1750
# emit-tail-expr
# si=-24
# env=((f224 . -20) (f223 . -16) (f224 . -12) (f223 . -8) (f209 . 8) (f211 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# expr=((vector-ref f209 0) f223 f224 0 (string-length f223))
# emit-tail-funcall
#    si   =-24
#    env  = ((f224 . -20) (f223 . -16) (f224 . -12) (f223 . -8) (f209 . 8) (f211 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
#    expr = (funcall (vector-ref f209 0) f223 f224 0 (string-length f223))
# emit-expr (vector-ref f209 0)
# emit-expr f209
# emit-variable-ref
# env=((f224 . -20) (f223 . -16) (f224 . -12) (f223 . -8) (f209 . 8) (f211 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f209
    movl 6(%edi), %eax  # frame load f209
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_1757
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1757:
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1758"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1758:
# check bounds on vector index
    movl -24(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_1760
    cmp  $0,%eax
    jge _L_1759
_L_1760:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1759:
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr f223
# emit-variable-ref
# env=((f224 . -20) (f223 . -16) (f224 . -12) (f223 . -8) (f209 . 8) (f211 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f223
    movl -16(%esp), %eax  # stack load f223
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f223
# emit-expr f224
# emit-variable-ref
# env=((f224 . -20) (f223 . -16) (f224 . -12) (f223 . -8) (f209 . 8) (f211 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f224
    movl -20(%esp), %eax  # stack load f224
# end emit-variable-ref
    mov %eax, -32(%esp)    # arg f224
# emit-expr 0
    movl $0, %eax     # immed 0
    mov %eax, -36(%esp)    # arg 0
# emit-expr (string-length f223)
# emit-expr f223
# emit-variable-ref
# env=((f224 . -20) (f223 . -16) (f224 . -12) (f223 . -8) (f209 . 8) (f211 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f223
    movl -16(%esp), %eax  # stack load f223
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_1761
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1761:
    movl -6(%eax), %eax
    mov %eax, -40(%esp)    # arg (string-length f223)
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
    jmp _L_1751
_L_1750:
# emit-tail-expr
# si=-24
# env=((f224 . -20) (f223 . -16) (f224 . -12) (f223 . -8) (f209 . 8) (f211 . 4) (f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_1751:
    .align 4,0x90
_L_1748:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# emit-expr (begin (vector-ref f208 0))
# emit-begin
#   expr=(begin (vector-ref f208 0))
#   env=((f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# emit-expr (vector-ref f208 0)
# emit-expr f208
# emit-variable-ref
# env=((f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
# var=f208
    movl -12(%esp), %eax  # stack load f208
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_1762
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1762:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1763"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1763:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_1765
    cmp  $0,%eax
    jge _L_1764
_L_1765:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1764:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f208 . -12) (f209 . -8) (f210 . -4) (f211 . 0))
     movl %eax, string$e$q
# == explicit-begins  ==>
# (letrec ((str->sym (lambda (str symlist) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let* ((new-sym (make-symbol str #f)) (new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym)) (str->sym str (cdr symlist))))))) (lambda (str) (str->sym str (symbols))))
# == eliminate-let*  ==>
# (letrec ((str->sym (lambda (str symlist) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) (str->sym str (cdr symlist))))))) (lambda (str) (str->sym str (symbols))))
# == uniquify-variables  ==>
# (letrec ((f234 (lambda (f243 f244) (if (string=? f243 (symbol->string (car f244))) (car f244) (if (null? (cdr f244)) (let ((f248 (make-symbol f243 #f))) (let ((f250 (cons f248 ()))) (begin (set-cdr! f244 f250) f248))) (f234 f243 (cdr f244))))))) (lambda (f252) (f234 f252 (symbols))))
# == vectorize-letrec  ==>
# (let ((f234 (make-vector 1))) (begin (begin (vector-set! f234 0 (lambda (f243 f244) (if (string=? f243 (symbol->string (car f244))) (car f244) (if (null? (cdr f244)) (let ((f248 (make-symbol f243 #f))) (let ((f250 (cons f248 ()))) (begin (set-cdr! f244 f250) f248))) ((vector-ref f234 0) f243 (cdr f244))))))) (lambda (f252) ((vector-ref f234 0) f252 (symbols)))))
# == eliminate-set!  ==>
# (let ((f234 (make-vector 1))) (begin (begin (vector-set! f234 0 (lambda (f243 f244) (let ((f243 f243) (f244 f244)) (if (string=? f243 (symbol->string (car f244))) (car f244) (if (null? (cdr f244)) (let ((f248 (make-symbol f243 #f))) (let ((f250 (cons f248 ()))) (begin (set-cdr! f244 f250) f248))) ((vector-ref f234 0) f243 (cdr f244)))))))) (lambda (f252) (let ((f252 f252)) ((vector-ref f234 0) f252 (symbols))))))
# == close-free-variables  ==>
# (let ((f234 (make-vector 1))) (begin (begin (vector-set! f234 0 (closure (f243 f244) (string=? f234) (let ((f243 f243) (f244 f244)) (if (string=? f243 (symbol->string (car f244))) (car f244) (if (null? (cdr f244)) (let ((f248 (make-symbol f243 #f))) (let ((f250 (cons f248 ()))) (begin (set-cdr! f244 f250) f248))) ((vector-ref f234 0) f243 (cdr f244)))))))) (closure (f252) (f234 symbols) (let ((f252 f252)) ((vector-ref f234 0) f252 (symbols))))))
# == eliminate-quote  ==>
# (let ((f234 (make-vector 1))) (begin (begin (vector-set! f234 0 (closure (f243 f244) (string=? f234) (let ((f243 f243) (f244 f244)) (if (string=? f243 (symbol->string (car f244))) (car f244) (if (null? (cdr f244)) (let ((f248 (make-symbol f243 #f))) (let ((f250 (cons f248 ()))) (begin (set-cdr! f244 f250) f248))) ((vector-ref f234 0) f243 (cdr f244)))))))) (closure (f252) (f234 symbols) (let ((f252 f252)) ((vector-ref f234 0) f252 (symbols))))))
# == eliminate-when/unless  ==>
# (let ((f234 (make-vector 1))) (begin (begin (vector-set! f234 0 (closure (f243 f244) (string=? f234) (let ((f243 f243) (f244 f244)) (if (string=? f243 (symbol->string (car f244))) (car f244) (if (null? (cdr f244)) (let ((f248 (make-symbol f243 #f))) (let ((f250 (cons f248 ()))) (begin (set-cdr! f244 f250) f248))) ((vector-ref f234 0) f243 (cdr f244)))))))) (closure (f252) (f234 symbols) (let ((f252 f252)) ((vector-ref f234 0) f252 (symbols))))))
# == eliminate-cond  ==>
# (let ((f234 (make-vector 1))) (begin (begin (vector-set! f234 0 (closure (f243 f244) (string=? f234) (let ((f243 f243) (f244 f244)) (if (string=? f243 (symbol->string (car f244))) (car f244) (if (null? (cdr f244)) (let ((f248 (make-symbol f243 #f))) (let ((f250 (cons f248 ()))) (begin (set-cdr! f244 f250) f248))) ((vector-ref f234 0) f243 (cdr f244)))))))) (closure (f252) (f234 symbols) (let ((f252 f252)) ((vector-ref f234 0) f252 (symbols))))))
# == external-symbols  ==>
# (let ((f234 (make-vector 1))) (begin (begin (vector-set! f234 0 (closure (f243 f244) ((primitive-ref string=?) f234) (let ((f243 f243) (f244 f244)) (if ((primitive-ref string=?) f243 (symbol->string (car f244))) (car f244) (if (null? (cdr f244)) (let ((f248 (make-symbol f243 #f))) (let ((f250 (cons f248 ()))) (begin (set-cdr! f244 f250) f248))) ((vector-ref f234 0) f243 (cdr f244)))))))) (closure (f252) (f234 (primitive-ref symbols)) (let ((f252 f252)) ((vector-ref f234 0) f252 ((primitive-ref symbols)))))))
# emit-expr (let ((f234 (make-vector 1))) (begin (begin (vector-set! f234 0 (closure (f243 f244) ((primitive-ref string=?) f234) (let ((f243 f243) (f244 f244)) (if ((primitive-ref string=?) f243 (symbol->string (car f244))) (car f244) (if (null? (cdr f244)) (let ((f248 (make-symbol f243 #f))) (let ((f250 (cons f248 ()))) (begin (set-cdr! f244 f250) f248))) ((vector-ref f234 0) f243 (cdr f244)))))))) (closure (f252) (f234 (primitive-ref symbols)) (let ((f252 f252)) ((vector-ref f234 0) f252 ((primitive-ref symbols)))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f234 (make-vector 1)))
#  body = (begin (begin (vector-set! f234 0 (closure (f243 f244) ((primitive-ref string=?) f234) (let ((f243 f243) (f244 f244)) (if ((primitive-ref string=?) f243 (symbol->string (car f244))) (car f244) (if (null? (cdr f244)) (let ((f248 (make-symbol f243 #f))) (let ((f250 (cons f248 ()))) (begin (set-cdr! f244 f250) f248))) ((vector-ref f234 0) f243 (cdr f244)))))))) (closure (f252) (f234 (primitive-ref symbols)) (let ((f252 f252)) ((vector-ref f234 0) f252 ((primitive-ref symbols))))))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1766"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1766:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_1767
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1767:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f234 0 (closure (f243 f244) ((primitive-ref string=?) f234) (let ((f243 f243) (f244 f244)) (if ((primitive-ref string=?) f243 (symbol->string (car f244))) (car f244) (if (null? (cdr f244)) (let ((f248 (make-symbol f243 #f))) (let ((f250 (cons f248 ()))) (begin (set-cdr! f244 f250) f248))) ((vector-ref f234 0) f243 (cdr f244)))))))) (closure (f252) (f234 (primitive-ref symbols)) (let ((f252 f252)) ((vector-ref f234 0) f252 ((primitive-ref symbols))))))
# emit-begin
#   expr=(begin (begin (vector-set! f234 0 (closure (f243 f244) ((primitive-ref string=?) f234) (let ((f243 f243) (f244 f244)) (if ((primitive-ref string=?) f243 (symbol->string (car f244))) (car f244) (if (null? (cdr f244)) (let ((f248 (make-symbol f243 #f))) (let ((f250 (cons f248 ()))) (begin (set-cdr! f244 f250) f248))) ((vector-ref f234 0) f243 (cdr f244)))))))) (closure (f252) (f234 (primitive-ref symbols)) (let ((f252 f252)) ((vector-ref f234 0) f252 ((primitive-ref symbols))))))
#   env=((f234 . 0))
# emit-expr (begin (vector-set! f234 0 (closure (f243 f244) ((primitive-ref string=?) f234) (let ((f243 f243) (f244 f244)) (if ((primitive-ref string=?) f243 (symbol->string (car f244))) (car f244) (if (null? (cdr f244)) (let ((f248 (make-symbol f243 #f))) (let ((f250 (cons f248 ()))) (begin (set-cdr! f244 f250) f248))) ((vector-ref f234 0) f243 (cdr f244))))))))
# emit-begin
#   expr=(begin (vector-set! f234 0 (closure (f243 f244) ((primitive-ref string=?) f234) (let ((f243 f243) (f244 f244)) (if ((primitive-ref string=?) f243 (symbol->string (car f244))) (car f244) (if (null? (cdr f244)) (let ((f248 (make-symbol f243 #f))) (let ((f250 (cons f248 ()))) (begin (set-cdr! f244 f250) f248))) ((vector-ref f234 0) f243 (cdr f244))))))))
#   env=((f234 . 0))
# emit-expr (vector-set! f234 0 (closure (f243 f244) ((primitive-ref string=?) f234) (let ((f243 f243) (f244 f244)) (if ((primitive-ref string=?) f243 (symbol->string (car f244))) (car f244) (if (null? (cdr f244)) (let ((f248 (make-symbol f243 #f))) (let ((f250 (cons f248 ()))) (begin (set-cdr! f244 f250) f248))) ((vector-ref f234 0) f243 (cdr f244)))))))
# emit-expr f234
# emit-variable-ref
# env=((f234 . 0))
# var=f234
    movl 0(%esp), %eax  # stack load f234
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_1768
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1768:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1769"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1769:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_1771
    cmp  $0,%eax
    jge _L_1770
_L_1771:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1770:
    movl %eax, -8(%esp)
# emit-expr (closure (f243 f244) ((primitive-ref string=?) f234) (let ((f243 f243) (f244 f244)) (if ((primitive-ref string=?) f243 (symbol->string (car f244))) (car f244) (if (null? (cdr f244)) (let ((f248 (make-symbol f243 #f))) (let ((f250 (cons f248 ()))) (begin (set-cdr! f244 f250) f248))) ((vector-ref f234 0) f243 (cdr f244))))))
# emit-closure
# si = -12
# env = ((f234 . 0))
# expr = (closure (f243 f244) ((primitive-ref string=?) f234) (let ((f243 f243) (f244 f244)) (if ((primitive-ref string=?) f243 (symbol->string (car f244))) (car f244) (if (null? (cdr f244)) (let ((f248 (make-symbol f243 #f))) (let ((f250 (cons f248 ()))) (begin (set-cdr! f244 f250) f248))) ((vector-ref f234 0) f243 (cdr f244))))))
    movl $_L_1772, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref string=?) not defined in the environmnet
# emit-variable-ref
# env=((f234 . 0))
# var=f234
    movl 0(%esp), %eax  # stack load f234
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f234
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_1773            # jump around closure body
_L_1772:
# check argument count
    cmp $8,%eax
    je _L_1774
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_1774:
# emit-tail-expr
# si=-16
# env=((f244 . -12) (f243 . -8) (f234 . 8) ((primitive-ref string=?) . 4) (f234 . 0))
# expr=(let ((f243 f243) (f244 f244)) (if ((primitive-ref string=?) f243 (symbol->string (car f244))) (car f244) (if (null? (cdr f244)) (let ((f248 (make-symbol f243 #f))) (let ((f250 (cons f248 ()))) (begin (set-cdr! f244 f250) f248))) ((vector-ref f234 0) f243 (cdr f244)))))
# emit-tail-let
#  si   = -16
#  env  = ((f244 . -12) (f243 . -8) (f234 . 8) ((primitive-ref string=?) . 4) (f234 . 0))
#  bindings = ((f243 f243) (f244 f244))
#  body = (if ((primitive-ref string=?) f243 (symbol->string (car f244))) (car f244) (if (null? (cdr f244)) (let ((f248 (make-symbol f243 #f))) (let ((f250 (cons f248 ()))) (begin (set-cdr! f244 f250) f248))) ((vector-ref f234 0) f243 (cdr f244))))
# emit-expr f243
# emit-variable-ref
# env=((f244 . -12) (f243 . -8) (f234 . 8) ((primitive-ref string=?) . 4) (f234 . 0))
# var=f243
    movl -8(%esp), %eax  # stack load f243
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f244
# emit-variable-ref
# env=((f244 . -12) (f243 . -8) (f234 . 8) ((primitive-ref string=?) . 4) (f234 . 0))
# var=f244
    movl -12(%esp), %eax  # stack load f244
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f244 . -20) (f243 . -16) (f244 . -12) (f243 . -8) (f234 . 8) ((primitive-ref string=?) . 4) (f234 . 0))
# expr=(if ((primitive-ref string=?) f243 (symbol->string (car f244))) (car f244) (if (null? (cdr f244)) (let ((f248 (make-symbol f243 #f))) (let ((f250 (cons f248 ()))) (begin (set-cdr! f244 f250) f248))) ((vector-ref f234 0) f243 (cdr f244))))
# emit-expr ((primitive-ref string=?) f243 (symbol->string (car f244)))
# funcall
#    si   =-24
#    env  = ((f244 . -20) (f243 . -16) (f244 . -12) (f243 . -8) (f234 . 8) ((primitive-ref string=?) . 4) (f234 . 0))
#    expr = (funcall (primitive-ref string=?) f243 (symbol->string (car f244)))
# emit-expr (primitive-ref string=?)
    .extern string$e$q
    movl string$e$q,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_1777"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_1777":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f243
# emit-variable-ref
# env=((f244 . -20) (f243 . -16) (f244 . -12) (f243 . -8) (f234 . 8) ((primitive-ref string=?) . 4) (f234 . 0))
# var=f243
    movl -16(%esp), %eax  # stack load f243
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f243
# emit-expr (symbol->string (car f244))
# symbol->string (car f244)
# emit-expr (car f244)
# emit-expr f244
# emit-variable-ref
# env=((f244 . -20) (f243 . -16) (f244 . -12) (f243 . -8) (f234 . 8) ((primitive-ref string=?) . 4) (f234 . 0))
# var=f244
    movl -20(%esp), %eax  # stack load f244
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_1778
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1778:
    movl -1(%eax), %eax
    movl -3(%eax), %eax
    mov %eax, -40(%esp)  # arg (symbol->string (car f244))
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_1775
# emit-tail-expr
# si=-24
# env=((f244 . -20) (f243 . -16) (f244 . -12) (f243 . -8) (f234 . 8) ((primitive-ref string=?) . 4) (f234 . 0))
# expr=(car f244)
# tail primcall
# emit-expr f244
# emit-variable-ref
# env=((f244 . -20) (f243 . -16) (f244 . -12) (f243 . -8) (f234 . 8) ((primitive-ref string=?) . 4) (f234 . 0))
# var=f244
    movl -20(%esp), %eax  # stack load f244
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_1779
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1779:
    movl -1(%eax), %eax
#return from tail (car f244)
    ret
    jmp _L_1776
_L_1775:
# emit-tail-expr
# si=-24
# env=((f244 . -20) (f243 . -16) (f244 . -12) (f243 . -8) (f234 . 8) ((primitive-ref string=?) . 4) (f234 . 0))
# expr=(if (null? (cdr f244)) (let ((f248 (make-symbol f243 #f))) (let ((f250 (cons f248 ()))) (begin (set-cdr! f244 f250) f248))) ((vector-ref f234 0) f243 (cdr f244)))
# emit-expr (null? (cdr f244))
# emit-expr (cdr f244)
# emit-expr f244
# emit-variable-ref
# env=((f244 . -20) (f243 . -16) (f244 . -12) (f243 . -8) (f234 . 8) ((primitive-ref string=?) . 4) (f234 . 0))
# var=f244
    movl -20(%esp), %eax  # stack load f244
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_1782
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1782:
    movl 3(%eax), %eax
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_1780
# emit-tail-expr
# si=-24
# env=((f244 . -20) (f243 . -16) (f244 . -12) (f243 . -8) (f234 . 8) ((primitive-ref string=?) . 4) (f234 . 0))
# expr=(let ((f248 (make-symbol f243 #f))) (let ((f250 (cons f248 ()))) (begin (set-cdr! f244 f250) f248)))
# emit-tail-let
#  si   = -24
#  env  = ((f244 . -20) (f243 . -16) (f244 . -12) (f243 . -8) (f234 . 8) ((primitive-ref string=?) . 4) (f234 . 0))
#  bindings = ((f248 (make-symbol f243 #f)))
#  body = (let ((f250 (cons f248 ()))) (begin (set-cdr! f244 f250) f248))
# emit-expr (make-symbol f243 #f)
# make-symbol arg1=f243 arg2=#f
# emit-expr f243
# emit-variable-ref
# env=((f244 . -20) (f243 . -16) (f244 . -12) (f243 . -8) (f234 . 8) ((primitive-ref string=?) . 4) (f234 . 0))
# var=f243
    movl -16(%esp), %eax  # stack load f243
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
# env=((f248 . -24) (f244 . -20) (f243 . -16) (f244 . -12) (f243 . -8) (f234 . 8) ((primitive-ref string=?) . 4) (f234 . 0))
# expr=(let ((f250 (cons f248 ()))) (begin (set-cdr! f244 f250) f248))
# emit-tail-let
#  si   = -28
#  env  = ((f248 . -24) (f244 . -20) (f243 . -16) (f244 . -12) (f243 . -8) (f234 . 8) ((primitive-ref string=?) . 4) (f234 . 0))
#  bindings = ((f250 (cons f248 ())))
#  body = (begin (set-cdr! f244 f250) f248)
# emit-expr (cons f248 ())
# cons arg1=f248 arg2=()
# emit-expr f248
# emit-variable-ref
# env=((f248 . -24) (f244 . -20) (f243 . -16) (f244 . -12) (f243 . -8) (f234 . 8) ((primitive-ref string=?) . 4) (f234 . 0))
# var=f248
    movl -24(%esp), %eax  # stack load f248
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
# env=((f250 . -28) (f248 . -24) (f244 . -20) (f243 . -16) (f244 . -12) (f243 . -8) (f234 . 8) ((primitive-ref string=?) . 4) (f234 . 0))
# expr=(begin (set-cdr! f244 f250) f248)
# tail-begin (begin (set-cdr! f244 f250) f248)
#   env=((f250 . -28) (f248 . -24) (f244 . -20) (f243 . -16) (f244 . -12) (f243 . -8) (f234 . 8) ((primitive-ref string=?) . 4) (f234 . 0))
# emit-expr (set-cdr! f244 f250)
# emit-expr f244
# emit-variable-ref
# env=((f250 . -28) (f248 . -24) (f244 . -20) (f243 . -16) (f244 . -12) (f243 . -8) (f234 . 8) ((primitive-ref string=?) . 4) (f234 . 0))
# var=f244
    movl -20(%esp), %eax  # stack load f244
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_1783
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1783:
    movl %eax, -32(%esp)
# emit-expr f250
# emit-variable-ref
# env=((f250 . -28) (f248 . -24) (f244 . -20) (f243 . -16) (f244 . -12) (f243 . -8) (f234 . 8) ((primitive-ref string=?) . 4) (f234 . 0))
# var=f250
    movl -28(%esp), %eax  # stack load f250
# end emit-variable-ref
    movl -32(%esp), %ebx
    movl %eax, 3(%ebx)
# emit-tail-expr
# si=-32
# env=((f250 . -28) (f248 . -24) (f244 . -20) (f243 . -16) (f244 . -12) (f243 . -8) (f234 . 8) ((primitive-ref string=?) . 4) (f234 . 0))
# expr=(begin f248)
# tail-begin (begin f248)
#   env=((f250 . -28) (f248 . -24) (f244 . -20) (f243 . -16) (f244 . -12) (f243 . -8) (f234 . 8) ((primitive-ref string=?) . 4) (f234 . 0))
# emit-tail-expr
# si=-32
# env=((f250 . -28) (f248 . -24) (f244 . -20) (f243 . -16) (f244 . -12) (f243 . -8) (f234 . 8) ((primitive-ref string=?) . 4) (f234 . 0))
# expr=f248
# emit-tail-variable-ref
# emit-variable-ref
# env=((f250 . -28) (f248 . -24) (f244 . -20) (f243 . -16) (f244 . -12) (f243 . -8) (f234 . 8) ((primitive-ref string=?) . 4) (f234 . 0))
# var=f248
    movl -24(%esp), %eax  # stack load f248
# end emit-variable-ref
    ret
# end emit-tail-variable ref
     ret   # return thru stack
    jmp _L_1781
_L_1780:
# emit-tail-expr
# si=-24
# env=((f244 . -20) (f243 . -16) (f244 . -12) (f243 . -8) (f234 . 8) ((primitive-ref string=?) . 4) (f234 . 0))
# expr=((vector-ref f234 0) f243 (cdr f244))
# emit-tail-funcall
#    si   =-24
#    env  = ((f244 . -20) (f243 . -16) (f244 . -12) (f243 . -8) (f234 . 8) ((primitive-ref string=?) . 4) (f234 . 0))
#    expr = (funcall (vector-ref f234 0) f243 (cdr f244))
# emit-expr (vector-ref f234 0)
# emit-expr f234
# emit-variable-ref
# env=((f244 . -20) (f243 . -16) (f244 . -12) (f243 . -8) (f234 . 8) ((primitive-ref string=?) . 4) (f234 . 0))
# var=f234
    movl 6(%edi), %eax  # frame load f234
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_1784
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1784:
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1785"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1785:
# check bounds on vector index
    movl -24(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_1787
    cmp  $0,%eax
    jge _L_1786
_L_1787:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1786:
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr f243
# emit-variable-ref
# env=((f244 . -20) (f243 . -16) (f244 . -12) (f243 . -8) (f234 . 8) ((primitive-ref string=?) . 4) (f234 . 0))
# var=f243
    movl -16(%esp), %eax  # stack load f243
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f243
# emit-expr (cdr f244)
# emit-expr f244
# emit-variable-ref
# env=((f244 . -20) (f243 . -16) (f244 . -12) (f243 . -8) (f234 . 8) ((primitive-ref string=?) . 4) (f234 . 0))
# var=f244
    movl -20(%esp), %eax  # stack load f244
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_1788
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1788:
    movl 3(%eax), %eax
    mov %eax, -32(%esp)    # arg (cdr f244)
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
_L_1781:
_L_1776:
    .align 4,0x90
_L_1773:
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f234 . 0))
# emit-expr (begin (closure (f252) (f234 (primitive-ref symbols)) (let ((f252 f252)) ((vector-ref f234 0) f252 ((primitive-ref symbols))))))
# emit-begin
#   expr=(begin (closure (f252) (f234 (primitive-ref symbols)) (let ((f252 f252)) ((vector-ref f234 0) f252 ((primitive-ref symbols))))))
#   env=((f234 . 0))
# emit-expr (closure (f252) (f234 (primitive-ref symbols)) (let ((f252 f252)) ((vector-ref f234 0) f252 ((primitive-ref symbols)))))
# emit-closure
# si = -4
# env = ((f234 . 0))
# expr = (closure (f252) (f234 (primitive-ref symbols)) (let ((f252 f252)) ((vector-ref f234 0) f252 ((primitive-ref symbols)))))
    movl $_L_1789, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f234 . 0))
# var=f234
    movl 0(%esp), %eax  # stack load f234
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f234
# WARNING: free var (primitive-ref symbols) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_1790            # jump around closure body
_L_1789:
# check argument count
    cmp $4,%eax
    je _L_1791
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_1791:
# emit-tail-expr
# si=-12
# env=((f252 . -8) ((primitive-ref symbols) . 8) (f234 . 4) (f234 . 0))
# expr=(let ((f252 f252)) ((vector-ref f234 0) f252 ((primitive-ref symbols))))
# emit-tail-let
#  si   = -12
#  env  = ((f252 . -8) ((primitive-ref symbols) . 8) (f234 . 4) (f234 . 0))
#  bindings = ((f252 f252))
#  body = ((vector-ref f234 0) f252 ((primitive-ref symbols)))
# emit-expr f252
# emit-variable-ref
# env=((f252 . -8) ((primitive-ref symbols) . 8) (f234 . 4) (f234 . 0))
# var=f252
    movl -8(%esp), %eax  # stack load f252
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f252 . -12) (f252 . -8) ((primitive-ref symbols) . 8) (f234 . 4) (f234 . 0))
# expr=((vector-ref f234 0) f252 ((primitive-ref symbols)))
# emit-tail-funcall
#    si   =-16
#    env  = ((f252 . -12) (f252 . -8) ((primitive-ref symbols) . 8) (f234 . 4) (f234 . 0))
#    expr = (funcall (vector-ref f234 0) f252 ((primitive-ref symbols)))
# emit-expr (vector-ref f234 0)
# emit-expr f234
# emit-variable-ref
# env=((f252 . -12) (f252 . -8) ((primitive-ref symbols) . 8) (f234 . 4) (f234 . 0))
# var=f234
    movl 2(%edi), %eax  # frame load f234
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_1792
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1792:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1793"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1793:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_1795
    cmp  $0,%eax
    jge _L_1794
_L_1795:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1794:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr f252
# emit-variable-ref
# env=((f252 . -12) (f252 . -8) ((primitive-ref symbols) . 8) (f234 . 4) (f234 . 0))
# var=f252
    movl -12(%esp), %eax  # stack load f252
# end emit-variable-ref
    mov %eax, -20(%esp)    # arg f252
# emit-expr ((primitive-ref symbols))
# funcall
#    si   =-24
#    env  = ((f252 . -12) (f252 . -8) ((primitive-ref symbols) . 8) (f234 . 4) (f234 . 0))
#    expr = (funcall (primitive-ref symbols))
# emit-expr (primitive-ref symbols)
    .extern symbols
    movl symbols,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_1796"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_1796":
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
_L_1790:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f234 . 0))
     movl %eax, string$m$gsymbol
# == explicit-begins  ==>
# (lambda (lst elt) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt))))
# == eliminate-let*  ==>
# (lambda (lst elt) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt))))
# == uniquify-variables  ==>
# (lambda (f253 f254) (if (null? f253) (cons e nil) (cons (car f253) (append1 (cdr f253) f254))))
# == vectorize-letrec  ==>
# (lambda (f253 f254) (if (null? f253) (cons e nil) (cons (car f253) (append1 (cdr f253) f254))))
# == eliminate-set!  ==>
# (lambda (f253 f254) (let ((f253 f253) (f254 f254)) (if (null? f253) (cons e nil) (cons (car f253) (append1 (cdr f253) f254)))))
# == close-free-variables  ==>
# (closure (f253 f254) (e nil append1) (let ((f253 f253) (f254 f254)) (if (null? f253) (cons e nil) (cons (car f253) (append1 (cdr f253) f254)))))
# == eliminate-quote  ==>
# (closure (f253 f254) (e nil append1) (let ((f253 f253) (f254 f254)) (if (null? f253) (cons e nil) (cons (car f253) (append1 (cdr f253) f254)))))
# == eliminate-when/unless  ==>
# (closure (f253 f254) (e nil append1) (let ((f253 f253) (f254 f254)) (if (null? f253) (cons e nil) (cons (car f253) (append1 (cdr f253) f254)))))
# == eliminate-cond  ==>
# (closure (f253 f254) (e nil append1) (let ((f253 f253) (f254 f254)) (if (null? f253) (cons e nil) (cons (car f253) (append1 (cdr f253) f254)))))
# == external-symbols  ==>
# (closure (f253 f254) (e nil (primitive-ref append1)) (let ((f253 f253) (f254 f254)) (if (null? f253) (cons e nil) (cons (car f253) ((primitive-ref append1) (cdr f253) f254)))))
# emit-expr (closure (f253 f254) (e nil (primitive-ref append1)) (let ((f253 f253) (f254 f254)) (if (null? f253) (cons e nil) (cons (car f253) ((primitive-ref append1) (cdr f253) f254)))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f253 f254) (e nil (primitive-ref append1)) (let ((f253 f253) (f254 f254)) (if (null? f253) (cons e nil) (cons (car f253) ((primitive-ref append1) (cdr f253) f254)))))
    movl $_L_1797, 0(%ebp)  # closure label
# WARNING: free var e not defined in the environmnet
# WARNING: free var nil not defined in the environmnet
# WARNING: free var (primitive-ref append1) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_1798            # jump around closure body
_L_1797:
# check argument count
    cmp $8,%eax
    je _L_1799
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_1799:
# emit-tail-expr
# si=-16
# env=((f254 . -12) (f253 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(let ((f253 f253) (f254 f254)) (if (null? f253) (cons e nil) (cons (car f253) ((primitive-ref append1) (cdr f253) f254))))
# emit-tail-let
#  si   = -16
#  env  = ((f254 . -12) (f253 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
#  bindings = ((f253 f253) (f254 f254))
#  body = (if (null? f253) (cons e nil) (cons (car f253) ((primitive-ref append1) (cdr f253) f254)))
# emit-expr f253
# emit-variable-ref
# env=((f254 . -12) (f253 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f253
    movl -8(%esp), %eax  # stack load f253
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f254
# emit-variable-ref
# env=((f254 . -12) (f253 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f254
    movl -12(%esp), %eax  # stack load f254
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f254 . -20) (f253 . -16) (f254 . -12) (f253 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(if (null? f253) (cons e nil) (cons (car f253) ((primitive-ref append1) (cdr f253) f254)))
# emit-expr (null? f253)
# emit-expr f253
# emit-variable-ref
# env=((f254 . -20) (f253 . -16) (f254 . -12) (f253 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f253
    movl -16(%esp), %eax  # stack load f253
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_1800
# emit-tail-expr
# si=-24
# env=((f254 . -20) (f253 . -16) (f254 . -12) (f253 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(cons e nil)
# tail primcall
# cons arg1=e arg2=nil
# emit-expr e
# emit-variable-ref
# env=((f254 . -20) (f253 . -16) (f254 . -12) (f253 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=e
    movl 2(%edi), %eax  # frame load e
# end emit-variable-ref
    movl %eax, -24(%esp)
# emit-expr nil
# emit-variable-ref
# env=((f254 . -20) (f253 . -16) (f254 . -12) (f253 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
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
    jmp _L_1801
_L_1800:
# emit-tail-expr
# si=-24
# env=((f254 . -20) (f253 . -16) (f254 . -12) (f253 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(cons (car f253) ((primitive-ref append1) (cdr f253) f254))
# tail primcall
# cons arg1=(car f253) arg2=((primitive-ref append1) (cdr f253) f254)
# emit-expr (car f253)
# emit-expr f253
# emit-variable-ref
# env=((f254 . -20) (f253 . -16) (f254 . -12) (f253 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f253
    movl -16(%esp), %eax  # stack load f253
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_1802
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1802:
    movl -1(%eax), %eax
    movl %eax, -24(%esp)
# emit-expr ((primitive-ref append1) (cdr f253) f254)
# funcall
#    si   =-28
#    env  = ((f254 . -20) (f253 . -16) (f254 . -12) (f253 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
#    expr = (funcall (primitive-ref append1) (cdr f253) f254)
# emit-expr (primitive-ref append1)
    .extern append1
    movl append1,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_1803"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_1803":
   movl %eax,  -36(%esp)  # stash funcall-oper in closure slot
# emit-expr (cdr f253)
# emit-expr f253
# emit-variable-ref
# env=((f254 . -20) (f253 . -16) (f254 . -12) (f253 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f253
    movl -16(%esp), %eax  # stack load f253
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_1804
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1804:
    movl 3(%eax), %eax
    mov %eax, -40(%esp)  # arg (cdr f253)
# emit-expr f254
# emit-variable-ref
# env=((f254 . -20) (f253 . -16) (f254 . -12) (f253 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f254
    movl -20(%esp), %eax  # stack load f254
# end emit-variable-ref
    mov %eax, -44(%esp)  # arg f254
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
#return from tail (cons (car f253) ((primitive-ref append1) (cdr f253) f254))
    ret
_L_1801:
    .align 4,0x90
_L_1798:
     movl %eax, append1
# == explicit-begins  ==>
# (lambda (l k) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1))))
# == eliminate-let*  ==>
# (lambda (l k) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1))))
# == uniquify-variables  ==>
# (lambda (f255 f256) (if (fx= f256 0) (car f255) (list-ref (cdr f255) (fx- f256 1))))
# == vectorize-letrec  ==>
# (lambda (f255 f256) (if (fx= f256 0) (car f255) (list-ref (cdr f255) (fx- f256 1))))
# == eliminate-set!  ==>
# (lambda (f255 f256) (let ((f255 f255) (f256 f256)) (if (fx= f256 0) (car f255) (list-ref (cdr f255) (fx- f256 1)))))
# == close-free-variables  ==>
# (closure (f255 f256) (list-ref) (let ((f255 f255) (f256 f256)) (if (fx= f256 0) (car f255) (list-ref (cdr f255) (fx- f256 1)))))
# == eliminate-quote  ==>
# (closure (f255 f256) (list-ref) (let ((f255 f255) (f256 f256)) (if (fx= f256 0) (car f255) (list-ref (cdr f255) (fx- f256 1)))))
# == eliminate-when/unless  ==>
# (closure (f255 f256) (list-ref) (let ((f255 f255) (f256 f256)) (if (fx= f256 0) (car f255) (list-ref (cdr f255) (fx- f256 1)))))
# == eliminate-cond  ==>
# (closure (f255 f256) (list-ref) (let ((f255 f255) (f256 f256)) (if (fx= f256 0) (car f255) (list-ref (cdr f255) (fx- f256 1)))))
# == external-symbols  ==>
# (closure (f255 f256) ((primitive-ref list-ref)) (let ((f255 f255) (f256 f256)) (if (fx= f256 0) (car f255) ((primitive-ref list-ref) (cdr f255) (fx- f256 1)))))
# emit-expr (closure (f255 f256) ((primitive-ref list-ref)) (let ((f255 f255) (f256 f256)) (if (fx= f256 0) (car f255) ((primitive-ref list-ref) (cdr f255) (fx- f256 1)))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f255 f256) ((primitive-ref list-ref)) (let ((f255 f255) (f256 f256)) (if (fx= f256 0) (car f255) ((primitive-ref list-ref) (cdr f255) (fx- f256 1)))))
    movl $_L_1805, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_1806            # jump around closure body
_L_1805:
# check argument count
    cmp $8,%eax
    je _L_1807
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_1807:
# emit-tail-expr
# si=-16
# env=((f256 . -12) (f255 . -8) ((primitive-ref list-ref) . 4))
# expr=(let ((f255 f255) (f256 f256)) (if (fx= f256 0) (car f255) ((primitive-ref list-ref) (cdr f255) (fx- f256 1))))
# emit-tail-let
#  si   = -16
#  env  = ((f256 . -12) (f255 . -8) ((primitive-ref list-ref) . 4))
#  bindings = ((f255 f255) (f256 f256))
#  body = (if (fx= f256 0) (car f255) ((primitive-ref list-ref) (cdr f255) (fx- f256 1)))
# emit-expr f255
# emit-variable-ref
# env=((f256 . -12) (f255 . -8) ((primitive-ref list-ref) . 4))
# var=f255
    movl -8(%esp), %eax  # stack load f255
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f256
# emit-variable-ref
# env=((f256 . -12) (f255 . -8) ((primitive-ref list-ref) . 4))
# var=f256
    movl -12(%esp), %eax  # stack load f256
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f256 . -20) (f255 . -16) (f256 . -12) (f255 . -8) ((primitive-ref list-ref) . 4))
# expr=(if (fx= f256 0) (car f255) ((primitive-ref list-ref) (cdr f255) (fx- f256 1)))
# emit-expr (fx= f256 0)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1810"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1810:
    movl %eax, -24(%esp)
# emit-expr f256
# emit-variable-ref
# env=((f256 . -20) (f255 . -16) (f256 . -12) (f255 . -8) ((primitive-ref list-ref) . 4))
# var=f256
    movl -20(%esp), %eax  # stack load f256
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1811"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1811:
    cmp -24(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_1808
# emit-tail-expr
# si=-24
# env=((f256 . -20) (f255 . -16) (f256 . -12) (f255 . -8) ((primitive-ref list-ref) . 4))
# expr=(car f255)
# tail primcall
# emit-expr f255
# emit-variable-ref
# env=((f256 . -20) (f255 . -16) (f256 . -12) (f255 . -8) ((primitive-ref list-ref) . 4))
# var=f255
    movl -16(%esp), %eax  # stack load f255
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_1812
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1812:
    movl -1(%eax), %eax
#return from tail (car f255)
    ret
    jmp _L_1809
_L_1808:
# emit-tail-expr
# si=-24
# env=((f256 . -20) (f255 . -16) (f256 . -12) (f255 . -8) ((primitive-ref list-ref) . 4))
# expr=((primitive-ref list-ref) (cdr f255) (fx- f256 1))
# emit-tail-funcall
#    si   =-24
#    env  = ((f256 . -20) (f255 . -16) (f256 . -12) (f255 . -8) ((primitive-ref list-ref) . 4))
#    expr = (funcall (primitive-ref list-ref) (cdr f255) (fx- f256 1))
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr (cdr f255)
# emit-expr f255
# emit-variable-ref
# env=((f256 . -20) (f255 . -16) (f256 . -12) (f255 . -8) ((primitive-ref list-ref) . 4))
# var=f255
    movl -16(%esp), %eax  # stack load f255
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_1813
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1813:
    movl 3(%eax), %eax
    mov %eax, -28(%esp)    # arg (cdr f255)
# emit-expr (fx- f256 1)
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1814"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $84,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1814:
    movl %eax, -32(%esp)
# emit-expr f256
# emit-variable-ref
# env=((f256 . -20) (f255 . -16) (f256 . -12) (f255 . -8) ((primitive-ref list-ref) . 4))
# var=f256
    movl -20(%esp), %eax  # stack load f256
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1815"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $84,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1815:
    subl -32(%esp), %eax
    mov %eax, -32(%esp)    # arg (fx- f256 1)
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
_L_1809:
    .align 4,0x90
_L_1806:
     movl %eax, list$mref
# == explicit-begins  ==>
# (lambda (l) (if (null? l) 0 (fxadd1 (list-length (cdr l)))))
# == eliminate-let*  ==>
# (lambda (l) (if (null? l) 0 (fxadd1 (list-length (cdr l)))))
# == uniquify-variables  ==>
# (lambda (f257) (if (null? f257) 0 (fxadd1 (list-length (cdr f257)))))
# == vectorize-letrec  ==>
# (lambda (f257) (if (null? f257) 0 (fxadd1 (list-length (cdr f257)))))
# == eliminate-set!  ==>
# (lambda (f257) (let ((f257 f257)) (if (null? f257) 0 (fxadd1 (list-length (cdr f257))))))
# == close-free-variables  ==>
# (closure (f257) (list-length) (let ((f257 f257)) (if (null? f257) 0 (fxadd1 (list-length (cdr f257))))))
# == eliminate-quote  ==>
# (closure (f257) (list-length) (let ((f257 f257)) (if (null? f257) 0 (fxadd1 (list-length (cdr f257))))))
# == eliminate-when/unless  ==>
# (closure (f257) (list-length) (let ((f257 f257)) (if (null? f257) 0 (fxadd1 (list-length (cdr f257))))))
# == eliminate-cond  ==>
# (closure (f257) (list-length) (let ((f257 f257)) (if (null? f257) 0 (fxadd1 (list-length (cdr f257))))))
# == external-symbols  ==>
# (closure (f257) ((primitive-ref list-length)) (let ((f257 f257)) (if (null? f257) 0 (fxadd1 ((primitive-ref list-length) (cdr f257))))))
# emit-expr (closure (f257) ((primitive-ref list-length)) (let ((f257 f257)) (if (null? f257) 0 (fxadd1 ((primitive-ref list-length) (cdr f257))))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f257) ((primitive-ref list-length)) (let ((f257 f257)) (if (null? f257) 0 (fxadd1 ((primitive-ref list-length) (cdr f257))))))
    movl $_L_1816, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref list-length) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_1817            # jump around closure body
_L_1816:
# check argument count
    cmp $4,%eax
    je _L_1818
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_1818:
# emit-tail-expr
# si=-12
# env=((f257 . -8) ((primitive-ref list-length) . 4))
# expr=(let ((f257 f257)) (if (null? f257) 0 (fxadd1 ((primitive-ref list-length) (cdr f257)))))
# emit-tail-let
#  si   = -12
#  env  = ((f257 . -8) ((primitive-ref list-length) . 4))
#  bindings = ((f257 f257))
#  body = (if (null? f257) 0 (fxadd1 ((primitive-ref list-length) (cdr f257))))
# emit-expr f257
# emit-variable-ref
# env=((f257 . -8) ((primitive-ref list-length) . 4))
# var=f257
    movl -8(%esp), %eax  # stack load f257
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f257 . -12) (f257 . -8) ((primitive-ref list-length) . 4))
# expr=(if (null? f257) 0 (fxadd1 ((primitive-ref list-length) (cdr f257))))
# emit-expr (null? f257)
# emit-expr f257
# emit-variable-ref
# env=((f257 . -12) (f257 . -8) ((primitive-ref list-length) . 4))
# var=f257
    movl -12(%esp), %eax  # stack load f257
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_1819
# emit-tail-expr
# si=-16
# env=((f257 . -12) (f257 . -8) ((primitive-ref list-length) . 4))
# expr=0
    movl $0, %eax     # immed 0
    ret                  # immediate tail return
    jmp _L_1820
_L_1819:
# emit-tail-expr
# si=-16
# env=((f257 . -12) (f257 . -8) ((primitive-ref list-length) . 4))
# expr=(fxadd1 ((primitive-ref list-length) (cdr f257)))
# tail primcall
# emit-expr ((primitive-ref list-length) (cdr f257))
# funcall
#    si   =-16
#    env  = ((f257 . -12) (f257 . -8) ((primitive-ref list-length) . 4))
#    expr = (funcall (primitive-ref list-length) (cdr f257))
# emit-expr (primitive-ref list-length)
    .extern list$mlength
    movl list$mlength,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_1821"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_1821":
   movl %eax,  -24(%esp)  # stash funcall-oper in closure slot
# emit-expr (cdr f257)
# emit-expr f257
# emit-variable-ref
# env=((f257 . -12) (f257 . -8) ((primitive-ref list-length) . 4))
# var=f257
    movl -12(%esp), %eax  # stack load f257
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_1822
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1822:
    movl 3(%eax), %eax
    mov %eax, -28(%esp)  # arg (cdr f257)
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
    je "_L_1823"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $48,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1823:
     addl $4, %eax
#return from tail (fxadd1 ((primitive-ref list-length) (cdr f257)))
    ret
_L_1820:
    .align 4,0x90
_L_1817:
     movl %eax, list$mlength
# == explicit-begins  ==>
# (letrec ((fill-vector (lambda (v k args) (if (null? args) v (begin (vector-set! v k (car args)) (fill-vector v (fxadd1 k) (cdr args))))))) (lambda args (let ((v (make-vector (list-length args)))) (fill-vector v 0 args))))
# == eliminate-let*  ==>
# (letrec ((fill-vector (lambda (v k args) (if (null? args) v (begin (vector-set! v k (car args)) (fill-vector v (fxadd1 k) (cdr args))))))) (lambda args (let ((v (make-vector (list-length args)))) (fill-vector v 0 args))))
# == uniquify-variables  ==>
# (letrec ((f258 (lambda (f262 f263 f264) (if (null? f264) f262 (begin (vector-set! f262 f263 (car f264)) (f258 f262 (fxadd1 f263) (cdr f264))))))) (lambda f268 (let ((f270 (make-vector (list-length f268)))) (f258 f270 0 f268))))
# == vectorize-letrec  ==>
# (let ((f258 (make-vector 1))) (begin (begin (vector-set! f258 0 (lambda (f262 f263 f264) (if (null? f264) f262 (begin (vector-set! f262 f263 (car f264)) ((vector-ref f258 0) f262 (fxadd1 f263) (cdr f264))))))) (lambda f268 (let ((f270 (make-vector (list-length f268)))) ((vector-ref f258 0) f270 0 f268)))))
# == eliminate-set!  ==>
# (let ((f258 (make-vector 1))) (begin (begin (vector-set! f258 0 (lambda (f262 f263 f264) (let ((f262 f262) (f263 f263) (f264 f264)) (if (null? f264) f262 (begin (vector-set! f262 f263 (car f264)) ((vector-ref f258 0) f262 (fxadd1 f263) (cdr f264)))))))) (lambda f268 (let () (let ((f270 (make-vector (list-length f268)))) ((vector-ref f258 0) f270 0 f268))))))
# == close-free-variables  ==>
# (let ((f258 (make-vector 1))) (begin (begin (vector-set! f258 0 (closure (f262 f263 f264) (f258) (let ((f262 f262) (f263 f263) (f264 f264)) (if (null? f264) f262 (begin (vector-set! f262 f263 (car f264)) ((vector-ref f258 0) f262 (fxadd1 f263) (cdr f264)))))))) (closure f268 (f258) (let () (let ((f270 (make-vector (list-length f268)))) ((vector-ref f258 0) f270 0 f268))))))
# == eliminate-quote  ==>
# (let ((f258 (make-vector 1))) (begin (begin (vector-set! f258 0 (closure (f262 f263 f264) (f258) (let ((f262 f262) (f263 f263) (f264 f264)) (if (null? f264) f262 (begin (vector-set! f262 f263 (car f264)) ((vector-ref f258 0) f262 (fxadd1 f263) (cdr f264)))))))) (closure f268 (f258) (let () (let ((f270 (make-vector (list-length f268)))) ((vector-ref f258 0) f270 0 f268))))))
# == eliminate-when/unless  ==>
# (let ((f258 (make-vector 1))) (begin (begin (vector-set! f258 0 (closure (f262 f263 f264) (f258) (let ((f262 f262) (f263 f263) (f264 f264)) (if (null? f264) f262 (begin (vector-set! f262 f263 (car f264)) ((vector-ref f258 0) f262 (fxadd1 f263) (cdr f264)))))))) (closure f268 (f258) (let () (let ((f270 (make-vector (list-length f268)))) ((vector-ref f258 0) f270 0 f268))))))
# == eliminate-cond  ==>
# (let ((f258 (make-vector 1))) (begin (begin (vector-set! f258 0 (closure (f262 f263 f264) (f258) (let ((f262 f262) (f263 f263) (f264 f264)) (if (null? f264) f262 (begin (vector-set! f262 f263 (car f264)) ((vector-ref f258 0) f262 (fxadd1 f263) (cdr f264)))))))) (closure f268 (f258) (let () (let ((f270 (make-vector (list-length f268)))) ((vector-ref f258 0) f270 0 f268))))))
# == external-symbols  ==>
# (let ((f258 (make-vector 1))) (begin (begin (vector-set! f258 0 (closure (f262 f263 f264) (f258) (let ((f262 f262) (f263 f263) (f264 f264)) (if (null? f264) f262 (begin (vector-set! f262 f263 (car f264)) ((vector-ref f258 0) f262 (fxadd1 f263) (cdr f264)))))))) (closure f268 (f258) (let () (let ((f270 (make-vector ((primitive-ref list-length) f268)))) ((vector-ref f258 0) f270 0 f268))))))
# emit-expr (let ((f258 (make-vector 1))) (begin (begin (vector-set! f258 0 (closure (f262 f263 f264) (f258) (let ((f262 f262) (f263 f263) (f264 f264)) (if (null? f264) f262 (begin (vector-set! f262 f263 (car f264)) ((vector-ref f258 0) f262 (fxadd1 f263) (cdr f264)))))))) (closure f268 (f258) (let () (let ((f270 (make-vector ((primitive-ref list-length) f268)))) ((vector-ref f258 0) f270 0 f268))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f258 (make-vector 1)))
#  body = (begin (begin (vector-set! f258 0 (closure (f262 f263 f264) (f258) (let ((f262 f262) (f263 f263) (f264 f264)) (if (null? f264) f262 (begin (vector-set! f262 f263 (car f264)) ((vector-ref f258 0) f262 (fxadd1 f263) (cdr f264)))))))) (closure f268 (f258) (let () (let ((f270 (make-vector ((primitive-ref list-length) f268)))) ((vector-ref f258 0) f270 0 f268)))))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1824"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1824:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_1825
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1825:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f258 0 (closure (f262 f263 f264) (f258) (let ((f262 f262) (f263 f263) (f264 f264)) (if (null? f264) f262 (begin (vector-set! f262 f263 (car f264)) ((vector-ref f258 0) f262 (fxadd1 f263) (cdr f264)))))))) (closure f268 (f258) (let () (let ((f270 (make-vector ((primitive-ref list-length) f268)))) ((vector-ref f258 0) f270 0 f268)))))
# emit-begin
#   expr=(begin (begin (vector-set! f258 0 (closure (f262 f263 f264) (f258) (let ((f262 f262) (f263 f263) (f264 f264)) (if (null? f264) f262 (begin (vector-set! f262 f263 (car f264)) ((vector-ref f258 0) f262 (fxadd1 f263) (cdr f264)))))))) (closure f268 (f258) (let () (let ((f270 (make-vector ((primitive-ref list-length) f268)))) ((vector-ref f258 0) f270 0 f268)))))
#   env=((f258 . 0))
# emit-expr (begin (vector-set! f258 0 (closure (f262 f263 f264) (f258) (let ((f262 f262) (f263 f263) (f264 f264)) (if (null? f264) f262 (begin (vector-set! f262 f263 (car f264)) ((vector-ref f258 0) f262 (fxadd1 f263) (cdr f264))))))))
# emit-begin
#   expr=(begin (vector-set! f258 0 (closure (f262 f263 f264) (f258) (let ((f262 f262) (f263 f263) (f264 f264)) (if (null? f264) f262 (begin (vector-set! f262 f263 (car f264)) ((vector-ref f258 0) f262 (fxadd1 f263) (cdr f264))))))))
#   env=((f258 . 0))
# emit-expr (vector-set! f258 0 (closure (f262 f263 f264) (f258) (let ((f262 f262) (f263 f263) (f264 f264)) (if (null? f264) f262 (begin (vector-set! f262 f263 (car f264)) ((vector-ref f258 0) f262 (fxadd1 f263) (cdr f264)))))))
# emit-expr f258
# emit-variable-ref
# env=((f258 . 0))
# var=f258
    movl 0(%esp), %eax  # stack load f258
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_1826
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1826:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1827"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1827:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_1829
    cmp  $0,%eax
    jge _L_1828
_L_1829:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1828:
    movl %eax, -8(%esp)
# emit-expr (closure (f262 f263 f264) (f258) (let ((f262 f262) (f263 f263) (f264 f264)) (if (null? f264) f262 (begin (vector-set! f262 f263 (car f264)) ((vector-ref f258 0) f262 (fxadd1 f263) (cdr f264))))))
# emit-closure
# si = -12
# env = ((f258 . 0))
# expr = (closure (f262 f263 f264) (f258) (let ((f262 f262) (f263 f263) (f264 f264)) (if (null? f264) f262 (begin (vector-set! f262 f263 (car f264)) ((vector-ref f258 0) f262 (fxadd1 f263) (cdr f264))))))
    movl $_L_1830, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f258 . 0))
# var=f258
    movl 0(%esp), %eax  # stack load f258
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f258
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_1831            # jump around closure body
_L_1830:
# check argument count
    cmp $12,%eax
    je _L_1832
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_1832:
# emit-tail-expr
# si=-20
# env=((f264 . -16) (f263 . -12) (f262 . -8) (f258 . 4) (f258 . 0))
# expr=(let ((f262 f262) (f263 f263) (f264 f264)) (if (null? f264) f262 (begin (vector-set! f262 f263 (car f264)) ((vector-ref f258 0) f262 (fxadd1 f263) (cdr f264)))))
# emit-tail-let
#  si   = -20
#  env  = ((f264 . -16) (f263 . -12) (f262 . -8) (f258 . 4) (f258 . 0))
#  bindings = ((f262 f262) (f263 f263) (f264 f264))
#  body = (if (null? f264) f262 (begin (vector-set! f262 f263 (car f264)) ((vector-ref f258 0) f262 (fxadd1 f263) (cdr f264))))
# emit-expr f262
# emit-variable-ref
# env=((f264 . -16) (f263 . -12) (f262 . -8) (f258 . 4) (f258 . 0))
# var=f262
    movl -8(%esp), %eax  # stack load f262
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-expr f263
# emit-variable-ref
# env=((f264 . -16) (f263 . -12) (f262 . -8) (f258 . 4) (f258 . 0))
# var=f263
    movl -12(%esp), %eax  # stack load f263
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f264
# emit-variable-ref
# env=((f264 . -16) (f263 . -12) (f262 . -8) (f258 . 4) (f258 . 0))
# var=f264
    movl -16(%esp), %eax  # stack load f264
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-tail-expr
# si=-32
# env=((f264 . -28) (f263 . -24) (f262 . -20) (f264 . -16) (f263 . -12) (f262 . -8) (f258 . 4) (f258 . 0))
# expr=(if (null? f264) f262 (begin (vector-set! f262 f263 (car f264)) ((vector-ref f258 0) f262 (fxadd1 f263) (cdr f264))))
# emit-expr (null? f264)
# emit-expr f264
# emit-variable-ref
# env=((f264 . -28) (f263 . -24) (f262 . -20) (f264 . -16) (f263 . -12) (f262 . -8) (f258 . 4) (f258 . 0))
# var=f264
    movl -28(%esp), %eax  # stack load f264
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_1833
# emit-tail-expr
# si=-32
# env=((f264 . -28) (f263 . -24) (f262 . -20) (f264 . -16) (f263 . -12) (f262 . -8) (f258 . 4) (f258 . 0))
# expr=f262
# emit-tail-variable-ref
# emit-variable-ref
# env=((f264 . -28) (f263 . -24) (f262 . -20) (f264 . -16) (f263 . -12) (f262 . -8) (f258 . 4) (f258 . 0))
# var=f262
    movl -20(%esp), %eax  # stack load f262
# end emit-variable-ref
    ret
# end emit-tail-variable ref
    jmp _L_1834
_L_1833:
# emit-tail-expr
# si=-32
# env=((f264 . -28) (f263 . -24) (f262 . -20) (f264 . -16) (f263 . -12) (f262 . -8) (f258 . 4) (f258 . 0))
# expr=(begin (vector-set! f262 f263 (car f264)) ((vector-ref f258 0) f262 (fxadd1 f263) (cdr f264)))
# tail-begin (begin (vector-set! f262 f263 (car f264)) ((vector-ref f258 0) f262 (fxadd1 f263) (cdr f264)))
#   env=((f264 . -28) (f263 . -24) (f262 . -20) (f264 . -16) (f263 . -12) (f262 . -8) (f258 . 4) (f258 . 0))
# emit-expr (vector-set! f262 f263 (car f264))
# emit-expr f262
# emit-variable-ref
# env=((f264 . -28) (f263 . -24) (f262 . -20) (f264 . -16) (f263 . -12) (f262 . -8) (f258 . 4) (f258 . 0))
# var=f262
    movl -20(%esp), %eax  # stack load f262
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_1835
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1835:
    movl %eax, -32(%esp)
# emit-expr f263
# emit-variable-ref
# env=((f264 . -28) (f263 . -24) (f262 . -20) (f264 . -16) (f263 . -12) (f262 . -8) (f258 . 4) (f258 . 0))
# var=f263
    movl -24(%esp), %eax  # stack load f263
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1836"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1836:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_1838
    cmp  $0,%eax
    jge _L_1837
_L_1838:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1837:
    movl %eax, -36(%esp)
# emit-expr (car f264)
# emit-expr f264
# emit-variable-ref
# env=((f264 . -28) (f263 . -24) (f262 . -20) (f264 . -16) (f263 . -12) (f262 . -8) (f258 . 4) (f258 . 0))
# var=f264
    movl -28(%esp), %eax  # stack load f264
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_1839
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1839:
    movl -1(%eax), %eax
    movl -32(%esp), %ebx
    movl -36(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-tail-expr
# si=-32
# env=((f264 . -28) (f263 . -24) (f262 . -20) (f264 . -16) (f263 . -12) (f262 . -8) (f258 . 4) (f258 . 0))
# expr=(begin ((vector-ref f258 0) f262 (fxadd1 f263) (cdr f264)))
# tail-begin (begin ((vector-ref f258 0) f262 (fxadd1 f263) (cdr f264)))
#   env=((f264 . -28) (f263 . -24) (f262 . -20) (f264 . -16) (f263 . -12) (f262 . -8) (f258 . 4) (f258 . 0))
# emit-tail-expr
# si=-32
# env=((f264 . -28) (f263 . -24) (f262 . -20) (f264 . -16) (f263 . -12) (f262 . -8) (f258 . 4) (f258 . 0))
# expr=((vector-ref f258 0) f262 (fxadd1 f263) (cdr f264))
# emit-tail-funcall
#    si   =-32
#    env  = ((f264 . -28) (f263 . -24) (f262 . -20) (f264 . -16) (f263 . -12) (f262 . -8) (f258 . 4) (f258 . 0))
#    expr = (funcall (vector-ref f258 0) f262 (fxadd1 f263) (cdr f264))
# emit-expr (vector-ref f258 0)
# emit-expr f258
# emit-variable-ref
# env=((f264 . -28) (f263 . -24) (f262 . -20) (f264 . -16) (f263 . -12) (f262 . -8) (f258 . 4) (f258 . 0))
# var=f258
    movl 2(%edi), %eax  # frame load f258
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_1840
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1840:
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1841"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1841:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_1843
    cmp  $0,%eax
    jge _L_1842
_L_1843:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1842:
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -32(%esp)  # stash funcall-oper in next closure slot
# emit-expr f262
# emit-variable-ref
# env=((f264 . -28) (f263 . -24) (f262 . -20) (f264 . -16) (f263 . -12) (f262 . -8) (f258 . 4) (f258 . 0))
# var=f262
    movl -20(%esp), %eax  # stack load f262
# end emit-variable-ref
    mov %eax, -36(%esp)    # arg f262
# emit-expr (fxadd1 f263)
# emit-expr f263
# emit-variable-ref
# env=((f264 . -28) (f263 . -24) (f262 . -20) (f264 . -16) (f263 . -12) (f262 . -8) (f258 . 4) (f258 . 0))
# var=f263
    movl -24(%esp), %eax  # stack load f263
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1844"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $48,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1844:
     addl $4, %eax
    mov %eax, -40(%esp)    # arg (fxadd1 f263)
# emit-expr (cdr f264)
# emit-expr f264
# emit-variable-ref
# env=((f264 . -28) (f263 . -24) (f262 . -20) (f264 . -16) (f263 . -12) (f262 . -8) (f258 . 4) (f258 . 0))
# var=f264
    movl -28(%esp), %eax  # stack load f264
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_1845
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1845:
    movl 3(%eax), %eax
    mov %eax, -44(%esp)    # arg (cdr f264)
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
_L_1834:
    .align 4,0x90
_L_1831:
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f258 . 0))
# emit-expr (begin (closure f268 (f258) (let () (let ((f270 (make-vector ((primitive-ref list-length) f268)))) ((vector-ref f258 0) f270 0 f268)))))
# emit-begin
#   expr=(begin (closure f268 (f258) (let () (let ((f270 (make-vector ((primitive-ref list-length) f268)))) ((vector-ref f258 0) f270 0 f268)))))
#   env=((f258 . 0))
# emit-expr (closure f268 (f258) (let () (let ((f270 (make-vector ((primitive-ref list-length) f268)))) ((vector-ref f258 0) f270 0 f268))))
# emit-closure
# si = -4
# env = ((f258 . 0))
# expr = (closure f268 (f258) (let () (let ((f270 (make-vector ((primitive-ref list-length) f268)))) ((vector-ref f258 0) f270 0 f268))))
    movl $_L_1846, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f258 . 0))
# var=f258
    movl 0(%esp), %eax  # stack load f258
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f258
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_1847            # jump around closure body
_L_1846:
# check argument count
    cmp $0,%eax
    jge _L_1848
# invoke error handler eh_argcount_min
    .extern eh$uargcount$umin
    movl eh$uargcount$umin, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_1848:
# emit-build-varargs-list
    movl $63, %esi       # args <- () 
    lea -4(%esp),%edi    # edi <- esp-4
    subl %eax, %edi      # edi <- esp-4-eax    addr of arg[K+N] on stack
_L_1850:
    lea -4(%esp),%ebx    # addr of arg[K] on stack
    cmp %edi, %ebx       # while edi <> esp+(si+4)
    je _L_1849
    movl (%edi),%ebx     # arg i -> car
    movl %ebx, 0(%ebp)
    movl %esi, 4(%ebp)  # esi -> cdr
    movl %ebp, %esi
    addl $1, %esi       # tag as pair
    addl $8,%ebp         # bump heap ptr
    addl $4,%edi         # move to next previous arg from the end
    jmp _L_1850
_L_1849:
    movl %esi, -8(%esp)  # set args
# emit-tail-expr
# si=-12
# env=((f268 . -8) (f258 . 4) (f258 . 0))
# expr=(let () (let ((f270 (make-vector ((primitive-ref list-length) f268)))) ((vector-ref f258 0) f270 0 f268)))
# emit-tail-let
#  si   = -12
#  env  = ((f268 . -8) (f258 . 4) (f258 . 0))
#  bindings = ()
#  body = (let ((f270 (make-vector ((primitive-ref list-length) f268)))) ((vector-ref f258 0) f270 0 f268))
# emit-tail-expr
# si=-12
# env=((f268 . -8) (f258 . 4) (f258 . 0))
# expr=(let ((f270 (make-vector ((primitive-ref list-length) f268)))) ((vector-ref f258 0) f270 0 f268))
# emit-tail-let
#  si   = -12
#  env  = ((f268 . -8) (f258 . 4) (f258 . 0))
#  bindings = ((f270 (make-vector ((primitive-ref list-length) f268))))
#  body = ((vector-ref f258 0) f270 0 f268)
# emit-expr (make-vector ((primitive-ref list-length) f268))
# make-vector ((primitive-ref list-length) f268)
# emit-expr ((primitive-ref list-length) f268)
# funcall
#    si   =-12
#    env  = ((f268 . -8) (f258 . 4) (f258 . 0))
#    expr = (funcall (primitive-ref list-length) f268)
# emit-expr (primitive-ref list-length)
    .extern list$mlength
    movl list$mlength,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_1851"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_1851":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr f268
# emit-variable-ref
# env=((f268 . -8) (f258 . 4) (f258 . 0))
# var=f268
    movl -8(%esp), %eax  # stack load f268
# end emit-variable-ref
    mov %eax, -24(%esp)  # arg f268
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
    je "_L_1852"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1852:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_1853
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1853:
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
# env=((f270 . -12) (f268 . -8) (f258 . 4) (f258 . 0))
# expr=((vector-ref f258 0) f270 0 f268)
# emit-tail-funcall
#    si   =-16
#    env  = ((f270 . -12) (f268 . -8) (f258 . 4) (f258 . 0))
#    expr = (funcall (vector-ref f258 0) f270 0 f268)
# emit-expr (vector-ref f258 0)
# emit-expr f258
# emit-variable-ref
# env=((f270 . -12) (f268 . -8) (f258 . 4) (f258 . 0))
# var=f258
    movl 2(%edi), %eax  # frame load f258
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_1854
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1854:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1855"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1855:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_1857
    cmp  $0,%eax
    jge _L_1856
_L_1857:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1856:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr f270
# emit-variable-ref
# env=((f270 . -12) (f268 . -8) (f258 . 4) (f258 . 0))
# var=f270
    movl -12(%esp), %eax  # stack load f270
# end emit-variable-ref
    mov %eax, -20(%esp)    # arg f270
# emit-expr 0
    movl $0, %eax     # immed 0
    mov %eax, -24(%esp)    # arg 0
# emit-expr f268
# emit-variable-ref
# env=((f270 . -12) (f268 . -8) (f258 . 4) (f258 . 0))
# var=f268
    movl -8(%esp), %eax  # stack load f268
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f268
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
_L_1847:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f258 . 0))
     movl %eax, vector
# == explicit-begins  ==>
# (letrec ((fill-string (lambda (s k args) (if (null? args) s (begin (string-set! s k (car args)) (fill-string s (fxadd1 k) (cdr args))))))) (lambda args (let ((s (make-string (list-length args)))) (fill-string s 0 args))))
# == eliminate-let*  ==>
# (letrec ((fill-string (lambda (s k args) (if (null? args) s (begin (string-set! s k (car args)) (fill-string s (fxadd1 k) (cdr args))))))) (lambda args (let ((s (make-string (list-length args)))) (fill-string s 0 args))))
# == uniquify-variables  ==>
# (letrec ((f271 (lambda (f275 f276 f277) (if (null? f277) f275 (begin (string-set! f275 f276 (car f277)) (f271 f275 (fxadd1 f276) (cdr f277))))))) (lambda f281 (let ((f283 (make-string (list-length f281)))) (f271 f283 0 f281))))
# == vectorize-letrec  ==>
# (let ((f271 (make-vector 1))) (begin (begin (vector-set! f271 0 (lambda (f275 f276 f277) (if (null? f277) f275 (begin (string-set! f275 f276 (car f277)) ((vector-ref f271 0) f275 (fxadd1 f276) (cdr f277))))))) (lambda f281 (let ((f283 (make-string (list-length f281)))) ((vector-ref f271 0) f283 0 f281)))))
# == eliminate-set!  ==>
# (let ((f271 (make-vector 1))) (begin (begin (vector-set! f271 0 (lambda (f275 f276 f277) (let ((f275 f275) (f276 f276) (f277 f277)) (if (null? f277) f275 (begin (string-set! f275 f276 (car f277)) ((vector-ref f271 0) f275 (fxadd1 f276) (cdr f277)))))))) (lambda f281 (let () (let ((f283 (make-string (list-length f281)))) ((vector-ref f271 0) f283 0 f281))))))
# == close-free-variables  ==>
# (let ((f271 (make-vector 1))) (begin (begin (vector-set! f271 0 (closure (f275 f276 f277) (f271) (let ((f275 f275) (f276 f276) (f277 f277)) (if (null? f277) f275 (begin (string-set! f275 f276 (car f277)) ((vector-ref f271 0) f275 (fxadd1 f276) (cdr f277)))))))) (closure f281 (f271) (let () (let ((f283 (make-string (list-length f281)))) ((vector-ref f271 0) f283 0 f281))))))
# == eliminate-quote  ==>
# (let ((f271 (make-vector 1))) (begin (begin (vector-set! f271 0 (closure (f275 f276 f277) (f271) (let ((f275 f275) (f276 f276) (f277 f277)) (if (null? f277) f275 (begin (string-set! f275 f276 (car f277)) ((vector-ref f271 0) f275 (fxadd1 f276) (cdr f277)))))))) (closure f281 (f271) (let () (let ((f283 (make-string (list-length f281)))) ((vector-ref f271 0) f283 0 f281))))))
# == eliminate-when/unless  ==>
# (let ((f271 (make-vector 1))) (begin (begin (vector-set! f271 0 (closure (f275 f276 f277) (f271) (let ((f275 f275) (f276 f276) (f277 f277)) (if (null? f277) f275 (begin (string-set! f275 f276 (car f277)) ((vector-ref f271 0) f275 (fxadd1 f276) (cdr f277)))))))) (closure f281 (f271) (let () (let ((f283 (make-string (list-length f281)))) ((vector-ref f271 0) f283 0 f281))))))
# == eliminate-cond  ==>
# (let ((f271 (make-vector 1))) (begin (begin (vector-set! f271 0 (closure (f275 f276 f277) (f271) (let ((f275 f275) (f276 f276) (f277 f277)) (if (null? f277) f275 (begin (string-set! f275 f276 (car f277)) ((vector-ref f271 0) f275 (fxadd1 f276) (cdr f277)))))))) (closure f281 (f271) (let () (let ((f283 (make-string (list-length f281)))) ((vector-ref f271 0) f283 0 f281))))))
# == external-symbols  ==>
# (let ((f271 (make-vector 1))) (begin (begin (vector-set! f271 0 (closure (f275 f276 f277) (f271) (let ((f275 f275) (f276 f276) (f277 f277)) (if (null? f277) f275 (begin (string-set! f275 f276 (car f277)) ((vector-ref f271 0) f275 (fxadd1 f276) (cdr f277)))))))) (closure f281 (f271) (let () (let ((f283 (make-string ((primitive-ref list-length) f281)))) ((vector-ref f271 0) f283 0 f281))))))
# emit-expr (let ((f271 (make-vector 1))) (begin (begin (vector-set! f271 0 (closure (f275 f276 f277) (f271) (let ((f275 f275) (f276 f276) (f277 f277)) (if (null? f277) f275 (begin (string-set! f275 f276 (car f277)) ((vector-ref f271 0) f275 (fxadd1 f276) (cdr f277)))))))) (closure f281 (f271) (let () (let ((f283 (make-string ((primitive-ref list-length) f281)))) ((vector-ref f271 0) f283 0 f281))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f271 (make-vector 1)))
#  body = (begin (begin (vector-set! f271 0 (closure (f275 f276 f277) (f271) (let ((f275 f275) (f276 f276) (f277 f277)) (if (null? f277) f275 (begin (string-set! f275 f276 (car f277)) ((vector-ref f271 0) f275 (fxadd1 f276) (cdr f277)))))))) (closure f281 (f271) (let () (let ((f283 (make-string ((primitive-ref list-length) f281)))) ((vector-ref f271 0) f283 0 f281)))))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1858"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1858:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_1859
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1859:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f271 0 (closure (f275 f276 f277) (f271) (let ((f275 f275) (f276 f276) (f277 f277)) (if (null? f277) f275 (begin (string-set! f275 f276 (car f277)) ((vector-ref f271 0) f275 (fxadd1 f276) (cdr f277)))))))) (closure f281 (f271) (let () (let ((f283 (make-string ((primitive-ref list-length) f281)))) ((vector-ref f271 0) f283 0 f281)))))
# emit-begin
#   expr=(begin (begin (vector-set! f271 0 (closure (f275 f276 f277) (f271) (let ((f275 f275) (f276 f276) (f277 f277)) (if (null? f277) f275 (begin (string-set! f275 f276 (car f277)) ((vector-ref f271 0) f275 (fxadd1 f276) (cdr f277)))))))) (closure f281 (f271) (let () (let ((f283 (make-string ((primitive-ref list-length) f281)))) ((vector-ref f271 0) f283 0 f281)))))
#   env=((f271 . 0))
# emit-expr (begin (vector-set! f271 0 (closure (f275 f276 f277) (f271) (let ((f275 f275) (f276 f276) (f277 f277)) (if (null? f277) f275 (begin (string-set! f275 f276 (car f277)) ((vector-ref f271 0) f275 (fxadd1 f276) (cdr f277))))))))
# emit-begin
#   expr=(begin (vector-set! f271 0 (closure (f275 f276 f277) (f271) (let ((f275 f275) (f276 f276) (f277 f277)) (if (null? f277) f275 (begin (string-set! f275 f276 (car f277)) ((vector-ref f271 0) f275 (fxadd1 f276) (cdr f277))))))))
#   env=((f271 . 0))
# emit-expr (vector-set! f271 0 (closure (f275 f276 f277) (f271) (let ((f275 f275) (f276 f276) (f277 f277)) (if (null? f277) f275 (begin (string-set! f275 f276 (car f277)) ((vector-ref f271 0) f275 (fxadd1 f276) (cdr f277)))))))
# emit-expr f271
# emit-variable-ref
# env=((f271 . 0))
# var=f271
    movl 0(%esp), %eax  # stack load f271
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_1860
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1860:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1861"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1861:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_1863
    cmp  $0,%eax
    jge _L_1862
_L_1863:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1862:
    movl %eax, -8(%esp)
# emit-expr (closure (f275 f276 f277) (f271) (let ((f275 f275) (f276 f276) (f277 f277)) (if (null? f277) f275 (begin (string-set! f275 f276 (car f277)) ((vector-ref f271 0) f275 (fxadd1 f276) (cdr f277))))))
# emit-closure
# si = -12
# env = ((f271 . 0))
# expr = (closure (f275 f276 f277) (f271) (let ((f275 f275) (f276 f276) (f277 f277)) (if (null? f277) f275 (begin (string-set! f275 f276 (car f277)) ((vector-ref f271 0) f275 (fxadd1 f276) (cdr f277))))))
    movl $_L_1864, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f271 . 0))
# var=f271
    movl 0(%esp), %eax  # stack load f271
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f271
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_1865            # jump around closure body
_L_1864:
# check argument count
    cmp $12,%eax
    je _L_1866
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_1866:
# emit-tail-expr
# si=-20
# env=((f277 . -16) (f276 . -12) (f275 . -8) (f271 . 4) (f271 . 0))
# expr=(let ((f275 f275) (f276 f276) (f277 f277)) (if (null? f277) f275 (begin (string-set! f275 f276 (car f277)) ((vector-ref f271 0) f275 (fxadd1 f276) (cdr f277)))))
# emit-tail-let
#  si   = -20
#  env  = ((f277 . -16) (f276 . -12) (f275 . -8) (f271 . 4) (f271 . 0))
#  bindings = ((f275 f275) (f276 f276) (f277 f277))
#  body = (if (null? f277) f275 (begin (string-set! f275 f276 (car f277)) ((vector-ref f271 0) f275 (fxadd1 f276) (cdr f277))))
# emit-expr f275
# emit-variable-ref
# env=((f277 . -16) (f276 . -12) (f275 . -8) (f271 . 4) (f271 . 0))
# var=f275
    movl -8(%esp), %eax  # stack load f275
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-expr f276
# emit-variable-ref
# env=((f277 . -16) (f276 . -12) (f275 . -8) (f271 . 4) (f271 . 0))
# var=f276
    movl -12(%esp), %eax  # stack load f276
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f277
# emit-variable-ref
# env=((f277 . -16) (f276 . -12) (f275 . -8) (f271 . 4) (f271 . 0))
# var=f277
    movl -16(%esp), %eax  # stack load f277
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-tail-expr
# si=-32
# env=((f277 . -28) (f276 . -24) (f275 . -20) (f277 . -16) (f276 . -12) (f275 . -8) (f271 . 4) (f271 . 0))
# expr=(if (null? f277) f275 (begin (string-set! f275 f276 (car f277)) ((vector-ref f271 0) f275 (fxadd1 f276) (cdr f277))))
# emit-expr (null? f277)
# emit-expr f277
# emit-variable-ref
# env=((f277 . -28) (f276 . -24) (f275 . -20) (f277 . -16) (f276 . -12) (f275 . -8) (f271 . 4) (f271 . 0))
# var=f277
    movl -28(%esp), %eax  # stack load f277
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_1867
# emit-tail-expr
# si=-32
# env=((f277 . -28) (f276 . -24) (f275 . -20) (f277 . -16) (f276 . -12) (f275 . -8) (f271 . 4) (f271 . 0))
# expr=f275
# emit-tail-variable-ref
# emit-variable-ref
# env=((f277 . -28) (f276 . -24) (f275 . -20) (f277 . -16) (f276 . -12) (f275 . -8) (f271 . 4) (f271 . 0))
# var=f275
    movl -20(%esp), %eax  # stack load f275
# end emit-variable-ref
    ret
# end emit-tail-variable ref
    jmp _L_1868
_L_1867:
# emit-tail-expr
# si=-32
# env=((f277 . -28) (f276 . -24) (f275 . -20) (f277 . -16) (f276 . -12) (f275 . -8) (f271 . 4) (f271 . 0))
# expr=(begin (string-set! f275 f276 (car f277)) ((vector-ref f271 0) f275 (fxadd1 f276) (cdr f277)))
# tail-begin (begin (string-set! f275 f276 (car f277)) ((vector-ref f271 0) f275 (fxadd1 f276) (cdr f277)))
#   env=((f277 . -28) (f276 . -24) (f275 . -20) (f277 . -16) (f276 . -12) (f275 . -8) (f271 . 4) (f271 . 0))
# emit-expr (string-set! f275 f276 (car f277))
# emit-expr f275
# emit-variable-ref
# env=((f277 . -28) (f276 . -24) (f275 . -20) (f277 . -16) (f276 . -12) (f275 . -8) (f271 . 4) (f271 . 0))
# var=f275
    movl -20(%esp), %eax  # stack load f275
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_1869
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1869:
    movl %eax, -32(%esp)
# emit-expr f276
# emit-variable-ref
# env=((f277 . -28) (f276 . -24) (f275 . -20) (f277 . -16) (f276 . -12) (f275 . -8) (f271 . 4) (f271 . 0))
# var=f276
    movl -24(%esp), %eax  # stack load f276
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1870"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1870:
# check bounds on string index
    movl -32(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_1872
    cmp  $0,%eax
    jge _L_1871
_L_1872:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1871:
    movl %eax, -36(%esp)
# emit-expr (car f277)
# emit-expr f277
# emit-variable-ref
# env=((f277 . -28) (f276 . -24) (f275 . -20) (f277 . -16) (f276 . -12) (f275 . -8) (f271 . 4) (f271 . 0))
# var=f277
    movl -28(%esp), %eax  # stack load f277
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_1873
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1873:
    movl -1(%eax), %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_1874"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1874:
    movl -32(%esp), %ebx
    movl -36(%esp), %esi
    sar $2, %esi
    movb  %ah, -2(%ebx,%esi)
# emit-tail-expr
# si=-32
# env=((f277 . -28) (f276 . -24) (f275 . -20) (f277 . -16) (f276 . -12) (f275 . -8) (f271 . 4) (f271 . 0))
# expr=(begin ((vector-ref f271 0) f275 (fxadd1 f276) (cdr f277)))
# tail-begin (begin ((vector-ref f271 0) f275 (fxadd1 f276) (cdr f277)))
#   env=((f277 . -28) (f276 . -24) (f275 . -20) (f277 . -16) (f276 . -12) (f275 . -8) (f271 . 4) (f271 . 0))
# emit-tail-expr
# si=-32
# env=((f277 . -28) (f276 . -24) (f275 . -20) (f277 . -16) (f276 . -12) (f275 . -8) (f271 . 4) (f271 . 0))
# expr=((vector-ref f271 0) f275 (fxadd1 f276) (cdr f277))
# emit-tail-funcall
#    si   =-32
#    env  = ((f277 . -28) (f276 . -24) (f275 . -20) (f277 . -16) (f276 . -12) (f275 . -8) (f271 . 4) (f271 . 0))
#    expr = (funcall (vector-ref f271 0) f275 (fxadd1 f276) (cdr f277))
# emit-expr (vector-ref f271 0)
# emit-expr f271
# emit-variable-ref
# env=((f277 . -28) (f276 . -24) (f275 . -20) (f277 . -16) (f276 . -12) (f275 . -8) (f271 . 4) (f271 . 0))
# var=f271
    movl 2(%edi), %eax  # frame load f271
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_1875
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1875:
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1876"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1876:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_1878
    cmp  $0,%eax
    jge _L_1877
_L_1878:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1877:
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -32(%esp)  # stash funcall-oper in next closure slot
# emit-expr f275
# emit-variable-ref
# env=((f277 . -28) (f276 . -24) (f275 . -20) (f277 . -16) (f276 . -12) (f275 . -8) (f271 . 4) (f271 . 0))
# var=f275
    movl -20(%esp), %eax  # stack load f275
# end emit-variable-ref
    mov %eax, -36(%esp)    # arg f275
# emit-expr (fxadd1 f276)
# emit-expr f276
# emit-variable-ref
# env=((f277 . -28) (f276 . -24) (f275 . -20) (f277 . -16) (f276 . -12) (f275 . -8) (f271 . 4) (f271 . 0))
# var=f276
    movl -24(%esp), %eax  # stack load f276
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1879"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $48,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1879:
     addl $4, %eax
    mov %eax, -40(%esp)    # arg (fxadd1 f276)
# emit-expr (cdr f277)
# emit-expr f277
# emit-variable-ref
# env=((f277 . -28) (f276 . -24) (f275 . -20) (f277 . -16) (f276 . -12) (f275 . -8) (f271 . 4) (f271 . 0))
# var=f277
    movl -28(%esp), %eax  # stack load f277
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_1880
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1880:
    movl 3(%eax), %eax
    mov %eax, -44(%esp)    # arg (cdr f277)
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
_L_1868:
    .align 4,0x90
_L_1865:
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f271 . 0))
# emit-expr (begin (closure f281 (f271) (let () (let ((f283 (make-string ((primitive-ref list-length) f281)))) ((vector-ref f271 0) f283 0 f281)))))
# emit-begin
#   expr=(begin (closure f281 (f271) (let () (let ((f283 (make-string ((primitive-ref list-length) f281)))) ((vector-ref f271 0) f283 0 f281)))))
#   env=((f271 . 0))
# emit-expr (closure f281 (f271) (let () (let ((f283 (make-string ((primitive-ref list-length) f281)))) ((vector-ref f271 0) f283 0 f281))))
# emit-closure
# si = -4
# env = ((f271 . 0))
# expr = (closure f281 (f271) (let () (let ((f283 (make-string ((primitive-ref list-length) f281)))) ((vector-ref f271 0) f283 0 f281))))
    movl $_L_1881, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f271 . 0))
# var=f271
    movl 0(%esp), %eax  # stack load f271
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f271
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_1882            # jump around closure body
_L_1881:
# check argument count
    cmp $0,%eax
    jge _L_1883
# invoke error handler eh_argcount_min
    .extern eh$uargcount$umin
    movl eh$uargcount$umin, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_1883:
# emit-build-varargs-list
    movl $63, %esi       # args <- () 
    lea -4(%esp),%edi    # edi <- esp-4
    subl %eax, %edi      # edi <- esp-4-eax    addr of arg[K+N] on stack
_L_1885:
    lea -4(%esp),%ebx    # addr of arg[K] on stack
    cmp %edi, %ebx       # while edi <> esp+(si+4)
    je _L_1884
    movl (%edi),%ebx     # arg i -> car
    movl %ebx, 0(%ebp)
    movl %esi, 4(%ebp)  # esi -> cdr
    movl %ebp, %esi
    addl $1, %esi       # tag as pair
    addl $8,%ebp         # bump heap ptr
    addl $4,%edi         # move to next previous arg from the end
    jmp _L_1885
_L_1884:
    movl %esi, -8(%esp)  # set args
# emit-tail-expr
# si=-12
# env=((f281 . -8) (f271 . 4) (f271 . 0))
# expr=(let () (let ((f283 (make-string ((primitive-ref list-length) f281)))) ((vector-ref f271 0) f283 0 f281)))
# emit-tail-let
#  si   = -12
#  env  = ((f281 . -8) (f271 . 4) (f271 . 0))
#  bindings = ()
#  body = (let ((f283 (make-string ((primitive-ref list-length) f281)))) ((vector-ref f271 0) f283 0 f281))
# emit-tail-expr
# si=-12
# env=((f281 . -8) (f271 . 4) (f271 . 0))
# expr=(let ((f283 (make-string ((primitive-ref list-length) f281)))) ((vector-ref f271 0) f283 0 f281))
# emit-tail-let
#  si   = -12
#  env  = ((f281 . -8) (f271 . 4) (f271 . 0))
#  bindings = ((f283 (make-string ((primitive-ref list-length) f281))))
#  body = ((vector-ref f271 0) f283 0 f281)
# emit-expr (make-string ((primitive-ref list-length) f281))
# make-string len=((primitive-ref list-length) f281)
# emit-expr ((primitive-ref list-length) f281)
# funcall
#    si   =-12
#    env  = ((f281 . -8) (f271 . 4) (f271 . 0))
#    expr = (funcall (primitive-ref list-length) f281)
# emit-expr (primitive-ref list-length)
    .extern list$mlength
    movl list$mlength,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_1886"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_1886":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr f281
# emit-variable-ref
# env=((f281 . -8) (f271 . 4) (f271 . 0))
# var=f281
    movl -8(%esp), %eax  # stack load f281
# end emit-variable-ref
    mov %eax, -24(%esp)  # arg f281
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
    je "_L_1887"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1887:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_1888
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1888:
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
# env=((f283 . -12) (f281 . -8) (f271 . 4) (f271 . 0))
# expr=((vector-ref f271 0) f283 0 f281)
# emit-tail-funcall
#    si   =-16
#    env  = ((f283 . -12) (f281 . -8) (f271 . 4) (f271 . 0))
#    expr = (funcall (vector-ref f271 0) f283 0 f281)
# emit-expr (vector-ref f271 0)
# emit-expr f271
# emit-variable-ref
# env=((f283 . -12) (f281 . -8) (f271 . 4) (f271 . 0))
# var=f271
    movl 2(%edi), %eax  # frame load f271
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_1889
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1889:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1890"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1890:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_1892
    cmp  $0,%eax
    jge _L_1891
_L_1892:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1891:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr f283
# emit-variable-ref
# env=((f283 . -12) (f281 . -8) (f271 . 4) (f271 . 0))
# var=f283
    movl -12(%esp), %eax  # stack load f283
# end emit-variable-ref
    mov %eax, -20(%esp)    # arg f283
# emit-expr 0
    movl $0, %eax     # immed 0
    mov %eax, -24(%esp)    # arg 0
# emit-expr f281
# emit-variable-ref
# env=((f283 . -12) (f281 . -8) (f271 . 4) (f271 . 0))
# var=f281
    movl -8(%esp), %eax  # stack load f281
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f281
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
_L_1882:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f271 . 0))
     movl %eax, string
# == explicit-begins  ==>
# (let* ((write-stderr (lambda (s) (foreign-call "s_write" 2 s (string-length s)))) (write-errmsg (lambda (sym emsg) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))))) (lambda (sym emsg) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))
# == eliminate-let*  ==>
# (let ((write-stderr (lambda (s) (foreign-call "s_write" 2 s (string-length s))))) (let ((write-errmsg (lambda (sym emsg) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))))) (lambda (sym emsg) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1)))))
# == uniquify-variables  ==>
# (let ((f284 (lambda (f285) (foreign-call "s_write" 2 f285 (string-length f285))))) (let ((f293 (lambda (f294 f295) (begin (f284 "error:") (f284 (symbol->string f294)) (f284 ": ") (f284 f295) (f284 "\n"))))) (lambda (f298 f299) (begin (f293 f298 f299) (foreign-call "s_exit" 1)))))
# == vectorize-letrec  ==>
# (let ((f284 (lambda (f285) (foreign-call "s_write" 2 f285 (string-length f285))))) (let ((f293 (lambda (f294 f295) (begin (f284 "error:") (f284 (symbol->string f294)) (f284 ": ") (f284 f295) (f284 "\n"))))) (lambda (f298 f299) (begin (f293 f298 f299) (foreign-call "s_exit" 1)))))
# == eliminate-set!  ==>
# (let ((f284 (lambda (f285) (let ((f285 f285)) (foreign-call "s_write" 2 f285 (string-length f285)))))) (let ((f293 (lambda (f294 f295) (let ((f294 f294) (f295 f295)) (begin (f284 "error:") (f284 (symbol->string f294)) (f284 ": ") (f284 f295) (f284 "\n")))))) (lambda (f298 f299) (let ((f298 f298) (f299 f299)) (begin (f293 f298 f299) (foreign-call "s_exit" 1))))))
# == close-free-variables  ==>
# (let ((f284 (closure (f285) () (let ((f285 f285)) (foreign-call "s_write" 2 f285 (string-length f285)))))) (let ((f293 (closure (f294 f295) (f284 f284 f284 f284 f284) (let ((f294 f294) (f295 f295)) (begin (f284 "error:") (f284 (symbol->string f294)) (f284 ": ") (f284 f295) (f284 "\n")))))) (closure (f298 f299) (f293) (let ((f298 f298) (f299 f299)) (begin (f293 f298 f299) (foreign-call "s_exit" 1))))))
# == eliminate-quote  ==>
# (let ((f284 (closure (f285) () (let ((f285 f285)) (foreign-call "s_write" 2 f285 (string-length f285)))))) (let ((f293 (closure (f294 f295) (f284 f284 f284 f284 f284) (let ((f294 f294) (f295 f295)) (begin (f284 "error:") (f284 (symbol->string f294)) (f284 ": ") (f284 f295) (f284 "\n")))))) (closure (f298 f299) (f293) (let ((f298 f298) (f299 f299)) (begin (f293 f298 f299) (foreign-call "s_exit" 1))))))
# == eliminate-when/unless  ==>
# (let ((f284 (closure (f285) () (let ((f285 f285)) (foreign-call "s_write" 2 f285 (string-length f285)))))) (let ((f293 (closure (f294 f295) (f284 f284 f284 f284 f284) (let ((f294 f294) (f295 f295)) (begin (f284 "error:") (f284 (symbol->string f294)) (f284 ": ") (f284 f295) (f284 "\n")))))) (closure (f298 f299) (f293) (let ((f298 f298) (f299 f299)) (begin (f293 f298 f299) (foreign-call "s_exit" 1))))))
# == eliminate-cond  ==>
# (let ((f284 (closure (f285) () (let ((f285 f285)) (foreign-call "s_write" 2 f285 (string-length f285)))))) (let ((f293 (closure (f294 f295) (f284 f284 f284 f284 f284) (let ((f294 f294) (f295 f295)) (begin (f284 "error:") (f284 (symbol->string f294)) (f284 ": ") (f284 f295) (f284 "\n")))))) (closure (f298 f299) (f293) (let ((f298 f298) (f299 f299)) (begin (f293 f298 f299) (foreign-call "s_exit" 1))))))
# == external-symbols  ==>
# (let ((f284 (closure (f285) () (let ((f285 f285)) (foreign-call "s_write" 2 f285 (string-length f285)))))) (let ((f293 (closure (f294 f295) (f284 f284 f284 f284 f284) (let ((f294 f294) (f295 f295)) (begin (f284 "error:") (f284 (symbol->string f294)) (f284 ": ") (f284 f295) (f284 "\n")))))) (closure (f298 f299) (f293) (let ((f298 f298) (f299 f299)) (begin (f293 f298 f299) (foreign-call "s_exit" 1))))))
# emit-expr (let ((f284 (closure (f285) () (let ((f285 f285)) (foreign-call "s_write" 2 f285 (string-length f285)))))) (let ((f293 (closure (f294 f295) (f284 f284 f284 f284 f284) (let ((f294 f294) (f295 f295)) (begin (f284 "error:") (f284 (symbol->string f294)) (f284 ": ") (f284 f295) (f284 "\n")))))) (closure (f298 f299) (f293) (let ((f298 f298) (f299 f299)) (begin (f293 f298 f299) (foreign-call "s_exit" 1))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f284 (closure (f285) () (let ((f285 f285)) (foreign-call "s_write" 2 f285 (string-length f285))))))
#  body = (let ((f293 (closure (f294 f295) (f284 f284 f284 f284 f284) (let ((f294 f294) (f295 f295)) (begin (f284 "error:") (f284 (symbol->string f294)) (f284 ": ") (f284 f295) (f284 "\n")))))) (closure (f298 f299) (f293) (let ((f298 f298) (f299 f299)) (begin (f293 f298 f299) (foreign-call "s_exit" 1)))))
# emit-expr (closure (f285) () (let ((f285 f285)) (foreign-call "s_write" 2 f285 (string-length f285))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f285) () (let ((f285 f285)) (foreign-call "s_write" 2 f285 (string-length f285))))
    movl $_L_1893, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_1894            # jump around closure body
_L_1893:
# check argument count
    cmp $4,%eax
    je _L_1895
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_1895:
# emit-tail-expr
# si=-12
# env=((f285 . -8))
# expr=(let ((f285 f285)) (foreign-call "s_write" 2 f285 (string-length f285)))
# emit-tail-let
#  si   = -12
#  env  = ((f285 . -8))
#  bindings = ((f285 f285))
#  body = (foreign-call "s_write" 2 f285 (string-length f285))
# emit-expr f285
# emit-variable-ref
# env=((f285 . -8))
# var=f285
    movl -8(%esp), %eax  # stack load f285
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f285 . -12) (f285 . -8))
# expr=(foreign-call "s_write" 2 f285 (string-length f285))
    movl %ecx,-16(%esp)
    movl %esp,-20(%esp)
# emit-expr (string-length f285)
# emit-expr f285
# emit-variable-ref
# env=((f285 . -12) (f285 . -8))
# var=f285
    movl -12(%esp), %eax  # stack load f285
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_1896
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1896:
    movl -6(%eax), %eax
    movl %eax, -24(%esp)
# emit-expr f285
# emit-variable-ref
# env=((f285 . -12) (f285 . -8))
# var=f285
    movl -12(%esp), %eax  # stack load f285
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
_L_1894:
    movl %eax, 0(%esp)  # stack save
# emit-expr (let ((f293 (closure (f294 f295) (f284 f284 f284 f284 f284) (let ((f294 f294) (f295 f295)) (begin (f284 "error:") (f284 (symbol->string f294)) (f284 ": ") (f284 f295) (f284 "\n")))))) (closure (f298 f299) (f293) (let ((f298 f298) (f299 f299)) (begin (f293 f298 f299) (foreign-call "s_exit" 1)))))
# emit-let
#  si   = -4
#  env  = ((f284 . 0))
#  bindings = ((f293 (closure (f294 f295) (f284 f284 f284 f284 f284) (let ((f294 f294) (f295 f295)) (begin (f284 "error:") (f284 (symbol->string f294)) (f284 ": ") (f284 f295) (f284 "\n"))))))
#  body = (closure (f298 f299) (f293) (let ((f298 f298) (f299 f299)) (begin (f293 f298 f299) (foreign-call "s_exit" 1))))
# emit-expr (closure (f294 f295) (f284 f284 f284 f284 f284) (let ((f294 f294) (f295 f295)) (begin (f284 "error:") (f284 (symbol->string f294)) (f284 ": ") (f284 f295) (f284 "\n"))))
# emit-closure
# si = -4
# env = ((f284 . 0))
# expr = (closure (f294 f295) (f284 f284 f284 f284 f284) (let ((f294 f294) (f295 f295)) (begin (f284 "error:") (f284 (symbol->string f294)) (f284 ": ") (f284 f295) (f284 "\n"))))
    movl $_L_1897, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f284 . 0))
# var=f284
    movl 0(%esp), %eax  # stack load f284
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f284
# emit-variable-ref
# env=((f284 . 0))
# var=f284
    movl 0(%esp), %eax  # stack load f284
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f284
# emit-variable-ref
# env=((f284 . 0))
# var=f284
    movl 0(%esp), %eax  # stack load f284
# end emit-variable-ref
   movl  %eax, 12(%ebp)  # f284
# emit-variable-ref
# env=((f284 . 0))
# var=f284
    movl 0(%esp), %eax  # stack load f284
# end emit-variable-ref
   movl  %eax, 16(%ebp)  # f284
# emit-variable-ref
# env=((f284 . 0))
# var=f284
    movl 0(%esp), %eax  # stack load f284
# end emit-variable-ref
   movl  %eax, 20(%ebp)  # f284
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $24, %ebp     # bump ebp
    jmp _L_1898            # jump around closure body
_L_1897:
# check argument count
    cmp $8,%eax
    je _L_1899
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_1899:
# emit-tail-expr
# si=-16
# env=((f295 . -12) (f294 . -8) (f284 . 20) (f284 . 16) (f284 . 12) (f284 . 8) (f284 . 4) (f284 . 0))
# expr=(let ((f294 f294) (f295 f295)) (begin (f284 "error:") (f284 (symbol->string f294)) (f284 ": ") (f284 f295) (f284 "\n")))
# emit-tail-let
#  si   = -16
#  env  = ((f295 . -12) (f294 . -8) (f284 . 20) (f284 . 16) (f284 . 12) (f284 . 8) (f284 . 4) (f284 . 0))
#  bindings = ((f294 f294) (f295 f295))
#  body = (begin (f284 "error:") (f284 (symbol->string f294)) (f284 ": ") (f284 f295) (f284 "\n"))
# emit-expr f294
# emit-variable-ref
# env=((f295 . -12) (f294 . -8) (f284 . 20) (f284 . 16) (f284 . 12) (f284 . 8) (f284 . 4) (f284 . 0))
# var=f294
    movl -8(%esp), %eax  # stack load f294
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f295
# emit-variable-ref
# env=((f295 . -12) (f294 . -8) (f284 . 20) (f284 . 16) (f284 . 12) (f284 . 8) (f284 . 4) (f284 . 0))
# var=f295
    movl -12(%esp), %eax  # stack load f295
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f295 . -20) (f294 . -16) (f295 . -12) (f294 . -8) (f284 . 20) (f284 . 16) (f284 . 12) (f284 . 8) (f284 . 4) (f284 . 0))
# expr=(begin (f284 "error:") (f284 (symbol->string f294)) (f284 ": ") (f284 f295) (f284 "\n"))
# tail-begin (begin (f284 "error:") (f284 (symbol->string f294)) (f284 ": ") (f284 f295) (f284 "\n"))
#   env=((f295 . -20) (f294 . -16) (f295 . -12) (f294 . -8) (f284 . 20) (f284 . 16) (f284 . 12) (f284 . 8) (f284 . 4) (f284 . 0))
# emit-expr (f284 "error:")
# funcall
#    si   =-24
#    env  = ((f295 . -20) (f294 . -16) (f295 . -12) (f294 . -8) (f284 . 20) (f284 . 16) (f284 . 12) (f284 . 8) (f284 . 4) (f284 . 0))
#    expr = (funcall f284 "error:")
# emit-expr f284
# emit-variable-ref
# env=((f295 . -20) (f294 . -16) (f295 . -12) (f294 . -8) (f284 . 20) (f284 . 16) (f284 . 12) (f284 . 8) (f284 . 4) (f284 . 0))
# var=f284
    movl 18(%edi), %eax  # frame load f284
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_1900"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_1900":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr "error:"
# string literal
    jmp _L_1902
    .align 8,0x90
_L_1901 :
    .int 24
    .ascii "error:"
_L_1902:
    movl $_L_1901, %eax
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
# env=((f295 . -20) (f294 . -16) (f295 . -12) (f294 . -8) (f284 . 20) (f284 . 16) (f284 . 12) (f284 . 8) (f284 . 4) (f284 . 0))
# expr=(begin (f284 (symbol->string f294)) (f284 ": ") (f284 f295) (f284 "\n"))
# tail-begin (begin (f284 (symbol->string f294)) (f284 ": ") (f284 f295) (f284 "\n"))
#   env=((f295 . -20) (f294 . -16) (f295 . -12) (f294 . -8) (f284 . 20) (f284 . 16) (f284 . 12) (f284 . 8) (f284 . 4) (f284 . 0))
# emit-expr (f284 (symbol->string f294))
# funcall
#    si   =-24
#    env  = ((f295 . -20) (f294 . -16) (f295 . -12) (f294 . -8) (f284 . 20) (f284 . 16) (f284 . 12) (f284 . 8) (f284 . 4) (f284 . 0))
#    expr = (funcall f284 (symbol->string f294))
# emit-expr f284
# emit-variable-ref
# env=((f295 . -20) (f294 . -16) (f295 . -12) (f294 . -8) (f284 . 20) (f284 . 16) (f284 . 12) (f284 . 8) (f284 . 4) (f284 . 0))
# var=f284
    movl 18(%edi), %eax  # frame load f284
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_1903"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_1903":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr (symbol->string f294)
# symbol->string f294
# emit-expr f294
# emit-variable-ref
# env=((f295 . -20) (f294 . -16) (f295 . -12) (f294 . -8) (f284 . 20) (f284 . 16) (f284 . 12) (f284 . 8) (f284 . 4) (f284 . 0))
# var=f294
    movl -16(%esp), %eax  # stack load f294
# end emit-variable-ref
    movl -3(%eax), %eax
    mov %eax, -36(%esp)  # arg (symbol->string f294)
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((f295 . -20) (f294 . -16) (f295 . -12) (f294 . -8) (f284 . 20) (f284 . 16) (f284 . 12) (f284 . 8) (f284 . 4) (f284 . 0))
# expr=(begin (f284 ": ") (f284 f295) (f284 "\n"))
# tail-begin (begin (f284 ": ") (f284 f295) (f284 "\n"))
#   env=((f295 . -20) (f294 . -16) (f295 . -12) (f294 . -8) (f284 . 20) (f284 . 16) (f284 . 12) (f284 . 8) (f284 . 4) (f284 . 0))
# emit-expr (f284 ": ")
# funcall
#    si   =-24
#    env  = ((f295 . -20) (f294 . -16) (f295 . -12) (f294 . -8) (f284 . 20) (f284 . 16) (f284 . 12) (f284 . 8) (f284 . 4) (f284 . 0))
#    expr = (funcall f284 ": ")
# emit-expr f284
# emit-variable-ref
# env=((f295 . -20) (f294 . -16) (f295 . -12) (f294 . -8) (f284 . 20) (f284 . 16) (f284 . 12) (f284 . 8) (f284 . 4) (f284 . 0))
# var=f284
    movl 18(%edi), %eax  # frame load f284
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_1904"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_1904":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr ": "
# string literal
    jmp _L_1906
    .align 8,0x90
_L_1905 :
    .int 8
    .ascii ": "
_L_1906:
    movl $_L_1905, %eax
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
# env=((f295 . -20) (f294 . -16) (f295 . -12) (f294 . -8) (f284 . 20) (f284 . 16) (f284 . 12) (f284 . 8) (f284 . 4) (f284 . 0))
# expr=(begin (f284 f295) (f284 "\n"))
# tail-begin (begin (f284 f295) (f284 "\n"))
#   env=((f295 . -20) (f294 . -16) (f295 . -12) (f294 . -8) (f284 . 20) (f284 . 16) (f284 . 12) (f284 . 8) (f284 . 4) (f284 . 0))
# emit-expr (f284 f295)
# funcall
#    si   =-24
#    env  = ((f295 . -20) (f294 . -16) (f295 . -12) (f294 . -8) (f284 . 20) (f284 . 16) (f284 . 12) (f284 . 8) (f284 . 4) (f284 . 0))
#    expr = (funcall f284 f295)
# emit-expr f284
# emit-variable-ref
# env=((f295 . -20) (f294 . -16) (f295 . -12) (f294 . -8) (f284 . 20) (f284 . 16) (f284 . 12) (f284 . 8) (f284 . 4) (f284 . 0))
# var=f284
    movl 18(%edi), %eax  # frame load f284
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_1907"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_1907":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f295
# emit-variable-ref
# env=((f295 . -20) (f294 . -16) (f295 . -12) (f294 . -8) (f284 . 20) (f284 . 16) (f284 . 12) (f284 . 8) (f284 . 4) (f284 . 0))
# var=f295
    movl -20(%esp), %eax  # stack load f295
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f295
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((f295 . -20) (f294 . -16) (f295 . -12) (f294 . -8) (f284 . 20) (f284 . 16) (f284 . 12) (f284 . 8) (f284 . 4) (f284 . 0))
# expr=(begin (f284 "\n"))
# tail-begin (begin (f284 "\n"))
#   env=((f295 . -20) (f294 . -16) (f295 . -12) (f294 . -8) (f284 . 20) (f284 . 16) (f284 . 12) (f284 . 8) (f284 . 4) (f284 . 0))
# emit-tail-expr
# si=-24
# env=((f295 . -20) (f294 . -16) (f295 . -12) (f294 . -8) (f284 . 20) (f284 . 16) (f284 . 12) (f284 . 8) (f284 . 4) (f284 . 0))
# expr=(f284 "\n")
# emit-tail-funcall
#    si   =-24
#    env  = ((f295 . -20) (f294 . -16) (f295 . -12) (f294 . -8) (f284 . 20) (f284 . 16) (f284 . 12) (f284 . 8) (f284 . 4) (f284 . 0))
#    expr = (funcall f284 "\n")
# emit-expr f284
# emit-variable-ref
# env=((f295 . -20) (f294 . -16) (f295 . -12) (f294 . -8) (f284 . 20) (f284 . 16) (f284 . 12) (f284 . 8) (f284 . 4) (f284 . 0))
# var=f284
    movl 18(%edi), %eax  # frame load f284
# end emit-variable-ref
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr "\n"
# string literal
    jmp _L_1909
    .align 8,0x90
_L_1908 :
    .int 4
    .ascii "\n"
_L_1909:
    movl $_L_1908, %eax
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
_L_1898:
    movl %eax, -4(%esp)  # stack save
# emit-expr (closure (f298 f299) (f293) (let ((f298 f298) (f299 f299)) (begin (f293 f298 f299) (foreign-call "s_exit" 1))))
# emit-closure
# si = -8
# env = ((f293 . -4) (f284 . 0))
# expr = (closure (f298 f299) (f293) (let ((f298 f298) (f299 f299)) (begin (f293 f298 f299) (foreign-call "s_exit" 1))))
    movl $_L_1910, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f293 . -4) (f284 . 0))
# var=f293
    movl -4(%esp), %eax  # stack load f293
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f293
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_1911            # jump around closure body
_L_1910:
# check argument count
    cmp $8,%eax
    je _L_1912
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_1912:
# emit-tail-expr
# si=-16
# env=((f299 . -12) (f298 . -8) (f293 . 4) (f293 . -4) (f284 . 0))
# expr=(let ((f298 f298) (f299 f299)) (begin (f293 f298 f299) (foreign-call "s_exit" 1)))
# emit-tail-let
#  si   = -16
#  env  = ((f299 . -12) (f298 . -8) (f293 . 4) (f293 . -4) (f284 . 0))
#  bindings = ((f298 f298) (f299 f299))
#  body = (begin (f293 f298 f299) (foreign-call "s_exit" 1))
# emit-expr f298
# emit-variable-ref
# env=((f299 . -12) (f298 . -8) (f293 . 4) (f293 . -4) (f284 . 0))
# var=f298
    movl -8(%esp), %eax  # stack load f298
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f299
# emit-variable-ref
# env=((f299 . -12) (f298 . -8) (f293 . 4) (f293 . -4) (f284 . 0))
# var=f299
    movl -12(%esp), %eax  # stack load f299
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f299 . -20) (f298 . -16) (f299 . -12) (f298 . -8) (f293 . 4) (f293 . -4) (f284 . 0))
# expr=(begin (f293 f298 f299) (foreign-call "s_exit" 1))
# tail-begin (begin (f293 f298 f299) (foreign-call "s_exit" 1))
#   env=((f299 . -20) (f298 . -16) (f299 . -12) (f298 . -8) (f293 . 4) (f293 . -4) (f284 . 0))
# emit-expr (f293 f298 f299)
# funcall
#    si   =-24
#    env  = ((f299 . -20) (f298 . -16) (f299 . -12) (f298 . -8) (f293 . 4) (f293 . -4) (f284 . 0))
#    expr = (funcall f293 f298 f299)
# emit-expr f293
# emit-variable-ref
# env=((f299 . -20) (f298 . -16) (f299 . -12) (f298 . -8) (f293 . 4) (f293 . -4) (f284 . 0))
# var=f293
    movl 2(%edi), %eax  # frame load f293
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_1913"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_1913":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f298
# emit-variable-ref
# env=((f299 . -20) (f298 . -16) (f299 . -12) (f298 . -8) (f293 . 4) (f293 . -4) (f284 . 0))
# var=f298
    movl -16(%esp), %eax  # stack load f298
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f298
# emit-expr f299
# emit-variable-ref
# env=((f299 . -20) (f298 . -16) (f299 . -12) (f298 . -8) (f293 . 4) (f293 . -4) (f284 . 0))
# var=f299
    movl -20(%esp), %eax  # stack load f299
# end emit-variable-ref
    mov %eax, -40(%esp)  # arg f299
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((f299 . -20) (f298 . -16) (f299 . -12) (f298 . -8) (f293 . 4) (f293 . -4) (f284 . 0))
# expr=(begin (foreign-call "s_exit" 1))
# tail-begin (begin (foreign-call "s_exit" 1))
#   env=((f299 . -20) (f298 . -16) (f299 . -12) (f298 . -8) (f293 . 4) (f293 . -4) (f284 . 0))
# emit-tail-expr
# si=-24
# env=((f299 . -20) (f298 . -16) (f299 . -12) (f298 . -8) (f293 . 4) (f293 . -4) (f284 . 0))
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
_L_1911:
     movl %eax, error
# == explicit-begins  ==>
# (let ((p (quote ()))) (begin (set! p (cons (quote procedure?) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote symbol-value) p)) (set! p (cons (quote symbol->string) p)) (set! p (cons (quote make-symbol) p)) (set! p (cons (quote symbol?) p)) (set! p (cons (quote string-set!) p)) (set! p (cons (quote string-ref) p)) (set! p (cons (quote string-length) p)) (set! p (cons (quote string?) p)) (set! p (cons (quote make-string) p)) (set! p (cons (quote vector-ref) p)) (set! p (cons (quote vector-set!) p)) (set! p (cons (quote vector-length) p)) (set! p (cons (quote make-vector) p)) (set! p (cons (quote vector?) p)) (set! p (cons (quote set-cdr!) p)) (set! p (cons (quote set-car!) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote cons) p)) (set! p (cons (quote pair?) p)) (set! p (cons (quote fx*) p)) (set! p (cons (quote fx-) p)) (set! p (cons (quote fx+) p)) (set! p (cons (quote fx>=) p)) (set! p (cons (quote fx>) p)) (set! p (cons (quote fx<=) p)) (set! p (cons (quote fx<) p)) (set! p (cons (quote fx=) p)) (set! p (cons (quote fxzero?) p)) (set! p (cons (quote fxsub1) p)) (set! p (cons (quote fxadd1) p)) (set! p (cons (quote fxlogor) p)) (set! p (cons (quote fxlogand) p)) (set! p (cons (quote fxlognot) p)) (set! p (cons (quote char=?) p)) (set! p (cons (quote eq?) p)) (set! p (cons (quote not) p)) (set! p (cons (quote boolean?) p)) (set! p (cons (quote fixnum?) p)) (set! p (cons (quote char?) p)) (set! p (cons (quote null?) p)) (set! p (cons (quote char->fixnum) p)) (set! p (cons (quote fixnum->char) p)) (lambda () p)))
# == eliminate-let*  ==>
# (let ((p (quote ()))) (begin (set! p (cons (quote procedure?) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote symbol-value) p)) (set! p (cons (quote symbol->string) p)) (set! p (cons (quote make-symbol) p)) (set! p (cons (quote symbol?) p)) (set! p (cons (quote string-set!) p)) (set! p (cons (quote string-ref) p)) (set! p (cons (quote string-length) p)) (set! p (cons (quote string?) p)) (set! p (cons (quote make-string) p)) (set! p (cons (quote vector-ref) p)) (set! p (cons (quote vector-set!) p)) (set! p (cons (quote vector-length) p)) (set! p (cons (quote make-vector) p)) (set! p (cons (quote vector?) p)) (set! p (cons (quote set-cdr!) p)) (set! p (cons (quote set-car!) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote cons) p)) (set! p (cons (quote pair?) p)) (set! p (cons (quote fx*) p)) (set! p (cons (quote fx-) p)) (set! p (cons (quote fx+) p)) (set! p (cons (quote fx>=) p)) (set! p (cons (quote fx>) p)) (set! p (cons (quote fx<=) p)) (set! p (cons (quote fx<) p)) (set! p (cons (quote fx=) p)) (set! p (cons (quote fxzero?) p)) (set! p (cons (quote fxsub1) p)) (set! p (cons (quote fxadd1) p)) (set! p (cons (quote fxlogor) p)) (set! p (cons (quote fxlogand) p)) (set! p (cons (quote fxlognot) p)) (set! p (cons (quote char=?) p)) (set! p (cons (quote eq?) p)) (set! p (cons (quote not) p)) (set! p (cons (quote boolean?) p)) (set! p (cons (quote fixnum?) p)) (set! p (cons (quote char?) p)) (set! p (cons (quote null?) p)) (set! p (cons (quote char->fixnum) p)) (set! p (cons (quote fixnum->char) p)) (lambda () p)))
# == uniquify-variables  ==>
# (let ((f300 (quote ()))) (begin (set! f300 (cons (quote procedure?) f300)) (set! f300 (cons (quote cdr) f300)) (set! f300 (cons (quote car) f300)) (set! f300 (cons (quote symbol-value) f300)) (set! f300 (cons (quote symbol->string) f300)) (set! f300 (cons (quote make-symbol) f300)) (set! f300 (cons (quote symbol?) f300)) (set! f300 (cons (quote string-set!) f300)) (set! f300 (cons (quote string-ref) f300)) (set! f300 (cons (quote string-length) f300)) (set! f300 (cons (quote string?) f300)) (set! f300 (cons (quote make-string) f300)) (set! f300 (cons (quote vector-ref) f300)) (set! f300 (cons (quote vector-set!) f300)) (set! f300 (cons (quote vector-length) f300)) (set! f300 (cons (quote make-vector) f300)) (set! f300 (cons (quote vector?) f300)) (set! f300 (cons (quote set-cdr!) f300)) (set! f300 (cons (quote set-car!) f300)) (set! f300 (cons (quote cdr) f300)) (set! f300 (cons (quote car) f300)) (set! f300 (cons (quote cons) f300)) (set! f300 (cons (quote pair?) f300)) (set! f300 (cons (quote fx*) f300)) (set! f300 (cons (quote fx-) f300)) (set! f300 (cons (quote fx+) f300)) (set! f300 (cons (quote fx>=) f300)) (set! f300 (cons (quote fx>) f300)) (set! f300 (cons (quote fx<=) f300)) (set! f300 (cons (quote fx<) f300)) (set! f300 (cons (quote fx=) f300)) (set! f300 (cons (quote fxzero?) f300)) (set! f300 (cons (quote fxsub1) f300)) (set! f300 (cons (quote fxadd1) f300)) (set! f300 (cons (quote fxlogor) f300)) (set! f300 (cons (quote fxlogand) f300)) (set! f300 (cons (quote fxlognot) f300)) (set! f300 (cons (quote char=?) f300)) (set! f300 (cons (quote eq?) f300)) (set! f300 (cons (quote not) f300)) (set! f300 (cons (quote boolean?) f300)) (set! f300 (cons (quote fixnum?) f300)) (set! f300 (cons (quote char?) f300)) (set! f300 (cons (quote null?) f300)) (set! f300 (cons (quote char->fixnum) f300)) (set! f300 (cons (quote fixnum->char) f300)) (lambda () f300)))
# == vectorize-letrec  ==>
# (let ((f300 (quote ()))) (begin (set! f300 (cons (quote procedure?) f300)) (set! f300 (cons (quote cdr) f300)) (set! f300 (cons (quote car) f300)) (set! f300 (cons (quote symbol-value) f300)) (set! f300 (cons (quote symbol->string) f300)) (set! f300 (cons (quote make-symbol) f300)) (set! f300 (cons (quote symbol?) f300)) (set! f300 (cons (quote string-set!) f300)) (set! f300 (cons (quote string-ref) f300)) (set! f300 (cons (quote string-length) f300)) (set! f300 (cons (quote string?) f300)) (set! f300 (cons (quote make-string) f300)) (set! f300 (cons (quote vector-ref) f300)) (set! f300 (cons (quote vector-set!) f300)) (set! f300 (cons (quote vector-length) f300)) (set! f300 (cons (quote make-vector) f300)) (set! f300 (cons (quote vector?) f300)) (set! f300 (cons (quote set-cdr!) f300)) (set! f300 (cons (quote set-car!) f300)) (set! f300 (cons (quote cdr) f300)) (set! f300 (cons (quote car) f300)) (set! f300 (cons (quote cons) f300)) (set! f300 (cons (quote pair?) f300)) (set! f300 (cons (quote fx*) f300)) (set! f300 (cons (quote fx-) f300)) (set! f300 (cons (quote fx+) f300)) (set! f300 (cons (quote fx>=) f300)) (set! f300 (cons (quote fx>) f300)) (set! f300 (cons (quote fx<=) f300)) (set! f300 (cons (quote fx<) f300)) (set! f300 (cons (quote fx=) f300)) (set! f300 (cons (quote fxzero?) f300)) (set! f300 (cons (quote fxsub1) f300)) (set! f300 (cons (quote fxadd1) f300)) (set! f300 (cons (quote fxlogor) f300)) (set! f300 (cons (quote fxlogand) f300)) (set! f300 (cons (quote fxlognot) f300)) (set! f300 (cons (quote char=?) f300)) (set! f300 (cons (quote eq?) f300)) (set! f300 (cons (quote not) f300)) (set! f300 (cons (quote boolean?) f300)) (set! f300 (cons (quote fixnum?) f300)) (set! f300 (cons (quote char?) f300)) (set! f300 (cons (quote null?) f300)) (set! f300 (cons (quote char->fixnum) f300)) (set! f300 (cons (quote fixnum->char) f300)) (lambda () f300)))
# == eliminate-set!  ==>
# (let ((f300 (vector (quote ())))) (begin (vector-set! f300 0 (cons (quote procedure?) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote cdr) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote car) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote symbol-value) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote symbol->string) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote make-symbol) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote symbol?) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote string-set!) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote string-ref) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote string-length) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote string?) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote make-string) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote vector-ref) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote vector-set!) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote vector-length) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote make-vector) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote vector?) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote set-cdr!) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote set-car!) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote cdr) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote car) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote cons) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote pair?) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote fx*) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote fx-) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote fx+) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote fx>=) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote fx>) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote fx<=) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote fx<) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote fx=) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote fxzero?) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote fxsub1) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote fxadd1) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote fxlogor) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote fxlogand) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote fxlognot) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote char=?) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote eq?) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote not) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote boolean?) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote fixnum?) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote char?) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote null?) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote char->fixnum) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote fixnum->char) (vector-ref f300 0))) (lambda () (let () (vector-ref f300 0)))))
# == close-free-variables  ==>
# (let ((f300 (vector (quote ())))) (begin (vector-set! f300 0 (cons (quote procedure?) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote cdr) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote car) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote symbol-value) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote symbol->string) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote make-symbol) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote symbol?) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote string-set!) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote string-ref) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote string-length) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote string?) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote make-string) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote vector-ref) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote vector-set!) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote vector-length) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote make-vector) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote vector?) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote set-cdr!) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote set-car!) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote cdr) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote car) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote cons) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote pair?) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote fx*) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote fx-) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote fx+) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote fx>=) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote fx>) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote fx<=) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote fx<) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote fx=) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote fxzero?) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote fxsub1) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote fxadd1) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote fxlogor) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote fxlogand) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote fxlognot) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote char=?) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote eq?) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote not) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote boolean?) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote fixnum?) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote char?) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote null?) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote char->fixnum) (vector-ref f300 0))) (vector-set! f300 0 (cons (quote fixnum->char) (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0)))))
# == eliminate-quote  ==>
# (let ((f300 (vector ()))) (begin (vector-set! f300 0 (cons (string->symbol "procedure?") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "car") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "symbol-value") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "symbol->string") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "make-symbol") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "symbol?") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "string-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "string-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "string-length") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "string?") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "make-string") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "vector-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "vector-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "vector-length") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "car") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "not") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0)))))
# == eliminate-when/unless  ==>
# (let ((f300 (vector ()))) (begin (vector-set! f300 0 (cons (string->symbol "procedure?") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "car") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "symbol-value") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "symbol->string") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "make-symbol") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "symbol?") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "string-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "string-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "string-length") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "string?") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "make-string") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "vector-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "vector-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "vector-length") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "car") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "not") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0)))))
# == eliminate-cond  ==>
# (let ((f300 (vector ()))) (begin (vector-set! f300 0 (cons (string->symbol "procedure?") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "car") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "symbol-value") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "symbol->string") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "make-symbol") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "symbol?") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "string-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "string-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "string-length") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "string?") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "make-string") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "vector-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "vector-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "vector-length") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "car") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "not") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons (string->symbol "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0)))))
# == external-symbols  ==>
# (let ((f300 ((primitive-ref vector) ()))) (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0)))))
# emit-expr (let ((f300 ((primitive-ref vector) ()))) (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0)))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f300 ((primitive-ref vector) ())))
#  body = (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
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
    je "_L_1914"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_1914":
   movl %eax,  -8(%esp)  # stash funcall-oper in closure slot
# emit-expr ()
    movl $63, %eax     # immed ()
    mov %eax, -12(%esp)  # arg ()
    movl -8(%esp), %edi   # load new closure to %edi
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_1915
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1915:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1916"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1916:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_1918
    cmp  $0,%eax
    jge _L_1917
_L_1918:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1917:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "procedure?") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "procedure?")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "procedure?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_1919"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_1919":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "procedure?"
# string literal
    jmp _L_1921
    .align 8,0x90
_L_1920 :
    .int 40
    .ascii "procedure?"
_L_1921:
    movl $_L_1920, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg procedure?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_1922
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1922:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1923"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1923:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_1925
    cmp  $0,%eax
    jge _L_1924
_L_1925:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1924:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_1926
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1926:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1927"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1927:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_1929
    cmp  $0,%eax
    jge _L_1928
_L_1929:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1928:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "cdr") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "cdr")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "cdr")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_1930"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_1930":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cdr"
# string literal
    jmp _L_1932
    .align 8,0x90
_L_1931 :
    .int 12
    .ascii "cdr"
_L_1932:
    movl $_L_1931, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cdr
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_1933
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1933:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1934"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1934:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_1936
    cmp  $0,%eax
    jge _L_1935
_L_1936:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1935:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_1937
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1937:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1938"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1938:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_1940
    cmp  $0,%eax
    jge _L_1939
_L_1940:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1939:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "car") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "car")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "car")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_1941"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_1941":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "car"
# string literal
    jmp _L_1943
    .align 8,0x90
_L_1942 :
    .int 12
    .ascii "car"
_L_1943:
    movl $_L_1942, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg car
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_1944
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1944:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1945"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1945:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_1947
    cmp  $0,%eax
    jge _L_1946
_L_1947:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1946:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_1948
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1948:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1949"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1949:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_1951
    cmp  $0,%eax
    jge _L_1950
_L_1951:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1950:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "symbol-value") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "symbol-value")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol-value")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_1952"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_1952":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol-value"
# string literal
    jmp _L_1954
    .align 8,0x90
_L_1953 :
    .int 48
    .ascii "symbol-value"
_L_1954:
    movl $_L_1953, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol-value
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_1955
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1955:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1956"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1956:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_1958
    cmp  $0,%eax
    jge _L_1957
_L_1958:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1957:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_1959
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1959:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1960"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1960:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_1962
    cmp  $0,%eax
    jge _L_1961
_L_1962:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1961:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "symbol->string") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "symbol->string")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol->string")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_1963"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_1963":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol->string"
# string literal
    jmp _L_1965
    .align 8,0x90
_L_1964 :
    .int 56
    .ascii "symbol->string"
_L_1965:
    movl $_L_1964, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol->string
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_1966
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1966:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1967"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1967:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_1969
    cmp  $0,%eax
    jge _L_1968
_L_1969:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1968:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_1970
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1970:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1971"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1971:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_1973
    cmp  $0,%eax
    jge _L_1972
_L_1973:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1972:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "make-symbol") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "make-symbol")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-symbol")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_1974"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_1974":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-symbol"
# string literal
    jmp _L_1976
    .align 8,0x90
_L_1975 :
    .int 44
    .ascii "make-symbol"
_L_1976:
    movl $_L_1975, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-symbol
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_1977
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1977:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1978"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1978:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_1980
    cmp  $0,%eax
    jge _L_1979
_L_1980:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1979:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_1981
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1981:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1982"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1982:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_1984
    cmp  $0,%eax
    jge _L_1983
_L_1984:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1983:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "symbol?") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "symbol?")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_1985"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_1985":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol?"
# string literal
    jmp _L_1987
    .align 8,0x90
_L_1986 :
    .int 28
    .ascii "symbol?"
_L_1987:
    movl $_L_1986, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_1988
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1988:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1989"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1989:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_1991
    cmp  $0,%eax
    jge _L_1990
_L_1991:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1990:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_1992
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1992:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1993"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1993:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_1995
    cmp  $0,%eax
    jge _L_1994
_L_1995:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1994:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "string-set!") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "string-set!")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-set!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_1996"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_1996":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-set!"
# string literal
    jmp _L_1998
    .align 8,0x90
_L_1997 :
    .int 44
    .ascii "string-set!"
_L_1998:
    movl $_L_1997, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-set!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_1999
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1999:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2000"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2000:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2002
    cmp  $0,%eax
    jge _L_2001
_L_2002:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2001:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2003
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2003:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2004"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2004:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2006
    cmp  $0,%eax
    jge _L_2005
_L_2006:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2005:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "string-ref") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "string-ref")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-ref")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2007"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2007":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-ref"
# string literal
    jmp _L_2009
    .align 8,0x90
_L_2008 :
    .int 40
    .ascii "string-ref"
_L_2009:
    movl $_L_2008, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-ref
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2010
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2010:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2011"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2011:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2013
    cmp  $0,%eax
    jge _L_2012
_L_2013:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2012:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2014
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2014:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2015"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2015:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2017
    cmp  $0,%eax
    jge _L_2016
_L_2017:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2016:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-length") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "string-length") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "string-length")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-length")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2018"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2018":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-length"
# string literal
    jmp _L_2020
    .align 8,0x90
_L_2019 :
    .int 52
    .ascii "string-length"
_L_2020:
    movl $_L_2019, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-length
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2021
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2021:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2022"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2022:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2024
    cmp  $0,%eax
    jge _L_2023
_L_2024:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2023:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2025
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2025:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2026"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2026:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2028
    cmp  $0,%eax
    jge _L_2027
_L_2028:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2027:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string?") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "string?") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "string?")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2029"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2029":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string?"
# string literal
    jmp _L_2031
    .align 8,0x90
_L_2030 :
    .int 28
    .ascii "string?"
_L_2031:
    movl $_L_2030, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2032
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2032:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2033"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2033:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2035
    cmp  $0,%eax
    jge _L_2034
_L_2035:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2034:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2036
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2036:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2037"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2037:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2039
    cmp  $0,%eax
    jge _L_2038
_L_2039:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2038:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-string") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "make-string") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "make-string")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-string")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2040"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2040":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-string"
# string literal
    jmp _L_2042
    .align 8,0x90
_L_2041 :
    .int 44
    .ascii "make-string"
_L_2042:
    movl $_L_2041, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-string
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2043
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2043:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2044"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2044:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2046
    cmp  $0,%eax
    jge _L_2045
_L_2046:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2045:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2047
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2047:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2048"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2048:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2050
    cmp  $0,%eax
    jge _L_2049
_L_2050:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2049:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "vector-ref") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "vector-ref")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-ref")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2051"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2051":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-ref"
# string literal
    jmp _L_2053
    .align 8,0x90
_L_2052 :
    .int 40
    .ascii "vector-ref"
_L_2053:
    movl $_L_2052, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-ref
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2054
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2054:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2055"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2055:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2057
    cmp  $0,%eax
    jge _L_2056
_L_2057:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2056:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2058
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2058:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2059"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2059:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2061
    cmp  $0,%eax
    jge _L_2060
_L_2061:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2060:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "vector-set!") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "vector-set!")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-set!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2062"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2062":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-set!"
# string literal
    jmp _L_2064
    .align 8,0x90
_L_2063 :
    .int 44
    .ascii "vector-set!"
_L_2064:
    movl $_L_2063, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-set!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2065
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2065:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2066"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2066:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2068
    cmp  $0,%eax
    jge _L_2067
_L_2068:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2067:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2069
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2069:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2070"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2070:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2072
    cmp  $0,%eax
    jge _L_2071
_L_2072:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2071:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "vector-length") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "vector-length")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-length")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2073"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2073":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-length"
# string literal
    jmp _L_2075
    .align 8,0x90
_L_2074 :
    .int 52
    .ascii "vector-length"
_L_2075:
    movl $_L_2074, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-length
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2076
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2076:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2077"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2077:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2079
    cmp  $0,%eax
    jge _L_2078
_L_2079:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2078:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2080
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2080:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2081"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2081:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2083
    cmp  $0,%eax
    jge _L_2082
_L_2083:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2082:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "make-vector") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "make-vector")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-vector")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2084"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2084":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-vector"
# string literal
    jmp _L_2086
    .align 8,0x90
_L_2085 :
    .int 44
    .ascii "make-vector"
_L_2086:
    movl $_L_2085, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-vector
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2087
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2087:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2088"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2088:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2090
    cmp  $0,%eax
    jge _L_2089
_L_2090:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2089:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2091
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2091:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2092"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2092:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2094
    cmp  $0,%eax
    jge _L_2093
_L_2094:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2093:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector?") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "vector?") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "vector?")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2095"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2095":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector?"
# string literal
    jmp _L_2097
    .align 8,0x90
_L_2096 :
    .int 28
    .ascii "vector?"
_L_2097:
    movl $_L_2096, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2098
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2098:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2099"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2099:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2101
    cmp  $0,%eax
    jge _L_2100
_L_2101:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2100:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2102
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2102:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2103"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2103:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2105
    cmp  $0,%eax
    jge _L_2104
_L_2105:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2104:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "set-cdr!") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "set-cdr!")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "set-cdr!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2106"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2106":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "set-cdr!"
# string literal
    jmp _L_2108
    .align 8,0x90
_L_2107 :
    .int 32
    .ascii "set-cdr!"
_L_2108:
    movl $_L_2107, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg set-cdr!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2109
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2109:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2110"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2110:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2112
    cmp  $0,%eax
    jge _L_2111
_L_2112:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2111:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2113
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2113:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2114"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2114:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2116
    cmp  $0,%eax
    jge _L_2115
_L_2116:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2115:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "set-car!") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "set-car!")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "set-car!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2117"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2117":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "set-car!"
# string literal
    jmp _L_2119
    .align 8,0x90
_L_2118 :
    .int 32
    .ascii "set-car!"
_L_2119:
    movl $_L_2118, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg set-car!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2120
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2120:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2121"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2121:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2123
    cmp  $0,%eax
    jge _L_2122
_L_2123:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2122:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2124
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2124:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2125"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2125:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2127
    cmp  $0,%eax
    jge _L_2126
_L_2127:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2126:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cdr") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "cdr") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "cdr")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "cdr")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2128"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2128":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cdr"
# string literal
    jmp _L_2130
    .align 8,0x90
_L_2129 :
    .int 12
    .ascii "cdr"
_L_2130:
    movl $_L_2129, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cdr
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2131
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2131:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2132"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2132:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2134
    cmp  $0,%eax
    jge _L_2133
_L_2134:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2133:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2135
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2135:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2136"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2136:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2138
    cmp  $0,%eax
    jge _L_2137
_L_2138:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2137:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "car") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "car") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "car")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "car")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2139"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2139":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "car"
# string literal
    jmp _L_2141
    .align 8,0x90
_L_2140 :
    .int 12
    .ascii "car"
_L_2141:
    movl $_L_2140, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg car
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2142
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2142:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2143"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2143:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2145
    cmp  $0,%eax
    jge _L_2144
_L_2145:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2144:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2146
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2146:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2147"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2147:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2149
    cmp  $0,%eax
    jge _L_2148
_L_2149:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2148:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cons") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "cons") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "cons")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "cons")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2150"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2150":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cons"
# string literal
    jmp _L_2152
    .align 8,0x90
_L_2151 :
    .int 16
    .ascii "cons"
_L_2152:
    movl $_L_2151, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cons
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2153
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2153:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2154"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2154:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2156
    cmp  $0,%eax
    jge _L_2155
_L_2156:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2155:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2157
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2157:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2158"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2158:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2160
    cmp  $0,%eax
    jge _L_2159
_L_2160:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2159:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "pair?") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "pair?") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "pair?")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "pair?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2161"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2161":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "pair?"
# string literal
    jmp _L_2163
    .align 8,0x90
_L_2162 :
    .int 20
    .ascii "pair?"
_L_2163:
    movl $_L_2162, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg pair?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2164
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2164:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2165"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2165:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2167
    cmp  $0,%eax
    jge _L_2166
_L_2167:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2166:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2168
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2168:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2169"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2169:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2171
    cmp  $0,%eax
    jge _L_2170
_L_2171:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2170:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx*") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "fx*") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "fx*")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx*")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2172"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2172":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx*"
# string literal
    jmp _L_2174
    .align 8,0x90
_L_2173 :
    .int 12
    .ascii "fx*"
_L_2174:
    movl $_L_2173, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx*
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2175
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2175:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2176"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2176:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2178
    cmp  $0,%eax
    jge _L_2177
_L_2178:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2177:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2179
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2179:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2180"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2180:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2182
    cmp  $0,%eax
    jge _L_2181
_L_2182:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2181:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx-") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "fx-") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "fx-")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx-")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2183"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2183":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx-"
# string literal
    jmp _L_2185
    .align 8,0x90
_L_2184 :
    .int 12
    .ascii "fx-"
_L_2185:
    movl $_L_2184, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx-
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2186
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2186:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2187"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2187:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2189
    cmp  $0,%eax
    jge _L_2188
_L_2189:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2188:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2190
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2190:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2191"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2191:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2193
    cmp  $0,%eax
    jge _L_2192
_L_2193:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2192:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx+") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "fx+") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "fx+")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx+")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2194"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2194":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx+"
# string literal
    jmp _L_2196
    .align 8,0x90
_L_2195 :
    .int 12
    .ascii "fx+"
_L_2196:
    movl $_L_2195, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx+
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2197
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2197:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2198"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2198:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2200
    cmp  $0,%eax
    jge _L_2199
_L_2200:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2199:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2201
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2201:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2202"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2202:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2204
    cmp  $0,%eax
    jge _L_2203
_L_2204:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2203:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "fx>=") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "fx>=")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx>=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2205"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2205":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx>="
# string literal
    jmp _L_2207
    .align 8,0x90
_L_2206 :
    .int 16
    .ascii "fx>="
_L_2207:
    movl $_L_2206, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx>=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2208
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2208:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2209"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2209:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2211
    cmp  $0,%eax
    jge _L_2210
_L_2211:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2210:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2212
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2212:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2213"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2213:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2215
    cmp  $0,%eax
    jge _L_2214
_L_2215:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2214:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx>") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "fx>") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "fx>")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx>")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2216"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2216":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx>"
# string literal
    jmp _L_2218
    .align 8,0x90
_L_2217 :
    .int 12
    .ascii "fx>"
_L_2218:
    movl $_L_2217, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx>
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2219
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2219:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2220"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2220:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2222
    cmp  $0,%eax
    jge _L_2221
_L_2222:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2221:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2223
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2223:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2224"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2224:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2226
    cmp  $0,%eax
    jge _L_2225
_L_2226:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2225:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "fx<=") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "fx<=")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx<=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2227"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2227":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx<="
# string literal
    jmp _L_2229
    .align 8,0x90
_L_2228 :
    .int 16
    .ascii "fx<="
_L_2229:
    movl $_L_2228, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx<=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2230
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2230:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2231"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2231:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2233
    cmp  $0,%eax
    jge _L_2232
_L_2233:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2232:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2234
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2234:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2235"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2235:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2237
    cmp  $0,%eax
    jge _L_2236
_L_2237:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2236:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx<") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "fx<") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "fx<")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx<")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2238"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2238":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx<"
# string literal
    jmp _L_2240
    .align 8,0x90
_L_2239 :
    .int 12
    .ascii "fx<"
_L_2240:
    movl $_L_2239, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx<
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2241
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2241:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2242"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2242:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2244
    cmp  $0,%eax
    jge _L_2243
_L_2244:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2243:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2245
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2245:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2246"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2246:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2248
    cmp  $0,%eax
    jge _L_2247
_L_2248:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2247:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx=") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "fx=") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "fx=")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2249"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2249":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx="
# string literal
    jmp _L_2251
    .align 8,0x90
_L_2250 :
    .int 12
    .ascii "fx="
_L_2251:
    movl $_L_2250, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2252
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2252:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2253"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2253:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2255
    cmp  $0,%eax
    jge _L_2254
_L_2255:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2254:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2256
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2256:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2257"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2257:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2259
    cmp  $0,%eax
    jge _L_2258
_L_2259:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2258:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "fxzero?") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "fxzero?")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxzero?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2260"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2260":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxzero?"
# string literal
    jmp _L_2262
    .align 8,0x90
_L_2261 :
    .int 28
    .ascii "fxzero?"
_L_2262:
    movl $_L_2261, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxzero?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2263
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2263:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2264"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2264:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2266
    cmp  $0,%eax
    jge _L_2265
_L_2266:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2265:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2267
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2267:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2268"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2268:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2270
    cmp  $0,%eax
    jge _L_2269
_L_2270:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2269:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "fxsub1") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "fxsub1")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxsub1")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2271"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2271":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxsub1"
# string literal
    jmp _L_2273
    .align 8,0x90
_L_2272 :
    .int 24
    .ascii "fxsub1"
_L_2273:
    movl $_L_2272, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxsub1
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2274
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2274:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2275"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2275:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2277
    cmp  $0,%eax
    jge _L_2276
_L_2277:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2276:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2278
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2278:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2279"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2279:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2281
    cmp  $0,%eax
    jge _L_2280
_L_2281:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2280:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "fxadd1") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "fxadd1")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxadd1")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2282"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2282":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxadd1"
# string literal
    jmp _L_2284
    .align 8,0x90
_L_2283 :
    .int 24
    .ascii "fxadd1"
_L_2284:
    movl $_L_2283, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxadd1
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2285
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2285:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2286"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2286:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2288
    cmp  $0,%eax
    jge _L_2287
_L_2288:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2287:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2289
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2289:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2290"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2290:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2292
    cmp  $0,%eax
    jge _L_2291
_L_2292:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2291:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "fxlogor") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "fxlogor")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlogor")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2293"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2293":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlogor"
# string literal
    jmp _L_2295
    .align 8,0x90
_L_2294 :
    .int 28
    .ascii "fxlogor"
_L_2295:
    movl $_L_2294, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlogor
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2296
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2296:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2297"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2297:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2299
    cmp  $0,%eax
    jge _L_2298
_L_2299:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2298:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2300
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2300:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2301"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2301:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2303
    cmp  $0,%eax
    jge _L_2302
_L_2303:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2302:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "fxlogand") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "fxlogand")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlogand")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2304"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2304":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlogand"
# string literal
    jmp _L_2306
    .align 8,0x90
_L_2305 :
    .int 32
    .ascii "fxlogand"
_L_2306:
    movl $_L_2305, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlogand
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2307
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2307:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2308"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2308:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2310
    cmp  $0,%eax
    jge _L_2309
_L_2310:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2309:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2311
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2311:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2312"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2312:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2314
    cmp  $0,%eax
    jge _L_2313
_L_2314:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2313:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "fxlognot") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "fxlognot")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlognot")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2315"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2315":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlognot"
# string literal
    jmp _L_2317
    .align 8,0x90
_L_2316 :
    .int 32
    .ascii "fxlognot"
_L_2317:
    movl $_L_2316, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlognot
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2318
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2318:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2319"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2319:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2321
    cmp  $0,%eax
    jge _L_2320
_L_2321:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2320:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2322
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2322:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2323"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2323:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2325
    cmp  $0,%eax
    jge _L_2324
_L_2325:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2324:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char=?") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "char=?") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "char=?")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "char=?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2326"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2326":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char=?"
# string literal
    jmp _L_2328
    .align 8,0x90
_L_2327 :
    .int 24
    .ascii "char=?"
_L_2328:
    movl $_L_2327, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char=?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2329
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2329:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2330"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2330:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2332
    cmp  $0,%eax
    jge _L_2331
_L_2332:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2331:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2333
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2333:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2334"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2334:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2336
    cmp  $0,%eax
    jge _L_2335
_L_2336:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2335:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "eq?") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "eq?") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "eq?")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "eq?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2337"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2337":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "eq?"
# string literal
    jmp _L_2339
    .align 8,0x90
_L_2338 :
    .int 12
    .ascii "eq?"
_L_2339:
    movl $_L_2338, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg eq?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2340
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2340:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2341"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2341:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2343
    cmp  $0,%eax
    jge _L_2342
_L_2343:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2342:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2344
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2344:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2345"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2345:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2347
    cmp  $0,%eax
    jge _L_2346
_L_2347:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2346:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "not") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "not") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "not")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "not")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2348"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2348":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "not"
# string literal
    jmp _L_2350
    .align 8,0x90
_L_2349 :
    .int 12
    .ascii "not"
_L_2350:
    movl $_L_2349, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg not
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2351
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2351:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2352"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2352:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2354
    cmp  $0,%eax
    jge _L_2353
_L_2354:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2353:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2355
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2355:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2356"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2356:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2358
    cmp  $0,%eax
    jge _L_2357
_L_2358:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2357:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "boolean?") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "boolean?")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "boolean?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2359"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2359":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "boolean?"
# string literal
    jmp _L_2361
    .align 8,0x90
_L_2360 :
    .int 32
    .ascii "boolean?"
_L_2361:
    movl $_L_2360, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg boolean?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2362
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2362:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2363"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2363:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2365
    cmp  $0,%eax
    jge _L_2364
_L_2365:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2364:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2366
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2366:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2367"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2367:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2369
    cmp  $0,%eax
    jge _L_2368
_L_2369:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2368:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "fixnum?") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "fixnum?")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fixnum?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2370"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2370":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fixnum?"
# string literal
    jmp _L_2372
    .align 8,0x90
_L_2371 :
    .int 28
    .ascii "fixnum?"
_L_2372:
    movl $_L_2371, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fixnum?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2373
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2373:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2374"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2374:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2376
    cmp  $0,%eax
    jge _L_2375
_L_2376:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2375:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2377
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2377:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2378"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2378:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2380
    cmp  $0,%eax
    jge _L_2379
_L_2380:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2379:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char?") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "char?") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "char?")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "char?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2381"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2381":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char?"
# string literal
    jmp _L_2383
    .align 8,0x90
_L_2382 :
    .int 20
    .ascii "char?"
_L_2383:
    movl $_L_2382, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2384
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2384:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2385"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2385:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2387
    cmp  $0,%eax
    jge _L_2386
_L_2387:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2386:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2388
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2388:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2389"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2389:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2391
    cmp  $0,%eax
    jge _L_2390
_L_2391:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2390:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "null?") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "null?") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "null?")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "null?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2392"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2392":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "null?"
# string literal
    jmp _L_2394
    .align 8,0x90
_L_2393 :
    .int 20
    .ascii "null?"
_L_2394:
    movl $_L_2393, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg null?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2395
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2395:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2396"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2396:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2398
    cmp  $0,%eax
    jge _L_2397
_L_2398:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2397:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))) (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2399
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2399:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2400"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2400:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2402
    cmp  $0,%eax
    jge _L_2401
_L_2402:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2401:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "char->fixnum") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "char->fixnum")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "char->fixnum")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2403"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2403":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char->fixnum"
# string literal
    jmp _L_2405
    .align 8,0x90
_L_2404 :
    .int 48
    .ascii "char->fixnum"
_L_2405:
    movl $_L_2404, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char->fixnum
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2406
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2406:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2407"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2407:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2409
    cmp  $0,%eax
    jge _L_2408
_L_2409:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2408:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))) (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (vector-set! f300 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0)))
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2410
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2410:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2411"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2411:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2413
    cmp  $0,%eax
    jge _L_2412
_L_2413:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2412:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f300 0))
# cons arg1=((primitive-ref string->symbol) "fixnum->char") arg2=(vector-ref f300 0)
# emit-expr ((primitive-ref string->symbol) "fixnum->char")
# funcall
#    si   =-12
#    env  = ((f300 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fixnum->char")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2414"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2414":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fixnum->char"
# string literal
    jmp _L_2416
    .align 8,0x90
_L_2415 :
    .int 48
    .ascii "fixnum->char"
_L_2416:
    movl $_L_2415, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fixnum->char
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f300 0)
# emit-expr f300
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2417
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2417:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2418"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2418:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2420
    cmp  $0,%eax
    jge _L_2419
_L_2420:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2419:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (closure () (f300) (let () (vector-ref f300 0))))
# emit-begin
#   expr=(begin (closure () (f300) (let () (vector-ref f300 0))))
#   env=((f300 . 0))
# emit-expr (closure () (f300) (let () (vector-ref f300 0)))
# emit-closure
# si = -4
# env = ((f300 . 0))
# expr = (closure () (f300) (let () (vector-ref f300 0)))
    movl $_L_2421, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f300 . 0))
# var=f300
    movl 0(%esp), %eax  # stack load f300
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f300
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_2422            # jump around closure body
_L_2421:
# check argument count
    cmp $0,%eax
    je _L_2423
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_2423:
# emit-tail-expr
# si=-8
# env=((f300 . 4) (f300 . 0))
# expr=(let () (vector-ref f300 0))
# emit-tail-let
#  si   = -8
#  env  = ((f300 . 4) (f300 . 0))
#  bindings = ()
#  body = (vector-ref f300 0)
# emit-tail-expr
# si=-8
# env=((f300 . 4) (f300 . 0))
# expr=(vector-ref f300 0)
# tail primcall
# emit-expr f300
# emit-variable-ref
# env=((f300 . 4) (f300 . 0))
# var=f300
    movl 2(%edi), %eax  # frame load f300
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_2424
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2424:
    movl %eax, -8(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2425"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2425:
# check bounds on vector index
    movl -8(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_2427
    cmp  $0,%eax
    jge _L_2426
_L_2427:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_2426:
    movl -8(%esp), %esi
    movl -1(%eax,%esi), %eax
#return from tail (vector-ref f300 0)
    ret
    .align 4,0x90
_L_2422:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f300 . 0))
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
    movl $_L_2428, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_2429            # jump around closure body
_L_2428:
# check argument count
    cmp $0,%eax
    je _L_2430
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_2430:
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
    je "_L_2431"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2431":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_2433
    .align 8,0x90
_L_2432 :
    .int 28
    .ascii "funcall"
_L_2433:
    movl $_L_2432, %eax
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
    jmp _L_2435
    .align 8,0x90
_L_2434 :
    .int 100
    .ascii "arg 1 must be a procedure"
_L_2435:
    movl $_L_2434, %eax
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
_L_2429:
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
    movl $_L_2436, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_2437            # jump around closure body
_L_2436:
# check argument count
    cmp $0,%eax
    je _L_2438
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_2438:
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
    je "_L_2439"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2439":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_2441
    .align 8,0x90
_L_2440 :
    .int 28
    .ascii "funcall"
_L_2441:
    movl $_L_2440, %eax
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
    jmp _L_2443
    .align 8,0x90
_L_2442 :
    .int 80
    .ascii "wrong number of args"
_L_2443:
    movl $_L_2442, %eax
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
_L_2437:
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
    movl $_L_2444, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_2445            # jump around closure body
_L_2444:
# check argument count
    cmp $0,%eax
    je _L_2446
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_2446:
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
    je "_L_2447"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2447":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_2449
    .align 8,0x90
_L_2448 :
    .int 28
    .ascii "funcall"
_L_2449:
    movl $_L_2448, %eax
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
    jmp _L_2451
    .align 8,0x90
_L_2450 :
    .int 48
    .ascii "too few args"
_L_2451:
    movl $_L_2450, %eax
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
_L_2445:
     movl %eax, eh$uargcount$umin
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a fixnum"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a fixnum"))
# == uniquify-variables  ==>
# (lambda (f301) (error (list-ref (primitives) f301) "arg must be a fixnum"))
# == vectorize-letrec  ==>
# (lambda (f301) (error (list-ref (primitives) f301) "arg must be a fixnum"))
# == eliminate-set!  ==>
# (lambda (f301) (let ((f301 f301)) (error (list-ref (primitives) f301) "arg must be a fixnum")))
# == close-free-variables  ==>
# (closure (f301) (error list-ref primitives) (let ((f301 f301)) (error (list-ref (primitives) f301) "arg must be a fixnum")))
# == eliminate-quote  ==>
# (closure (f301) (error list-ref primitives) (let ((f301 f301)) (error (list-ref (primitives) f301) "arg must be a fixnum")))
# == eliminate-when/unless  ==>
# (closure (f301) (error list-ref primitives) (let ((f301 f301)) (error (list-ref (primitives) f301) "arg must be a fixnum")))
# == eliminate-cond  ==>
# (closure (f301) (error list-ref primitives) (let ((f301 f301)) (error (list-ref (primitives) f301) "arg must be a fixnum")))
# == external-symbols  ==>
# (closure (f301) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f301 f301)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f301) "arg must be a fixnum")))
# emit-expr (closure (f301) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f301 f301)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f301) "arg must be a fixnum")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f301) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f301 f301)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f301) "arg must be a fixnum")))
    movl $_L_2452, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_2453            # jump around closure body
_L_2452:
# check argument count
    cmp $4,%eax
    je _L_2454
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_2454:
# emit-tail-expr
# si=-12
# env=((f301 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f301 f301)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f301) "arg must be a fixnum"))
# emit-tail-let
#  si   = -12
#  env  = ((f301 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f301 f301))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f301) "arg must be a fixnum")
# emit-expr f301
# emit-variable-ref
# env=((f301 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f301
    movl -8(%esp), %eax  # stack load f301
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f301 . -12) (f301 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f301) "arg must be a fixnum")
# emit-tail-funcall
#    si   =-16
#    env  = ((f301 . -12) (f301 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f301) "arg must be a fixnum")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f301)
# funcall
#    si   =-20
#    env  = ((f301 . -12) (f301 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f301)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2455"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2455":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f301 . -12) (f301 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2456"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2456":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f301
# emit-variable-ref
# env=((f301 . -12) (f301 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f301
    movl -12(%esp), %eax  # stack load f301
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f301
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f301)
# emit-expr "arg must be a fixnum"
# string literal
    jmp _L_2458
    .align 8,0x90
_L_2457 :
    .int 80
    .ascii "arg must be a fixnum"
_L_2458:
    movl $_L_2457, %eax
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
_L_2453:
     movl %eax, eh$ufixnum
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a string"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a string"))
# == uniquify-variables  ==>
# (lambda (f302) (error (list-ref (primitives) f302) "arg must be a string"))
# == vectorize-letrec  ==>
# (lambda (f302) (error (list-ref (primitives) f302) "arg must be a string"))
# == eliminate-set!  ==>
# (lambda (f302) (let ((f302 f302)) (error (list-ref (primitives) f302) "arg must be a string")))
# == close-free-variables  ==>
# (closure (f302) (error list-ref primitives) (let ((f302 f302)) (error (list-ref (primitives) f302) "arg must be a string")))
# == eliminate-quote  ==>
# (closure (f302) (error list-ref primitives) (let ((f302 f302)) (error (list-ref (primitives) f302) "arg must be a string")))
# == eliminate-when/unless  ==>
# (closure (f302) (error list-ref primitives) (let ((f302 f302)) (error (list-ref (primitives) f302) "arg must be a string")))
# == eliminate-cond  ==>
# (closure (f302) (error list-ref primitives) (let ((f302 f302)) (error (list-ref (primitives) f302) "arg must be a string")))
# == external-symbols  ==>
# (closure (f302) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f302 f302)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f302) "arg must be a string")))
# emit-expr (closure (f302) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f302 f302)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f302) "arg must be a string")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f302) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f302 f302)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f302) "arg must be a string")))
    movl $_L_2459, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_2460            # jump around closure body
_L_2459:
# check argument count
    cmp $4,%eax
    je _L_2461
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_2461:
# emit-tail-expr
# si=-12
# env=((f302 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f302 f302)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f302) "arg must be a string"))
# emit-tail-let
#  si   = -12
#  env  = ((f302 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f302 f302))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f302) "arg must be a string")
# emit-expr f302
# emit-variable-ref
# env=((f302 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f302
    movl -8(%esp), %eax  # stack load f302
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f302 . -12) (f302 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f302) "arg must be a string")
# emit-tail-funcall
#    si   =-16
#    env  = ((f302 . -12) (f302 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f302) "arg must be a string")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f302)
# funcall
#    si   =-20
#    env  = ((f302 . -12) (f302 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f302)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2462"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2462":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f302 . -12) (f302 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2463"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2463":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f302
# emit-variable-ref
# env=((f302 . -12) (f302 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f302
    movl -12(%esp), %eax  # stack load f302
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f302
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f302)
# emit-expr "arg must be a string"
# string literal
    jmp _L_2465
    .align 8,0x90
_L_2464 :
    .int 80
    .ascii "arg must be a string"
_L_2465:
    movl $_L_2464, %eax
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
_L_2460:
     movl %eax, eh$ustring
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a character"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a character"))
# == uniquify-variables  ==>
# (lambda (f303) (error (list-ref (primitives) f303) "arg must be a character"))
# == vectorize-letrec  ==>
# (lambda (f303) (error (list-ref (primitives) f303) "arg must be a character"))
# == eliminate-set!  ==>
# (lambda (f303) (let ((f303 f303)) (error (list-ref (primitives) f303) "arg must be a character")))
# == close-free-variables  ==>
# (closure (f303) (error list-ref primitives) (let ((f303 f303)) (error (list-ref (primitives) f303) "arg must be a character")))
# == eliminate-quote  ==>
# (closure (f303) (error list-ref primitives) (let ((f303 f303)) (error (list-ref (primitives) f303) "arg must be a character")))
# == eliminate-when/unless  ==>
# (closure (f303) (error list-ref primitives) (let ((f303 f303)) (error (list-ref (primitives) f303) "arg must be a character")))
# == eliminate-cond  ==>
# (closure (f303) (error list-ref primitives) (let ((f303 f303)) (error (list-ref (primitives) f303) "arg must be a character")))
# == external-symbols  ==>
# (closure (f303) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f303 f303)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f303) "arg must be a character")))
# emit-expr (closure (f303) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f303 f303)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f303) "arg must be a character")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f303) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f303 f303)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f303) "arg must be a character")))
    movl $_L_2466, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_2467            # jump around closure body
_L_2466:
# check argument count
    cmp $4,%eax
    je _L_2468
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_2468:
# emit-tail-expr
# si=-12
# env=((f303 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f303 f303)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f303) "arg must be a character"))
# emit-tail-let
#  si   = -12
#  env  = ((f303 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f303 f303))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f303) "arg must be a character")
# emit-expr f303
# emit-variable-ref
# env=((f303 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f303
    movl -8(%esp), %eax  # stack load f303
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f303 . -12) (f303 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f303) "arg must be a character")
# emit-tail-funcall
#    si   =-16
#    env  = ((f303 . -12) (f303 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f303) "arg must be a character")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f303)
# funcall
#    si   =-20
#    env  = ((f303 . -12) (f303 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f303)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2469"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2469":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f303 . -12) (f303 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2470"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2470":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f303
# emit-variable-ref
# env=((f303 . -12) (f303 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f303
    movl -12(%esp), %eax  # stack load f303
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f303
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f303)
# emit-expr "arg must be a character"
# string literal
    jmp _L_2472
    .align 8,0x90
_L_2471 :
    .int 92
    .ascii "arg must be a character"
_L_2472:
    movl $_L_2471, %eax
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
_L_2467:
     movl %eax, eh$ucharacter
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a pair"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a pair"))
# == uniquify-variables  ==>
# (lambda (f304) (error (list-ref (primitives) f304) "arg must be a pair"))
# == vectorize-letrec  ==>
# (lambda (f304) (error (list-ref (primitives) f304) "arg must be a pair"))
# == eliminate-set!  ==>
# (lambda (f304) (let ((f304 f304)) (error (list-ref (primitives) f304) "arg must be a pair")))
# == close-free-variables  ==>
# (closure (f304) (error list-ref primitives) (let ((f304 f304)) (error (list-ref (primitives) f304) "arg must be a pair")))
# == eliminate-quote  ==>
# (closure (f304) (error list-ref primitives) (let ((f304 f304)) (error (list-ref (primitives) f304) "arg must be a pair")))
# == eliminate-when/unless  ==>
# (closure (f304) (error list-ref primitives) (let ((f304 f304)) (error (list-ref (primitives) f304) "arg must be a pair")))
# == eliminate-cond  ==>
# (closure (f304) (error list-ref primitives) (let ((f304 f304)) (error (list-ref (primitives) f304) "arg must be a pair")))
# == external-symbols  ==>
# (closure (f304) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f304 f304)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f304) "arg must be a pair")))
# emit-expr (closure (f304) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f304 f304)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f304) "arg must be a pair")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f304) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f304 f304)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f304) "arg must be a pair")))
    movl $_L_2473, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_2474            # jump around closure body
_L_2473:
# check argument count
    cmp $4,%eax
    je _L_2475
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_2475:
# emit-tail-expr
# si=-12
# env=((f304 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f304 f304)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f304) "arg must be a pair"))
# emit-tail-let
#  si   = -12
#  env  = ((f304 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f304 f304))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f304) "arg must be a pair")
# emit-expr f304
# emit-variable-ref
# env=((f304 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f304
    movl -8(%esp), %eax  # stack load f304
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f304 . -12) (f304 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f304) "arg must be a pair")
# emit-tail-funcall
#    si   =-16
#    env  = ((f304 . -12) (f304 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f304) "arg must be a pair")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f304)
# funcall
#    si   =-20
#    env  = ((f304 . -12) (f304 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f304)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2476"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2476":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f304 . -12) (f304 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2477"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2477":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f304
# emit-variable-ref
# env=((f304 . -12) (f304 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f304
    movl -12(%esp), %eax  # stack load f304
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f304
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f304)
# emit-expr "arg must be a pair"
# string literal
    jmp _L_2479
    .align 8,0x90
_L_2478 :
    .int 72
    .ascii "arg must be a pair"
_L_2479:
    movl $_L_2478, %eax
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
_L_2474:
     movl %eax, eh$upair
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a vector"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a vector"))
# == uniquify-variables  ==>
# (lambda (f305) (error (list-ref (primitives) f305) "arg must be a vector"))
# == vectorize-letrec  ==>
# (lambda (f305) (error (list-ref (primitives) f305) "arg must be a vector"))
# == eliminate-set!  ==>
# (lambda (f305) (let ((f305 f305)) (error (list-ref (primitives) f305) "arg must be a vector")))
# == close-free-variables  ==>
# (closure (f305) (error list-ref primitives) (let ((f305 f305)) (error (list-ref (primitives) f305) "arg must be a vector")))
# == eliminate-quote  ==>
# (closure (f305) (error list-ref primitives) (let ((f305 f305)) (error (list-ref (primitives) f305) "arg must be a vector")))
# == eliminate-when/unless  ==>
# (closure (f305) (error list-ref primitives) (let ((f305 f305)) (error (list-ref (primitives) f305) "arg must be a vector")))
# == eliminate-cond  ==>
# (closure (f305) (error list-ref primitives) (let ((f305 f305)) (error (list-ref (primitives) f305) "arg must be a vector")))
# == external-symbols  ==>
# (closure (f305) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f305 f305)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f305) "arg must be a vector")))
# emit-expr (closure (f305) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f305 f305)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f305) "arg must be a vector")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f305) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f305 f305)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f305) "arg must be a vector")))
    movl $_L_2480, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_2481            # jump around closure body
_L_2480:
# check argument count
    cmp $4,%eax
    je _L_2482
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_2482:
# emit-tail-expr
# si=-12
# env=((f305 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f305 f305)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f305) "arg must be a vector"))
# emit-tail-let
#  si   = -12
#  env  = ((f305 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f305 f305))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f305) "arg must be a vector")
# emit-expr f305
# emit-variable-ref
# env=((f305 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f305
    movl -8(%esp), %eax  # stack load f305
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f305 . -12) (f305 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f305) "arg must be a vector")
# emit-tail-funcall
#    si   =-16
#    env  = ((f305 . -12) (f305 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f305) "arg must be a vector")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f305)
# funcall
#    si   =-20
#    env  = ((f305 . -12) (f305 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f305)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2483"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2483":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f305 . -12) (f305 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2484"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2484":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f305
# emit-variable-ref
# env=((f305 . -12) (f305 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f305
    movl -12(%esp), %eax  # stack load f305
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f305
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f305)
# emit-expr "arg must be a vector"
# string literal
    jmp _L_2486
    .align 8,0x90
_L_2485 :
    .int 80
    .ascii "arg must be a vector"
_L_2486:
    movl $_L_2485, %eax
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
_L_2481:
     movl %eax, eh$uvector
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "length must be a fixnum >= 0"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "length must be a fixnum >= 0"))
# == uniquify-variables  ==>
# (lambda (f306) (error (list-ref (primitives) f306) "length must be a fixnum >= 0"))
# == vectorize-letrec  ==>
# (lambda (f306) (error (list-ref (primitives) f306) "length must be a fixnum >= 0"))
# == eliminate-set!  ==>
# (lambda (f306) (let ((f306 f306)) (error (list-ref (primitives) f306) "length must be a fixnum >= 0")))
# == close-free-variables  ==>
# (closure (f306) (error list-ref primitives) (let ((f306 f306)) (error (list-ref (primitives) f306) "length must be a fixnum >= 0")))
# == eliminate-quote  ==>
# (closure (f306) (error list-ref primitives) (let ((f306 f306)) (error (list-ref (primitives) f306) "length must be a fixnum >= 0")))
# == eliminate-when/unless  ==>
# (closure (f306) (error list-ref primitives) (let ((f306 f306)) (error (list-ref (primitives) f306) "length must be a fixnum >= 0")))
# == eliminate-cond  ==>
# (closure (f306) (error list-ref primitives) (let ((f306 f306)) (error (list-ref (primitives) f306) "length must be a fixnum >= 0")))
# == external-symbols  ==>
# (closure (f306) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f306 f306)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f306) "length must be a fixnum >= 0")))
# emit-expr (closure (f306) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f306 f306)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f306) "length must be a fixnum >= 0")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f306) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f306 f306)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f306) "length must be a fixnum >= 0")))
    movl $_L_2487, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_2488            # jump around closure body
_L_2487:
# check argument count
    cmp $4,%eax
    je _L_2489
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_2489:
# emit-tail-expr
# si=-12
# env=((f306 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f306 f306)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f306) "length must be a fixnum >= 0"))
# emit-tail-let
#  si   = -12
#  env  = ((f306 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f306 f306))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f306) "length must be a fixnum >= 0")
# emit-expr f306
# emit-variable-ref
# env=((f306 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f306
    movl -8(%esp), %eax  # stack load f306
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f306 . -12) (f306 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f306) "length must be a fixnum >= 0")
# emit-tail-funcall
#    si   =-16
#    env  = ((f306 . -12) (f306 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f306) "length must be a fixnum >= 0")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f306)
# funcall
#    si   =-20
#    env  = ((f306 . -12) (f306 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f306)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2490"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2490":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f306 . -12) (f306 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2491"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2491":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f306
# emit-variable-ref
# env=((f306 . -12) (f306 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f306
    movl -12(%esp), %eax  # stack load f306
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f306
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f306)
# emit-expr "length must be a fixnum >= 0"
# string literal
    jmp _L_2493
    .align 8,0x90
_L_2492 :
    .int 112
    .ascii "length must be a fixnum >= 0"
_L_2493:
    movl $_L_2492, %eax
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
_L_2488:
     movl %eax, eh$ulength
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == uniquify-variables  ==>
# (lambda (f307) (error (list-ref (primitives) f307) "index out of bounds"))
# == vectorize-letrec  ==>
# (lambda (f307) (error (list-ref (primitives) f307) "index out of bounds"))
# == eliminate-set!  ==>
# (lambda (f307) (let ((f307 f307)) (error (list-ref (primitives) f307) "index out of bounds")))
# == close-free-variables  ==>
# (closure (f307) (error list-ref primitives) (let ((f307 f307)) (error (list-ref (primitives) f307) "index out of bounds")))
# == eliminate-quote  ==>
# (closure (f307) (error list-ref primitives) (let ((f307 f307)) (error (list-ref (primitives) f307) "index out of bounds")))
# == eliminate-when/unless  ==>
# (closure (f307) (error list-ref primitives) (let ((f307 f307)) (error (list-ref (primitives) f307) "index out of bounds")))
# == eliminate-cond  ==>
# (closure (f307) (error list-ref primitives) (let ((f307 f307)) (error (list-ref (primitives) f307) "index out of bounds")))
# == external-symbols  ==>
# (closure (f307) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f307 f307)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f307) "index out of bounds")))
# emit-expr (closure (f307) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f307 f307)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f307) "index out of bounds")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f307) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f307 f307)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f307) "index out of bounds")))
    movl $_L_2494, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_2495            # jump around closure body
_L_2494:
# check argument count
    cmp $4,%eax
    je _L_2496
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_2496:
# emit-tail-expr
# si=-12
# env=((f307 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f307 f307)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f307) "index out of bounds"))
# emit-tail-let
#  si   = -12
#  env  = ((f307 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f307 f307))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f307) "index out of bounds")
# emit-expr f307
# emit-variable-ref
# env=((f307 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f307
    movl -8(%esp), %eax  # stack load f307
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f307 . -12) (f307 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f307) "index out of bounds")
# emit-tail-funcall
#    si   =-16
#    env  = ((f307 . -12) (f307 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f307) "index out of bounds")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f307)
# funcall
#    si   =-20
#    env  = ((f307 . -12) (f307 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f307)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2497"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2497":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f307 . -12) (f307 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2498"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2498":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f307
# emit-variable-ref
# env=((f307 . -12) (f307 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f307
    movl -12(%esp), %eax  # stack load f307
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f307
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f307)
# emit-expr "index out of bounds"
# string literal
    jmp _L_2500
    .align 8,0x90
_L_2499 :
    .int 76
    .ascii "index out of bounds"
_L_2500:
    movl $_L_2499, %eax
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
_L_2495:
     movl %eax, eh$uvector$uindex
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == uniquify-variables  ==>
# (lambda (f308) (error (list-ref (primitives) f308) "index out of bounds"))
# == vectorize-letrec  ==>
# (lambda (f308) (error (list-ref (primitives) f308) "index out of bounds"))
# == eliminate-set!  ==>
# (lambda (f308) (let ((f308 f308)) (error (list-ref (primitives) f308) "index out of bounds")))
# == close-free-variables  ==>
# (closure (f308) (error list-ref primitives) (let ((f308 f308)) (error (list-ref (primitives) f308) "index out of bounds")))
# == eliminate-quote  ==>
# (closure (f308) (error list-ref primitives) (let ((f308 f308)) (error (list-ref (primitives) f308) "index out of bounds")))
# == eliminate-when/unless  ==>
# (closure (f308) (error list-ref primitives) (let ((f308 f308)) (error (list-ref (primitives) f308) "index out of bounds")))
# == eliminate-cond  ==>
# (closure (f308) (error list-ref primitives) (let ((f308 f308)) (error (list-ref (primitives) f308) "index out of bounds")))
# == external-symbols  ==>
# (closure (f308) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f308 f308)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f308) "index out of bounds")))
# emit-expr (closure (f308) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f308 f308)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f308) "index out of bounds")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f308) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f308 f308)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f308) "index out of bounds")))
    movl $_L_2501, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_2502            # jump around closure body
_L_2501:
# check argument count
    cmp $4,%eax
    je _L_2503
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_2503:
# emit-tail-expr
# si=-12
# env=((f308 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f308 f308)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f308) "index out of bounds"))
# emit-tail-let
#  si   = -12
#  env  = ((f308 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f308 f308))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f308) "index out of bounds")
# emit-expr f308
# emit-variable-ref
# env=((f308 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f308
    movl -8(%esp), %eax  # stack load f308
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f308 . -12) (f308 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f308) "index out of bounds")
# emit-tail-funcall
#    si   =-16
#    env  = ((f308 . -12) (f308 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f308) "index out of bounds")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f308)
# funcall
#    si   =-20
#    env  = ((f308 . -12) (f308 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f308)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2504"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2504":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f308 . -12) (f308 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2505"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2505":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f308
# emit-variable-ref
# env=((f308 . -12) (f308 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f308
    movl -12(%esp), %eax  # stack load f308
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f308
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f308)
# emit-expr "index out of bounds"
# string literal
    jmp _L_2507
    .align 8,0x90
_L_2506 :
    .int 76
    .ascii "index out of bounds"
_L_2507:
    movl $_L_2506, %eax
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
_L_2502:
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
