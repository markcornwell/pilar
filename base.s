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
# (let ((f1122 (cons (make-symbol "nil" ()) ()))) (lambda () f1122))
# == vectorize-letrec  ==>
# (let ((f1122 (cons (make-symbol "nil" ()) ()))) (lambda () f1122))
# == eliminate-set!  ==>
# (let ((f1122 (cons (make-symbol "nil" ()) ()))) (lambda () (let () f1122)))
# == close-free-variables  ==>
# (let ((f1122 (cons (make-symbol "nil" ()) ()))) (closure () (f1122) (let () f1122)))
# == eliminate-quote  ==>
# (let ((f1122 (cons (make-symbol "nil" ()) ()))) (closure () (f1122) (let () f1122)))
# == eliminate-when/unless  ==>
# (let ((f1122 (cons (make-symbol "nil" ()) ()))) (closure () (f1122) (let () f1122)))
# == eliminate-cond  ==>
# (let ((f1122 (cons (make-symbol "nil" ()) ()))) (closure () (f1122) (let () f1122)))
# == external-symbols  ==>
# (let ((f1122 (cons (make-symbol "nil" ()) ()))) (closure () (f1122) (let () f1122)))
# emit-expr (let ((f1122 (cons (make-symbol "nil" ()) ()))) (closure () (f1122) (let () f1122)))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f1122 (cons (make-symbol "nil" ()) ())))
#  body = (closure () (f1122) (let () f1122))
# emit-expr (cons (make-symbol "nil" ()) ())
# cons arg1=(make-symbol "nil" ()) arg2=()
# emit-expr (make-symbol "nil" ())
# make-symbol arg1="nil" arg2=()
# emit-expr "nil"
# string literal
    jmp _L_9403
    .align 8,0x90
_L_9402 :
    .int 12
    .ascii "nil"
_L_9403:
    movl $_L_9402, %eax
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
# emit-expr (closure () (f1122) (let () f1122))
# emit-closure
# si = -4
# env = ((f1122 . 0))
# expr = (closure () (f1122) (let () f1122))
    movl $_L_9404, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f1122 . 0))
# var=f1122
    movl 0(%esp), %eax  # stack load f1122
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f1122
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_9405            # jump around closure body
_L_9404:
# check argument count
    cmp $0,%eax
    je _L_9406
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_9406:
# emit-tail-expr
# si=-8
# env=((f1122 . 4) (f1122 . 0))
# expr=(let () f1122)
# emit-tail-let
#  si   = -8
#  env  = ((f1122 . 4) (f1122 . 0))
#  bindings = ()
#  body = f1122
# emit-tail-expr
# si=-8
# env=((f1122 . 4) (f1122 . 0))
# expr=f1122
# emit-tail-variable-ref
# emit-variable-ref
# env=((f1122 . 4) (f1122 . 0))
# var=f1122
    movl 2(%edi), %eax  # frame load f1122
# end emit-variable-ref
    ret
# end emit-tail-variable ref
    .align 4,0x90
_L_9405:
     movl %eax, symbols
# == explicit-begins  ==>
# (letrec ((slen= (lambda (s1 s2) (fx= (string-length s1) (string-length s2)))) (si= (lambda (s1 s2 i) (char=? (string-ref s1 i) (string-ref s2 i)))) (si<n= (lambda (s1 s2 i n) (if (fx= i n) #t (if (si= s1 s2 i) (si<n= s1 s2 (fx+ i 1) n) #f)))) (ss= (lambda (s1 s2) (if (slen= s1 s2) (si<n= s1 s2 0 (string-length s1)) #f)))) ss=)
# == eliminate-let*  ==>
# (letrec ((slen= (lambda (s1 s2) (fx= (string-length s1) (string-length s2)))) (si= (lambda (s1 s2 i) (char=? (string-ref s1 i) (string-ref s2 i)))) (si<n= (lambda (s1 s2 i n) (if (fx= i n) #t (if (si= s1 s2 i) (si<n= s1 s2 (fx+ i 1) n) #f)))) (ss= (lambda (s1 s2) (if (slen= s1 s2) (si<n= s1 s2 0 (string-length s1)) #f)))) ss=)
# == uniquify-variables  ==>
# (letrec ((f1126 (lambda (f1147 f1148) (fx= (string-length f1147) (string-length f1148)))) (f1125 (lambda (f1144 f1145 f1146) (char=? (string-ref f1144 f1146) (string-ref f1145 f1146)))) (f1124 (lambda (f1140 f1141 f1142 f1143) (if (fx= f1142 f1143) #t (if (f1125 f1140 f1141 f1142) (f1124 f1140 f1141 (fx+ f1142 1) f1143) #f)))) (f1123 (lambda (f1138 f1139) (if (f1126 f1138 f1139) (f1124 f1138 f1139 0 (string-length f1138)) #f)))) f1123)
# == vectorize-letrec  ==>
# (let ((f1126 (make-vector 1)) (f1125 (make-vector 1)) (f1124 (make-vector 1)) (f1123 (make-vector 1))) (begin (begin (vector-set! f1126 0 (lambda (f1147 f1148) (fx= (string-length f1147) (string-length f1148)))) (vector-set! f1125 0 (lambda (f1144 f1145 f1146) (char=? (string-ref f1144 f1146) (string-ref f1145 f1146)))) (vector-set! f1124 0 (lambda (f1140 f1141 f1142 f1143) (if (fx= f1142 f1143) #t (if ((vector-ref f1125 0) f1140 f1141 f1142) ((vector-ref f1124 0) f1140 f1141 (fx+ f1142 1) f1143) #f)))) (vector-set! f1123 0 (lambda (f1138 f1139) (if ((vector-ref f1126 0) f1138 f1139) ((vector-ref f1124 0) f1138 f1139 0 (string-length f1138)) #f)))) (vector-ref f1123 0)))
# == eliminate-set!  ==>
# (let ((f1126 (make-vector 1)) (f1125 (make-vector 1)) (f1124 (make-vector 1)) (f1123 (make-vector 1))) (begin (begin (vector-set! f1126 0 (lambda (f1147 f1148) (let ((f1147 f1147) (f1148 f1148)) (fx= (string-length f1147) (string-length f1148))))) (vector-set! f1125 0 (lambda (f1144 f1145 f1146) (let ((f1144 f1144) (f1145 f1145) (f1146 f1146)) (char=? (string-ref f1144 f1146) (string-ref f1145 f1146))))) (vector-set! f1124 0 (lambda (f1140 f1141 f1142 f1143) (let ((f1140 f1140) (f1141 f1141) (f1142 f1142) (f1143 f1143)) (if (fx= f1142 f1143) #t (if ((vector-ref f1125 0) f1140 f1141 f1142) ((vector-ref f1124 0) f1140 f1141 (fx+ f1142 1) f1143) #f))))) (vector-set! f1123 0 (lambda (f1138 f1139) (let ((f1138 f1138) (f1139 f1139)) (if ((vector-ref f1126 0) f1138 f1139) ((vector-ref f1124 0) f1138 f1139 0 (string-length f1138)) #f))))) (vector-ref f1123 0)))
# == close-free-variables  ==>
# (let ((f1126 (make-vector 1)) (f1125 (make-vector 1)) (f1124 (make-vector 1)) (f1123 (make-vector 1))) (begin (begin (vector-set! f1126 0 (closure (f1147 f1148) () (let ((f1147 f1147) (f1148 f1148)) (fx= (string-length f1147) (string-length f1148))))) (vector-set! f1125 0 (closure (f1144 f1145 f1146) () (let ((f1144 f1144) (f1145 f1145) (f1146 f1146)) (char=? (string-ref f1144 f1146) (string-ref f1145 f1146))))) (vector-set! f1124 0 (closure (f1140 f1141 f1142 f1143) (f1125 f1124) (let ((f1140 f1140) (f1141 f1141) (f1142 f1142) (f1143 f1143)) (if (fx= f1142 f1143) #t (if ((vector-ref f1125 0) f1140 f1141 f1142) ((vector-ref f1124 0) f1140 f1141 (fx+ f1142 1) f1143) #f))))) (vector-set! f1123 0 (closure (f1138 f1139) (f1126 f1124) (let ((f1138 f1138) (f1139 f1139)) (if ((vector-ref f1126 0) f1138 f1139) ((vector-ref f1124 0) f1138 f1139 0 (string-length f1138)) #f))))) (vector-ref f1123 0)))
# == eliminate-quote  ==>
# (let ((f1126 (make-vector 1)) (f1125 (make-vector 1)) (f1124 (make-vector 1)) (f1123 (make-vector 1))) (begin (begin (vector-set! f1126 0 (closure (f1147 f1148) () (let ((f1147 f1147) (f1148 f1148)) (fx= (string-length f1147) (string-length f1148))))) (vector-set! f1125 0 (closure (f1144 f1145 f1146) () (let ((f1144 f1144) (f1145 f1145) (f1146 f1146)) (char=? (string-ref f1144 f1146) (string-ref f1145 f1146))))) (vector-set! f1124 0 (closure (f1140 f1141 f1142 f1143) (f1125 f1124) (let ((f1140 f1140) (f1141 f1141) (f1142 f1142) (f1143 f1143)) (if (fx= f1142 f1143) #t (if ((vector-ref f1125 0) f1140 f1141 f1142) ((vector-ref f1124 0) f1140 f1141 (fx+ f1142 1) f1143) #f))))) (vector-set! f1123 0 (closure (f1138 f1139) (f1126 f1124) (let ((f1138 f1138) (f1139 f1139)) (if ((vector-ref f1126 0) f1138 f1139) ((vector-ref f1124 0) f1138 f1139 0 (string-length f1138)) #f))))) (vector-ref f1123 0)))
# == eliminate-when/unless  ==>
# (let ((f1126 (make-vector 1)) (f1125 (make-vector 1)) (f1124 (make-vector 1)) (f1123 (make-vector 1))) (begin (begin (vector-set! f1126 0 (closure (f1147 f1148) () (let ((f1147 f1147) (f1148 f1148)) (fx= (string-length f1147) (string-length f1148))))) (vector-set! f1125 0 (closure (f1144 f1145 f1146) () (let ((f1144 f1144) (f1145 f1145) (f1146 f1146)) (char=? (string-ref f1144 f1146) (string-ref f1145 f1146))))) (vector-set! f1124 0 (closure (f1140 f1141 f1142 f1143) (f1125 f1124) (let ((f1140 f1140) (f1141 f1141) (f1142 f1142) (f1143 f1143)) (if (fx= f1142 f1143) #t (if ((vector-ref f1125 0) f1140 f1141 f1142) ((vector-ref f1124 0) f1140 f1141 (fx+ f1142 1) f1143) #f))))) (vector-set! f1123 0 (closure (f1138 f1139) (f1126 f1124) (let ((f1138 f1138) (f1139 f1139)) (if ((vector-ref f1126 0) f1138 f1139) ((vector-ref f1124 0) f1138 f1139 0 (string-length f1138)) #f))))) (vector-ref f1123 0)))
# == eliminate-cond  ==>
# (let ((f1126 (make-vector 1)) (f1125 (make-vector 1)) (f1124 (make-vector 1)) (f1123 (make-vector 1))) (begin (begin (vector-set! f1126 0 (closure (f1147 f1148) () (let ((f1147 f1147) (f1148 f1148)) (fx= (string-length f1147) (string-length f1148))))) (vector-set! f1125 0 (closure (f1144 f1145 f1146) () (let ((f1144 f1144) (f1145 f1145) (f1146 f1146)) (char=? (string-ref f1144 f1146) (string-ref f1145 f1146))))) (vector-set! f1124 0 (closure (f1140 f1141 f1142 f1143) (f1125 f1124) (let ((f1140 f1140) (f1141 f1141) (f1142 f1142) (f1143 f1143)) (if (fx= f1142 f1143) #t (if ((vector-ref f1125 0) f1140 f1141 f1142) ((vector-ref f1124 0) f1140 f1141 (fx+ f1142 1) f1143) #f))))) (vector-set! f1123 0 (closure (f1138 f1139) (f1126 f1124) (let ((f1138 f1138) (f1139 f1139)) (if ((vector-ref f1126 0) f1138 f1139) ((vector-ref f1124 0) f1138 f1139 0 (string-length f1138)) #f))))) (vector-ref f1123 0)))
# == external-symbols  ==>
# (let ((f1126 (make-vector 1)) (f1125 (make-vector 1)) (f1124 (make-vector 1)) (f1123 (make-vector 1))) (begin (begin (vector-set! f1126 0 (closure (f1147 f1148) () (let ((f1147 f1147) (f1148 f1148)) (fx= (string-length f1147) (string-length f1148))))) (vector-set! f1125 0 (closure (f1144 f1145 f1146) () (let ((f1144 f1144) (f1145 f1145) (f1146 f1146)) (char=? (string-ref f1144 f1146) (string-ref f1145 f1146))))) (vector-set! f1124 0 (closure (f1140 f1141 f1142 f1143) (f1125 f1124) (let ((f1140 f1140) (f1141 f1141) (f1142 f1142) (f1143 f1143)) (if (fx= f1142 f1143) #t (if ((vector-ref f1125 0) f1140 f1141 f1142) ((vector-ref f1124 0) f1140 f1141 (fx+ f1142 1) f1143) #f))))) (vector-set! f1123 0 (closure (f1138 f1139) (f1126 f1124) (let ((f1138 f1138) (f1139 f1139)) (if ((vector-ref f1126 0) f1138 f1139) ((vector-ref f1124 0) f1138 f1139 0 (string-length f1138)) #f))))) (vector-ref f1123 0)))
# emit-expr (let ((f1126 (make-vector 1)) (f1125 (make-vector 1)) (f1124 (make-vector 1)) (f1123 (make-vector 1))) (begin (begin (vector-set! f1126 0 (closure (f1147 f1148) () (let ((f1147 f1147) (f1148 f1148)) (fx= (string-length f1147) (string-length f1148))))) (vector-set! f1125 0 (closure (f1144 f1145 f1146) () (let ((f1144 f1144) (f1145 f1145) (f1146 f1146)) (char=? (string-ref f1144 f1146) (string-ref f1145 f1146))))) (vector-set! f1124 0 (closure (f1140 f1141 f1142 f1143) (f1125 f1124) (let ((f1140 f1140) (f1141 f1141) (f1142 f1142) (f1143 f1143)) (if (fx= f1142 f1143) #t (if ((vector-ref f1125 0) f1140 f1141 f1142) ((vector-ref f1124 0) f1140 f1141 (fx+ f1142 1) f1143) #f))))) (vector-set! f1123 0 (closure (f1138 f1139) (f1126 f1124) (let ((f1138 f1138) (f1139 f1139)) (if ((vector-ref f1126 0) f1138 f1139) ((vector-ref f1124 0) f1138 f1139 0 (string-length f1138)) #f))))) (vector-ref f1123 0)))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f1126 (make-vector 1)) (f1125 (make-vector 1)) (f1124 (make-vector 1)) (f1123 (make-vector 1)))
#  body = (begin (begin (vector-set! f1126 0 (closure (f1147 f1148) () (let ((f1147 f1147) (f1148 f1148)) (fx= (string-length f1147) (string-length f1148))))) (vector-set! f1125 0 (closure (f1144 f1145 f1146) () (let ((f1144 f1144) (f1145 f1145) (f1146 f1146)) (char=? (string-ref f1144 f1146) (string-ref f1145 f1146))))) (vector-set! f1124 0 (closure (f1140 f1141 f1142 f1143) (f1125 f1124) (let ((f1140 f1140) (f1141 f1141) (f1142 f1142) (f1143 f1143)) (if (fx= f1142 f1143) #t (if ((vector-ref f1125 0) f1140 f1141 f1142) ((vector-ref f1124 0) f1140 f1141 (fx+ f1142 1) f1143) #f))))) (vector-set! f1123 0 (closure (f1138 f1139) (f1126 f1124) (let ((f1138 f1138) (f1139 f1139)) (if ((vector-ref f1126 0) f1138 f1139) ((vector-ref f1124 0) f1138 f1139 0 (string-length f1138)) #f))))) (vector-ref f1123 0))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9407"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9407:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_9408
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9408:
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
    je "_L_9409"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9409:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_9410
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9410:
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
    je "_L_9411"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9411:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_9412
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9412:
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
    je "_L_9413"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9413:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_9414
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9414:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, -12(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f1126 0 (closure (f1147 f1148) () (let ((f1147 f1147) (f1148 f1148)) (fx= (string-length f1147) (string-length f1148))))) (vector-set! f1125 0 (closure (f1144 f1145 f1146) () (let ((f1144 f1144) (f1145 f1145) (f1146 f1146)) (char=? (string-ref f1144 f1146) (string-ref f1145 f1146))))) (vector-set! f1124 0 (closure (f1140 f1141 f1142 f1143) (f1125 f1124) (let ((f1140 f1140) (f1141 f1141) (f1142 f1142) (f1143 f1143)) (if (fx= f1142 f1143) #t (if ((vector-ref f1125 0) f1140 f1141 f1142) ((vector-ref f1124 0) f1140 f1141 (fx+ f1142 1) f1143) #f))))) (vector-set! f1123 0 (closure (f1138 f1139) (f1126 f1124) (let ((f1138 f1138) (f1139 f1139)) (if ((vector-ref f1126 0) f1138 f1139) ((vector-ref f1124 0) f1138 f1139 0 (string-length f1138)) #f))))) (vector-ref f1123 0))
# emit-begin
#   expr=(begin (begin (vector-set! f1126 0 (closure (f1147 f1148) () (let ((f1147 f1147) (f1148 f1148)) (fx= (string-length f1147) (string-length f1148))))) (vector-set! f1125 0 (closure (f1144 f1145 f1146) () (let ((f1144 f1144) (f1145 f1145) (f1146 f1146)) (char=? (string-ref f1144 f1146) (string-ref f1145 f1146))))) (vector-set! f1124 0 (closure (f1140 f1141 f1142 f1143) (f1125 f1124) (let ((f1140 f1140) (f1141 f1141) (f1142 f1142) (f1143 f1143)) (if (fx= f1142 f1143) #t (if ((vector-ref f1125 0) f1140 f1141 f1142) ((vector-ref f1124 0) f1140 f1141 (fx+ f1142 1) f1143) #f))))) (vector-set! f1123 0 (closure (f1138 f1139) (f1126 f1124) (let ((f1138 f1138) (f1139 f1139)) (if ((vector-ref f1126 0) f1138 f1139) ((vector-ref f1124 0) f1138 f1139 0 (string-length f1138)) #f))))) (vector-ref f1123 0))
#   env=((f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# emit-expr (begin (vector-set! f1126 0 (closure (f1147 f1148) () (let ((f1147 f1147) (f1148 f1148)) (fx= (string-length f1147) (string-length f1148))))) (vector-set! f1125 0 (closure (f1144 f1145 f1146) () (let ((f1144 f1144) (f1145 f1145) (f1146 f1146)) (char=? (string-ref f1144 f1146) (string-ref f1145 f1146))))) (vector-set! f1124 0 (closure (f1140 f1141 f1142 f1143) (f1125 f1124) (let ((f1140 f1140) (f1141 f1141) (f1142 f1142) (f1143 f1143)) (if (fx= f1142 f1143) #t (if ((vector-ref f1125 0) f1140 f1141 f1142) ((vector-ref f1124 0) f1140 f1141 (fx+ f1142 1) f1143) #f))))) (vector-set! f1123 0 (closure (f1138 f1139) (f1126 f1124) (let ((f1138 f1138) (f1139 f1139)) (if ((vector-ref f1126 0) f1138 f1139) ((vector-ref f1124 0) f1138 f1139 0 (string-length f1138)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f1126 0 (closure (f1147 f1148) () (let ((f1147 f1147) (f1148 f1148)) (fx= (string-length f1147) (string-length f1148))))) (vector-set! f1125 0 (closure (f1144 f1145 f1146) () (let ((f1144 f1144) (f1145 f1145) (f1146 f1146)) (char=? (string-ref f1144 f1146) (string-ref f1145 f1146))))) (vector-set! f1124 0 (closure (f1140 f1141 f1142 f1143) (f1125 f1124) (let ((f1140 f1140) (f1141 f1141) (f1142 f1142) (f1143 f1143)) (if (fx= f1142 f1143) #t (if ((vector-ref f1125 0) f1140 f1141 f1142) ((vector-ref f1124 0) f1140 f1141 (fx+ f1142 1) f1143) #f))))) (vector-set! f1123 0 (closure (f1138 f1139) (f1126 f1124) (let ((f1138 f1138) (f1139 f1139)) (if ((vector-ref f1126 0) f1138 f1139) ((vector-ref f1124 0) f1138 f1139 0 (string-length f1138)) #f)))))
#   env=((f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# emit-expr (vector-set! f1126 0 (closure (f1147 f1148) () (let ((f1147 f1147) (f1148 f1148)) (fx= (string-length f1147) (string-length f1148)))))
# emit-expr f1126
# emit-variable-ref
# env=((f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1126
    movl 0(%esp), %eax  # stack load f1126
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9415
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9415:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9416"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9416:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9418
    cmp  $0,%eax
    jge _L_9417
_L_9418:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9417:
    movl %eax, -20(%esp)
# emit-expr (closure (f1147 f1148) () (let ((f1147 f1147) (f1148 f1148)) (fx= (string-length f1147) (string-length f1148))))
# emit-closure
# si = -24
# env = ((f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# expr = (closure (f1147 f1148) () (let ((f1147 f1147) (f1148 f1148)) (fx= (string-length f1147) (string-length f1148))))
    movl $_L_9419, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_9420            # jump around closure body
_L_9419:
# check argument count
    cmp $8,%eax
    je _L_9421
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_9421:
# emit-tail-expr
# si=-16
# env=((f1148 . -12) (f1147 . -8) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# expr=(let ((f1147 f1147) (f1148 f1148)) (fx= (string-length f1147) (string-length f1148)))
# emit-tail-let
#  si   = -16
#  env  = ((f1148 . -12) (f1147 . -8) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
#  bindings = ((f1147 f1147) (f1148 f1148))
#  body = (fx= (string-length f1147) (string-length f1148))
# emit-expr f1147
# emit-variable-ref
# env=((f1148 . -12) (f1147 . -8) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1147
    movl -8(%esp), %eax  # stack load f1147
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f1148
# emit-variable-ref
# env=((f1148 . -12) (f1147 . -8) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1148
    movl -12(%esp), %eax  # stack load f1148
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f1148 . -20) (f1147 . -16) (f1148 . -12) (f1147 . -8) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# expr=(fx= (string-length f1147) (string-length f1148))
# tail primcall
# emit-expr (string-length f1148)
# emit-expr f1148
# emit-variable-ref
# env=((f1148 . -20) (f1147 . -16) (f1148 . -12) (f1147 . -8) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1148
    movl -20(%esp), %eax  # stack load f1148
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_9422
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9422:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9423"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9423:
    movl %eax, -24(%esp)
# emit-expr (string-length f1147)
# emit-expr f1147
# emit-variable-ref
# env=((f1148 . -20) (f1147 . -16) (f1148 . -12) (f1147 . -8) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1147
    movl -16(%esp), %eax  # stack load f1147
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_9424
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9424:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9425"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9425:
    cmp -24(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
#return from tail (fx= (string-length f1147) (string-length f1148))
    ret
    .align 4,0x90
_L_9420:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1125 0 (closure (f1144 f1145 f1146) () (let ((f1144 f1144) (f1145 f1145) (f1146 f1146)) (char=? (string-ref f1144 f1146) (string-ref f1145 f1146))))) (vector-set! f1124 0 (closure (f1140 f1141 f1142 f1143) (f1125 f1124) (let ((f1140 f1140) (f1141 f1141) (f1142 f1142) (f1143 f1143)) (if (fx= f1142 f1143) #t (if ((vector-ref f1125 0) f1140 f1141 f1142) ((vector-ref f1124 0) f1140 f1141 (fx+ f1142 1) f1143) #f))))) (vector-set! f1123 0 (closure (f1138 f1139) (f1126 f1124) (let ((f1138 f1138) (f1139 f1139)) (if ((vector-ref f1126 0) f1138 f1139) ((vector-ref f1124 0) f1138 f1139 0 (string-length f1138)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f1125 0 (closure (f1144 f1145 f1146) () (let ((f1144 f1144) (f1145 f1145) (f1146 f1146)) (char=? (string-ref f1144 f1146) (string-ref f1145 f1146))))) (vector-set! f1124 0 (closure (f1140 f1141 f1142 f1143) (f1125 f1124) (let ((f1140 f1140) (f1141 f1141) (f1142 f1142) (f1143 f1143)) (if (fx= f1142 f1143) #t (if ((vector-ref f1125 0) f1140 f1141 f1142) ((vector-ref f1124 0) f1140 f1141 (fx+ f1142 1) f1143) #f))))) (vector-set! f1123 0 (closure (f1138 f1139) (f1126 f1124) (let ((f1138 f1138) (f1139 f1139)) (if ((vector-ref f1126 0) f1138 f1139) ((vector-ref f1124 0) f1138 f1139 0 (string-length f1138)) #f)))))
#   env=((f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# emit-expr (vector-set! f1125 0 (closure (f1144 f1145 f1146) () (let ((f1144 f1144) (f1145 f1145) (f1146 f1146)) (char=? (string-ref f1144 f1146) (string-ref f1145 f1146)))))
# emit-expr f1125
# emit-variable-ref
# env=((f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1125
    movl -4(%esp), %eax  # stack load f1125
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9426
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9426:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9427"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9427:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9429
    cmp  $0,%eax
    jge _L_9428
_L_9429:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9428:
    movl %eax, -20(%esp)
# emit-expr (closure (f1144 f1145 f1146) () (let ((f1144 f1144) (f1145 f1145) (f1146 f1146)) (char=? (string-ref f1144 f1146) (string-ref f1145 f1146))))
# emit-closure
# si = -24
# env = ((f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# expr = (closure (f1144 f1145 f1146) () (let ((f1144 f1144) (f1145 f1145) (f1146 f1146)) (char=? (string-ref f1144 f1146) (string-ref f1145 f1146))))
    movl $_L_9430, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_9431            # jump around closure body
_L_9430:
# check argument count
    cmp $12,%eax
    je _L_9432
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_9432:
# emit-tail-expr
# si=-20
# env=((f1146 . -16) (f1145 . -12) (f1144 . -8) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# expr=(let ((f1144 f1144) (f1145 f1145) (f1146 f1146)) (char=? (string-ref f1144 f1146) (string-ref f1145 f1146)))
# emit-tail-let
#  si   = -20
#  env  = ((f1146 . -16) (f1145 . -12) (f1144 . -8) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
#  bindings = ((f1144 f1144) (f1145 f1145) (f1146 f1146))
#  body = (char=? (string-ref f1144 f1146) (string-ref f1145 f1146))
# emit-expr f1144
# emit-variable-ref
# env=((f1146 . -16) (f1145 . -12) (f1144 . -8) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1144
    movl -8(%esp), %eax  # stack load f1144
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-expr f1145
# emit-variable-ref
# env=((f1146 . -16) (f1145 . -12) (f1144 . -8) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1145
    movl -12(%esp), %eax  # stack load f1145
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f1146
# emit-variable-ref
# env=((f1146 . -16) (f1145 . -12) (f1144 . -8) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1146
    movl -16(%esp), %eax  # stack load f1146
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-tail-expr
# si=-32
# env=((f1146 . -28) (f1145 . -24) (f1144 . -20) (f1146 . -16) (f1145 . -12) (f1144 . -8) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# expr=(char=? (string-ref f1144 f1146) (string-ref f1145 f1146))
# tail primcall
# char= c1=(string-ref f1144 f1146) c2=(string-ref f1145 f1146)
# emit-expr (string-ref f1144 f1146)
# emit-expr f1144
# emit-variable-ref
# env=((f1146 . -28) (f1145 . -24) (f1144 . -20) (f1146 . -16) (f1145 . -12) (f1144 . -8) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1144
    movl -20(%esp), %eax  # stack load f1144
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_9433
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $156,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9433:
    movl %eax, -32(%esp)
# emit-expr f1146
# emit-variable-ref
# env=((f1146 . -28) (f1145 . -24) (f1144 . -20) (f1146 . -16) (f1145 . -12) (f1144 . -8) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1146
    movl -28(%esp), %eax  # stack load f1146
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9434"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $156,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9434:
# check bounds on string index
    movl -32(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_9436
    cmp  $0,%eax
    jge _L_9435
_L_9436:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $156,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9435:
    sar $2, %eax
    movl -32(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_9437"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $32,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9437:
    movb %ah, -32(%esp)
# emit-expr (string-ref f1145 f1146)
# emit-expr f1145
# emit-variable-ref
# env=((f1146 . -28) (f1145 . -24) (f1144 . -20) (f1146 . -16) (f1145 . -12) (f1144 . -8) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1145
    movl -24(%esp), %eax  # stack load f1145
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_9438
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $156,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9438:
    movl %eax, -36(%esp)
# emit-expr f1146
# emit-variable-ref
# env=((f1146 . -28) (f1145 . -24) (f1144 . -20) (f1146 . -16) (f1145 . -12) (f1144 . -8) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1146
    movl -28(%esp), %eax  # stack load f1146
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9439"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $156,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9439:
# check bounds on string index
    movl -36(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_9441
    cmp  $0,%eax
    jge _L_9440
_L_9441:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $156,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9440:
    sar $2, %eax
    movl -36(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_9442"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $32,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9442:
    cmp %ah, -32(%esp)
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
#return from tail (char=? (string-ref f1144 f1146) (string-ref f1145 f1146))
    ret
    .align 4,0x90
_L_9431:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1124 0 (closure (f1140 f1141 f1142 f1143) (f1125 f1124) (let ((f1140 f1140) (f1141 f1141) (f1142 f1142) (f1143 f1143)) (if (fx= f1142 f1143) #t (if ((vector-ref f1125 0) f1140 f1141 f1142) ((vector-ref f1124 0) f1140 f1141 (fx+ f1142 1) f1143) #f))))) (vector-set! f1123 0 (closure (f1138 f1139) (f1126 f1124) (let ((f1138 f1138) (f1139 f1139)) (if ((vector-ref f1126 0) f1138 f1139) ((vector-ref f1124 0) f1138 f1139 0 (string-length f1138)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f1124 0 (closure (f1140 f1141 f1142 f1143) (f1125 f1124) (let ((f1140 f1140) (f1141 f1141) (f1142 f1142) (f1143 f1143)) (if (fx= f1142 f1143) #t (if ((vector-ref f1125 0) f1140 f1141 f1142) ((vector-ref f1124 0) f1140 f1141 (fx+ f1142 1) f1143) #f))))) (vector-set! f1123 0 (closure (f1138 f1139) (f1126 f1124) (let ((f1138 f1138) (f1139 f1139)) (if ((vector-ref f1126 0) f1138 f1139) ((vector-ref f1124 0) f1138 f1139 0 (string-length f1138)) #f)))))
#   env=((f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# emit-expr (vector-set! f1124 0 (closure (f1140 f1141 f1142 f1143) (f1125 f1124) (let ((f1140 f1140) (f1141 f1141) (f1142 f1142) (f1143 f1143)) (if (fx= f1142 f1143) #t (if ((vector-ref f1125 0) f1140 f1141 f1142) ((vector-ref f1124 0) f1140 f1141 (fx+ f1142 1) f1143) #f)))))
# emit-expr f1124
# emit-variable-ref
# env=((f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1124
    movl -8(%esp), %eax  # stack load f1124
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9443
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9443:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9444"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9444:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9446
    cmp  $0,%eax
    jge _L_9445
_L_9446:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9445:
    movl %eax, -20(%esp)
# emit-expr (closure (f1140 f1141 f1142 f1143) (f1125 f1124) (let ((f1140 f1140) (f1141 f1141) (f1142 f1142) (f1143 f1143)) (if (fx= f1142 f1143) #t (if ((vector-ref f1125 0) f1140 f1141 f1142) ((vector-ref f1124 0) f1140 f1141 (fx+ f1142 1) f1143) #f))))
# emit-closure
# si = -24
# env = ((f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# expr = (closure (f1140 f1141 f1142 f1143) (f1125 f1124) (let ((f1140 f1140) (f1141 f1141) (f1142 f1142) (f1143 f1143)) (if (fx= f1142 f1143) #t (if ((vector-ref f1125 0) f1140 f1141 f1142) ((vector-ref f1124 0) f1140 f1141 (fx+ f1142 1) f1143) #f))))
    movl $_L_9447, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1125
    movl -4(%esp), %eax  # stack load f1125
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f1125
# emit-variable-ref
# env=((f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1124
    movl -8(%esp), %eax  # stack load f1124
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f1124
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_9448            # jump around closure body
_L_9447:
# check argument count
    cmp $16,%eax
    je _L_9449
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_9449:
# emit-tail-expr
# si=-24
# env=((f1143 . -20) (f1142 . -16) (f1141 . -12) (f1140 . -8) (f1124 . 8) (f1125 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# expr=(let ((f1140 f1140) (f1141 f1141) (f1142 f1142) (f1143 f1143)) (if (fx= f1142 f1143) #t (if ((vector-ref f1125 0) f1140 f1141 f1142) ((vector-ref f1124 0) f1140 f1141 (fx+ f1142 1) f1143) #f)))
# emit-tail-let
#  si   = -24
#  env  = ((f1143 . -20) (f1142 . -16) (f1141 . -12) (f1140 . -8) (f1124 . 8) (f1125 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
#  bindings = ((f1140 f1140) (f1141 f1141) (f1142 f1142) (f1143 f1143))
#  body = (if (fx= f1142 f1143) #t (if ((vector-ref f1125 0) f1140 f1141 f1142) ((vector-ref f1124 0) f1140 f1141 (fx+ f1142 1) f1143) #f))
# emit-expr f1140
# emit-variable-ref
# env=((f1143 . -20) (f1142 . -16) (f1141 . -12) (f1140 . -8) (f1124 . 8) (f1125 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1140
    movl -8(%esp), %eax  # stack load f1140
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f1141
# emit-variable-ref
# env=((f1143 . -20) (f1142 . -16) (f1141 . -12) (f1140 . -8) (f1124 . 8) (f1125 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1141
    movl -12(%esp), %eax  # stack load f1141
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-expr f1142
# emit-variable-ref
# env=((f1143 . -20) (f1142 . -16) (f1141 . -12) (f1140 . -8) (f1124 . 8) (f1125 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1142
    movl -16(%esp), %eax  # stack load f1142
# end emit-variable-ref
    movl %eax, -32(%esp)  # stack save
# emit-expr f1143
# emit-variable-ref
# env=((f1143 . -20) (f1142 . -16) (f1141 . -12) (f1140 . -8) (f1124 . 8) (f1125 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1143
    movl -20(%esp), %eax  # stack load f1143
# end emit-variable-ref
    movl %eax, -36(%esp)  # stack save
# emit-tail-expr
# si=-40
# env=((f1143 . -36) (f1142 . -32) (f1141 . -28) (f1140 . -24) (f1143 . -20) (f1142 . -16) (f1141 . -12) (f1140 . -8) (f1124 . 8) (f1125 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# expr=(if (fx= f1142 f1143) #t (if ((vector-ref f1125 0) f1140 f1141 f1142) ((vector-ref f1124 0) f1140 f1141 (fx+ f1142 1) f1143) #f))
# emit-expr (fx= f1142 f1143)
# emit-expr f1143
# emit-variable-ref
# env=((f1143 . -36) (f1142 . -32) (f1141 . -28) (f1140 . -24) (f1143 . -20) (f1142 . -16) (f1141 . -12) (f1140 . -8) (f1124 . 8) (f1125 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1143
    movl -36(%esp), %eax  # stack load f1143
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9452"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9452:
    movl %eax, -40(%esp)
# emit-expr f1142
# emit-variable-ref
# env=((f1143 . -36) (f1142 . -32) (f1141 . -28) (f1140 . -24) (f1143 . -20) (f1142 . -16) (f1141 . -12) (f1140 . -8) (f1124 . 8) (f1125 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1142
    movl -32(%esp), %eax  # stack load f1142
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9453"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9453:
    cmp -40(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_9450
# emit-tail-expr
# si=-40
# env=((f1143 . -36) (f1142 . -32) (f1141 . -28) (f1140 . -24) (f1143 . -20) (f1142 . -16) (f1141 . -12) (f1140 . -8) (f1124 . 8) (f1125 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# expr=#t
    movl $111, %eax     # immed #t
    ret                  # immediate tail return
    jmp _L_9451
_L_9450:
# emit-tail-expr
# si=-40
# env=((f1143 . -36) (f1142 . -32) (f1141 . -28) (f1140 . -24) (f1143 . -20) (f1142 . -16) (f1141 . -12) (f1140 . -8) (f1124 . 8) (f1125 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# expr=(if ((vector-ref f1125 0) f1140 f1141 f1142) ((vector-ref f1124 0) f1140 f1141 (fx+ f1142 1) f1143) #f)
# emit-expr ((vector-ref f1125 0) f1140 f1141 f1142)
# funcall
#    si   =-40
#    env  = ((f1143 . -36) (f1142 . -32) (f1141 . -28) (f1140 . -24) (f1143 . -20) (f1142 . -16) (f1141 . -12) (f1140 . -8) (f1124 . 8) (f1125 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
#    expr = (funcall (vector-ref f1125 0) f1140 f1141 f1142)
# emit-expr (vector-ref f1125 0)
# emit-expr f1125
# emit-variable-ref
# env=((f1143 . -36) (f1142 . -32) (f1141 . -28) (f1140 . -24) (f1143 . -20) (f1142 . -16) (f1141 . -12) (f1140 . -8) (f1124 . 8) (f1125 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1125
    movl 2(%edi), %eax  # frame load f1125
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9456
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9456:
    movl %eax, -48(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9457"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9457:
# check bounds on vector index
    movl -48(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9459
    cmp  $0,%eax
    jge _L_9458
_L_9459:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9458:
    movl -48(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9460"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9460":
   movl %eax,  -48(%esp)  # stash funcall-oper in closure slot
# emit-expr f1140
# emit-variable-ref
# env=((f1143 . -36) (f1142 . -32) (f1141 . -28) (f1140 . -24) (f1143 . -20) (f1142 . -16) (f1141 . -12) (f1140 . -8) (f1124 . 8) (f1125 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1140
    movl -24(%esp), %eax  # stack load f1140
# end emit-variable-ref
    mov %eax, -52(%esp)  # arg f1140
# emit-expr f1141
# emit-variable-ref
# env=((f1143 . -36) (f1142 . -32) (f1141 . -28) (f1140 . -24) (f1143 . -20) (f1142 . -16) (f1141 . -12) (f1140 . -8) (f1124 . 8) (f1125 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1141
    movl -28(%esp), %eax  # stack load f1141
# end emit-variable-ref
    mov %eax, -56(%esp)  # arg f1141
# emit-expr f1142
# emit-variable-ref
# env=((f1143 . -36) (f1142 . -32) (f1141 . -28) (f1140 . -24) (f1143 . -20) (f1142 . -16) (f1141 . -12) (f1140 . -8) (f1124 . 8) (f1125 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1142
    movl -32(%esp), %eax  # stack load f1142
# end emit-variable-ref
    mov %eax, -60(%esp)  # arg f1142
    movl -48(%esp), %edi   # load new closure to %edi
    add $-40, %esp   # adjust base
    movl $12,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $40, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_9454
# emit-tail-expr
# si=-40
# env=((f1143 . -36) (f1142 . -32) (f1141 . -28) (f1140 . -24) (f1143 . -20) (f1142 . -16) (f1141 . -12) (f1140 . -8) (f1124 . 8) (f1125 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# expr=((vector-ref f1124 0) f1140 f1141 (fx+ f1142 1) f1143)
# emit-tail-funcall
#    si   =-40
#    env  = ((f1143 . -36) (f1142 . -32) (f1141 . -28) (f1140 . -24) (f1143 . -20) (f1142 . -16) (f1141 . -12) (f1140 . -8) (f1124 . 8) (f1125 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
#    expr = (funcall (vector-ref f1124 0) f1140 f1141 (fx+ f1142 1) f1143)
# emit-expr (vector-ref f1124 0)
# emit-expr f1124
# emit-variable-ref
# env=((f1143 . -36) (f1142 . -32) (f1141 . -28) (f1140 . -24) (f1143 . -20) (f1142 . -16) (f1141 . -12) (f1140 . -8) (f1124 . 8) (f1125 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1124
    movl 6(%edi), %eax  # frame load f1124
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9461
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9461:
    movl %eax, -40(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9462"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9462:
# check bounds on vector index
    movl -40(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9464
    cmp  $0,%eax
    jge _L_9463
_L_9464:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9463:
    movl -40(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -40(%esp)  # stash funcall-oper in next closure slot
# emit-expr f1140
# emit-variable-ref
# env=((f1143 . -36) (f1142 . -32) (f1141 . -28) (f1140 . -24) (f1143 . -20) (f1142 . -16) (f1141 . -12) (f1140 . -8) (f1124 . 8) (f1125 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1140
    movl -24(%esp), %eax  # stack load f1140
# end emit-variable-ref
    mov %eax, -44(%esp)    # arg f1140
# emit-expr f1141
# emit-variable-ref
# env=((f1143 . -36) (f1142 . -32) (f1141 . -28) (f1140 . -24) (f1143 . -20) (f1142 . -16) (f1141 . -12) (f1140 . -8) (f1124 . 8) (f1125 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1141
    movl -28(%esp), %eax  # stack load f1141
# end emit-variable-ref
    mov %eax, -48(%esp)    # arg f1141
# emit-expr (fx+ f1142 1)
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9465"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9465:
    movl %eax, -52(%esp)  # fx+ push arg1
# emit-expr f1142
# emit-variable-ref
# env=((f1143 . -36) (f1142 . -32) (f1141 . -28) (f1140 . -24) (f1143 . -20) (f1142 . -16) (f1141 . -12) (f1140 . -8) (f1124 . 8) (f1125 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1142
    movl -32(%esp), %eax  # stack load f1142
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9466"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9466:
    addl -52(%esp), %eax  # fx+ arg1 arg2
    mov %eax, -52(%esp)    # arg (fx+ f1142 1)
# emit-expr f1143
# emit-variable-ref
# env=((f1143 . -36) (f1142 . -32) (f1141 . -28) (f1140 . -24) (f1143 . -20) (f1142 . -16) (f1141 . -12) (f1140 . -8) (f1124 . 8) (f1125 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1143
    movl -36(%esp), %eax  # stack load f1143
# end emit-variable-ref
    mov %eax, -56(%esp)    # arg f1143
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
    jmp _L_9455
_L_9454:
# emit-tail-expr
# si=-40
# env=((f1143 . -36) (f1142 . -32) (f1141 . -28) (f1140 . -24) (f1143 . -20) (f1142 . -16) (f1141 . -12) (f1140 . -8) (f1124 . 8) (f1125 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_9455:
_L_9451:
    .align 4,0x90
_L_9448:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1123 0 (closure (f1138 f1139) (f1126 f1124) (let ((f1138 f1138) (f1139 f1139)) (if ((vector-ref f1126 0) f1138 f1139) ((vector-ref f1124 0) f1138 f1139 0 (string-length f1138)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f1123 0 (closure (f1138 f1139) (f1126 f1124) (let ((f1138 f1138) (f1139 f1139)) (if ((vector-ref f1126 0) f1138 f1139) ((vector-ref f1124 0) f1138 f1139 0 (string-length f1138)) #f)))))
#   env=((f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# emit-expr (vector-set! f1123 0 (closure (f1138 f1139) (f1126 f1124) (let ((f1138 f1138) (f1139 f1139)) (if ((vector-ref f1126 0) f1138 f1139) ((vector-ref f1124 0) f1138 f1139 0 (string-length f1138)) #f))))
# emit-expr f1123
# emit-variable-ref
# env=((f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1123
    movl -12(%esp), %eax  # stack load f1123
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9467
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9467:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9468"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9468:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9470
    cmp  $0,%eax
    jge _L_9469
_L_9470:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9469:
    movl %eax, -20(%esp)
# emit-expr (closure (f1138 f1139) (f1126 f1124) (let ((f1138 f1138) (f1139 f1139)) (if ((vector-ref f1126 0) f1138 f1139) ((vector-ref f1124 0) f1138 f1139 0 (string-length f1138)) #f)))
# emit-closure
# si = -24
# env = ((f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# expr = (closure (f1138 f1139) (f1126 f1124) (let ((f1138 f1138) (f1139 f1139)) (if ((vector-ref f1126 0) f1138 f1139) ((vector-ref f1124 0) f1138 f1139 0 (string-length f1138)) #f)))
    movl $_L_9471, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1126
    movl 0(%esp), %eax  # stack load f1126
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f1126
# emit-variable-ref
# env=((f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1124
    movl -8(%esp), %eax  # stack load f1124
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f1124
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_9472            # jump around closure body
_L_9471:
# check argument count
    cmp $8,%eax
    je _L_9473
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_9473:
# emit-tail-expr
# si=-16
# env=((f1139 . -12) (f1138 . -8) (f1124 . 8) (f1126 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# expr=(let ((f1138 f1138) (f1139 f1139)) (if ((vector-ref f1126 0) f1138 f1139) ((vector-ref f1124 0) f1138 f1139 0 (string-length f1138)) #f))
# emit-tail-let
#  si   = -16
#  env  = ((f1139 . -12) (f1138 . -8) (f1124 . 8) (f1126 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
#  bindings = ((f1138 f1138) (f1139 f1139))
#  body = (if ((vector-ref f1126 0) f1138 f1139) ((vector-ref f1124 0) f1138 f1139 0 (string-length f1138)) #f)
# emit-expr f1138
# emit-variable-ref
# env=((f1139 . -12) (f1138 . -8) (f1124 . 8) (f1126 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1138
    movl -8(%esp), %eax  # stack load f1138
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f1139
# emit-variable-ref
# env=((f1139 . -12) (f1138 . -8) (f1124 . 8) (f1126 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1139
    movl -12(%esp), %eax  # stack load f1139
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f1139 . -20) (f1138 . -16) (f1139 . -12) (f1138 . -8) (f1124 . 8) (f1126 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# expr=(if ((vector-ref f1126 0) f1138 f1139) ((vector-ref f1124 0) f1138 f1139 0 (string-length f1138)) #f)
# emit-expr ((vector-ref f1126 0) f1138 f1139)
# funcall
#    si   =-24
#    env  = ((f1139 . -20) (f1138 . -16) (f1139 . -12) (f1138 . -8) (f1124 . 8) (f1126 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
#    expr = (funcall (vector-ref f1126 0) f1138 f1139)
# emit-expr (vector-ref f1126 0)
# emit-expr f1126
# emit-variable-ref
# env=((f1139 . -20) (f1138 . -16) (f1139 . -12) (f1138 . -8) (f1124 . 8) (f1126 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1126
    movl 2(%edi), %eax  # frame load f1126
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9476
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9476:
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9477"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9477:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9479
    cmp  $0,%eax
    jge _L_9478
_L_9479:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9478:
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9480"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9480":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f1138
# emit-variable-ref
# env=((f1139 . -20) (f1138 . -16) (f1139 . -12) (f1138 . -8) (f1124 . 8) (f1126 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1138
    movl -16(%esp), %eax  # stack load f1138
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f1138
# emit-expr f1139
# emit-variable-ref
# env=((f1139 . -20) (f1138 . -16) (f1139 . -12) (f1138 . -8) (f1124 . 8) (f1126 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1139
    movl -20(%esp), %eax  # stack load f1139
# end emit-variable-ref
    mov %eax, -40(%esp)  # arg f1139
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_9474
# emit-tail-expr
# si=-24
# env=((f1139 . -20) (f1138 . -16) (f1139 . -12) (f1138 . -8) (f1124 . 8) (f1126 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# expr=((vector-ref f1124 0) f1138 f1139 0 (string-length f1138))
# emit-tail-funcall
#    si   =-24
#    env  = ((f1139 . -20) (f1138 . -16) (f1139 . -12) (f1138 . -8) (f1124 . 8) (f1126 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
#    expr = (funcall (vector-ref f1124 0) f1138 f1139 0 (string-length f1138))
# emit-expr (vector-ref f1124 0)
# emit-expr f1124
# emit-variable-ref
# env=((f1139 . -20) (f1138 . -16) (f1139 . -12) (f1138 . -8) (f1124 . 8) (f1126 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1124
    movl 6(%edi), %eax  # frame load f1124
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9481
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9481:
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9482"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9482:
# check bounds on vector index
    movl -24(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9484
    cmp  $0,%eax
    jge _L_9483
_L_9484:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9483:
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr f1138
# emit-variable-ref
# env=((f1139 . -20) (f1138 . -16) (f1139 . -12) (f1138 . -8) (f1124 . 8) (f1126 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1138
    movl -16(%esp), %eax  # stack load f1138
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f1138
# emit-expr f1139
# emit-variable-ref
# env=((f1139 . -20) (f1138 . -16) (f1139 . -12) (f1138 . -8) (f1124 . 8) (f1126 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1139
    movl -20(%esp), %eax  # stack load f1139
# end emit-variable-ref
    mov %eax, -32(%esp)    # arg f1139
# emit-expr 0
    movl $0, %eax     # immed 0
    mov %eax, -36(%esp)    # arg 0
# emit-expr (string-length f1138)
# emit-expr f1138
# emit-variable-ref
# env=((f1139 . -20) (f1138 . -16) (f1139 . -12) (f1138 . -8) (f1124 . 8) (f1126 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1138
    movl -16(%esp), %eax  # stack load f1138
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_9485
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9485:
    movl -6(%eax), %eax
    mov %eax, -40(%esp)    # arg (string-length f1138)
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
    jmp _L_9475
_L_9474:
# emit-tail-expr
# si=-24
# env=((f1139 . -20) (f1138 . -16) (f1139 . -12) (f1138 . -8) (f1124 . 8) (f1126 . 4) (f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_9475:
    .align 4,0x90
_L_9472:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# emit-expr (begin (vector-ref f1123 0))
# emit-begin
#   expr=(begin (vector-ref f1123 0))
#   env=((f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# emit-expr (vector-ref f1123 0)
# emit-expr f1123
# emit-variable-ref
# env=((f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
# var=f1123
    movl -12(%esp), %eax  # stack load f1123
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
    movl $140,-8(%esp)
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
    movl $140,-8(%esp)
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
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9488:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f1123 . -12) (f1124 . -8) (f1125 . -4) (f1126 . 0))
     movl %eax, string$e$q
# == explicit-begins  ==>
# (letrec ((str->sym (lambda (str symlist) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let* ((new-sym (make-symbol str #f)) (new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym)) (str->sym str (cdr symlist))))))) (lambda (str) (str->sym str (symbols))))
# == eliminate-let*  ==>
# (letrec ((str->sym (lambda (str symlist) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) (str->sym str (cdr symlist))))))) (lambda (str) (str->sym str (symbols))))
# == uniquify-variables  ==>
# (letrec ((f1149 (lambda (f1158 f1159) (if (string=? f1158 (symbol->string (car f1159))) (car f1159) (if (null? (cdr f1159)) (let ((f1163 (make-symbol f1158 #f))) (let ((f1165 (cons f1163 ()))) (begin (set-cdr! f1159 f1165) f1163))) (f1149 f1158 (cdr f1159))))))) (lambda (f1167) (f1149 f1167 (symbols))))
# == vectorize-letrec  ==>
# (let ((f1149 (make-vector 1))) (begin (begin (vector-set! f1149 0 (lambda (f1158 f1159) (if (string=? f1158 (symbol->string (car f1159))) (car f1159) (if (null? (cdr f1159)) (let ((f1163 (make-symbol f1158 #f))) (let ((f1165 (cons f1163 ()))) (begin (set-cdr! f1159 f1165) f1163))) ((vector-ref f1149 0) f1158 (cdr f1159))))))) (lambda (f1167) ((vector-ref f1149 0) f1167 (symbols)))))
# == eliminate-set!  ==>
# (let ((f1149 (make-vector 1))) (begin (begin (vector-set! f1149 0 (lambda (f1158 f1159) (let ((f1158 f1158) (f1159 f1159)) (if (string=? f1158 (symbol->string (car f1159))) (car f1159) (if (null? (cdr f1159)) (let ((f1163 (make-symbol f1158 #f))) (let ((f1165 (cons f1163 ()))) (begin (set-cdr! f1159 f1165) f1163))) ((vector-ref f1149 0) f1158 (cdr f1159)))))))) (lambda (f1167) (let ((f1167 f1167)) ((vector-ref f1149 0) f1167 (symbols))))))
# == close-free-variables  ==>
# (let ((f1149 (make-vector 1))) (begin (begin (vector-set! f1149 0 (closure (f1158 f1159) (string=? f1149) (let ((f1158 f1158) (f1159 f1159)) (if (string=? f1158 (symbol->string (car f1159))) (car f1159) (if (null? (cdr f1159)) (let ((f1163 (make-symbol f1158 #f))) (let ((f1165 (cons f1163 ()))) (begin (set-cdr! f1159 f1165) f1163))) ((vector-ref f1149 0) f1158 (cdr f1159)))))))) (closure (f1167) (f1149 symbols) (let ((f1167 f1167)) ((vector-ref f1149 0) f1167 (symbols))))))
# == eliminate-quote  ==>
# (let ((f1149 (make-vector 1))) (begin (begin (vector-set! f1149 0 (closure (f1158 f1159) (string=? f1149) (let ((f1158 f1158) (f1159 f1159)) (if (string=? f1158 (symbol->string (car f1159))) (car f1159) (if (null? (cdr f1159)) (let ((f1163 (make-symbol f1158 #f))) (let ((f1165 (cons f1163 ()))) (begin (set-cdr! f1159 f1165) f1163))) ((vector-ref f1149 0) f1158 (cdr f1159)))))))) (closure (f1167) (f1149 symbols) (let ((f1167 f1167)) ((vector-ref f1149 0) f1167 (symbols))))))
# == eliminate-when/unless  ==>
# (let ((f1149 (make-vector 1))) (begin (begin (vector-set! f1149 0 (closure (f1158 f1159) (string=? f1149) (let ((f1158 f1158) (f1159 f1159)) (if (string=? f1158 (symbol->string (car f1159))) (car f1159) (if (null? (cdr f1159)) (let ((f1163 (make-symbol f1158 #f))) (let ((f1165 (cons f1163 ()))) (begin (set-cdr! f1159 f1165) f1163))) ((vector-ref f1149 0) f1158 (cdr f1159)))))))) (closure (f1167) (f1149 symbols) (let ((f1167 f1167)) ((vector-ref f1149 0) f1167 (symbols))))))
# == eliminate-cond  ==>
# (let ((f1149 (make-vector 1))) (begin (begin (vector-set! f1149 0 (closure (f1158 f1159) (string=? f1149) (let ((f1158 f1158) (f1159 f1159)) (if (string=? f1158 (symbol->string (car f1159))) (car f1159) (if (null? (cdr f1159)) (let ((f1163 (make-symbol f1158 #f))) (let ((f1165 (cons f1163 ()))) (begin (set-cdr! f1159 f1165) f1163))) ((vector-ref f1149 0) f1158 (cdr f1159)))))))) (closure (f1167) (f1149 symbols) (let ((f1167 f1167)) ((vector-ref f1149 0) f1167 (symbols))))))
# == external-symbols  ==>
# (let ((f1149 (make-vector 1))) (begin (begin (vector-set! f1149 0 (closure (f1158 f1159) ((primitive-ref string=?) f1149) (let ((f1158 f1158) (f1159 f1159)) (if ((primitive-ref string=?) f1158 (symbol->string (car f1159))) (car f1159) (if (null? (cdr f1159)) (let ((f1163 (make-symbol f1158 #f))) (let ((f1165 (cons f1163 ()))) (begin (set-cdr! f1159 f1165) f1163))) ((vector-ref f1149 0) f1158 (cdr f1159)))))))) (closure (f1167) (f1149 (primitive-ref symbols)) (let ((f1167 f1167)) ((vector-ref f1149 0) f1167 ((primitive-ref symbols)))))))
# emit-expr (let ((f1149 (make-vector 1))) (begin (begin (vector-set! f1149 0 (closure (f1158 f1159) ((primitive-ref string=?) f1149) (let ((f1158 f1158) (f1159 f1159)) (if ((primitive-ref string=?) f1158 (symbol->string (car f1159))) (car f1159) (if (null? (cdr f1159)) (let ((f1163 (make-symbol f1158 #f))) (let ((f1165 (cons f1163 ()))) (begin (set-cdr! f1159 f1165) f1163))) ((vector-ref f1149 0) f1158 (cdr f1159)))))))) (closure (f1167) (f1149 (primitive-ref symbols)) (let ((f1167 f1167)) ((vector-ref f1149 0) f1167 ((primitive-ref symbols)))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f1149 (make-vector 1)))
#  body = (begin (begin (vector-set! f1149 0 (closure (f1158 f1159) ((primitive-ref string=?) f1149) (let ((f1158 f1158) (f1159 f1159)) (if ((primitive-ref string=?) f1158 (symbol->string (car f1159))) (car f1159) (if (null? (cdr f1159)) (let ((f1163 (make-symbol f1158 #f))) (let ((f1165 (cons f1163 ()))) (begin (set-cdr! f1159 f1165) f1163))) ((vector-ref f1149 0) f1158 (cdr f1159)))))))) (closure (f1167) (f1149 (primitive-ref symbols)) (let ((f1167 f1167)) ((vector-ref f1149 0) f1167 ((primitive-ref symbols))))))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9490"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9490:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_9491
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9491:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f1149 0 (closure (f1158 f1159) ((primitive-ref string=?) f1149) (let ((f1158 f1158) (f1159 f1159)) (if ((primitive-ref string=?) f1158 (symbol->string (car f1159))) (car f1159) (if (null? (cdr f1159)) (let ((f1163 (make-symbol f1158 #f))) (let ((f1165 (cons f1163 ()))) (begin (set-cdr! f1159 f1165) f1163))) ((vector-ref f1149 0) f1158 (cdr f1159)))))))) (closure (f1167) (f1149 (primitive-ref symbols)) (let ((f1167 f1167)) ((vector-ref f1149 0) f1167 ((primitive-ref symbols))))))
# emit-begin
#   expr=(begin (begin (vector-set! f1149 0 (closure (f1158 f1159) ((primitive-ref string=?) f1149) (let ((f1158 f1158) (f1159 f1159)) (if ((primitive-ref string=?) f1158 (symbol->string (car f1159))) (car f1159) (if (null? (cdr f1159)) (let ((f1163 (make-symbol f1158 #f))) (let ((f1165 (cons f1163 ()))) (begin (set-cdr! f1159 f1165) f1163))) ((vector-ref f1149 0) f1158 (cdr f1159)))))))) (closure (f1167) (f1149 (primitive-ref symbols)) (let ((f1167 f1167)) ((vector-ref f1149 0) f1167 ((primitive-ref symbols))))))
#   env=((f1149 . 0))
# emit-expr (begin (vector-set! f1149 0 (closure (f1158 f1159) ((primitive-ref string=?) f1149) (let ((f1158 f1158) (f1159 f1159)) (if ((primitive-ref string=?) f1158 (symbol->string (car f1159))) (car f1159) (if (null? (cdr f1159)) (let ((f1163 (make-symbol f1158 #f))) (let ((f1165 (cons f1163 ()))) (begin (set-cdr! f1159 f1165) f1163))) ((vector-ref f1149 0) f1158 (cdr f1159))))))))
# emit-begin
#   expr=(begin (vector-set! f1149 0 (closure (f1158 f1159) ((primitive-ref string=?) f1149) (let ((f1158 f1158) (f1159 f1159)) (if ((primitive-ref string=?) f1158 (symbol->string (car f1159))) (car f1159) (if (null? (cdr f1159)) (let ((f1163 (make-symbol f1158 #f))) (let ((f1165 (cons f1163 ()))) (begin (set-cdr! f1159 f1165) f1163))) ((vector-ref f1149 0) f1158 (cdr f1159))))))))
#   env=((f1149 . 0))
# emit-expr (vector-set! f1149 0 (closure (f1158 f1159) ((primitive-ref string=?) f1149) (let ((f1158 f1158) (f1159 f1159)) (if ((primitive-ref string=?) f1158 (symbol->string (car f1159))) (car f1159) (if (null? (cdr f1159)) (let ((f1163 (make-symbol f1158 #f))) (let ((f1165 (cons f1163 ()))) (begin (set-cdr! f1159 f1165) f1163))) ((vector-ref f1149 0) f1158 (cdr f1159)))))))
# emit-expr f1149
# emit-variable-ref
# env=((f1149 . 0))
# var=f1149
    movl 0(%esp), %eax  # stack load f1149
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9492
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9492:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9493"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9493:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9495
    cmp  $0,%eax
    jge _L_9494
_L_9495:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9494:
    movl %eax, -8(%esp)
# emit-expr (closure (f1158 f1159) ((primitive-ref string=?) f1149) (let ((f1158 f1158) (f1159 f1159)) (if ((primitive-ref string=?) f1158 (symbol->string (car f1159))) (car f1159) (if (null? (cdr f1159)) (let ((f1163 (make-symbol f1158 #f))) (let ((f1165 (cons f1163 ()))) (begin (set-cdr! f1159 f1165) f1163))) ((vector-ref f1149 0) f1158 (cdr f1159))))))
# emit-closure
# si = -12
# env = ((f1149 . 0))
# expr = (closure (f1158 f1159) ((primitive-ref string=?) f1149) (let ((f1158 f1158) (f1159 f1159)) (if ((primitive-ref string=?) f1158 (symbol->string (car f1159))) (car f1159) (if (null? (cdr f1159)) (let ((f1163 (make-symbol f1158 #f))) (let ((f1165 (cons f1163 ()))) (begin (set-cdr! f1159 f1165) f1163))) ((vector-ref f1149 0) f1158 (cdr f1159))))))
    movl $_L_9496, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref string=?) not defined in the environmnet
# emit-variable-ref
# env=((f1149 . 0))
# var=f1149
    movl 0(%esp), %eax  # stack load f1149
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f1149
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_9497            # jump around closure body
_L_9496:
# check argument count
    cmp $8,%eax
    je _L_9498
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_9498:
# emit-tail-expr
# si=-16
# env=((f1159 . -12) (f1158 . -8) (f1149 . 8) ((primitive-ref string=?) . 4) (f1149 . 0))
# expr=(let ((f1158 f1158) (f1159 f1159)) (if ((primitive-ref string=?) f1158 (symbol->string (car f1159))) (car f1159) (if (null? (cdr f1159)) (let ((f1163 (make-symbol f1158 #f))) (let ((f1165 (cons f1163 ()))) (begin (set-cdr! f1159 f1165) f1163))) ((vector-ref f1149 0) f1158 (cdr f1159)))))
# emit-tail-let
#  si   = -16
#  env  = ((f1159 . -12) (f1158 . -8) (f1149 . 8) ((primitive-ref string=?) . 4) (f1149 . 0))
#  bindings = ((f1158 f1158) (f1159 f1159))
#  body = (if ((primitive-ref string=?) f1158 (symbol->string (car f1159))) (car f1159) (if (null? (cdr f1159)) (let ((f1163 (make-symbol f1158 #f))) (let ((f1165 (cons f1163 ()))) (begin (set-cdr! f1159 f1165) f1163))) ((vector-ref f1149 0) f1158 (cdr f1159))))
# emit-expr f1158
# emit-variable-ref
# env=((f1159 . -12) (f1158 . -8) (f1149 . 8) ((primitive-ref string=?) . 4) (f1149 . 0))
# var=f1158
    movl -8(%esp), %eax  # stack load f1158
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f1159
# emit-variable-ref
# env=((f1159 . -12) (f1158 . -8) (f1149 . 8) ((primitive-ref string=?) . 4) (f1149 . 0))
# var=f1159
    movl -12(%esp), %eax  # stack load f1159
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f1159 . -20) (f1158 . -16) (f1159 . -12) (f1158 . -8) (f1149 . 8) ((primitive-ref string=?) . 4) (f1149 . 0))
# expr=(if ((primitive-ref string=?) f1158 (symbol->string (car f1159))) (car f1159) (if (null? (cdr f1159)) (let ((f1163 (make-symbol f1158 #f))) (let ((f1165 (cons f1163 ()))) (begin (set-cdr! f1159 f1165) f1163))) ((vector-ref f1149 0) f1158 (cdr f1159))))
# emit-expr ((primitive-ref string=?) f1158 (symbol->string (car f1159)))
# funcall
#    si   =-24
#    env  = ((f1159 . -20) (f1158 . -16) (f1159 . -12) (f1158 . -8) (f1149 . 8) ((primitive-ref string=?) . 4) (f1149 . 0))
#    expr = (funcall (primitive-ref string=?) f1158 (symbol->string (car f1159)))
# emit-expr (primitive-ref string=?)
    .extern string$e$q
    movl string$e$q,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9501"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9501":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f1158
# emit-variable-ref
# env=((f1159 . -20) (f1158 . -16) (f1159 . -12) (f1158 . -8) (f1149 . 8) ((primitive-ref string=?) . 4) (f1149 . 0))
# var=f1158
    movl -16(%esp), %eax  # stack load f1158
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f1158
# emit-expr (symbol->string (car f1159))
# symbol->string (car f1159)
# emit-expr (car f1159)
# emit-expr f1159
# emit-variable-ref
# env=((f1159 . -20) (f1158 . -16) (f1159 . -12) (f1158 . -8) (f1149 . 8) ((primitive-ref string=?) . 4) (f1149 . 0))
# var=f1159
    movl -20(%esp), %eax  # stack load f1159
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_9502
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $108,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9502:
    movl -1(%eax), %eax
    movl -3(%eax), %eax
    mov %eax, -40(%esp)  # arg (symbol->string (car f1159))
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_9499
# emit-tail-expr
# si=-24
# env=((f1159 . -20) (f1158 . -16) (f1159 . -12) (f1158 . -8) (f1149 . 8) ((primitive-ref string=?) . 4) (f1149 . 0))
# expr=(car f1159)
# tail primcall
# emit-expr f1159
# emit-variable-ref
# env=((f1159 . -20) (f1158 . -16) (f1159 . -12) (f1158 . -8) (f1149 . 8) ((primitive-ref string=?) . 4) (f1149 . 0))
# var=f1159
    movl -20(%esp), %eax  # stack load f1159
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_9503
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $108,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9503:
    movl -1(%eax), %eax
#return from tail (car f1159)
    ret
    jmp _L_9500
_L_9499:
# emit-tail-expr
# si=-24
# env=((f1159 . -20) (f1158 . -16) (f1159 . -12) (f1158 . -8) (f1149 . 8) ((primitive-ref string=?) . 4) (f1149 . 0))
# expr=(if (null? (cdr f1159)) (let ((f1163 (make-symbol f1158 #f))) (let ((f1165 (cons f1163 ()))) (begin (set-cdr! f1159 f1165) f1163))) ((vector-ref f1149 0) f1158 (cdr f1159)))
# emit-expr (null? (cdr f1159))
# emit-expr (cdr f1159)
# emit-expr f1159
# emit-variable-ref
# env=((f1159 . -20) (f1158 . -16) (f1159 . -12) (f1158 . -8) (f1149 . 8) ((primitive-ref string=?) . 4) (f1149 . 0))
# var=f1159
    movl -20(%esp), %eax  # stack load f1159
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_9506
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9506:
    movl 3(%eax), %eax
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_9504
# emit-tail-expr
# si=-24
# env=((f1159 . -20) (f1158 . -16) (f1159 . -12) (f1158 . -8) (f1149 . 8) ((primitive-ref string=?) . 4) (f1149 . 0))
# expr=(let ((f1163 (make-symbol f1158 #f))) (let ((f1165 (cons f1163 ()))) (begin (set-cdr! f1159 f1165) f1163)))
# emit-tail-let
#  si   = -24
#  env  = ((f1159 . -20) (f1158 . -16) (f1159 . -12) (f1158 . -8) (f1149 . 8) ((primitive-ref string=?) . 4) (f1149 . 0))
#  bindings = ((f1163 (make-symbol f1158 #f)))
#  body = (let ((f1165 (cons f1163 ()))) (begin (set-cdr! f1159 f1165) f1163))
# emit-expr (make-symbol f1158 #f)
# make-symbol arg1=f1158 arg2=#f
# emit-expr f1158
# emit-variable-ref
# env=((f1159 . -20) (f1158 . -16) (f1159 . -12) (f1158 . -8) (f1149 . 8) ((primitive-ref string=?) . 4) (f1149 . 0))
# var=f1158
    movl -16(%esp), %eax  # stack load f1158
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
# env=((f1163 . -24) (f1159 . -20) (f1158 . -16) (f1159 . -12) (f1158 . -8) (f1149 . 8) ((primitive-ref string=?) . 4) (f1149 . 0))
# expr=(let ((f1165 (cons f1163 ()))) (begin (set-cdr! f1159 f1165) f1163))
# emit-tail-let
#  si   = -28
#  env  = ((f1163 . -24) (f1159 . -20) (f1158 . -16) (f1159 . -12) (f1158 . -8) (f1149 . 8) ((primitive-ref string=?) . 4) (f1149 . 0))
#  bindings = ((f1165 (cons f1163 ())))
#  body = (begin (set-cdr! f1159 f1165) f1163)
# emit-expr (cons f1163 ())
# cons arg1=f1163 arg2=()
# emit-expr f1163
# emit-variable-ref
# env=((f1163 . -24) (f1159 . -20) (f1158 . -16) (f1159 . -12) (f1158 . -8) (f1149 . 8) ((primitive-ref string=?) . 4) (f1149 . 0))
# var=f1163
    movl -24(%esp), %eax  # stack load f1163
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
# env=((f1165 . -28) (f1163 . -24) (f1159 . -20) (f1158 . -16) (f1159 . -12) (f1158 . -8) (f1149 . 8) ((primitive-ref string=?) . 4) (f1149 . 0))
# expr=(begin (set-cdr! f1159 f1165) f1163)
# tail-begin (begin (set-cdr! f1159 f1165) f1163)
#   env=((f1165 . -28) (f1163 . -24) (f1159 . -20) (f1158 . -16) (f1159 . -12) (f1158 . -8) (f1149 . 8) ((primitive-ref string=?) . 4) (f1149 . 0))
# emit-expr (set-cdr! f1159 f1165)
# emit-expr f1159
# emit-variable-ref
# env=((f1165 . -28) (f1163 . -24) (f1159 . -20) (f1158 . -16) (f1159 . -12) (f1158 . -8) (f1149 . 8) ((primitive-ref string=?) . 4) (f1149 . 0))
# var=f1159
    movl -20(%esp), %eax  # stack load f1159
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_9507
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9507:
    movl %eax, -32(%esp)
# emit-expr f1165
# emit-variable-ref
# env=((f1165 . -28) (f1163 . -24) (f1159 . -20) (f1158 . -16) (f1159 . -12) (f1158 . -8) (f1149 . 8) ((primitive-ref string=?) . 4) (f1149 . 0))
# var=f1165
    movl -28(%esp), %eax  # stack load f1165
# end emit-variable-ref
    movl -32(%esp), %ebx
    movl %eax, 3(%ebx)
# emit-tail-expr
# si=-32
# env=((f1165 . -28) (f1163 . -24) (f1159 . -20) (f1158 . -16) (f1159 . -12) (f1158 . -8) (f1149 . 8) ((primitive-ref string=?) . 4) (f1149 . 0))
# expr=(begin f1163)
# tail-begin (begin f1163)
#   env=((f1165 . -28) (f1163 . -24) (f1159 . -20) (f1158 . -16) (f1159 . -12) (f1158 . -8) (f1149 . 8) ((primitive-ref string=?) . 4) (f1149 . 0))
# emit-tail-expr
# si=-32
# env=((f1165 . -28) (f1163 . -24) (f1159 . -20) (f1158 . -16) (f1159 . -12) (f1158 . -8) (f1149 . 8) ((primitive-ref string=?) . 4) (f1149 . 0))
# expr=f1163
# emit-tail-variable-ref
# emit-variable-ref
# env=((f1165 . -28) (f1163 . -24) (f1159 . -20) (f1158 . -16) (f1159 . -12) (f1158 . -8) (f1149 . 8) ((primitive-ref string=?) . 4) (f1149 . 0))
# var=f1163
    movl -24(%esp), %eax  # stack load f1163
# end emit-variable-ref
    ret
# end emit-tail-variable ref
     ret   # return thru stack
    jmp _L_9505
_L_9504:
# emit-tail-expr
# si=-24
# env=((f1159 . -20) (f1158 . -16) (f1159 . -12) (f1158 . -8) (f1149 . 8) ((primitive-ref string=?) . 4) (f1149 . 0))
# expr=((vector-ref f1149 0) f1158 (cdr f1159))
# emit-tail-funcall
#    si   =-24
#    env  = ((f1159 . -20) (f1158 . -16) (f1159 . -12) (f1158 . -8) (f1149 . 8) ((primitive-ref string=?) . 4) (f1149 . 0))
#    expr = (funcall (vector-ref f1149 0) f1158 (cdr f1159))
# emit-expr (vector-ref f1149 0)
# emit-expr f1149
# emit-variable-ref
# env=((f1159 . -20) (f1158 . -16) (f1159 . -12) (f1158 . -8) (f1149 . 8) ((primitive-ref string=?) . 4) (f1149 . 0))
# var=f1149
    movl 6(%edi), %eax  # frame load f1149
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
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9508:
    movl %eax, -24(%esp)
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
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9509:
# check bounds on vector index
    movl -24(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9511
    cmp  $0,%eax
    jge _L_9510
_L_9511:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9510:
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr f1158
# emit-variable-ref
# env=((f1159 . -20) (f1158 . -16) (f1159 . -12) (f1158 . -8) (f1149 . 8) ((primitive-ref string=?) . 4) (f1149 . 0))
# var=f1158
    movl -16(%esp), %eax  # stack load f1158
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f1158
# emit-expr (cdr f1159)
# emit-expr f1159
# emit-variable-ref
# env=((f1159 . -20) (f1158 . -16) (f1159 . -12) (f1158 . -8) (f1149 . 8) ((primitive-ref string=?) . 4) (f1149 . 0))
# var=f1159
    movl -20(%esp), %eax  # stack load f1159
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_9512
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9512:
    movl 3(%eax), %eax
    mov %eax, -32(%esp)    # arg (cdr f1159)
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
_L_9505:
_L_9500:
    .align 4,0x90
_L_9497:
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f1149 . 0))
# emit-expr (begin (closure (f1167) (f1149 (primitive-ref symbols)) (let ((f1167 f1167)) ((vector-ref f1149 0) f1167 ((primitive-ref symbols))))))
# emit-begin
#   expr=(begin (closure (f1167) (f1149 (primitive-ref symbols)) (let ((f1167 f1167)) ((vector-ref f1149 0) f1167 ((primitive-ref symbols))))))
#   env=((f1149 . 0))
# emit-expr (closure (f1167) (f1149 (primitive-ref symbols)) (let ((f1167 f1167)) ((vector-ref f1149 0) f1167 ((primitive-ref symbols)))))
# emit-closure
# si = -4
# env = ((f1149 . 0))
# expr = (closure (f1167) (f1149 (primitive-ref symbols)) (let ((f1167 f1167)) ((vector-ref f1149 0) f1167 ((primitive-ref symbols)))))
    movl $_L_9513, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f1149 . 0))
# var=f1149
    movl 0(%esp), %eax  # stack load f1149
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f1149
# WARNING: free var (primitive-ref symbols) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_9514            # jump around closure body
_L_9513:
# check argument count
    cmp $4,%eax
    je _L_9515
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_9515:
# emit-tail-expr
# si=-12
# env=((f1167 . -8) ((primitive-ref symbols) . 8) (f1149 . 4) (f1149 . 0))
# expr=(let ((f1167 f1167)) ((vector-ref f1149 0) f1167 ((primitive-ref symbols))))
# emit-tail-let
#  si   = -12
#  env  = ((f1167 . -8) ((primitive-ref symbols) . 8) (f1149 . 4) (f1149 . 0))
#  bindings = ((f1167 f1167))
#  body = ((vector-ref f1149 0) f1167 ((primitive-ref symbols)))
# emit-expr f1167
# emit-variable-ref
# env=((f1167 . -8) ((primitive-ref symbols) . 8) (f1149 . 4) (f1149 . 0))
# var=f1167
    movl -8(%esp), %eax  # stack load f1167
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f1167 . -12) (f1167 . -8) ((primitive-ref symbols) . 8) (f1149 . 4) (f1149 . 0))
# expr=((vector-ref f1149 0) f1167 ((primitive-ref symbols)))
# emit-tail-funcall
#    si   =-16
#    env  = ((f1167 . -12) (f1167 . -8) ((primitive-ref symbols) . 8) (f1149 . 4) (f1149 . 0))
#    expr = (funcall (vector-ref f1149 0) f1167 ((primitive-ref symbols)))
# emit-expr (vector-ref f1149 0)
# emit-expr f1149
# emit-variable-ref
# env=((f1167 . -12) (f1167 . -8) ((primitive-ref symbols) . 8) (f1149 . 4) (f1149 . 0))
# var=f1149
    movl 2(%edi), %eax  # frame load f1149
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9516
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9516:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9517"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9517:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9519
    cmp  $0,%eax
    jge _L_9518
_L_9519:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9518:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr f1167
# emit-variable-ref
# env=((f1167 . -12) (f1167 . -8) ((primitive-ref symbols) . 8) (f1149 . 4) (f1149 . 0))
# var=f1167
    movl -12(%esp), %eax  # stack load f1167
# end emit-variable-ref
    mov %eax, -20(%esp)    # arg f1167
# emit-expr ((primitive-ref symbols))
# funcall
#    si   =-24
#    env  = ((f1167 . -12) (f1167 . -8) ((primitive-ref symbols) . 8) (f1149 . 4) (f1149 . 0))
#    expr = (funcall (primitive-ref symbols))
# emit-expr (primitive-ref symbols)
    .extern symbols
    movl symbols,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9520"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9520":
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
_L_9514:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f1149 . 0))
     movl %eax, string$m$gsymbol
# == explicit-begins  ==>
# (lambda (lst elt) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt))))
# == eliminate-let*  ==>
# (lambda (lst elt) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt))))
# == uniquify-variables  ==>
# (lambda (f1168 f1169) (if (null? f1168) (cons e nil) (cons (car f1168) (append1 (cdr f1168) f1169))))
# == vectorize-letrec  ==>
# (lambda (f1168 f1169) (if (null? f1168) (cons e nil) (cons (car f1168) (append1 (cdr f1168) f1169))))
# == eliminate-set!  ==>
# (lambda (f1168 f1169) (let ((f1168 f1168) (f1169 f1169)) (if (null? f1168) (cons e nil) (cons (car f1168) (append1 (cdr f1168) f1169)))))
# == close-free-variables  ==>
# (closure (f1168 f1169) (e nil append1) (let ((f1168 f1168) (f1169 f1169)) (if (null? f1168) (cons e nil) (cons (car f1168) (append1 (cdr f1168) f1169)))))
# == eliminate-quote  ==>
# (closure (f1168 f1169) (e nil append1) (let ((f1168 f1168) (f1169 f1169)) (if (null? f1168) (cons e nil) (cons (car f1168) (append1 (cdr f1168) f1169)))))
# == eliminate-when/unless  ==>
# (closure (f1168 f1169) (e nil append1) (let ((f1168 f1168) (f1169 f1169)) (if (null? f1168) (cons e nil) (cons (car f1168) (append1 (cdr f1168) f1169)))))
# == eliminate-cond  ==>
# (closure (f1168 f1169) (e nil append1) (let ((f1168 f1168) (f1169 f1169)) (if (null? f1168) (cons e nil) (cons (car f1168) (append1 (cdr f1168) f1169)))))
# == external-symbols  ==>
# (closure (f1168 f1169) (e nil (primitive-ref append1)) (let ((f1168 f1168) (f1169 f1169)) (if (null? f1168) (cons e nil) (cons (car f1168) ((primitive-ref append1) (cdr f1168) f1169)))))
# emit-expr (closure (f1168 f1169) (e nil (primitive-ref append1)) (let ((f1168 f1168) (f1169 f1169)) (if (null? f1168) (cons e nil) (cons (car f1168) ((primitive-ref append1) (cdr f1168) f1169)))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f1168 f1169) (e nil (primitive-ref append1)) (let ((f1168 f1168) (f1169 f1169)) (if (null? f1168) (cons e nil) (cons (car f1168) ((primitive-ref append1) (cdr f1168) f1169)))))
    movl $_L_9521, 0(%ebp)  # closure label
# WARNING: free var e not defined in the environmnet
# WARNING: free var nil not defined in the environmnet
# WARNING: free var (primitive-ref append1) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_9522            # jump around closure body
_L_9521:
# check argument count
    cmp $8,%eax
    je _L_9523
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_9523:
# emit-tail-expr
# si=-16
# env=((f1169 . -12) (f1168 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(let ((f1168 f1168) (f1169 f1169)) (if (null? f1168) (cons e nil) (cons (car f1168) ((primitive-ref append1) (cdr f1168) f1169))))
# emit-tail-let
#  si   = -16
#  env  = ((f1169 . -12) (f1168 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
#  bindings = ((f1168 f1168) (f1169 f1169))
#  body = (if (null? f1168) (cons e nil) (cons (car f1168) ((primitive-ref append1) (cdr f1168) f1169)))
# emit-expr f1168
# emit-variable-ref
# env=((f1169 . -12) (f1168 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f1168
    movl -8(%esp), %eax  # stack load f1168
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f1169
# emit-variable-ref
# env=((f1169 . -12) (f1168 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f1169
    movl -12(%esp), %eax  # stack load f1169
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f1169 . -20) (f1168 . -16) (f1169 . -12) (f1168 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(if (null? f1168) (cons e nil) (cons (car f1168) ((primitive-ref append1) (cdr f1168) f1169)))
# emit-expr (null? f1168)
# emit-expr f1168
# emit-variable-ref
# env=((f1169 . -20) (f1168 . -16) (f1169 . -12) (f1168 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f1168
    movl -16(%esp), %eax  # stack load f1168
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_9524
# emit-tail-expr
# si=-24
# env=((f1169 . -20) (f1168 . -16) (f1169 . -12) (f1168 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(cons e nil)
# tail primcall
# cons arg1=e arg2=nil
# emit-expr e
# emit-variable-ref
# env=((f1169 . -20) (f1168 . -16) (f1169 . -12) (f1168 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=e
    movl 2(%edi), %eax  # frame load e
# end emit-variable-ref
    movl %eax, -24(%esp)
# emit-expr nil
# emit-variable-ref
# env=((f1169 . -20) (f1168 . -16) (f1169 . -12) (f1168 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
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
    jmp _L_9525
_L_9524:
# emit-tail-expr
# si=-24
# env=((f1169 . -20) (f1168 . -16) (f1169 . -12) (f1168 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(cons (car f1168) ((primitive-ref append1) (cdr f1168) f1169))
# tail primcall
# cons arg1=(car f1168) arg2=((primitive-ref append1) (cdr f1168) f1169)
# emit-expr (car f1168)
# emit-expr f1168
# emit-variable-ref
# env=((f1169 . -20) (f1168 . -16) (f1169 . -12) (f1168 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f1168
    movl -16(%esp), %eax  # stack load f1168
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_9526
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $108,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9526:
    movl -1(%eax), %eax
    movl %eax, -24(%esp)
# emit-expr ((primitive-ref append1) (cdr f1168) f1169)
# funcall
#    si   =-28
#    env  = ((f1169 . -20) (f1168 . -16) (f1169 . -12) (f1168 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
#    expr = (funcall (primitive-ref append1) (cdr f1168) f1169)
# emit-expr (primitive-ref append1)
    .extern append1
    movl append1,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9527"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9527":
   movl %eax,  -36(%esp)  # stash funcall-oper in closure slot
# emit-expr (cdr f1168)
# emit-expr f1168
# emit-variable-ref
# env=((f1169 . -20) (f1168 . -16) (f1169 . -12) (f1168 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f1168
    movl -16(%esp), %eax  # stack load f1168
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_9528
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9528:
    movl 3(%eax), %eax
    mov %eax, -40(%esp)  # arg (cdr f1168)
# emit-expr f1169
# emit-variable-ref
# env=((f1169 . -20) (f1168 . -16) (f1169 . -12) (f1168 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f1169
    movl -20(%esp), %eax  # stack load f1169
# end emit-variable-ref
    mov %eax, -44(%esp)  # arg f1169
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
#return from tail (cons (car f1168) ((primitive-ref append1) (cdr f1168) f1169))
    ret
_L_9525:
    .align 4,0x90
_L_9522:
     movl %eax, append1
# == explicit-begins  ==>
# (lambda (l k) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1))))
# == eliminate-let*  ==>
# (lambda (l k) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1))))
# == uniquify-variables  ==>
# (lambda (f1170 f1171) (if (fx= f1171 0) (car f1170) (list-ref (cdr f1170) (fx- f1171 1))))
# == vectorize-letrec  ==>
# (lambda (f1170 f1171) (if (fx= f1171 0) (car f1170) (list-ref (cdr f1170) (fx- f1171 1))))
# == eliminate-set!  ==>
# (lambda (f1170 f1171) (let ((f1170 f1170) (f1171 f1171)) (if (fx= f1171 0) (car f1170) (list-ref (cdr f1170) (fx- f1171 1)))))
# == close-free-variables  ==>
# (closure (f1170 f1171) (list-ref) (let ((f1170 f1170) (f1171 f1171)) (if (fx= f1171 0) (car f1170) (list-ref (cdr f1170) (fx- f1171 1)))))
# == eliminate-quote  ==>
# (closure (f1170 f1171) (list-ref) (let ((f1170 f1170) (f1171 f1171)) (if (fx= f1171 0) (car f1170) (list-ref (cdr f1170) (fx- f1171 1)))))
# == eliminate-when/unless  ==>
# (closure (f1170 f1171) (list-ref) (let ((f1170 f1170) (f1171 f1171)) (if (fx= f1171 0) (car f1170) (list-ref (cdr f1170) (fx- f1171 1)))))
# == eliminate-cond  ==>
# (closure (f1170 f1171) (list-ref) (let ((f1170 f1170) (f1171 f1171)) (if (fx= f1171 0) (car f1170) (list-ref (cdr f1170) (fx- f1171 1)))))
# == external-symbols  ==>
# (closure (f1170 f1171) ((primitive-ref list-ref)) (let ((f1170 f1170) (f1171 f1171)) (if (fx= f1171 0) (car f1170) ((primitive-ref list-ref) (cdr f1170) (fx- f1171 1)))))
# emit-expr (closure (f1170 f1171) ((primitive-ref list-ref)) (let ((f1170 f1170) (f1171 f1171)) (if (fx= f1171 0) (car f1170) ((primitive-ref list-ref) (cdr f1170) (fx- f1171 1)))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f1170 f1171) ((primitive-ref list-ref)) (let ((f1170 f1170) (f1171 f1171)) (if (fx= f1171 0) (car f1170) ((primitive-ref list-ref) (cdr f1170) (fx- f1171 1)))))
    movl $_L_9529, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_9530            # jump around closure body
_L_9529:
# check argument count
    cmp $8,%eax
    je _L_9531
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_9531:
# emit-tail-expr
# si=-16
# env=((f1171 . -12) (f1170 . -8) ((primitive-ref list-ref) . 4))
# expr=(let ((f1170 f1170) (f1171 f1171)) (if (fx= f1171 0) (car f1170) ((primitive-ref list-ref) (cdr f1170) (fx- f1171 1))))
# emit-tail-let
#  si   = -16
#  env  = ((f1171 . -12) (f1170 . -8) ((primitive-ref list-ref) . 4))
#  bindings = ((f1170 f1170) (f1171 f1171))
#  body = (if (fx= f1171 0) (car f1170) ((primitive-ref list-ref) (cdr f1170) (fx- f1171 1)))
# emit-expr f1170
# emit-variable-ref
# env=((f1171 . -12) (f1170 . -8) ((primitive-ref list-ref) . 4))
# var=f1170
    movl -8(%esp), %eax  # stack load f1170
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f1171
# emit-variable-ref
# env=((f1171 . -12) (f1170 . -8) ((primitive-ref list-ref) . 4))
# var=f1171
    movl -12(%esp), %eax  # stack load f1171
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f1171 . -20) (f1170 . -16) (f1171 . -12) (f1170 . -8) ((primitive-ref list-ref) . 4))
# expr=(if (fx= f1171 0) (car f1170) ((primitive-ref list-ref) (cdr f1170) (fx- f1171 1)))
# emit-expr (fx= f1171 0)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9534"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9534:
    movl %eax, -24(%esp)
# emit-expr f1171
# emit-variable-ref
# env=((f1171 . -20) (f1170 . -16) (f1171 . -12) (f1170 . -8) ((primitive-ref list-ref) . 4))
# var=f1171
    movl -20(%esp), %eax  # stack load f1171
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9535"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9535:
    cmp -24(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_9532
# emit-tail-expr
# si=-24
# env=((f1171 . -20) (f1170 . -16) (f1171 . -12) (f1170 . -8) ((primitive-ref list-ref) . 4))
# expr=(car f1170)
# tail primcall
# emit-expr f1170
# emit-variable-ref
# env=((f1171 . -20) (f1170 . -16) (f1171 . -12) (f1170 . -8) ((primitive-ref list-ref) . 4))
# var=f1170
    movl -16(%esp), %eax  # stack load f1170
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_9536
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $108,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9536:
    movl -1(%eax), %eax
#return from tail (car f1170)
    ret
    jmp _L_9533
_L_9532:
# emit-tail-expr
# si=-24
# env=((f1171 . -20) (f1170 . -16) (f1171 . -12) (f1170 . -8) ((primitive-ref list-ref) . 4))
# expr=((primitive-ref list-ref) (cdr f1170) (fx- f1171 1))
# emit-tail-funcall
#    si   =-24
#    env  = ((f1171 . -20) (f1170 . -16) (f1171 . -12) (f1170 . -8) ((primitive-ref list-ref) . 4))
#    expr = (funcall (primitive-ref list-ref) (cdr f1170) (fx- f1171 1))
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr (cdr f1170)
# emit-expr f1170
# emit-variable-ref
# env=((f1171 . -20) (f1170 . -16) (f1171 . -12) (f1170 . -8) ((primitive-ref list-ref) . 4))
# var=f1170
    movl -16(%esp), %eax  # stack load f1170
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_9537
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9537:
    movl 3(%eax), %eax
    mov %eax, -28(%esp)    # arg (cdr f1170)
# emit-expr (fx- f1171 1)
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9538"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $84,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9538:
    movl %eax, -32(%esp)
# emit-expr f1171
# emit-variable-ref
# env=((f1171 . -20) (f1170 . -16) (f1171 . -12) (f1170 . -8) ((primitive-ref list-ref) . 4))
# var=f1171
    movl -20(%esp), %eax  # stack load f1171
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9539"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $84,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9539:
    subl -32(%esp), %eax
    mov %eax, -32(%esp)    # arg (fx- f1171 1)
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
_L_9533:
    .align 4,0x90
_L_9530:
     movl %eax, list$mref
# == explicit-begins  ==>
# (lambda (l) (if (null? l) 0 (fxadd1 (list-length (cdr l)))))
# == eliminate-let*  ==>
# (lambda (l) (if (null? l) 0 (fxadd1 (list-length (cdr l)))))
# == uniquify-variables  ==>
# (lambda (f1172) (if (null? f1172) 0 (fxadd1 (list-length (cdr f1172)))))
# == vectorize-letrec  ==>
# (lambda (f1172) (if (null? f1172) 0 (fxadd1 (list-length (cdr f1172)))))
# == eliminate-set!  ==>
# (lambda (f1172) (let ((f1172 f1172)) (if (null? f1172) 0 (fxadd1 (list-length (cdr f1172))))))
# == close-free-variables  ==>
# (closure (f1172) (list-length) (let ((f1172 f1172)) (if (null? f1172) 0 (fxadd1 (list-length (cdr f1172))))))
# == eliminate-quote  ==>
# (closure (f1172) (list-length) (let ((f1172 f1172)) (if (null? f1172) 0 (fxadd1 (list-length (cdr f1172))))))
# == eliminate-when/unless  ==>
# (closure (f1172) (list-length) (let ((f1172 f1172)) (if (null? f1172) 0 (fxadd1 (list-length (cdr f1172))))))
# == eliminate-cond  ==>
# (closure (f1172) (list-length) (let ((f1172 f1172)) (if (null? f1172) 0 (fxadd1 (list-length (cdr f1172))))))
# == external-symbols  ==>
# (closure (f1172) ((primitive-ref list-length)) (let ((f1172 f1172)) (if (null? f1172) 0 (fxadd1 ((primitive-ref list-length) (cdr f1172))))))
# emit-expr (closure (f1172) ((primitive-ref list-length)) (let ((f1172 f1172)) (if (null? f1172) 0 (fxadd1 ((primitive-ref list-length) (cdr f1172))))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f1172) ((primitive-ref list-length)) (let ((f1172 f1172)) (if (null? f1172) 0 (fxadd1 ((primitive-ref list-length) (cdr f1172))))))
    movl $_L_9540, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref list-length) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_9541            # jump around closure body
_L_9540:
# check argument count
    cmp $4,%eax
    je _L_9542
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_9542:
# emit-tail-expr
# si=-12
# env=((f1172 . -8) ((primitive-ref list-length) . 4))
# expr=(let ((f1172 f1172)) (if (null? f1172) 0 (fxadd1 ((primitive-ref list-length) (cdr f1172)))))
# emit-tail-let
#  si   = -12
#  env  = ((f1172 . -8) ((primitive-ref list-length) . 4))
#  bindings = ((f1172 f1172))
#  body = (if (null? f1172) 0 (fxadd1 ((primitive-ref list-length) (cdr f1172))))
# emit-expr f1172
# emit-variable-ref
# env=((f1172 . -8) ((primitive-ref list-length) . 4))
# var=f1172
    movl -8(%esp), %eax  # stack load f1172
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f1172 . -12) (f1172 . -8) ((primitive-ref list-length) . 4))
# expr=(if (null? f1172) 0 (fxadd1 ((primitive-ref list-length) (cdr f1172))))
# emit-expr (null? f1172)
# emit-expr f1172
# emit-variable-ref
# env=((f1172 . -12) (f1172 . -8) ((primitive-ref list-length) . 4))
# var=f1172
    movl -12(%esp), %eax  # stack load f1172
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_9543
# emit-tail-expr
# si=-16
# env=((f1172 . -12) (f1172 . -8) ((primitive-ref list-length) . 4))
# expr=0
    movl $0, %eax     # immed 0
    ret                  # immediate tail return
    jmp _L_9544
_L_9543:
# emit-tail-expr
# si=-16
# env=((f1172 . -12) (f1172 . -8) ((primitive-ref list-length) . 4))
# expr=(fxadd1 ((primitive-ref list-length) (cdr f1172)))
# tail primcall
# emit-expr ((primitive-ref list-length) (cdr f1172))
# funcall
#    si   =-16
#    env  = ((f1172 . -12) (f1172 . -8) ((primitive-ref list-length) . 4))
#    expr = (funcall (primitive-ref list-length) (cdr f1172))
# emit-expr (primitive-ref list-length)
    .extern list$mlength
    movl list$mlength,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9545"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9545":
   movl %eax,  -24(%esp)  # stash funcall-oper in closure slot
# emit-expr (cdr f1172)
# emit-expr f1172
# emit-variable-ref
# env=((f1172 . -12) (f1172 . -8) ((primitive-ref list-length) . 4))
# var=f1172
    movl -12(%esp), %eax  # stack load f1172
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_9546
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9546:
    movl 3(%eax), %eax
    mov %eax, -28(%esp)  # arg (cdr f1172)
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
    je "_L_9547"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $48,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9547:
     addl $4, %eax
#return from tail (fxadd1 ((primitive-ref list-length) (cdr f1172)))
    ret
_L_9544:
    .align 4,0x90
_L_9541:
     movl %eax, list$mlength
# == explicit-begins  ==>
# (letrec ((fill-vector (lambda (v k args) (if (null? args) v (begin (vector-set! v k (car args)) (fill-vector v (fxadd1 k) (cdr args))))))) (lambda args (let ((v (make-vector (list-length args)))) (fill-vector v 0 args))))
# == eliminate-let*  ==>
# (letrec ((fill-vector (lambda (v k args) (if (null? args) v (begin (vector-set! v k (car args)) (fill-vector v (fxadd1 k) (cdr args))))))) (lambda args (let ((v (make-vector (list-length args)))) (fill-vector v 0 args))))
# == uniquify-variables  ==>
# (letrec ((f1173 (lambda (f1177 f1178 f1179) (if (null? f1179) f1177 (begin (vector-set! f1177 f1178 (car f1179)) (f1173 f1177 (fxadd1 f1178) (cdr f1179))))))) (lambda f1183 (let ((f1185 (make-vector (list-length f1183)))) (f1173 f1185 0 f1183))))
# == vectorize-letrec  ==>
# (let ((f1173 (make-vector 1))) (begin (begin (vector-set! f1173 0 (lambda (f1177 f1178 f1179) (if (null? f1179) f1177 (begin (vector-set! f1177 f1178 (car f1179)) ((vector-ref f1173 0) f1177 (fxadd1 f1178) (cdr f1179))))))) (lambda f1183 (let ((f1185 (make-vector (list-length f1183)))) ((vector-ref f1173 0) f1185 0 f1183)))))
# == eliminate-set!  ==>
# (let ((f1173 (make-vector 1))) (begin (begin (vector-set! f1173 0 (lambda (f1177 f1178 f1179) (let ((f1177 f1177) (f1178 f1178) (f1179 f1179)) (if (null? f1179) f1177 (begin (vector-set! f1177 f1178 (car f1179)) ((vector-ref f1173 0) f1177 (fxadd1 f1178) (cdr f1179)))))))) (lambda f1183 (let () (let ((f1185 (make-vector (list-length f1183)))) ((vector-ref f1173 0) f1185 0 f1183))))))
# == close-free-variables  ==>
# (let ((f1173 (make-vector 1))) (begin (begin (vector-set! f1173 0 (closure (f1177 f1178 f1179) (f1173) (let ((f1177 f1177) (f1178 f1178) (f1179 f1179)) (if (null? f1179) f1177 (begin (vector-set! f1177 f1178 (car f1179)) ((vector-ref f1173 0) f1177 (fxadd1 f1178) (cdr f1179)))))))) (closure f1183 (f1173) (let () (let ((f1185 (make-vector (list-length f1183)))) ((vector-ref f1173 0) f1185 0 f1183))))))
# == eliminate-quote  ==>
# (let ((f1173 (make-vector 1))) (begin (begin (vector-set! f1173 0 (closure (f1177 f1178 f1179) (f1173) (let ((f1177 f1177) (f1178 f1178) (f1179 f1179)) (if (null? f1179) f1177 (begin (vector-set! f1177 f1178 (car f1179)) ((vector-ref f1173 0) f1177 (fxadd1 f1178) (cdr f1179)))))))) (closure f1183 (f1173) (let () (let ((f1185 (make-vector (list-length f1183)))) ((vector-ref f1173 0) f1185 0 f1183))))))
# == eliminate-when/unless  ==>
# (let ((f1173 (make-vector 1))) (begin (begin (vector-set! f1173 0 (closure (f1177 f1178 f1179) (f1173) (let ((f1177 f1177) (f1178 f1178) (f1179 f1179)) (if (null? f1179) f1177 (begin (vector-set! f1177 f1178 (car f1179)) ((vector-ref f1173 0) f1177 (fxadd1 f1178) (cdr f1179)))))))) (closure f1183 (f1173) (let () (let ((f1185 (make-vector (list-length f1183)))) ((vector-ref f1173 0) f1185 0 f1183))))))
# == eliminate-cond  ==>
# (let ((f1173 (make-vector 1))) (begin (begin (vector-set! f1173 0 (closure (f1177 f1178 f1179) (f1173) (let ((f1177 f1177) (f1178 f1178) (f1179 f1179)) (if (null? f1179) f1177 (begin (vector-set! f1177 f1178 (car f1179)) ((vector-ref f1173 0) f1177 (fxadd1 f1178) (cdr f1179)))))))) (closure f1183 (f1173) (let () (let ((f1185 (make-vector (list-length f1183)))) ((vector-ref f1173 0) f1185 0 f1183))))))
# == external-symbols  ==>
# (let ((f1173 (make-vector 1))) (begin (begin (vector-set! f1173 0 (closure (f1177 f1178 f1179) (f1173) (let ((f1177 f1177) (f1178 f1178) (f1179 f1179)) (if (null? f1179) f1177 (begin (vector-set! f1177 f1178 (car f1179)) ((vector-ref f1173 0) f1177 (fxadd1 f1178) (cdr f1179)))))))) (closure f1183 (f1173) (let () (let ((f1185 (make-vector ((primitive-ref list-length) f1183)))) ((vector-ref f1173 0) f1185 0 f1183))))))
# emit-expr (let ((f1173 (make-vector 1))) (begin (begin (vector-set! f1173 0 (closure (f1177 f1178 f1179) (f1173) (let ((f1177 f1177) (f1178 f1178) (f1179 f1179)) (if (null? f1179) f1177 (begin (vector-set! f1177 f1178 (car f1179)) ((vector-ref f1173 0) f1177 (fxadd1 f1178) (cdr f1179)))))))) (closure f1183 (f1173) (let () (let ((f1185 (make-vector ((primitive-ref list-length) f1183)))) ((vector-ref f1173 0) f1185 0 f1183))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f1173 (make-vector 1)))
#  body = (begin (begin (vector-set! f1173 0 (closure (f1177 f1178 f1179) (f1173) (let ((f1177 f1177) (f1178 f1178) (f1179 f1179)) (if (null? f1179) f1177 (begin (vector-set! f1177 f1178 (car f1179)) ((vector-ref f1173 0) f1177 (fxadd1 f1178) (cdr f1179)))))))) (closure f1183 (f1173) (let () (let ((f1185 (make-vector ((primitive-ref list-length) f1183)))) ((vector-ref f1173 0) f1185 0 f1183)))))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9548"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9548:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_9549
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9549:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f1173 0 (closure (f1177 f1178 f1179) (f1173) (let ((f1177 f1177) (f1178 f1178) (f1179 f1179)) (if (null? f1179) f1177 (begin (vector-set! f1177 f1178 (car f1179)) ((vector-ref f1173 0) f1177 (fxadd1 f1178) (cdr f1179)))))))) (closure f1183 (f1173) (let () (let ((f1185 (make-vector ((primitive-ref list-length) f1183)))) ((vector-ref f1173 0) f1185 0 f1183)))))
# emit-begin
#   expr=(begin (begin (vector-set! f1173 0 (closure (f1177 f1178 f1179) (f1173) (let ((f1177 f1177) (f1178 f1178) (f1179 f1179)) (if (null? f1179) f1177 (begin (vector-set! f1177 f1178 (car f1179)) ((vector-ref f1173 0) f1177 (fxadd1 f1178) (cdr f1179)))))))) (closure f1183 (f1173) (let () (let ((f1185 (make-vector ((primitive-ref list-length) f1183)))) ((vector-ref f1173 0) f1185 0 f1183)))))
#   env=((f1173 . 0))
# emit-expr (begin (vector-set! f1173 0 (closure (f1177 f1178 f1179) (f1173) (let ((f1177 f1177) (f1178 f1178) (f1179 f1179)) (if (null? f1179) f1177 (begin (vector-set! f1177 f1178 (car f1179)) ((vector-ref f1173 0) f1177 (fxadd1 f1178) (cdr f1179))))))))
# emit-begin
#   expr=(begin (vector-set! f1173 0 (closure (f1177 f1178 f1179) (f1173) (let ((f1177 f1177) (f1178 f1178) (f1179 f1179)) (if (null? f1179) f1177 (begin (vector-set! f1177 f1178 (car f1179)) ((vector-ref f1173 0) f1177 (fxadd1 f1178) (cdr f1179))))))))
#   env=((f1173 . 0))
# emit-expr (vector-set! f1173 0 (closure (f1177 f1178 f1179) (f1173) (let ((f1177 f1177) (f1178 f1178) (f1179 f1179)) (if (null? f1179) f1177 (begin (vector-set! f1177 f1178 (car f1179)) ((vector-ref f1173 0) f1177 (fxadd1 f1178) (cdr f1179)))))))
# emit-expr f1173
# emit-variable-ref
# env=((f1173 . 0))
# var=f1173
    movl 0(%esp), %eax  # stack load f1173
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9550
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9550:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9551"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9551:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9553
    cmp  $0,%eax
    jge _L_9552
_L_9553:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9552:
    movl %eax, -8(%esp)
# emit-expr (closure (f1177 f1178 f1179) (f1173) (let ((f1177 f1177) (f1178 f1178) (f1179 f1179)) (if (null? f1179) f1177 (begin (vector-set! f1177 f1178 (car f1179)) ((vector-ref f1173 0) f1177 (fxadd1 f1178) (cdr f1179))))))
# emit-closure
# si = -12
# env = ((f1173 . 0))
# expr = (closure (f1177 f1178 f1179) (f1173) (let ((f1177 f1177) (f1178 f1178) (f1179 f1179)) (if (null? f1179) f1177 (begin (vector-set! f1177 f1178 (car f1179)) ((vector-ref f1173 0) f1177 (fxadd1 f1178) (cdr f1179))))))
    movl $_L_9554, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f1173 . 0))
# var=f1173
    movl 0(%esp), %eax  # stack load f1173
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f1173
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_9555            # jump around closure body
_L_9554:
# check argument count
    cmp $12,%eax
    je _L_9556
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_9556:
# emit-tail-expr
# si=-20
# env=((f1179 . -16) (f1178 . -12) (f1177 . -8) (f1173 . 4) (f1173 . 0))
# expr=(let ((f1177 f1177) (f1178 f1178) (f1179 f1179)) (if (null? f1179) f1177 (begin (vector-set! f1177 f1178 (car f1179)) ((vector-ref f1173 0) f1177 (fxadd1 f1178) (cdr f1179)))))
# emit-tail-let
#  si   = -20
#  env  = ((f1179 . -16) (f1178 . -12) (f1177 . -8) (f1173 . 4) (f1173 . 0))
#  bindings = ((f1177 f1177) (f1178 f1178) (f1179 f1179))
#  body = (if (null? f1179) f1177 (begin (vector-set! f1177 f1178 (car f1179)) ((vector-ref f1173 0) f1177 (fxadd1 f1178) (cdr f1179))))
# emit-expr f1177
# emit-variable-ref
# env=((f1179 . -16) (f1178 . -12) (f1177 . -8) (f1173 . 4) (f1173 . 0))
# var=f1177
    movl -8(%esp), %eax  # stack load f1177
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-expr f1178
# emit-variable-ref
# env=((f1179 . -16) (f1178 . -12) (f1177 . -8) (f1173 . 4) (f1173 . 0))
# var=f1178
    movl -12(%esp), %eax  # stack load f1178
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f1179
# emit-variable-ref
# env=((f1179 . -16) (f1178 . -12) (f1177 . -8) (f1173 . 4) (f1173 . 0))
# var=f1179
    movl -16(%esp), %eax  # stack load f1179
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-tail-expr
# si=-32
# env=((f1179 . -28) (f1178 . -24) (f1177 . -20) (f1179 . -16) (f1178 . -12) (f1177 . -8) (f1173 . 4) (f1173 . 0))
# expr=(if (null? f1179) f1177 (begin (vector-set! f1177 f1178 (car f1179)) ((vector-ref f1173 0) f1177 (fxadd1 f1178) (cdr f1179))))
# emit-expr (null? f1179)
# emit-expr f1179
# emit-variable-ref
# env=((f1179 . -28) (f1178 . -24) (f1177 . -20) (f1179 . -16) (f1178 . -12) (f1177 . -8) (f1173 . 4) (f1173 . 0))
# var=f1179
    movl -28(%esp), %eax  # stack load f1179
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_9557
# emit-tail-expr
# si=-32
# env=((f1179 . -28) (f1178 . -24) (f1177 . -20) (f1179 . -16) (f1178 . -12) (f1177 . -8) (f1173 . 4) (f1173 . 0))
# expr=f1177
# emit-tail-variable-ref
# emit-variable-ref
# env=((f1179 . -28) (f1178 . -24) (f1177 . -20) (f1179 . -16) (f1178 . -12) (f1177 . -8) (f1173 . 4) (f1173 . 0))
# var=f1177
    movl -20(%esp), %eax  # stack load f1177
# end emit-variable-ref
    ret
# end emit-tail-variable ref
    jmp _L_9558
_L_9557:
# emit-tail-expr
# si=-32
# env=((f1179 . -28) (f1178 . -24) (f1177 . -20) (f1179 . -16) (f1178 . -12) (f1177 . -8) (f1173 . 4) (f1173 . 0))
# expr=(begin (vector-set! f1177 f1178 (car f1179)) ((vector-ref f1173 0) f1177 (fxadd1 f1178) (cdr f1179)))
# tail-begin (begin (vector-set! f1177 f1178 (car f1179)) ((vector-ref f1173 0) f1177 (fxadd1 f1178) (cdr f1179)))
#   env=((f1179 . -28) (f1178 . -24) (f1177 . -20) (f1179 . -16) (f1178 . -12) (f1177 . -8) (f1173 . 4) (f1173 . 0))
# emit-expr (vector-set! f1177 f1178 (car f1179))
# emit-expr f1177
# emit-variable-ref
# env=((f1179 . -28) (f1178 . -24) (f1177 . -20) (f1179 . -16) (f1178 . -12) (f1177 . -8) (f1173 . 4) (f1173 . 0))
# var=f1177
    movl -20(%esp), %eax  # stack load f1177
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9559
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9559:
    movl %eax, -32(%esp)
# emit-expr f1178
# emit-variable-ref
# env=((f1179 . -28) (f1178 . -24) (f1177 . -20) (f1179 . -16) (f1178 . -12) (f1177 . -8) (f1173 . 4) (f1173 . 0))
# var=f1178
    movl -24(%esp), %eax  # stack load f1178
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9560"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9560:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9562
    cmp  $0,%eax
    jge _L_9561
_L_9562:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9561:
    movl %eax, -36(%esp)
# emit-expr (car f1179)
# emit-expr f1179
# emit-variable-ref
# env=((f1179 . -28) (f1178 . -24) (f1177 . -20) (f1179 . -16) (f1178 . -12) (f1177 . -8) (f1173 . 4) (f1173 . 0))
# var=f1179
    movl -28(%esp), %eax  # stack load f1179
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_9563
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $108,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9563:
    movl -1(%eax), %eax
    movl -32(%esp), %ebx
    movl -36(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-tail-expr
# si=-32
# env=((f1179 . -28) (f1178 . -24) (f1177 . -20) (f1179 . -16) (f1178 . -12) (f1177 . -8) (f1173 . 4) (f1173 . 0))
# expr=(begin ((vector-ref f1173 0) f1177 (fxadd1 f1178) (cdr f1179)))
# tail-begin (begin ((vector-ref f1173 0) f1177 (fxadd1 f1178) (cdr f1179)))
#   env=((f1179 . -28) (f1178 . -24) (f1177 . -20) (f1179 . -16) (f1178 . -12) (f1177 . -8) (f1173 . 4) (f1173 . 0))
# emit-tail-expr
# si=-32
# env=((f1179 . -28) (f1178 . -24) (f1177 . -20) (f1179 . -16) (f1178 . -12) (f1177 . -8) (f1173 . 4) (f1173 . 0))
# expr=((vector-ref f1173 0) f1177 (fxadd1 f1178) (cdr f1179))
# emit-tail-funcall
#    si   =-32
#    env  = ((f1179 . -28) (f1178 . -24) (f1177 . -20) (f1179 . -16) (f1178 . -12) (f1177 . -8) (f1173 . 4) (f1173 . 0))
#    expr = (funcall (vector-ref f1173 0) f1177 (fxadd1 f1178) (cdr f1179))
# emit-expr (vector-ref f1173 0)
# emit-expr f1173
# emit-variable-ref
# env=((f1179 . -28) (f1178 . -24) (f1177 . -20) (f1179 . -16) (f1178 . -12) (f1177 . -8) (f1173 . 4) (f1173 . 0))
# var=f1173
    movl 2(%edi), %eax  # frame load f1173
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9564
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9564:
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9565"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9565:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9567
    cmp  $0,%eax
    jge _L_9566
_L_9567:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9566:
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -32(%esp)  # stash funcall-oper in next closure slot
# emit-expr f1177
# emit-variable-ref
# env=((f1179 . -28) (f1178 . -24) (f1177 . -20) (f1179 . -16) (f1178 . -12) (f1177 . -8) (f1173 . 4) (f1173 . 0))
# var=f1177
    movl -20(%esp), %eax  # stack load f1177
# end emit-variable-ref
    mov %eax, -36(%esp)    # arg f1177
# emit-expr (fxadd1 f1178)
# emit-expr f1178
# emit-variable-ref
# env=((f1179 . -28) (f1178 . -24) (f1177 . -20) (f1179 . -16) (f1178 . -12) (f1177 . -8) (f1173 . 4) (f1173 . 0))
# var=f1178
    movl -24(%esp), %eax  # stack load f1178
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9568"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $48,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9568:
     addl $4, %eax
    mov %eax, -40(%esp)    # arg (fxadd1 f1178)
# emit-expr (cdr f1179)
# emit-expr f1179
# emit-variable-ref
# env=((f1179 . -28) (f1178 . -24) (f1177 . -20) (f1179 . -16) (f1178 . -12) (f1177 . -8) (f1173 . 4) (f1173 . 0))
# var=f1179
    movl -28(%esp), %eax  # stack load f1179
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_9569
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9569:
    movl 3(%eax), %eax
    mov %eax, -44(%esp)    # arg (cdr f1179)
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
_L_9558:
    .align 4,0x90
_L_9555:
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f1173 . 0))
# emit-expr (begin (closure f1183 (f1173) (let () (let ((f1185 (make-vector ((primitive-ref list-length) f1183)))) ((vector-ref f1173 0) f1185 0 f1183)))))
# emit-begin
#   expr=(begin (closure f1183 (f1173) (let () (let ((f1185 (make-vector ((primitive-ref list-length) f1183)))) ((vector-ref f1173 0) f1185 0 f1183)))))
#   env=((f1173 . 0))
# emit-expr (closure f1183 (f1173) (let () (let ((f1185 (make-vector ((primitive-ref list-length) f1183)))) ((vector-ref f1173 0) f1185 0 f1183))))
# emit-closure
# si = -4
# env = ((f1173 . 0))
# expr = (closure f1183 (f1173) (let () (let ((f1185 (make-vector ((primitive-ref list-length) f1183)))) ((vector-ref f1173 0) f1185 0 f1183))))
    movl $_L_9570, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f1173 . 0))
# var=f1173
    movl 0(%esp), %eax  # stack load f1173
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f1173
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_9571            # jump around closure body
_L_9570:
# check argument count
    cmp $0,%eax
    jge _L_9572
# invoke error handler eh_argcount_min
    .extern eh$uargcount$umin
    movl eh$uargcount$umin, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_9572:
# emit-build-varargs-list
    movl $63, %esi       # args <- () 
    lea -4(%esp),%edi    # edi <- esp-4
    subl %eax, %edi      # edi <- esp-4-eax    addr of arg[K+N] on stack
_L_9574:
    lea -4(%esp),%ebx    # addr of arg[K] on stack
    cmp %edi, %ebx       # while edi <> esp+(si+4)
    je _L_9573
    movl (%edi),%ebx     # arg i -> car
    movl %ebx, 0(%ebp)
    movl %esi, 4(%ebp)  # esi -> cdr
    movl %ebp, %esi
    addl $1, %esi       # tag as pair
    addl $8,%ebp         # bump heap ptr
    addl $4,%edi         # move to next previous arg from the end
    jmp _L_9574
_L_9573:
    movl %esi, -8(%esp)  # set args
# emit-tail-expr
# si=-12
# env=((f1183 . -8) (f1173 . 4) (f1173 . 0))
# expr=(let () (let ((f1185 (make-vector ((primitive-ref list-length) f1183)))) ((vector-ref f1173 0) f1185 0 f1183)))
# emit-tail-let
#  si   = -12
#  env  = ((f1183 . -8) (f1173 . 4) (f1173 . 0))
#  bindings = ()
#  body = (let ((f1185 (make-vector ((primitive-ref list-length) f1183)))) ((vector-ref f1173 0) f1185 0 f1183))
# emit-tail-expr
# si=-12
# env=((f1183 . -8) (f1173 . 4) (f1173 . 0))
# expr=(let ((f1185 (make-vector ((primitive-ref list-length) f1183)))) ((vector-ref f1173 0) f1185 0 f1183))
# emit-tail-let
#  si   = -12
#  env  = ((f1183 . -8) (f1173 . 4) (f1173 . 0))
#  bindings = ((f1185 (make-vector ((primitive-ref list-length) f1183))))
#  body = ((vector-ref f1173 0) f1185 0 f1183)
# emit-expr (make-vector ((primitive-ref list-length) f1183))
# make-vector ((primitive-ref list-length) f1183)
# emit-expr ((primitive-ref list-length) f1183)
# funcall
#    si   =-12
#    env  = ((f1183 . -8) (f1173 . 4) (f1173 . 0))
#    expr = (funcall (primitive-ref list-length) f1183)
# emit-expr (primitive-ref list-length)
    .extern list$mlength
    movl list$mlength,%eax
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
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr f1183
# emit-variable-ref
# env=((f1183 . -8) (f1173 . 4) (f1173 . 0))
# var=f1183
    movl -8(%esp), %eax  # stack load f1183
# end emit-variable-ref
    mov %eax, -24(%esp)  # arg f1183
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
    je "_L_9576"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9576:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_9577
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9577:
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
# env=((f1185 . -12) (f1183 . -8) (f1173 . 4) (f1173 . 0))
# expr=((vector-ref f1173 0) f1185 0 f1183)
# emit-tail-funcall
#    si   =-16
#    env  = ((f1185 . -12) (f1183 . -8) (f1173 . 4) (f1173 . 0))
#    expr = (funcall (vector-ref f1173 0) f1185 0 f1183)
# emit-expr (vector-ref f1173 0)
# emit-expr f1173
# emit-variable-ref
# env=((f1185 . -12) (f1183 . -8) (f1173 . 4) (f1173 . 0))
# var=f1173
    movl 2(%edi), %eax  # frame load f1173
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9578
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9578:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9579"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9579:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9581
    cmp  $0,%eax
    jge _L_9580
_L_9581:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9580:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr f1185
# emit-variable-ref
# env=((f1185 . -12) (f1183 . -8) (f1173 . 4) (f1173 . 0))
# var=f1185
    movl -12(%esp), %eax  # stack load f1185
# end emit-variable-ref
    mov %eax, -20(%esp)    # arg f1185
# emit-expr 0
    movl $0, %eax     # immed 0
    mov %eax, -24(%esp)    # arg 0
# emit-expr f1183
# emit-variable-ref
# env=((f1185 . -12) (f1183 . -8) (f1173 . 4) (f1173 . 0))
# var=f1183
    movl -8(%esp), %eax  # stack load f1183
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f1183
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
_L_9571:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f1173 . 0))
     movl %eax, vector
# == explicit-begins  ==>
# (letrec ((fill-string (lambda (s k args) (if (null? args) s (begin (string-set! s k (car args)) (fill-string s (fxadd1 k) (cdr args))))))) (lambda args (let ((s (make-string (list-length args)))) (fill-string s 0 args))))
# == eliminate-let*  ==>
# (letrec ((fill-string (lambda (s k args) (if (null? args) s (begin (string-set! s k (car args)) (fill-string s (fxadd1 k) (cdr args))))))) (lambda args (let ((s (make-string (list-length args)))) (fill-string s 0 args))))
# == uniquify-variables  ==>
# (letrec ((f1186 (lambda (f1190 f1191 f1192) (if (null? f1192) f1190 (begin (string-set! f1190 f1191 (car f1192)) (f1186 f1190 (fxadd1 f1191) (cdr f1192))))))) (lambda f1196 (let ((f1198 (make-string (list-length f1196)))) (f1186 f1198 0 f1196))))
# == vectorize-letrec  ==>
# (let ((f1186 (make-vector 1))) (begin (begin (vector-set! f1186 0 (lambda (f1190 f1191 f1192) (if (null? f1192) f1190 (begin (string-set! f1190 f1191 (car f1192)) ((vector-ref f1186 0) f1190 (fxadd1 f1191) (cdr f1192))))))) (lambda f1196 (let ((f1198 (make-string (list-length f1196)))) ((vector-ref f1186 0) f1198 0 f1196)))))
# == eliminate-set!  ==>
# (let ((f1186 (make-vector 1))) (begin (begin (vector-set! f1186 0 (lambda (f1190 f1191 f1192) (let ((f1190 f1190) (f1191 f1191) (f1192 f1192)) (if (null? f1192) f1190 (begin (string-set! f1190 f1191 (car f1192)) ((vector-ref f1186 0) f1190 (fxadd1 f1191) (cdr f1192)))))))) (lambda f1196 (let () (let ((f1198 (make-string (list-length f1196)))) ((vector-ref f1186 0) f1198 0 f1196))))))
# == close-free-variables  ==>
# (let ((f1186 (make-vector 1))) (begin (begin (vector-set! f1186 0 (closure (f1190 f1191 f1192) (f1186) (let ((f1190 f1190) (f1191 f1191) (f1192 f1192)) (if (null? f1192) f1190 (begin (string-set! f1190 f1191 (car f1192)) ((vector-ref f1186 0) f1190 (fxadd1 f1191) (cdr f1192)))))))) (closure f1196 (f1186) (let () (let ((f1198 (make-string (list-length f1196)))) ((vector-ref f1186 0) f1198 0 f1196))))))
# == eliminate-quote  ==>
# (let ((f1186 (make-vector 1))) (begin (begin (vector-set! f1186 0 (closure (f1190 f1191 f1192) (f1186) (let ((f1190 f1190) (f1191 f1191) (f1192 f1192)) (if (null? f1192) f1190 (begin (string-set! f1190 f1191 (car f1192)) ((vector-ref f1186 0) f1190 (fxadd1 f1191) (cdr f1192)))))))) (closure f1196 (f1186) (let () (let ((f1198 (make-string (list-length f1196)))) ((vector-ref f1186 0) f1198 0 f1196))))))
# == eliminate-when/unless  ==>
# (let ((f1186 (make-vector 1))) (begin (begin (vector-set! f1186 0 (closure (f1190 f1191 f1192) (f1186) (let ((f1190 f1190) (f1191 f1191) (f1192 f1192)) (if (null? f1192) f1190 (begin (string-set! f1190 f1191 (car f1192)) ((vector-ref f1186 0) f1190 (fxadd1 f1191) (cdr f1192)))))))) (closure f1196 (f1186) (let () (let ((f1198 (make-string (list-length f1196)))) ((vector-ref f1186 0) f1198 0 f1196))))))
# == eliminate-cond  ==>
# (let ((f1186 (make-vector 1))) (begin (begin (vector-set! f1186 0 (closure (f1190 f1191 f1192) (f1186) (let ((f1190 f1190) (f1191 f1191) (f1192 f1192)) (if (null? f1192) f1190 (begin (string-set! f1190 f1191 (car f1192)) ((vector-ref f1186 0) f1190 (fxadd1 f1191) (cdr f1192)))))))) (closure f1196 (f1186) (let () (let ((f1198 (make-string (list-length f1196)))) ((vector-ref f1186 0) f1198 0 f1196))))))
# == external-symbols  ==>
# (let ((f1186 (make-vector 1))) (begin (begin (vector-set! f1186 0 (closure (f1190 f1191 f1192) (f1186) (let ((f1190 f1190) (f1191 f1191) (f1192 f1192)) (if (null? f1192) f1190 (begin (string-set! f1190 f1191 (car f1192)) ((vector-ref f1186 0) f1190 (fxadd1 f1191) (cdr f1192)))))))) (closure f1196 (f1186) (let () (let ((f1198 (make-string ((primitive-ref list-length) f1196)))) ((vector-ref f1186 0) f1198 0 f1196))))))
# emit-expr (let ((f1186 (make-vector 1))) (begin (begin (vector-set! f1186 0 (closure (f1190 f1191 f1192) (f1186) (let ((f1190 f1190) (f1191 f1191) (f1192 f1192)) (if (null? f1192) f1190 (begin (string-set! f1190 f1191 (car f1192)) ((vector-ref f1186 0) f1190 (fxadd1 f1191) (cdr f1192)))))))) (closure f1196 (f1186) (let () (let ((f1198 (make-string ((primitive-ref list-length) f1196)))) ((vector-ref f1186 0) f1198 0 f1196))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f1186 (make-vector 1)))
#  body = (begin (begin (vector-set! f1186 0 (closure (f1190 f1191 f1192) (f1186) (let ((f1190 f1190) (f1191 f1191) (f1192 f1192)) (if (null? f1192) f1190 (begin (string-set! f1190 f1191 (car f1192)) ((vector-ref f1186 0) f1190 (fxadd1 f1191) (cdr f1192)))))))) (closure f1196 (f1186) (let () (let ((f1198 (make-string ((primitive-ref list-length) f1196)))) ((vector-ref f1186 0) f1198 0 f1196)))))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9582"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9582:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_9583
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9583:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f1186 0 (closure (f1190 f1191 f1192) (f1186) (let ((f1190 f1190) (f1191 f1191) (f1192 f1192)) (if (null? f1192) f1190 (begin (string-set! f1190 f1191 (car f1192)) ((vector-ref f1186 0) f1190 (fxadd1 f1191) (cdr f1192)))))))) (closure f1196 (f1186) (let () (let ((f1198 (make-string ((primitive-ref list-length) f1196)))) ((vector-ref f1186 0) f1198 0 f1196)))))
# emit-begin
#   expr=(begin (begin (vector-set! f1186 0 (closure (f1190 f1191 f1192) (f1186) (let ((f1190 f1190) (f1191 f1191) (f1192 f1192)) (if (null? f1192) f1190 (begin (string-set! f1190 f1191 (car f1192)) ((vector-ref f1186 0) f1190 (fxadd1 f1191) (cdr f1192)))))))) (closure f1196 (f1186) (let () (let ((f1198 (make-string ((primitive-ref list-length) f1196)))) ((vector-ref f1186 0) f1198 0 f1196)))))
#   env=((f1186 . 0))
# emit-expr (begin (vector-set! f1186 0 (closure (f1190 f1191 f1192) (f1186) (let ((f1190 f1190) (f1191 f1191) (f1192 f1192)) (if (null? f1192) f1190 (begin (string-set! f1190 f1191 (car f1192)) ((vector-ref f1186 0) f1190 (fxadd1 f1191) (cdr f1192))))))))
# emit-begin
#   expr=(begin (vector-set! f1186 0 (closure (f1190 f1191 f1192) (f1186) (let ((f1190 f1190) (f1191 f1191) (f1192 f1192)) (if (null? f1192) f1190 (begin (string-set! f1190 f1191 (car f1192)) ((vector-ref f1186 0) f1190 (fxadd1 f1191) (cdr f1192))))))))
#   env=((f1186 . 0))
# emit-expr (vector-set! f1186 0 (closure (f1190 f1191 f1192) (f1186) (let ((f1190 f1190) (f1191 f1191) (f1192 f1192)) (if (null? f1192) f1190 (begin (string-set! f1190 f1191 (car f1192)) ((vector-ref f1186 0) f1190 (fxadd1 f1191) (cdr f1192)))))))
# emit-expr f1186
# emit-variable-ref
# env=((f1186 . 0))
# var=f1186
    movl 0(%esp), %eax  # stack load f1186
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9584
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9584:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9585"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9585:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9587
    cmp  $0,%eax
    jge _L_9586
_L_9587:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9586:
    movl %eax, -8(%esp)
# emit-expr (closure (f1190 f1191 f1192) (f1186) (let ((f1190 f1190) (f1191 f1191) (f1192 f1192)) (if (null? f1192) f1190 (begin (string-set! f1190 f1191 (car f1192)) ((vector-ref f1186 0) f1190 (fxadd1 f1191) (cdr f1192))))))
# emit-closure
# si = -12
# env = ((f1186 . 0))
# expr = (closure (f1190 f1191 f1192) (f1186) (let ((f1190 f1190) (f1191 f1191) (f1192 f1192)) (if (null? f1192) f1190 (begin (string-set! f1190 f1191 (car f1192)) ((vector-ref f1186 0) f1190 (fxadd1 f1191) (cdr f1192))))))
    movl $_L_9588, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f1186 . 0))
# var=f1186
    movl 0(%esp), %eax  # stack load f1186
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f1186
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_9589            # jump around closure body
_L_9588:
# check argument count
    cmp $12,%eax
    je _L_9590
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_9590:
# emit-tail-expr
# si=-20
# env=((f1192 . -16) (f1191 . -12) (f1190 . -8) (f1186 . 4) (f1186 . 0))
# expr=(let ((f1190 f1190) (f1191 f1191) (f1192 f1192)) (if (null? f1192) f1190 (begin (string-set! f1190 f1191 (car f1192)) ((vector-ref f1186 0) f1190 (fxadd1 f1191) (cdr f1192)))))
# emit-tail-let
#  si   = -20
#  env  = ((f1192 . -16) (f1191 . -12) (f1190 . -8) (f1186 . 4) (f1186 . 0))
#  bindings = ((f1190 f1190) (f1191 f1191) (f1192 f1192))
#  body = (if (null? f1192) f1190 (begin (string-set! f1190 f1191 (car f1192)) ((vector-ref f1186 0) f1190 (fxadd1 f1191) (cdr f1192))))
# emit-expr f1190
# emit-variable-ref
# env=((f1192 . -16) (f1191 . -12) (f1190 . -8) (f1186 . 4) (f1186 . 0))
# var=f1190
    movl -8(%esp), %eax  # stack load f1190
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-expr f1191
# emit-variable-ref
# env=((f1192 . -16) (f1191 . -12) (f1190 . -8) (f1186 . 4) (f1186 . 0))
# var=f1191
    movl -12(%esp), %eax  # stack load f1191
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f1192
# emit-variable-ref
# env=((f1192 . -16) (f1191 . -12) (f1190 . -8) (f1186 . 4) (f1186 . 0))
# var=f1192
    movl -16(%esp), %eax  # stack load f1192
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-tail-expr
# si=-32
# env=((f1192 . -28) (f1191 . -24) (f1190 . -20) (f1192 . -16) (f1191 . -12) (f1190 . -8) (f1186 . 4) (f1186 . 0))
# expr=(if (null? f1192) f1190 (begin (string-set! f1190 f1191 (car f1192)) ((vector-ref f1186 0) f1190 (fxadd1 f1191) (cdr f1192))))
# emit-expr (null? f1192)
# emit-expr f1192
# emit-variable-ref
# env=((f1192 . -28) (f1191 . -24) (f1190 . -20) (f1192 . -16) (f1191 . -12) (f1190 . -8) (f1186 . 4) (f1186 . 0))
# var=f1192
    movl -28(%esp), %eax  # stack load f1192
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_9591
# emit-tail-expr
# si=-32
# env=((f1192 . -28) (f1191 . -24) (f1190 . -20) (f1192 . -16) (f1191 . -12) (f1190 . -8) (f1186 . 4) (f1186 . 0))
# expr=f1190
# emit-tail-variable-ref
# emit-variable-ref
# env=((f1192 . -28) (f1191 . -24) (f1190 . -20) (f1192 . -16) (f1191 . -12) (f1190 . -8) (f1186 . 4) (f1186 . 0))
# var=f1190
    movl -20(%esp), %eax  # stack load f1190
# end emit-variable-ref
    ret
# end emit-tail-variable ref
    jmp _L_9592
_L_9591:
# emit-tail-expr
# si=-32
# env=((f1192 . -28) (f1191 . -24) (f1190 . -20) (f1192 . -16) (f1191 . -12) (f1190 . -8) (f1186 . 4) (f1186 . 0))
# expr=(begin (string-set! f1190 f1191 (car f1192)) ((vector-ref f1186 0) f1190 (fxadd1 f1191) (cdr f1192)))
# tail-begin (begin (string-set! f1190 f1191 (car f1192)) ((vector-ref f1186 0) f1190 (fxadd1 f1191) (cdr f1192)))
#   env=((f1192 . -28) (f1191 . -24) (f1190 . -20) (f1192 . -16) (f1191 . -12) (f1190 . -8) (f1186 . 4) (f1186 . 0))
# emit-expr (string-set! f1190 f1191 (car f1192))
# emit-expr f1190
# emit-variable-ref
# env=((f1192 . -28) (f1191 . -24) (f1190 . -20) (f1192 . -16) (f1191 . -12) (f1190 . -8) (f1186 . 4) (f1186 . 0))
# var=f1190
    movl -20(%esp), %eax  # stack load f1190
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_9593
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $160,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9593:
    movl %eax, -32(%esp)
# emit-expr f1191
# emit-variable-ref
# env=((f1192 . -28) (f1191 . -24) (f1190 . -20) (f1192 . -16) (f1191 . -12) (f1190 . -8) (f1186 . 4) (f1186 . 0))
# var=f1191
    movl -24(%esp), %eax  # stack load f1191
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9594"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $160,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9594:
# check bounds on string index
    movl -32(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_9596
    cmp  $0,%eax
    jge _L_9595
_L_9596:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $160,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9595:
    movl %eax, -36(%esp)
# emit-expr (car f1192)
# emit-expr f1192
# emit-variable-ref
# env=((f1192 . -28) (f1191 . -24) (f1190 . -20) (f1192 . -16) (f1191 . -12) (f1190 . -8) (f1186 . 4) (f1186 . 0))
# var=f1192
    movl -28(%esp), %eax  # stack load f1192
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_9597
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $108,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9597:
    movl -1(%eax), %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_9598"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $160,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9598:
    movl -32(%esp), %ebx
    movl -36(%esp), %esi
    sar $2, %esi
    movb  %ah, -2(%ebx,%esi)
# emit-tail-expr
# si=-32
# env=((f1192 . -28) (f1191 . -24) (f1190 . -20) (f1192 . -16) (f1191 . -12) (f1190 . -8) (f1186 . 4) (f1186 . 0))
# expr=(begin ((vector-ref f1186 0) f1190 (fxadd1 f1191) (cdr f1192)))
# tail-begin (begin ((vector-ref f1186 0) f1190 (fxadd1 f1191) (cdr f1192)))
#   env=((f1192 . -28) (f1191 . -24) (f1190 . -20) (f1192 . -16) (f1191 . -12) (f1190 . -8) (f1186 . 4) (f1186 . 0))
# emit-tail-expr
# si=-32
# env=((f1192 . -28) (f1191 . -24) (f1190 . -20) (f1192 . -16) (f1191 . -12) (f1190 . -8) (f1186 . 4) (f1186 . 0))
# expr=((vector-ref f1186 0) f1190 (fxadd1 f1191) (cdr f1192))
# emit-tail-funcall
#    si   =-32
#    env  = ((f1192 . -28) (f1191 . -24) (f1190 . -20) (f1192 . -16) (f1191 . -12) (f1190 . -8) (f1186 . 4) (f1186 . 0))
#    expr = (funcall (vector-ref f1186 0) f1190 (fxadd1 f1191) (cdr f1192))
# emit-expr (vector-ref f1186 0)
# emit-expr f1186
# emit-variable-ref
# env=((f1192 . -28) (f1191 . -24) (f1190 . -20) (f1192 . -16) (f1191 . -12) (f1190 . -8) (f1186 . 4) (f1186 . 0))
# var=f1186
    movl 2(%edi), %eax  # frame load f1186
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9599
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9599:
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9600"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9600:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9602
    cmp  $0,%eax
    jge _L_9601
_L_9602:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9601:
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -32(%esp)  # stash funcall-oper in next closure slot
# emit-expr f1190
# emit-variable-ref
# env=((f1192 . -28) (f1191 . -24) (f1190 . -20) (f1192 . -16) (f1191 . -12) (f1190 . -8) (f1186 . 4) (f1186 . 0))
# var=f1190
    movl -20(%esp), %eax  # stack load f1190
# end emit-variable-ref
    mov %eax, -36(%esp)    # arg f1190
# emit-expr (fxadd1 f1191)
# emit-expr f1191
# emit-variable-ref
# env=((f1192 . -28) (f1191 . -24) (f1190 . -20) (f1192 . -16) (f1191 . -12) (f1190 . -8) (f1186 . 4) (f1186 . 0))
# var=f1191
    movl -24(%esp), %eax  # stack load f1191
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9603"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $48,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9603:
     addl $4, %eax
    mov %eax, -40(%esp)    # arg (fxadd1 f1191)
# emit-expr (cdr f1192)
# emit-expr f1192
# emit-variable-ref
# env=((f1192 . -28) (f1191 . -24) (f1190 . -20) (f1192 . -16) (f1191 . -12) (f1190 . -8) (f1186 . 4) (f1186 . 0))
# var=f1192
    movl -28(%esp), %eax  # stack load f1192
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_9604
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9604:
    movl 3(%eax), %eax
    mov %eax, -44(%esp)    # arg (cdr f1192)
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
_L_9592:
    .align 4,0x90
_L_9589:
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f1186 . 0))
# emit-expr (begin (closure f1196 (f1186) (let () (let ((f1198 (make-string ((primitive-ref list-length) f1196)))) ((vector-ref f1186 0) f1198 0 f1196)))))
# emit-begin
#   expr=(begin (closure f1196 (f1186) (let () (let ((f1198 (make-string ((primitive-ref list-length) f1196)))) ((vector-ref f1186 0) f1198 0 f1196)))))
#   env=((f1186 . 0))
# emit-expr (closure f1196 (f1186) (let () (let ((f1198 (make-string ((primitive-ref list-length) f1196)))) ((vector-ref f1186 0) f1198 0 f1196))))
# emit-closure
# si = -4
# env = ((f1186 . 0))
# expr = (closure f1196 (f1186) (let () (let ((f1198 (make-string ((primitive-ref list-length) f1196)))) ((vector-ref f1186 0) f1198 0 f1196))))
    movl $_L_9605, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f1186 . 0))
# var=f1186
    movl 0(%esp), %eax  # stack load f1186
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f1186
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_9606            # jump around closure body
_L_9605:
# check argument count
    cmp $0,%eax
    jge _L_9607
# invoke error handler eh_argcount_min
    .extern eh$uargcount$umin
    movl eh$uargcount$umin, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_9607:
# emit-build-varargs-list
    movl $63, %esi       # args <- () 
    lea -4(%esp),%edi    # edi <- esp-4
    subl %eax, %edi      # edi <- esp-4-eax    addr of arg[K+N] on stack
_L_9609:
    lea -4(%esp),%ebx    # addr of arg[K] on stack
    cmp %edi, %ebx       # while edi <> esp+(si+4)
    je _L_9608
    movl (%edi),%ebx     # arg i -> car
    movl %ebx, 0(%ebp)
    movl %esi, 4(%ebp)  # esi -> cdr
    movl %ebp, %esi
    addl $1, %esi       # tag as pair
    addl $8,%ebp         # bump heap ptr
    addl $4,%edi         # move to next previous arg from the end
    jmp _L_9609
_L_9608:
    movl %esi, -8(%esp)  # set args
# emit-tail-expr
# si=-12
# env=((f1196 . -8) (f1186 . 4) (f1186 . 0))
# expr=(let () (let ((f1198 (make-string ((primitive-ref list-length) f1196)))) ((vector-ref f1186 0) f1198 0 f1196)))
# emit-tail-let
#  si   = -12
#  env  = ((f1196 . -8) (f1186 . 4) (f1186 . 0))
#  bindings = ()
#  body = (let ((f1198 (make-string ((primitive-ref list-length) f1196)))) ((vector-ref f1186 0) f1198 0 f1196))
# emit-tail-expr
# si=-12
# env=((f1196 . -8) (f1186 . 4) (f1186 . 0))
# expr=(let ((f1198 (make-string ((primitive-ref list-length) f1196)))) ((vector-ref f1186 0) f1198 0 f1196))
# emit-tail-let
#  si   = -12
#  env  = ((f1196 . -8) (f1186 . 4) (f1186 . 0))
#  bindings = ((f1198 (make-string ((primitive-ref list-length) f1196))))
#  body = ((vector-ref f1186 0) f1198 0 f1196)
# emit-expr (make-string ((primitive-ref list-length) f1196))
# make-string len=((primitive-ref list-length) f1196)
# emit-expr ((primitive-ref list-length) f1196)
# funcall
#    si   =-12
#    env  = ((f1196 . -8) (f1186 . 4) (f1186 . 0))
#    expr = (funcall (primitive-ref list-length) f1196)
# emit-expr (primitive-ref list-length)
    .extern list$mlength
    movl list$mlength,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9610"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9610":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr f1196
# emit-variable-ref
# env=((f1196 . -8) (f1186 . 4) (f1186 . 0))
# var=f1196
    movl -8(%esp), %eax  # stack load f1196
# end emit-variable-ref
    mov %eax, -24(%esp)  # arg f1196
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
    je "_L_9611"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9611:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_9612
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9612:
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
# env=((f1198 . -12) (f1196 . -8) (f1186 . 4) (f1186 . 0))
# expr=((vector-ref f1186 0) f1198 0 f1196)
# emit-tail-funcall
#    si   =-16
#    env  = ((f1198 . -12) (f1196 . -8) (f1186 . 4) (f1186 . 0))
#    expr = (funcall (vector-ref f1186 0) f1198 0 f1196)
# emit-expr (vector-ref f1186 0)
# emit-expr f1186
# emit-variable-ref
# env=((f1198 . -12) (f1196 . -8) (f1186 . 4) (f1186 . 0))
# var=f1186
    movl 2(%edi), %eax  # frame load f1186
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9613
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9613:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9614"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9614:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9616
    cmp  $0,%eax
    jge _L_9615
_L_9616:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9615:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr f1198
# emit-variable-ref
# env=((f1198 . -12) (f1196 . -8) (f1186 . 4) (f1186 . 0))
# var=f1198
    movl -12(%esp), %eax  # stack load f1198
# end emit-variable-ref
    mov %eax, -20(%esp)    # arg f1198
# emit-expr 0
    movl $0, %eax     # immed 0
    mov %eax, -24(%esp)    # arg 0
# emit-expr f1196
# emit-variable-ref
# env=((f1198 . -12) (f1196 . -8) (f1186 . 4) (f1186 . 0))
# var=f1196
    movl -8(%esp), %eax  # stack load f1196
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f1196
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
_L_9606:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f1186 . 0))
     movl %eax, string
# == explicit-begins  ==>
# (let* ((write-stderr (lambda (s) (foreign-call "s_write" 2 s (string-length s)))) (write-errmsg (lambda (sym emsg) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))))) (lambda (sym emsg) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))
# == eliminate-let*  ==>
# (let ((write-stderr (lambda (s) (foreign-call "s_write" 2 s (string-length s))))) (let ((write-errmsg (lambda (sym emsg) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))))) (lambda (sym emsg) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1)))))
# == uniquify-variables  ==>
# (let ((f1199 (lambda (f1200) (foreign-call "s_write" 2 f1200 (string-length f1200))))) (let ((f1208 (lambda (f1209 f1210) (begin (f1199 "error:") (f1199 (symbol->string f1209)) (f1199 ": ") (f1199 f1210) (f1199 "\n"))))) (lambda (f1213 f1214) (begin (f1208 f1213 f1214) (foreign-call "s_exit" 1)))))
# == vectorize-letrec  ==>
# (let ((f1199 (lambda (f1200) (foreign-call "s_write" 2 f1200 (string-length f1200))))) (let ((f1208 (lambda (f1209 f1210) (begin (f1199 "error:") (f1199 (symbol->string f1209)) (f1199 ": ") (f1199 f1210) (f1199 "\n"))))) (lambda (f1213 f1214) (begin (f1208 f1213 f1214) (foreign-call "s_exit" 1)))))
# == eliminate-set!  ==>
# (let ((f1199 (lambda (f1200) (let ((f1200 f1200)) (foreign-call "s_write" 2 f1200 (string-length f1200)))))) (let ((f1208 (lambda (f1209 f1210) (let ((f1209 f1209) (f1210 f1210)) (begin (f1199 "error:") (f1199 (symbol->string f1209)) (f1199 ": ") (f1199 f1210) (f1199 "\n")))))) (lambda (f1213 f1214) (let ((f1213 f1213) (f1214 f1214)) (begin (f1208 f1213 f1214) (foreign-call "s_exit" 1))))))
# == close-free-variables  ==>
# (let ((f1199 (closure (f1200) () (let ((f1200 f1200)) (foreign-call "s_write" 2 f1200 (string-length f1200)))))) (let ((f1208 (closure (f1209 f1210) (f1199 f1199 f1199 f1199 f1199) (let ((f1209 f1209) (f1210 f1210)) (begin (f1199 "error:") (f1199 (symbol->string f1209)) (f1199 ": ") (f1199 f1210) (f1199 "\n")))))) (closure (f1213 f1214) (f1208) (let ((f1213 f1213) (f1214 f1214)) (begin (f1208 f1213 f1214) (foreign-call "s_exit" 1))))))
# == eliminate-quote  ==>
# (let ((f1199 (closure (f1200) () (let ((f1200 f1200)) (foreign-call "s_write" 2 f1200 (string-length f1200)))))) (let ((f1208 (closure (f1209 f1210) (f1199 f1199 f1199 f1199 f1199) (let ((f1209 f1209) (f1210 f1210)) (begin (f1199 "error:") (f1199 (symbol->string f1209)) (f1199 ": ") (f1199 f1210) (f1199 "\n")))))) (closure (f1213 f1214) (f1208) (let ((f1213 f1213) (f1214 f1214)) (begin (f1208 f1213 f1214) (foreign-call "s_exit" 1))))))
# == eliminate-when/unless  ==>
# (let ((f1199 (closure (f1200) () (let ((f1200 f1200)) (foreign-call "s_write" 2 f1200 (string-length f1200)))))) (let ((f1208 (closure (f1209 f1210) (f1199 f1199 f1199 f1199 f1199) (let ((f1209 f1209) (f1210 f1210)) (begin (f1199 "error:") (f1199 (symbol->string f1209)) (f1199 ": ") (f1199 f1210) (f1199 "\n")))))) (closure (f1213 f1214) (f1208) (let ((f1213 f1213) (f1214 f1214)) (begin (f1208 f1213 f1214) (foreign-call "s_exit" 1))))))
# == eliminate-cond  ==>
# (let ((f1199 (closure (f1200) () (let ((f1200 f1200)) (foreign-call "s_write" 2 f1200 (string-length f1200)))))) (let ((f1208 (closure (f1209 f1210) (f1199 f1199 f1199 f1199 f1199) (let ((f1209 f1209) (f1210 f1210)) (begin (f1199 "error:") (f1199 (symbol->string f1209)) (f1199 ": ") (f1199 f1210) (f1199 "\n")))))) (closure (f1213 f1214) (f1208) (let ((f1213 f1213) (f1214 f1214)) (begin (f1208 f1213 f1214) (foreign-call "s_exit" 1))))))
# == external-symbols  ==>
# (let ((f1199 (closure (f1200) () (let ((f1200 f1200)) (foreign-call "s_write" 2 f1200 (string-length f1200)))))) (let ((f1208 (closure (f1209 f1210) (f1199 f1199 f1199 f1199 f1199) (let ((f1209 f1209) (f1210 f1210)) (begin (f1199 "error:") (f1199 (symbol->string f1209)) (f1199 ": ") (f1199 f1210) (f1199 "\n")))))) (closure (f1213 f1214) (f1208) (let ((f1213 f1213) (f1214 f1214)) (begin (f1208 f1213 f1214) (foreign-call "s_exit" 1))))))
# emit-expr (let ((f1199 (closure (f1200) () (let ((f1200 f1200)) (foreign-call "s_write" 2 f1200 (string-length f1200)))))) (let ((f1208 (closure (f1209 f1210) (f1199 f1199 f1199 f1199 f1199) (let ((f1209 f1209) (f1210 f1210)) (begin (f1199 "error:") (f1199 (symbol->string f1209)) (f1199 ": ") (f1199 f1210) (f1199 "\n")))))) (closure (f1213 f1214) (f1208) (let ((f1213 f1213) (f1214 f1214)) (begin (f1208 f1213 f1214) (foreign-call "s_exit" 1))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f1199 (closure (f1200) () (let ((f1200 f1200)) (foreign-call "s_write" 2 f1200 (string-length f1200))))))
#  body = (let ((f1208 (closure (f1209 f1210) (f1199 f1199 f1199 f1199 f1199) (let ((f1209 f1209) (f1210 f1210)) (begin (f1199 "error:") (f1199 (symbol->string f1209)) (f1199 ": ") (f1199 f1210) (f1199 "\n")))))) (closure (f1213 f1214) (f1208) (let ((f1213 f1213) (f1214 f1214)) (begin (f1208 f1213 f1214) (foreign-call "s_exit" 1)))))
# emit-expr (closure (f1200) () (let ((f1200 f1200)) (foreign-call "s_write" 2 f1200 (string-length f1200))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f1200) () (let ((f1200 f1200)) (foreign-call "s_write" 2 f1200 (string-length f1200))))
    movl $_L_9617, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_9618            # jump around closure body
_L_9617:
# check argument count
    cmp $4,%eax
    je _L_9619
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_9619:
# emit-tail-expr
# si=-12
# env=((f1200 . -8))
# expr=(let ((f1200 f1200)) (foreign-call "s_write" 2 f1200 (string-length f1200)))
# emit-tail-let
#  si   = -12
#  env  = ((f1200 . -8))
#  bindings = ((f1200 f1200))
#  body = (foreign-call "s_write" 2 f1200 (string-length f1200))
# emit-expr f1200
# emit-variable-ref
# env=((f1200 . -8))
# var=f1200
    movl -8(%esp), %eax  # stack load f1200
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f1200 . -12) (f1200 . -8))
# expr=(foreign-call "s_write" 2 f1200 (string-length f1200))
    movl %ecx,-16(%esp)
    movl %esp,-20(%esp)
# emit-expr (string-length f1200)
# emit-expr f1200
# emit-variable-ref
# env=((f1200 . -12) (f1200 . -8))
# var=f1200
    movl -12(%esp), %eax  # stack load f1200
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_9620
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9620:
    movl -6(%eax), %eax
    movl %eax, -24(%esp)
# emit-expr f1200
# emit-variable-ref
# env=((f1200 . -12) (f1200 . -8))
# var=f1200
    movl -12(%esp), %eax  # stack load f1200
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
_L_9618:
    movl %eax, 0(%esp)  # stack save
# emit-expr (let ((f1208 (closure (f1209 f1210) (f1199 f1199 f1199 f1199 f1199) (let ((f1209 f1209) (f1210 f1210)) (begin (f1199 "error:") (f1199 (symbol->string f1209)) (f1199 ": ") (f1199 f1210) (f1199 "\n")))))) (closure (f1213 f1214) (f1208) (let ((f1213 f1213) (f1214 f1214)) (begin (f1208 f1213 f1214) (foreign-call "s_exit" 1)))))
# emit-let
#  si   = -4
#  env  = ((f1199 . 0))
#  bindings = ((f1208 (closure (f1209 f1210) (f1199 f1199 f1199 f1199 f1199) (let ((f1209 f1209) (f1210 f1210)) (begin (f1199 "error:") (f1199 (symbol->string f1209)) (f1199 ": ") (f1199 f1210) (f1199 "\n"))))))
#  body = (closure (f1213 f1214) (f1208) (let ((f1213 f1213) (f1214 f1214)) (begin (f1208 f1213 f1214) (foreign-call "s_exit" 1))))
# emit-expr (closure (f1209 f1210) (f1199 f1199 f1199 f1199 f1199) (let ((f1209 f1209) (f1210 f1210)) (begin (f1199 "error:") (f1199 (symbol->string f1209)) (f1199 ": ") (f1199 f1210) (f1199 "\n"))))
# emit-closure
# si = -4
# env = ((f1199 . 0))
# expr = (closure (f1209 f1210) (f1199 f1199 f1199 f1199 f1199) (let ((f1209 f1209) (f1210 f1210)) (begin (f1199 "error:") (f1199 (symbol->string f1209)) (f1199 ": ") (f1199 f1210) (f1199 "\n"))))
    movl $_L_9621, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f1199 . 0))
# var=f1199
    movl 0(%esp), %eax  # stack load f1199
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f1199
# emit-variable-ref
# env=((f1199 . 0))
# var=f1199
    movl 0(%esp), %eax  # stack load f1199
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f1199
# emit-variable-ref
# env=((f1199 . 0))
# var=f1199
    movl 0(%esp), %eax  # stack load f1199
# end emit-variable-ref
   movl  %eax, 12(%ebp)  # f1199
# emit-variable-ref
# env=((f1199 . 0))
# var=f1199
    movl 0(%esp), %eax  # stack load f1199
# end emit-variable-ref
   movl  %eax, 16(%ebp)  # f1199
# emit-variable-ref
# env=((f1199 . 0))
# var=f1199
    movl 0(%esp), %eax  # stack load f1199
# end emit-variable-ref
   movl  %eax, 20(%ebp)  # f1199
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $24, %ebp     # bump ebp
    jmp _L_9622            # jump around closure body
_L_9621:
# check argument count
    cmp $8,%eax
    je _L_9623
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_9623:
# emit-tail-expr
# si=-16
# env=((f1210 . -12) (f1209 . -8) (f1199 . 20) (f1199 . 16) (f1199 . 12) (f1199 . 8) (f1199 . 4) (f1199 . 0))
# expr=(let ((f1209 f1209) (f1210 f1210)) (begin (f1199 "error:") (f1199 (symbol->string f1209)) (f1199 ": ") (f1199 f1210) (f1199 "\n")))
# emit-tail-let
#  si   = -16
#  env  = ((f1210 . -12) (f1209 . -8) (f1199 . 20) (f1199 . 16) (f1199 . 12) (f1199 . 8) (f1199 . 4) (f1199 . 0))
#  bindings = ((f1209 f1209) (f1210 f1210))
#  body = (begin (f1199 "error:") (f1199 (symbol->string f1209)) (f1199 ": ") (f1199 f1210) (f1199 "\n"))
# emit-expr f1209
# emit-variable-ref
# env=((f1210 . -12) (f1209 . -8) (f1199 . 20) (f1199 . 16) (f1199 . 12) (f1199 . 8) (f1199 . 4) (f1199 . 0))
# var=f1209
    movl -8(%esp), %eax  # stack load f1209
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f1210
# emit-variable-ref
# env=((f1210 . -12) (f1209 . -8) (f1199 . 20) (f1199 . 16) (f1199 . 12) (f1199 . 8) (f1199 . 4) (f1199 . 0))
# var=f1210
    movl -12(%esp), %eax  # stack load f1210
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f1210 . -20) (f1209 . -16) (f1210 . -12) (f1209 . -8) (f1199 . 20) (f1199 . 16) (f1199 . 12) (f1199 . 8) (f1199 . 4) (f1199 . 0))
# expr=(begin (f1199 "error:") (f1199 (symbol->string f1209)) (f1199 ": ") (f1199 f1210) (f1199 "\n"))
# tail-begin (begin (f1199 "error:") (f1199 (symbol->string f1209)) (f1199 ": ") (f1199 f1210) (f1199 "\n"))
#   env=((f1210 . -20) (f1209 . -16) (f1210 . -12) (f1209 . -8) (f1199 . 20) (f1199 . 16) (f1199 . 12) (f1199 . 8) (f1199 . 4) (f1199 . 0))
# emit-expr (f1199 "error:")
# funcall
#    si   =-24
#    env  = ((f1210 . -20) (f1209 . -16) (f1210 . -12) (f1209 . -8) (f1199 . 20) (f1199 . 16) (f1199 . 12) (f1199 . 8) (f1199 . 4) (f1199 . 0))
#    expr = (funcall f1199 "error:")
# emit-expr f1199
# emit-variable-ref
# env=((f1210 . -20) (f1209 . -16) (f1210 . -12) (f1209 . -8) (f1199 . 20) (f1199 . 16) (f1199 . 12) (f1199 . 8) (f1199 . 4) (f1199 . 0))
# var=f1199
    movl 18(%edi), %eax  # frame load f1199
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9624"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9624":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr "error:"
# string literal
    jmp _L_9626
    .align 8,0x90
_L_9625 :
    .int 24
    .ascii "error:"
_L_9626:
    movl $_L_9625, %eax
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
# env=((f1210 . -20) (f1209 . -16) (f1210 . -12) (f1209 . -8) (f1199 . 20) (f1199 . 16) (f1199 . 12) (f1199 . 8) (f1199 . 4) (f1199 . 0))
# expr=(begin (f1199 (symbol->string f1209)) (f1199 ": ") (f1199 f1210) (f1199 "\n"))
# tail-begin (begin (f1199 (symbol->string f1209)) (f1199 ": ") (f1199 f1210) (f1199 "\n"))
#   env=((f1210 . -20) (f1209 . -16) (f1210 . -12) (f1209 . -8) (f1199 . 20) (f1199 . 16) (f1199 . 12) (f1199 . 8) (f1199 . 4) (f1199 . 0))
# emit-expr (f1199 (symbol->string f1209))
# funcall
#    si   =-24
#    env  = ((f1210 . -20) (f1209 . -16) (f1210 . -12) (f1209 . -8) (f1199 . 20) (f1199 . 16) (f1199 . 12) (f1199 . 8) (f1199 . 4) (f1199 . 0))
#    expr = (funcall f1199 (symbol->string f1209))
# emit-expr f1199
# emit-variable-ref
# env=((f1210 . -20) (f1209 . -16) (f1210 . -12) (f1209 . -8) (f1199 . 20) (f1199 . 16) (f1199 . 12) (f1199 . 8) (f1199 . 4) (f1199 . 0))
# var=f1199
    movl 18(%edi), %eax  # frame load f1199
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9627"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9627":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr (symbol->string f1209)
# symbol->string f1209
# emit-expr f1209
# emit-variable-ref
# env=((f1210 . -20) (f1209 . -16) (f1210 . -12) (f1209 . -8) (f1199 . 20) (f1199 . 16) (f1199 . 12) (f1199 . 8) (f1199 . 4) (f1199 . 0))
# var=f1209
    movl -16(%esp), %eax  # stack load f1209
# end emit-variable-ref
    movl -3(%eax), %eax
    mov %eax, -36(%esp)  # arg (symbol->string f1209)
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((f1210 . -20) (f1209 . -16) (f1210 . -12) (f1209 . -8) (f1199 . 20) (f1199 . 16) (f1199 . 12) (f1199 . 8) (f1199 . 4) (f1199 . 0))
# expr=(begin (f1199 ": ") (f1199 f1210) (f1199 "\n"))
# tail-begin (begin (f1199 ": ") (f1199 f1210) (f1199 "\n"))
#   env=((f1210 . -20) (f1209 . -16) (f1210 . -12) (f1209 . -8) (f1199 . 20) (f1199 . 16) (f1199 . 12) (f1199 . 8) (f1199 . 4) (f1199 . 0))
# emit-expr (f1199 ": ")
# funcall
#    si   =-24
#    env  = ((f1210 . -20) (f1209 . -16) (f1210 . -12) (f1209 . -8) (f1199 . 20) (f1199 . 16) (f1199 . 12) (f1199 . 8) (f1199 . 4) (f1199 . 0))
#    expr = (funcall f1199 ": ")
# emit-expr f1199
# emit-variable-ref
# env=((f1210 . -20) (f1209 . -16) (f1210 . -12) (f1209 . -8) (f1199 . 20) (f1199 . 16) (f1199 . 12) (f1199 . 8) (f1199 . 4) (f1199 . 0))
# var=f1199
    movl 18(%edi), %eax  # frame load f1199
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9628"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9628":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr ": "
# string literal
    jmp _L_9630
    .align 8,0x90
_L_9629 :
    .int 8
    .ascii ": "
_L_9630:
    movl $_L_9629, %eax
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
# env=((f1210 . -20) (f1209 . -16) (f1210 . -12) (f1209 . -8) (f1199 . 20) (f1199 . 16) (f1199 . 12) (f1199 . 8) (f1199 . 4) (f1199 . 0))
# expr=(begin (f1199 f1210) (f1199 "\n"))
# tail-begin (begin (f1199 f1210) (f1199 "\n"))
#   env=((f1210 . -20) (f1209 . -16) (f1210 . -12) (f1209 . -8) (f1199 . 20) (f1199 . 16) (f1199 . 12) (f1199 . 8) (f1199 . 4) (f1199 . 0))
# emit-expr (f1199 f1210)
# funcall
#    si   =-24
#    env  = ((f1210 . -20) (f1209 . -16) (f1210 . -12) (f1209 . -8) (f1199 . 20) (f1199 . 16) (f1199 . 12) (f1199 . 8) (f1199 . 4) (f1199 . 0))
#    expr = (funcall f1199 f1210)
# emit-expr f1199
# emit-variable-ref
# env=((f1210 . -20) (f1209 . -16) (f1210 . -12) (f1209 . -8) (f1199 . 20) (f1199 . 16) (f1199 . 12) (f1199 . 8) (f1199 . 4) (f1199 . 0))
# var=f1199
    movl 18(%edi), %eax  # frame load f1199
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9631"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9631":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f1210
# emit-variable-ref
# env=((f1210 . -20) (f1209 . -16) (f1210 . -12) (f1209 . -8) (f1199 . 20) (f1199 . 16) (f1199 . 12) (f1199 . 8) (f1199 . 4) (f1199 . 0))
# var=f1210
    movl -20(%esp), %eax  # stack load f1210
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f1210
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((f1210 . -20) (f1209 . -16) (f1210 . -12) (f1209 . -8) (f1199 . 20) (f1199 . 16) (f1199 . 12) (f1199 . 8) (f1199 . 4) (f1199 . 0))
# expr=(begin (f1199 "\n"))
# tail-begin (begin (f1199 "\n"))
#   env=((f1210 . -20) (f1209 . -16) (f1210 . -12) (f1209 . -8) (f1199 . 20) (f1199 . 16) (f1199 . 12) (f1199 . 8) (f1199 . 4) (f1199 . 0))
# emit-tail-expr
# si=-24
# env=((f1210 . -20) (f1209 . -16) (f1210 . -12) (f1209 . -8) (f1199 . 20) (f1199 . 16) (f1199 . 12) (f1199 . 8) (f1199 . 4) (f1199 . 0))
# expr=(f1199 "\n")
# emit-tail-funcall
#    si   =-24
#    env  = ((f1210 . -20) (f1209 . -16) (f1210 . -12) (f1209 . -8) (f1199 . 20) (f1199 . 16) (f1199 . 12) (f1199 . 8) (f1199 . 4) (f1199 . 0))
#    expr = (funcall f1199 "\n")
# emit-expr f1199
# emit-variable-ref
# env=((f1210 . -20) (f1209 . -16) (f1210 . -12) (f1209 . -8) (f1199 . 20) (f1199 . 16) (f1199 . 12) (f1199 . 8) (f1199 . 4) (f1199 . 0))
# var=f1199
    movl 18(%edi), %eax  # frame load f1199
# end emit-variable-ref
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr "\n"
# string literal
    jmp _L_9633
    .align 8,0x90
_L_9632 :
    .int 4
    .ascii "\n"
_L_9633:
    movl $_L_9632, %eax
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
_L_9622:
    movl %eax, -4(%esp)  # stack save
# emit-expr (closure (f1213 f1214) (f1208) (let ((f1213 f1213) (f1214 f1214)) (begin (f1208 f1213 f1214) (foreign-call "s_exit" 1))))
# emit-closure
# si = -8
# env = ((f1208 . -4) (f1199 . 0))
# expr = (closure (f1213 f1214) (f1208) (let ((f1213 f1213) (f1214 f1214)) (begin (f1208 f1213 f1214) (foreign-call "s_exit" 1))))
    movl $_L_9634, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f1208 . -4) (f1199 . 0))
# var=f1208
    movl -4(%esp), %eax  # stack load f1208
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f1208
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_9635            # jump around closure body
_L_9634:
# check argument count
    cmp $8,%eax
    je _L_9636
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_9636:
# emit-tail-expr
# si=-16
# env=((f1214 . -12) (f1213 . -8) (f1208 . 4) (f1208 . -4) (f1199 . 0))
# expr=(let ((f1213 f1213) (f1214 f1214)) (begin (f1208 f1213 f1214) (foreign-call "s_exit" 1)))
# emit-tail-let
#  si   = -16
#  env  = ((f1214 . -12) (f1213 . -8) (f1208 . 4) (f1208 . -4) (f1199 . 0))
#  bindings = ((f1213 f1213) (f1214 f1214))
#  body = (begin (f1208 f1213 f1214) (foreign-call "s_exit" 1))
# emit-expr f1213
# emit-variable-ref
# env=((f1214 . -12) (f1213 . -8) (f1208 . 4) (f1208 . -4) (f1199 . 0))
# var=f1213
    movl -8(%esp), %eax  # stack load f1213
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f1214
# emit-variable-ref
# env=((f1214 . -12) (f1213 . -8) (f1208 . 4) (f1208 . -4) (f1199 . 0))
# var=f1214
    movl -12(%esp), %eax  # stack load f1214
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f1214 . -20) (f1213 . -16) (f1214 . -12) (f1213 . -8) (f1208 . 4) (f1208 . -4) (f1199 . 0))
# expr=(begin (f1208 f1213 f1214) (foreign-call "s_exit" 1))
# tail-begin (begin (f1208 f1213 f1214) (foreign-call "s_exit" 1))
#   env=((f1214 . -20) (f1213 . -16) (f1214 . -12) (f1213 . -8) (f1208 . 4) (f1208 . -4) (f1199 . 0))
# emit-expr (f1208 f1213 f1214)
# funcall
#    si   =-24
#    env  = ((f1214 . -20) (f1213 . -16) (f1214 . -12) (f1213 . -8) (f1208 . 4) (f1208 . -4) (f1199 . 0))
#    expr = (funcall f1208 f1213 f1214)
# emit-expr f1208
# emit-variable-ref
# env=((f1214 . -20) (f1213 . -16) (f1214 . -12) (f1213 . -8) (f1208 . 4) (f1208 . -4) (f1199 . 0))
# var=f1208
    movl 2(%edi), %eax  # frame load f1208
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9637"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9637":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f1213
# emit-variable-ref
# env=((f1214 . -20) (f1213 . -16) (f1214 . -12) (f1213 . -8) (f1208 . 4) (f1208 . -4) (f1199 . 0))
# var=f1213
    movl -16(%esp), %eax  # stack load f1213
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f1213
# emit-expr f1214
# emit-variable-ref
# env=((f1214 . -20) (f1213 . -16) (f1214 . -12) (f1213 . -8) (f1208 . 4) (f1208 . -4) (f1199 . 0))
# var=f1214
    movl -20(%esp), %eax  # stack load f1214
# end emit-variable-ref
    mov %eax, -40(%esp)  # arg f1214
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((f1214 . -20) (f1213 . -16) (f1214 . -12) (f1213 . -8) (f1208 . 4) (f1208 . -4) (f1199 . 0))
# expr=(begin (foreign-call "s_exit" 1))
# tail-begin (begin (foreign-call "s_exit" 1))
#   env=((f1214 . -20) (f1213 . -16) (f1214 . -12) (f1213 . -8) (f1208 . 4) (f1208 . -4) (f1199 . 0))
# emit-tail-expr
# si=-24
# env=((f1214 . -20) (f1213 . -16) (f1214 . -12) (f1213 . -8) (f1208 . 4) (f1208 . -4) (f1199 . 0))
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
_L_9635:
     movl %eax, error
# == explicit-begins  ==>
# (let ((p (quote ()))) (begin (set! p (cons (quote procedure?) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote symbol-value) p)) (set! p (cons (quote symbol->string) p)) (set! p (cons (quote make-symbol) p)) (set! p (cons (quote symbol?) p)) (set! p (cons (quote string-set!) p)) (set! p (cons (quote string-ref) p)) (set! p (cons (quote string-length) p)) (set! p (cons (quote string?) p)) (set! p (cons (quote make-string) p)) (set! p (cons (quote vector-ref) p)) (set! p (cons (quote vector-set!) p)) (set! p (cons (quote vector-length) p)) (set! p (cons (quote make-vector) p)) (set! p (cons (quote vector?) p)) (set! p (cons (quote set-cdr!) p)) (set! p (cons (quote set-car!) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote cons) p)) (set! p (cons (quote pair?) p)) (set! p (cons (quote fx*) p)) (set! p (cons (quote fx-) p)) (set! p (cons (quote fx+) p)) (set! p (cons (quote fxquotient) p)) (set! p (cons (quote fxremainder) p)) (set! p (cons (quote fx>=) p)) (set! p (cons (quote fx>) p)) (set! p (cons (quote fx<=) p)) (set! p (cons (quote fx<) p)) (set! p (cons (quote fx=) p)) (set! p (cons (quote fxzero?) p)) (set! p (cons (quote fxsub1) p)) (set! p (cons (quote fxadd1) p)) (set! p (cons (quote fxlogor) p)) (set! p (cons (quote fxlogand) p)) (set! p (cons (quote fxlognot) p)) (set! p (cons (quote char=?) p)) (set! p (cons (quote eq?) p)) (set! p (cons (quote not) p)) (set! p (cons (quote boolean?) p)) (set! p (cons (quote fixnum?) p)) (set! p (cons (quote char?) p)) (set! p (cons (quote null?) p)) (set! p (cons (quote char->fixnum) p)) (set! p (cons (quote fixnum->char) p)) (lambda () p)))
# == eliminate-let*  ==>
# (let ((p (quote ()))) (begin (set! p (cons (quote procedure?) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote symbol-value) p)) (set! p (cons (quote symbol->string) p)) (set! p (cons (quote make-symbol) p)) (set! p (cons (quote symbol?) p)) (set! p (cons (quote string-set!) p)) (set! p (cons (quote string-ref) p)) (set! p (cons (quote string-length) p)) (set! p (cons (quote string?) p)) (set! p (cons (quote make-string) p)) (set! p (cons (quote vector-ref) p)) (set! p (cons (quote vector-set!) p)) (set! p (cons (quote vector-length) p)) (set! p (cons (quote make-vector) p)) (set! p (cons (quote vector?) p)) (set! p (cons (quote set-cdr!) p)) (set! p (cons (quote set-car!) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote cons) p)) (set! p (cons (quote pair?) p)) (set! p (cons (quote fx*) p)) (set! p (cons (quote fx-) p)) (set! p (cons (quote fx+) p)) (set! p (cons (quote fxquotient) p)) (set! p (cons (quote fxremainder) p)) (set! p (cons (quote fx>=) p)) (set! p (cons (quote fx>) p)) (set! p (cons (quote fx<=) p)) (set! p (cons (quote fx<) p)) (set! p (cons (quote fx=) p)) (set! p (cons (quote fxzero?) p)) (set! p (cons (quote fxsub1) p)) (set! p (cons (quote fxadd1) p)) (set! p (cons (quote fxlogor) p)) (set! p (cons (quote fxlogand) p)) (set! p (cons (quote fxlognot) p)) (set! p (cons (quote char=?) p)) (set! p (cons (quote eq?) p)) (set! p (cons (quote not) p)) (set! p (cons (quote boolean?) p)) (set! p (cons (quote fixnum?) p)) (set! p (cons (quote char?) p)) (set! p (cons (quote null?) p)) (set! p (cons (quote char->fixnum) p)) (set! p (cons (quote fixnum->char) p)) (lambda () p)))
# == uniquify-variables  ==>
# (let ((f1215 (quote ()))) (begin (set! f1215 (cons (quote procedure?) f1215)) (set! f1215 (cons (quote cdr) f1215)) (set! f1215 (cons (quote car) f1215)) (set! f1215 (cons (quote symbol-value) f1215)) (set! f1215 (cons (quote symbol->string) f1215)) (set! f1215 (cons (quote make-symbol) f1215)) (set! f1215 (cons (quote symbol?) f1215)) (set! f1215 (cons (quote string-set!) f1215)) (set! f1215 (cons (quote string-ref) f1215)) (set! f1215 (cons (quote string-length) f1215)) (set! f1215 (cons (quote string?) f1215)) (set! f1215 (cons (quote make-string) f1215)) (set! f1215 (cons (quote vector-ref) f1215)) (set! f1215 (cons (quote vector-set!) f1215)) (set! f1215 (cons (quote vector-length) f1215)) (set! f1215 (cons (quote make-vector) f1215)) (set! f1215 (cons (quote vector?) f1215)) (set! f1215 (cons (quote set-cdr!) f1215)) (set! f1215 (cons (quote set-car!) f1215)) (set! f1215 (cons (quote cdr) f1215)) (set! f1215 (cons (quote car) f1215)) (set! f1215 (cons (quote cons) f1215)) (set! f1215 (cons (quote pair?) f1215)) (set! f1215 (cons (quote fx*) f1215)) (set! f1215 (cons (quote fx-) f1215)) (set! f1215 (cons (quote fx+) f1215)) (set! f1215 (cons (quote fxquotient) f1215)) (set! f1215 (cons (quote fxremainder) f1215)) (set! f1215 (cons (quote fx>=) f1215)) (set! f1215 (cons (quote fx>) f1215)) (set! f1215 (cons (quote fx<=) f1215)) (set! f1215 (cons (quote fx<) f1215)) (set! f1215 (cons (quote fx=) f1215)) (set! f1215 (cons (quote fxzero?) f1215)) (set! f1215 (cons (quote fxsub1) f1215)) (set! f1215 (cons (quote fxadd1) f1215)) (set! f1215 (cons (quote fxlogor) f1215)) (set! f1215 (cons (quote fxlogand) f1215)) (set! f1215 (cons (quote fxlognot) f1215)) (set! f1215 (cons (quote char=?) f1215)) (set! f1215 (cons (quote eq?) f1215)) (set! f1215 (cons (quote not) f1215)) (set! f1215 (cons (quote boolean?) f1215)) (set! f1215 (cons (quote fixnum?) f1215)) (set! f1215 (cons (quote char?) f1215)) (set! f1215 (cons (quote null?) f1215)) (set! f1215 (cons (quote char->fixnum) f1215)) (set! f1215 (cons (quote fixnum->char) f1215)) (lambda () f1215)))
# == vectorize-letrec  ==>
# (let ((f1215 (quote ()))) (begin (set! f1215 (cons (quote procedure?) f1215)) (set! f1215 (cons (quote cdr) f1215)) (set! f1215 (cons (quote car) f1215)) (set! f1215 (cons (quote symbol-value) f1215)) (set! f1215 (cons (quote symbol->string) f1215)) (set! f1215 (cons (quote make-symbol) f1215)) (set! f1215 (cons (quote symbol?) f1215)) (set! f1215 (cons (quote string-set!) f1215)) (set! f1215 (cons (quote string-ref) f1215)) (set! f1215 (cons (quote string-length) f1215)) (set! f1215 (cons (quote string?) f1215)) (set! f1215 (cons (quote make-string) f1215)) (set! f1215 (cons (quote vector-ref) f1215)) (set! f1215 (cons (quote vector-set!) f1215)) (set! f1215 (cons (quote vector-length) f1215)) (set! f1215 (cons (quote make-vector) f1215)) (set! f1215 (cons (quote vector?) f1215)) (set! f1215 (cons (quote set-cdr!) f1215)) (set! f1215 (cons (quote set-car!) f1215)) (set! f1215 (cons (quote cdr) f1215)) (set! f1215 (cons (quote car) f1215)) (set! f1215 (cons (quote cons) f1215)) (set! f1215 (cons (quote pair?) f1215)) (set! f1215 (cons (quote fx*) f1215)) (set! f1215 (cons (quote fx-) f1215)) (set! f1215 (cons (quote fx+) f1215)) (set! f1215 (cons (quote fxquotient) f1215)) (set! f1215 (cons (quote fxremainder) f1215)) (set! f1215 (cons (quote fx>=) f1215)) (set! f1215 (cons (quote fx>) f1215)) (set! f1215 (cons (quote fx<=) f1215)) (set! f1215 (cons (quote fx<) f1215)) (set! f1215 (cons (quote fx=) f1215)) (set! f1215 (cons (quote fxzero?) f1215)) (set! f1215 (cons (quote fxsub1) f1215)) (set! f1215 (cons (quote fxadd1) f1215)) (set! f1215 (cons (quote fxlogor) f1215)) (set! f1215 (cons (quote fxlogand) f1215)) (set! f1215 (cons (quote fxlognot) f1215)) (set! f1215 (cons (quote char=?) f1215)) (set! f1215 (cons (quote eq?) f1215)) (set! f1215 (cons (quote not) f1215)) (set! f1215 (cons (quote boolean?) f1215)) (set! f1215 (cons (quote fixnum?) f1215)) (set! f1215 (cons (quote char?) f1215)) (set! f1215 (cons (quote null?) f1215)) (set! f1215 (cons (quote char->fixnum) f1215)) (set! f1215 (cons (quote fixnum->char) f1215)) (lambda () f1215)))
# == eliminate-set!  ==>
# (let ((f1215 (vector (quote ())))) (begin (vector-set! f1215 0 (cons (quote procedure?) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote cdr) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote car) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote symbol-value) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote symbol->string) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote make-symbol) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote symbol?) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote string-set!) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote string-ref) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote string-length) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote string?) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote make-string) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote vector-ref) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote vector-set!) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote vector-length) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote make-vector) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote vector?) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote set-cdr!) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote set-car!) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote cdr) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote car) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote cons) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote pair?) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote fx*) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote fx-) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote fx+) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote fxquotient) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote fxremainder) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote fx>=) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote fx>) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote fx<=) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote fx<) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote fx=) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote fxzero?) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote fxsub1) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote fxadd1) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote fxlogor) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote fxlogand) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote fxlognot) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote char=?) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote eq?) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote not) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote boolean?) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote fixnum?) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote char?) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote null?) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote char->fixnum) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote fixnum->char) (vector-ref f1215 0))) (lambda () (let () (vector-ref f1215 0)))))
# == close-free-variables  ==>
# (let ((f1215 (vector (quote ())))) (begin (vector-set! f1215 0 (cons (quote procedure?) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote cdr) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote car) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote symbol-value) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote symbol->string) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote make-symbol) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote symbol?) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote string-set!) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote string-ref) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote string-length) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote string?) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote make-string) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote vector-ref) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote vector-set!) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote vector-length) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote make-vector) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote vector?) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote set-cdr!) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote set-car!) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote cdr) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote car) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote cons) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote pair?) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote fx*) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote fx-) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote fx+) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote fxquotient) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote fxremainder) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote fx>=) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote fx>) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote fx<=) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote fx<) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote fx=) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote fxzero?) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote fxsub1) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote fxadd1) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote fxlogor) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote fxlogand) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote fxlognot) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote char=?) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote eq?) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote not) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote boolean?) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote fixnum?) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote char?) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote null?) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote char->fixnum) (vector-ref f1215 0))) (vector-set! f1215 0 (cons (quote fixnum->char) (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0)))))
# == eliminate-quote  ==>
# (let ((f1215 (vector ()))) (begin (vector-set! f1215 0 (cons (string->symbol "procedure?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "symbol-value") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "symbol->string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "make-symbol") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "symbol?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "string-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "string-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "string-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "string?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "make-string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "vector-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "vector-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "vector-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0)))))
# == eliminate-when/unless  ==>
# (let ((f1215 (vector ()))) (begin (vector-set! f1215 0 (cons (string->symbol "procedure?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "symbol-value") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "symbol->string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "make-symbol") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "symbol?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "string-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "string-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "string-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "string?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "make-string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "vector-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "vector-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "vector-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0)))))
# == eliminate-cond  ==>
# (let ((f1215 (vector ()))) (begin (vector-set! f1215 0 (cons (string->symbol "procedure?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "symbol-value") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "symbol->string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "make-symbol") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "symbol?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "string-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "string-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "string-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "string?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "make-string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "vector-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "vector-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "vector-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons (string->symbol "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0)))))
# == external-symbols  ==>
# (let ((f1215 ((primitive-ref vector) ()))) (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0)))))
# emit-expr (let ((f1215 ((primitive-ref vector) ()))) (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0)))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f1215 ((primitive-ref vector) ())))
#  body = (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
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
    je "_L_9638"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9638":
   movl %eax,  -8(%esp)  # stash funcall-oper in closure slot
# emit-expr ()
    movl $63, %eax     # immed ()
    mov %eax, -12(%esp)  # arg ()
    movl -8(%esp), %edi   # load new closure to %edi
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9639
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9639:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9640"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9640:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9642
    cmp  $0,%eax
    jge _L_9641
_L_9642:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9641:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "procedure?") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "procedure?")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "procedure?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9643"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9643":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "procedure?"
# string literal
    jmp _L_9645
    .align 8,0x90
_L_9644 :
    .int 40
    .ascii "procedure?"
_L_9645:
    movl $_L_9644, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg procedure?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9646
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9646:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9647"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9647:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9649
    cmp  $0,%eax
    jge _L_9648
_L_9649:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9648:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9650
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9650:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9651"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9651:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9653
    cmp  $0,%eax
    jge _L_9652
_L_9653:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9652:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "cdr") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "cdr")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "cdr")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9654"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9654":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cdr"
# string literal
    jmp _L_9656
    .align 8,0x90
_L_9655 :
    .int 12
    .ascii "cdr"
_L_9656:
    movl $_L_9655, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cdr
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9657
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9657:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9658"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9658:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9660
    cmp  $0,%eax
    jge _L_9659
_L_9660:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9659:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9661
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9661:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9662"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9662:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9664
    cmp  $0,%eax
    jge _L_9663
_L_9664:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9663:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "car") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "car")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "car")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9665"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9665":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "car"
# string literal
    jmp _L_9667
    .align 8,0x90
_L_9666 :
    .int 12
    .ascii "car"
_L_9667:
    movl $_L_9666, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg car
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9668
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9668:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9669"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9669:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9671
    cmp  $0,%eax
    jge _L_9670
_L_9671:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9670:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9672
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9672:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9673"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9673:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9675
    cmp  $0,%eax
    jge _L_9674
_L_9675:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9674:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "symbol-value") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "symbol-value")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol-value")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9676"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9676":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol-value"
# string literal
    jmp _L_9678
    .align 8,0x90
_L_9677 :
    .int 48
    .ascii "symbol-value"
_L_9678:
    movl $_L_9677, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol-value
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9679
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9679:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9680"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9680:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9682
    cmp  $0,%eax
    jge _L_9681
_L_9682:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9681:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9683
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9683:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9684"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9684:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9686
    cmp  $0,%eax
    jge _L_9685
_L_9686:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9685:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "symbol->string") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "symbol->string")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol->string")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9687"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9687":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol->string"
# string literal
    jmp _L_9689
    .align 8,0x90
_L_9688 :
    .int 56
    .ascii "symbol->string"
_L_9689:
    movl $_L_9688, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol->string
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9690
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9690:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9691"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9691:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9693
    cmp  $0,%eax
    jge _L_9692
_L_9693:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9692:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9694
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9694:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9695"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9695:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9697
    cmp  $0,%eax
    jge _L_9696
_L_9697:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9696:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "make-symbol") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "make-symbol")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-symbol")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9698"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9698":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-symbol"
# string literal
    jmp _L_9700
    .align 8,0x90
_L_9699 :
    .int 44
    .ascii "make-symbol"
_L_9700:
    movl $_L_9699, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-symbol
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9701
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9701:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9702"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9702:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9704
    cmp  $0,%eax
    jge _L_9703
_L_9704:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9703:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9705
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9705:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9706"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9706:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9708
    cmp  $0,%eax
    jge _L_9707
_L_9708:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9707:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "symbol?") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "symbol?")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9709"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9709":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol?"
# string literal
    jmp _L_9711
    .align 8,0x90
_L_9710 :
    .int 28
    .ascii "symbol?"
_L_9711:
    movl $_L_9710, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9712
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9712:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9713"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9713:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9715
    cmp  $0,%eax
    jge _L_9714
_L_9715:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9714:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9716
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9716:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9717"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9717:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9719
    cmp  $0,%eax
    jge _L_9718
_L_9719:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9718:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "string-set!") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "string-set!")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-set!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9720"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9720":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-set!"
# string literal
    jmp _L_9722
    .align 8,0x90
_L_9721 :
    .int 44
    .ascii "string-set!"
_L_9722:
    movl $_L_9721, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-set!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9723
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9723:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9724"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9724:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9726
    cmp  $0,%eax
    jge _L_9725
_L_9726:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9725:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9727
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9727:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9728"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9728:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9730
    cmp  $0,%eax
    jge _L_9729
_L_9730:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9729:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "string-ref") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "string-ref")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-ref")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9731"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9731":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-ref"
# string literal
    jmp _L_9733
    .align 8,0x90
_L_9732 :
    .int 40
    .ascii "string-ref"
_L_9733:
    movl $_L_9732, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-ref
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9734
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9734:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9735"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9735:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9737
    cmp  $0,%eax
    jge _L_9736
_L_9737:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9736:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9738
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9738:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9739"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9739:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9741
    cmp  $0,%eax
    jge _L_9740
_L_9741:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9740:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "string-length") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "string-length")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-length")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9742"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9742":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-length"
# string literal
    jmp _L_9744
    .align 8,0x90
_L_9743 :
    .int 52
    .ascii "string-length"
_L_9744:
    movl $_L_9743, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-length
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9745
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9745:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9746"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9746:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9748
    cmp  $0,%eax
    jge _L_9747
_L_9748:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9747:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9749
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9749:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9750"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9750:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9752
    cmp  $0,%eax
    jge _L_9751
_L_9752:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9751:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string?") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "string?") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "string?")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9753"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9753":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string?"
# string literal
    jmp _L_9755
    .align 8,0x90
_L_9754 :
    .int 28
    .ascii "string?"
_L_9755:
    movl $_L_9754, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9756
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9756:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9757"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9757:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9759
    cmp  $0,%eax
    jge _L_9758
_L_9759:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9758:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9760
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9760:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9761"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9761:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9763
    cmp  $0,%eax
    jge _L_9762
_L_9763:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9762:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "make-string") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "make-string")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-string")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9764"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9764":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-string"
# string literal
    jmp _L_9766
    .align 8,0x90
_L_9765 :
    .int 44
    .ascii "make-string"
_L_9766:
    movl $_L_9765, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-string
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9767
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9767:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9768"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9768:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9770
    cmp  $0,%eax
    jge _L_9769
_L_9770:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9769:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9771
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9771:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9772"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9772:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9774
    cmp  $0,%eax
    jge _L_9773
_L_9774:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9773:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "vector-ref") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "vector-ref")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-ref")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9775"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9775":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-ref"
# string literal
    jmp _L_9777
    .align 8,0x90
_L_9776 :
    .int 40
    .ascii "vector-ref"
_L_9777:
    movl $_L_9776, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-ref
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9778
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9778:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9779"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9779:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9781
    cmp  $0,%eax
    jge _L_9780
_L_9781:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9780:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9782
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9782:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9783"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9783:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9785
    cmp  $0,%eax
    jge _L_9784
_L_9785:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9784:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "vector-set!") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "vector-set!")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-set!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9786"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9786":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-set!"
# string literal
    jmp _L_9788
    .align 8,0x90
_L_9787 :
    .int 44
    .ascii "vector-set!"
_L_9788:
    movl $_L_9787, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-set!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9789
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9789:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9790"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9790:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9792
    cmp  $0,%eax
    jge _L_9791
_L_9792:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9791:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9793
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9793:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9794"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9794:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9796
    cmp  $0,%eax
    jge _L_9795
_L_9796:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9795:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "vector-length") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "vector-length")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-length")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9797"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9797":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-length"
# string literal
    jmp _L_9799
    .align 8,0x90
_L_9798 :
    .int 52
    .ascii "vector-length"
_L_9799:
    movl $_L_9798, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-length
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9800
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9800:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9801"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9801:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9803
    cmp  $0,%eax
    jge _L_9802
_L_9803:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9802:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9804
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9804:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9805"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9805:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9807
    cmp  $0,%eax
    jge _L_9806
_L_9807:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9806:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "make-vector") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "make-vector")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-vector")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9808"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9808":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-vector"
# string literal
    jmp _L_9810
    .align 8,0x90
_L_9809 :
    .int 44
    .ascii "make-vector"
_L_9810:
    movl $_L_9809, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-vector
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9811
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9811:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9812"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9812:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9814
    cmp  $0,%eax
    jge _L_9813
_L_9814:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9813:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9815
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9815:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9816"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9816:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9818
    cmp  $0,%eax
    jge _L_9817
_L_9818:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9817:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "vector?") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "vector?")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9819"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9819":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector?"
# string literal
    jmp _L_9821
    .align 8,0x90
_L_9820 :
    .int 28
    .ascii "vector?"
_L_9821:
    movl $_L_9820, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9822
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9822:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9823"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9823:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9825
    cmp  $0,%eax
    jge _L_9824
_L_9825:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9824:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9826
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9826:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9827"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9827:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9829
    cmp  $0,%eax
    jge _L_9828
_L_9829:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9828:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "set-cdr!") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "set-cdr!")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "set-cdr!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9830"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9830":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "set-cdr!"
# string literal
    jmp _L_9832
    .align 8,0x90
_L_9831 :
    .int 32
    .ascii "set-cdr!"
_L_9832:
    movl $_L_9831, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg set-cdr!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9833
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9833:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9834"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9834:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9836
    cmp  $0,%eax
    jge _L_9835
_L_9836:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9835:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9837
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9837:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9838"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9838:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9840
    cmp  $0,%eax
    jge _L_9839
_L_9840:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9839:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "set-car!") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "set-car!")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "set-car!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9841"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9841":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "set-car!"
# string literal
    jmp _L_9843
    .align 8,0x90
_L_9842 :
    .int 32
    .ascii "set-car!"
_L_9843:
    movl $_L_9842, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg set-car!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9844
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9844:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9845"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9845:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9847
    cmp  $0,%eax
    jge _L_9846
_L_9847:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9846:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9848
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9848:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9849"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9849:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9851
    cmp  $0,%eax
    jge _L_9850
_L_9851:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9850:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "cdr") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "cdr")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "cdr")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9852"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9852":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cdr"
# string literal
    jmp _L_9854
    .align 8,0x90
_L_9853 :
    .int 12
    .ascii "cdr"
_L_9854:
    movl $_L_9853, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cdr
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9855
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9855:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9856"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9856:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9858
    cmp  $0,%eax
    jge _L_9857
_L_9858:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9857:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9859
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9859:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9860"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9860:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9862
    cmp  $0,%eax
    jge _L_9861
_L_9862:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9861:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "car") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "car") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "car")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "car")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9863"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9863":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "car"
# string literal
    jmp _L_9865
    .align 8,0x90
_L_9864 :
    .int 12
    .ascii "car"
_L_9865:
    movl $_L_9864, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg car
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9866
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9866:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9867"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9867:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9869
    cmp  $0,%eax
    jge _L_9868
_L_9869:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9868:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9870
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9870:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9871"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9871:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9873
    cmp  $0,%eax
    jge _L_9872
_L_9873:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9872:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cons") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "cons") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "cons")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "cons")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9874"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9874":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cons"
# string literal
    jmp _L_9876
    .align 8,0x90
_L_9875 :
    .int 16
    .ascii "cons"
_L_9876:
    movl $_L_9875, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cons
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9877
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9877:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9878"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9878:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9880
    cmp  $0,%eax
    jge _L_9879
_L_9880:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9879:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9881
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9881:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9882"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9882:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9884
    cmp  $0,%eax
    jge _L_9883
_L_9884:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9883:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "pair?") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "pair?")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "pair?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9885"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9885":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "pair?"
# string literal
    jmp _L_9887
    .align 8,0x90
_L_9886 :
    .int 20
    .ascii "pair?"
_L_9887:
    movl $_L_9886, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg pair?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9888
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9888:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9889"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9889:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9891
    cmp  $0,%eax
    jge _L_9890
_L_9891:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9890:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9892
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9892:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9893"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9893:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9895
    cmp  $0,%eax
    jge _L_9894
_L_9895:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9894:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "fx*") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "fx*")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx*")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9896"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9896":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx*"
# string literal
    jmp _L_9898
    .align 8,0x90
_L_9897 :
    .int 12
    .ascii "fx*"
_L_9898:
    movl $_L_9897, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx*
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9899
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9899:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9900"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9900:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9902
    cmp  $0,%eax
    jge _L_9901
_L_9902:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9901:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9903
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9903:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9904"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9904:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9906
    cmp  $0,%eax
    jge _L_9905
_L_9906:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9905:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "fx-") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "fx-")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx-")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9907"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9907":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx-"
# string literal
    jmp _L_9909
    .align 8,0x90
_L_9908 :
    .int 12
    .ascii "fx-"
_L_9909:
    movl $_L_9908, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx-
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9910
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9910:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9911"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9911:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9913
    cmp  $0,%eax
    jge _L_9912
_L_9913:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9912:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9914
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9914:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9915"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9915:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9917
    cmp  $0,%eax
    jge _L_9916
_L_9917:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9916:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "fx+") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "fx+")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx+")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9918"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9918":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx+"
# string literal
    jmp _L_9920
    .align 8,0x90
_L_9919 :
    .int 12
    .ascii "fx+"
_L_9920:
    movl $_L_9919, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx+
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9921
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9921:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9922"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9922:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9924
    cmp  $0,%eax
    jge _L_9923
_L_9924:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9923:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9925
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9925:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9926"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9926:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9928
    cmp  $0,%eax
    jge _L_9927
_L_9928:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9927:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "fxquotient") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "fxquotient")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxquotient")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9929"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9929":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxquotient"
# string literal
    jmp _L_9931
    .align 8,0x90
_L_9930 :
    .int 40
    .ascii "fxquotient"
_L_9931:
    movl $_L_9930, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxquotient
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9932
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9932:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9933"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9933:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9935
    cmp  $0,%eax
    jge _L_9934
_L_9935:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9934:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9936
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9936:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9937"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9937:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9939
    cmp  $0,%eax
    jge _L_9938
_L_9939:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9938:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "fxremainder") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "fxremainder")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxremainder")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9940"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9940":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxremainder"
# string literal
    jmp _L_9942
    .align 8,0x90
_L_9941 :
    .int 44
    .ascii "fxremainder"
_L_9942:
    movl $_L_9941, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxremainder
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9943
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9943:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9944"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9944:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9946
    cmp  $0,%eax
    jge _L_9945
_L_9946:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9945:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9947
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9947:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9948"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9948:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9950
    cmp  $0,%eax
    jge _L_9949
_L_9950:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9949:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "fx>=") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "fx>=")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx>=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9951"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9951":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx>="
# string literal
    jmp _L_9953
    .align 8,0x90
_L_9952 :
    .int 16
    .ascii "fx>="
_L_9953:
    movl $_L_9952, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx>=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9954
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9954:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9955"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9955:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9957
    cmp  $0,%eax
    jge _L_9956
_L_9957:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9956:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9958
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9958:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9959"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9959:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9961
    cmp  $0,%eax
    jge _L_9960
_L_9961:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9960:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "fx>") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "fx>")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx>")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9962"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9962":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx>"
# string literal
    jmp _L_9964
    .align 8,0x90
_L_9963 :
    .int 12
    .ascii "fx>"
_L_9964:
    movl $_L_9963, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx>
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9965
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9965:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9966"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9966:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9968
    cmp  $0,%eax
    jge _L_9967
_L_9968:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9967:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9969
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9969:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9970"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9970:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9972
    cmp  $0,%eax
    jge _L_9971
_L_9972:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9971:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "fx<=") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "fx<=")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx<=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9973"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9973":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx<="
# string literal
    jmp _L_9975
    .align 8,0x90
_L_9974 :
    .int 16
    .ascii "fx<="
_L_9975:
    movl $_L_9974, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx<=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9976
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9976:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9977"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9977:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9979
    cmp  $0,%eax
    jge _L_9978
_L_9979:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9978:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9980
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9980:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9981"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9981:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9983
    cmp  $0,%eax
    jge _L_9982
_L_9983:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9982:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "fx<") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "fx<")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx<")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9984"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9984":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx<"
# string literal
    jmp _L_9986
    .align 8,0x90
_L_9985 :
    .int 12
    .ascii "fx<"
_L_9986:
    movl $_L_9985, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx<
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9987
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9987:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9988"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9988:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9990
    cmp  $0,%eax
    jge _L_9989
_L_9990:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9989:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9991
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9991:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9992"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9992:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9994
    cmp  $0,%eax
    jge _L_9993
_L_9994:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9993:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "fx=") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "fx=")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9995"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9995":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx="
# string literal
    jmp _L_9997
    .align 8,0x90
_L_9996 :
    .int 12
    .ascii "fx="
_L_9997:
    movl $_L_9996, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9998
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9998:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9999"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9999:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_10001
    cmp  $0,%eax
    jge _L_10000
_L_10001:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_10000:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_10002
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10002:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_10003"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10003:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_10005
    cmp  $0,%eax
    jge _L_10004
_L_10005:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_10004:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "fxzero?") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "fxzero?")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxzero?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_10006"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_10006":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxzero?"
# string literal
    jmp _L_10008
    .align 8,0x90
_L_10007 :
    .int 28
    .ascii "fxzero?"
_L_10008:
    movl $_L_10007, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxzero?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_10009
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10009:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_10010"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10010:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_10012
    cmp  $0,%eax
    jge _L_10011
_L_10012:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_10011:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_10013
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10013:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_10014"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10014:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_10016
    cmp  $0,%eax
    jge _L_10015
_L_10016:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_10015:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "fxsub1") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "fxsub1")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxsub1")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_10017"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_10017":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxsub1"
# string literal
    jmp _L_10019
    .align 8,0x90
_L_10018 :
    .int 24
    .ascii "fxsub1"
_L_10019:
    movl $_L_10018, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxsub1
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_10020
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10020:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_10021"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10021:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_10023
    cmp  $0,%eax
    jge _L_10022
_L_10023:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_10022:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_10024
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10024:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_10025"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10025:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_10027
    cmp  $0,%eax
    jge _L_10026
_L_10027:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_10026:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "fxadd1") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "fxadd1")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxadd1")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_10028"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_10028":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxadd1"
# string literal
    jmp _L_10030
    .align 8,0x90
_L_10029 :
    .int 24
    .ascii "fxadd1"
_L_10030:
    movl $_L_10029, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxadd1
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_10031
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10031:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_10032"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10032:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_10034
    cmp  $0,%eax
    jge _L_10033
_L_10034:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_10033:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_10035
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10035:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_10036"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10036:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_10038
    cmp  $0,%eax
    jge _L_10037
_L_10038:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_10037:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "fxlogor") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "fxlogor")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlogor")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_10039"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_10039":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlogor"
# string literal
    jmp _L_10041
    .align 8,0x90
_L_10040 :
    .int 28
    .ascii "fxlogor"
_L_10041:
    movl $_L_10040, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlogor
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_10042
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10042:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_10043"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10043:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_10045
    cmp  $0,%eax
    jge _L_10044
_L_10045:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_10044:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_10046
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10046:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_10047"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10047:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_10049
    cmp  $0,%eax
    jge _L_10048
_L_10049:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_10048:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "fxlogand") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "fxlogand")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlogand")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_10050"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_10050":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlogand"
# string literal
    jmp _L_10052
    .align 8,0x90
_L_10051 :
    .int 32
    .ascii "fxlogand"
_L_10052:
    movl $_L_10051, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlogand
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_10053
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10053:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_10054"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10054:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_10056
    cmp  $0,%eax
    jge _L_10055
_L_10056:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_10055:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_10057
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10057:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_10058"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10058:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_10060
    cmp  $0,%eax
    jge _L_10059
_L_10060:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_10059:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "fxlognot") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "fxlognot")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlognot")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_10061"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_10061":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlognot"
# string literal
    jmp _L_10063
    .align 8,0x90
_L_10062 :
    .int 32
    .ascii "fxlognot"
_L_10063:
    movl $_L_10062, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlognot
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_10064
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10064:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_10065"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10065:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_10067
    cmp  $0,%eax
    jge _L_10066
_L_10067:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_10066:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_10068
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10068:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_10069"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10069:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_10071
    cmp  $0,%eax
    jge _L_10070
_L_10071:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_10070:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "char=?") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "char=?")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "char=?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_10072"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_10072":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char=?"
# string literal
    jmp _L_10074
    .align 8,0x90
_L_10073 :
    .int 24
    .ascii "char=?"
_L_10074:
    movl $_L_10073, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char=?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_10075
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10075:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_10076"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10076:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_10078
    cmp  $0,%eax
    jge _L_10077
_L_10078:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_10077:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_10079
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10079:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_10080"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10080:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_10082
    cmp  $0,%eax
    jge _L_10081
_L_10082:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_10081:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "eq?") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "eq?")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "eq?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_10083"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_10083":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "eq?"
# string literal
    jmp _L_10085
    .align 8,0x90
_L_10084 :
    .int 12
    .ascii "eq?"
_L_10085:
    movl $_L_10084, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg eq?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_10086
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10086:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_10087"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10087:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_10089
    cmp  $0,%eax
    jge _L_10088
_L_10089:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_10088:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_10090
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10090:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_10091"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10091:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_10093
    cmp  $0,%eax
    jge _L_10092
_L_10093:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_10092:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "not") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "not") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "not")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "not")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_10094"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_10094":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "not"
# string literal
    jmp _L_10096
    .align 8,0x90
_L_10095 :
    .int 12
    .ascii "not"
_L_10096:
    movl $_L_10095, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg not
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_10097
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10097:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_10098"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10098:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_10100
    cmp  $0,%eax
    jge _L_10099
_L_10100:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_10099:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_10101
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10101:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_10102"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10102:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_10104
    cmp  $0,%eax
    jge _L_10103
_L_10104:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_10103:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "boolean?") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "boolean?")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "boolean?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_10105"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_10105":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "boolean?"
# string literal
    jmp _L_10107
    .align 8,0x90
_L_10106 :
    .int 32
    .ascii "boolean?"
_L_10107:
    movl $_L_10106, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg boolean?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_10108
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10108:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_10109"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10109:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_10111
    cmp  $0,%eax
    jge _L_10110
_L_10111:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_10110:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_10112
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10112:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_10113"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10113:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_10115
    cmp  $0,%eax
    jge _L_10114
_L_10115:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_10114:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "fixnum?") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "fixnum?")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fixnum?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_10116"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_10116":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fixnum?"
# string literal
    jmp _L_10118
    .align 8,0x90
_L_10117 :
    .int 28
    .ascii "fixnum?"
_L_10118:
    movl $_L_10117, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fixnum?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_10119
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10119:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_10120"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10120:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_10122
    cmp  $0,%eax
    jge _L_10121
_L_10122:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_10121:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_10123
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10123:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_10124"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10124:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_10126
    cmp  $0,%eax
    jge _L_10125
_L_10126:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_10125:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char?") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "char?") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "char?")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "char?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_10127"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_10127":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char?"
# string literal
    jmp _L_10129
    .align 8,0x90
_L_10128 :
    .int 20
    .ascii "char?"
_L_10129:
    movl $_L_10128, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_10130
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10130:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_10131"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10131:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_10133
    cmp  $0,%eax
    jge _L_10132
_L_10133:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_10132:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_10134
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10134:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_10135"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10135:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_10137
    cmp  $0,%eax
    jge _L_10136
_L_10137:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_10136:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "null?") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "null?") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "null?")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "null?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_10138"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_10138":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "null?"
# string literal
    jmp _L_10140
    .align 8,0x90
_L_10139 :
    .int 20
    .ascii "null?"
_L_10140:
    movl $_L_10139, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg null?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_10141
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10141:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_10142"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10142:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_10144
    cmp  $0,%eax
    jge _L_10143
_L_10144:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_10143:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))) (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_10145
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10145:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_10146"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10146:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_10148
    cmp  $0,%eax
    jge _L_10147
_L_10148:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_10147:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "char->fixnum") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "char->fixnum")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "char->fixnum")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_10149"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_10149":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char->fixnum"
# string literal
    jmp _L_10151
    .align 8,0x90
_L_10150 :
    .int 48
    .ascii "char->fixnum"
_L_10151:
    movl $_L_10150, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char->fixnum
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_10152
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10152:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_10153"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10153:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_10155
    cmp  $0,%eax
    jge _L_10154
_L_10155:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_10154:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))) (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (vector-set! f1215 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0)))
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_10156
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10156:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_10157"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10157:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_10159
    cmp  $0,%eax
    jge _L_10158
_L_10159:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_10158:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1215 0))
# cons arg1=((primitive-ref string->symbol) "fixnum->char") arg2=(vector-ref f1215 0)
# emit-expr ((primitive-ref string->symbol) "fixnum->char")
# funcall
#    si   =-12
#    env  = ((f1215 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fixnum->char")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_10160"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_10160":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fixnum->char"
# string literal
    jmp _L_10162
    .align 8,0x90
_L_10161 :
    .int 48
    .ascii "fixnum->char"
_L_10162:
    movl $_L_10161, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fixnum->char
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1215 0)
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_10163
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10163:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_10164"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10164:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_10166
    cmp  $0,%eax
    jge _L_10165
_L_10166:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_10165:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (closure () (f1215) (let () (vector-ref f1215 0))))
# emit-begin
#   expr=(begin (closure () (f1215) (let () (vector-ref f1215 0))))
#   env=((f1215 . 0))
# emit-expr (closure () (f1215) (let () (vector-ref f1215 0)))
# emit-closure
# si = -4
# env = ((f1215 . 0))
# expr = (closure () (f1215) (let () (vector-ref f1215 0)))
    movl $_L_10167, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f1215 . 0))
# var=f1215
    movl 0(%esp), %eax  # stack load f1215
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f1215
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_10168            # jump around closure body
_L_10167:
# check argument count
    cmp $0,%eax
    je _L_10169
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_10169:
# emit-tail-expr
# si=-8
# env=((f1215 . 4) (f1215 . 0))
# expr=(let () (vector-ref f1215 0))
# emit-tail-let
#  si   = -8
#  env  = ((f1215 . 4) (f1215 . 0))
#  bindings = ()
#  body = (vector-ref f1215 0)
# emit-tail-expr
# si=-8
# env=((f1215 . 4) (f1215 . 0))
# expr=(vector-ref f1215 0)
# tail primcall
# emit-expr f1215
# emit-variable-ref
# env=((f1215 . 4) (f1215 . 0))
# var=f1215
    movl 2(%edi), %eax  # frame load f1215
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_10170
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10170:
    movl %eax, -8(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_10171"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10171:
# check bounds on vector index
    movl -8(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_10173
    cmp  $0,%eax
    jge _L_10172
_L_10173:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_10172:
    movl -8(%esp), %esi
    movl -1(%eax,%esi), %eax
#return from tail (vector-ref f1215 0)
    ret
    .align 4,0x90
_L_10168:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f1215 . 0))
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
    movl $_L_10174, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_10175            # jump around closure body
_L_10174:
# check argument count
    cmp $0,%eax
    je _L_10176
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_10176:
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
    je "_L_10177"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_10177":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_10179
    .align 8,0x90
_L_10178 :
    .int 28
    .ascii "funcall"
_L_10179:
    movl $_L_10178, %eax
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
    jmp _L_10181
    .align 8,0x90
_L_10180 :
    .int 100
    .ascii "arg 1 must be a procedure"
_L_10181:
    movl $_L_10180, %eax
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
_L_10175:
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
    movl $_L_10182, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_10183            # jump around closure body
_L_10182:
# check argument count
    cmp $0,%eax
    je _L_10184
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_10184:
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
    je "_L_10185"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_10185":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_10187
    .align 8,0x90
_L_10186 :
    .int 28
    .ascii "funcall"
_L_10187:
    movl $_L_10186, %eax
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
    jmp _L_10189
    .align 8,0x90
_L_10188 :
    .int 80
    .ascii "wrong number of args"
_L_10189:
    movl $_L_10188, %eax
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
_L_10183:
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
    movl $_L_10190, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_10191            # jump around closure body
_L_10190:
# check argument count
    cmp $0,%eax
    je _L_10192
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_10192:
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
    je "_L_10193"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_10193":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_10195
    .align 8,0x90
_L_10194 :
    .int 28
    .ascii "funcall"
_L_10195:
    movl $_L_10194, %eax
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
    jmp _L_10197
    .align 8,0x90
_L_10196 :
    .int 48
    .ascii "too few args"
_L_10197:
    movl $_L_10196, %eax
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
_L_10191:
     movl %eax, eh$uargcount$umin
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a fixnum"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a fixnum"))
# == uniquify-variables  ==>
# (lambda (f1216) (error (list-ref (primitives) f1216) "arg must be a fixnum"))
# == vectorize-letrec  ==>
# (lambda (f1216) (error (list-ref (primitives) f1216) "arg must be a fixnum"))
# == eliminate-set!  ==>
# (lambda (f1216) (let ((f1216 f1216)) (error (list-ref (primitives) f1216) "arg must be a fixnum")))
# == close-free-variables  ==>
# (closure (f1216) (error list-ref primitives) (let ((f1216 f1216)) (error (list-ref (primitives) f1216) "arg must be a fixnum")))
# == eliminate-quote  ==>
# (closure (f1216) (error list-ref primitives) (let ((f1216 f1216)) (error (list-ref (primitives) f1216) "arg must be a fixnum")))
# == eliminate-when/unless  ==>
# (closure (f1216) (error list-ref primitives) (let ((f1216 f1216)) (error (list-ref (primitives) f1216) "arg must be a fixnum")))
# == eliminate-cond  ==>
# (closure (f1216) (error list-ref primitives) (let ((f1216 f1216)) (error (list-ref (primitives) f1216) "arg must be a fixnum")))
# == external-symbols  ==>
# (closure (f1216) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1216 f1216)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1216) "arg must be a fixnum")))
# emit-expr (closure (f1216) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1216 f1216)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1216) "arg must be a fixnum")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f1216) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1216 f1216)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1216) "arg must be a fixnum")))
    movl $_L_10198, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_10199            # jump around closure body
_L_10198:
# check argument count
    cmp $4,%eax
    je _L_10200
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_10200:
# emit-tail-expr
# si=-12
# env=((f1216 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f1216 f1216)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1216) "arg must be a fixnum"))
# emit-tail-let
#  si   = -12
#  env  = ((f1216 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f1216 f1216))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1216) "arg must be a fixnum")
# emit-expr f1216
# emit-variable-ref
# env=((f1216 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f1216
    movl -8(%esp), %eax  # stack load f1216
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f1216 . -12) (f1216 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1216) "arg must be a fixnum")
# emit-tail-funcall
#    si   =-16
#    env  = ((f1216 . -12) (f1216 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1216) "arg must be a fixnum")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f1216)
# funcall
#    si   =-20
#    env  = ((f1216 . -12) (f1216 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f1216)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_10201"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_10201":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f1216 . -12) (f1216 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_10202"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_10202":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f1216
# emit-variable-ref
# env=((f1216 . -12) (f1216 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f1216
    movl -12(%esp), %eax  # stack load f1216
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f1216
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f1216)
# emit-expr "arg must be a fixnum"
# string literal
    jmp _L_10204
    .align 8,0x90
_L_10203 :
    .int 80
    .ascii "arg must be a fixnum"
_L_10204:
    movl $_L_10203, %eax
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
_L_10199:
     movl %eax, eh$ufixnum
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a string"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a string"))
# == uniquify-variables  ==>
# (lambda (f1217) (error (list-ref (primitives) f1217) "arg must be a string"))
# == vectorize-letrec  ==>
# (lambda (f1217) (error (list-ref (primitives) f1217) "arg must be a string"))
# == eliminate-set!  ==>
# (lambda (f1217) (let ((f1217 f1217)) (error (list-ref (primitives) f1217) "arg must be a string")))
# == close-free-variables  ==>
# (closure (f1217) (error list-ref primitives) (let ((f1217 f1217)) (error (list-ref (primitives) f1217) "arg must be a string")))
# == eliminate-quote  ==>
# (closure (f1217) (error list-ref primitives) (let ((f1217 f1217)) (error (list-ref (primitives) f1217) "arg must be a string")))
# == eliminate-when/unless  ==>
# (closure (f1217) (error list-ref primitives) (let ((f1217 f1217)) (error (list-ref (primitives) f1217) "arg must be a string")))
# == eliminate-cond  ==>
# (closure (f1217) (error list-ref primitives) (let ((f1217 f1217)) (error (list-ref (primitives) f1217) "arg must be a string")))
# == external-symbols  ==>
# (closure (f1217) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1217 f1217)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1217) "arg must be a string")))
# emit-expr (closure (f1217) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1217 f1217)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1217) "arg must be a string")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f1217) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1217 f1217)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1217) "arg must be a string")))
    movl $_L_10205, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_10206            # jump around closure body
_L_10205:
# check argument count
    cmp $4,%eax
    je _L_10207
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_10207:
# emit-tail-expr
# si=-12
# env=((f1217 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f1217 f1217)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1217) "arg must be a string"))
# emit-tail-let
#  si   = -12
#  env  = ((f1217 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f1217 f1217))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1217) "arg must be a string")
# emit-expr f1217
# emit-variable-ref
# env=((f1217 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f1217
    movl -8(%esp), %eax  # stack load f1217
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f1217 . -12) (f1217 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1217) "arg must be a string")
# emit-tail-funcall
#    si   =-16
#    env  = ((f1217 . -12) (f1217 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1217) "arg must be a string")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f1217)
# funcall
#    si   =-20
#    env  = ((f1217 . -12) (f1217 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f1217)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_10208"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_10208":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f1217 . -12) (f1217 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_10209"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_10209":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f1217
# emit-variable-ref
# env=((f1217 . -12) (f1217 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f1217
    movl -12(%esp), %eax  # stack load f1217
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f1217
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f1217)
# emit-expr "arg must be a string"
# string literal
    jmp _L_10211
    .align 8,0x90
_L_10210 :
    .int 80
    .ascii "arg must be a string"
_L_10211:
    movl $_L_10210, %eax
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
_L_10206:
     movl %eax, eh$ustring
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a character"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a character"))
# == uniquify-variables  ==>
# (lambda (f1218) (error (list-ref (primitives) f1218) "arg must be a character"))
# == vectorize-letrec  ==>
# (lambda (f1218) (error (list-ref (primitives) f1218) "arg must be a character"))
# == eliminate-set!  ==>
# (lambda (f1218) (let ((f1218 f1218)) (error (list-ref (primitives) f1218) "arg must be a character")))
# == close-free-variables  ==>
# (closure (f1218) (error list-ref primitives) (let ((f1218 f1218)) (error (list-ref (primitives) f1218) "arg must be a character")))
# == eliminate-quote  ==>
# (closure (f1218) (error list-ref primitives) (let ((f1218 f1218)) (error (list-ref (primitives) f1218) "arg must be a character")))
# == eliminate-when/unless  ==>
# (closure (f1218) (error list-ref primitives) (let ((f1218 f1218)) (error (list-ref (primitives) f1218) "arg must be a character")))
# == eliminate-cond  ==>
# (closure (f1218) (error list-ref primitives) (let ((f1218 f1218)) (error (list-ref (primitives) f1218) "arg must be a character")))
# == external-symbols  ==>
# (closure (f1218) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1218 f1218)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1218) "arg must be a character")))
# emit-expr (closure (f1218) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1218 f1218)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1218) "arg must be a character")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f1218) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1218 f1218)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1218) "arg must be a character")))
    movl $_L_10212, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_10213            # jump around closure body
_L_10212:
# check argument count
    cmp $4,%eax
    je _L_10214
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_10214:
# emit-tail-expr
# si=-12
# env=((f1218 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f1218 f1218)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1218) "arg must be a character"))
# emit-tail-let
#  si   = -12
#  env  = ((f1218 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f1218 f1218))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1218) "arg must be a character")
# emit-expr f1218
# emit-variable-ref
# env=((f1218 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f1218
    movl -8(%esp), %eax  # stack load f1218
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f1218 . -12) (f1218 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1218) "arg must be a character")
# emit-tail-funcall
#    si   =-16
#    env  = ((f1218 . -12) (f1218 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1218) "arg must be a character")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f1218)
# funcall
#    si   =-20
#    env  = ((f1218 . -12) (f1218 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f1218)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_10215"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_10215":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f1218 . -12) (f1218 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_10216"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_10216":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f1218
# emit-variable-ref
# env=((f1218 . -12) (f1218 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f1218
    movl -12(%esp), %eax  # stack load f1218
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f1218
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f1218)
# emit-expr "arg must be a character"
# string literal
    jmp _L_10218
    .align 8,0x90
_L_10217 :
    .int 92
    .ascii "arg must be a character"
_L_10218:
    movl $_L_10217, %eax
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
_L_10213:
     movl %eax, eh$ucharacter
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a pair"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a pair"))
# == uniquify-variables  ==>
# (lambda (f1219) (error (list-ref (primitives) f1219) "arg must be a pair"))
# == vectorize-letrec  ==>
# (lambda (f1219) (error (list-ref (primitives) f1219) "arg must be a pair"))
# == eliminate-set!  ==>
# (lambda (f1219) (let ((f1219 f1219)) (error (list-ref (primitives) f1219) "arg must be a pair")))
# == close-free-variables  ==>
# (closure (f1219) (error list-ref primitives) (let ((f1219 f1219)) (error (list-ref (primitives) f1219) "arg must be a pair")))
# == eliminate-quote  ==>
# (closure (f1219) (error list-ref primitives) (let ((f1219 f1219)) (error (list-ref (primitives) f1219) "arg must be a pair")))
# == eliminate-when/unless  ==>
# (closure (f1219) (error list-ref primitives) (let ((f1219 f1219)) (error (list-ref (primitives) f1219) "arg must be a pair")))
# == eliminate-cond  ==>
# (closure (f1219) (error list-ref primitives) (let ((f1219 f1219)) (error (list-ref (primitives) f1219) "arg must be a pair")))
# == external-symbols  ==>
# (closure (f1219) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1219 f1219)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1219) "arg must be a pair")))
# emit-expr (closure (f1219) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1219 f1219)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1219) "arg must be a pair")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f1219) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1219 f1219)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1219) "arg must be a pair")))
    movl $_L_10219, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_10220            # jump around closure body
_L_10219:
# check argument count
    cmp $4,%eax
    je _L_10221
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_10221:
# emit-tail-expr
# si=-12
# env=((f1219 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f1219 f1219)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1219) "arg must be a pair"))
# emit-tail-let
#  si   = -12
#  env  = ((f1219 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f1219 f1219))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1219) "arg must be a pair")
# emit-expr f1219
# emit-variable-ref
# env=((f1219 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f1219
    movl -8(%esp), %eax  # stack load f1219
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f1219 . -12) (f1219 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1219) "arg must be a pair")
# emit-tail-funcall
#    si   =-16
#    env  = ((f1219 . -12) (f1219 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1219) "arg must be a pair")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f1219)
# funcall
#    si   =-20
#    env  = ((f1219 . -12) (f1219 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f1219)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_10222"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_10222":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f1219 . -12) (f1219 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_10223"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_10223":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f1219
# emit-variable-ref
# env=((f1219 . -12) (f1219 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f1219
    movl -12(%esp), %eax  # stack load f1219
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f1219
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f1219)
# emit-expr "arg must be a pair"
# string literal
    jmp _L_10225
    .align 8,0x90
_L_10224 :
    .int 72
    .ascii "arg must be a pair"
_L_10225:
    movl $_L_10224, %eax
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
_L_10220:
     movl %eax, eh$upair
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a vector"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a vector"))
# == uniquify-variables  ==>
# (lambda (f1220) (error (list-ref (primitives) f1220) "arg must be a vector"))
# == vectorize-letrec  ==>
# (lambda (f1220) (error (list-ref (primitives) f1220) "arg must be a vector"))
# == eliminate-set!  ==>
# (lambda (f1220) (let ((f1220 f1220)) (error (list-ref (primitives) f1220) "arg must be a vector")))
# == close-free-variables  ==>
# (closure (f1220) (error list-ref primitives) (let ((f1220 f1220)) (error (list-ref (primitives) f1220) "arg must be a vector")))
# == eliminate-quote  ==>
# (closure (f1220) (error list-ref primitives) (let ((f1220 f1220)) (error (list-ref (primitives) f1220) "arg must be a vector")))
# == eliminate-when/unless  ==>
# (closure (f1220) (error list-ref primitives) (let ((f1220 f1220)) (error (list-ref (primitives) f1220) "arg must be a vector")))
# == eliminate-cond  ==>
# (closure (f1220) (error list-ref primitives) (let ((f1220 f1220)) (error (list-ref (primitives) f1220) "arg must be a vector")))
# == external-symbols  ==>
# (closure (f1220) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1220 f1220)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1220) "arg must be a vector")))
# emit-expr (closure (f1220) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1220 f1220)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1220) "arg must be a vector")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f1220) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1220 f1220)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1220) "arg must be a vector")))
    movl $_L_10226, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_10227            # jump around closure body
_L_10226:
# check argument count
    cmp $4,%eax
    je _L_10228
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_10228:
# emit-tail-expr
# si=-12
# env=((f1220 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f1220 f1220)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1220) "arg must be a vector"))
# emit-tail-let
#  si   = -12
#  env  = ((f1220 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f1220 f1220))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1220) "arg must be a vector")
# emit-expr f1220
# emit-variable-ref
# env=((f1220 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f1220
    movl -8(%esp), %eax  # stack load f1220
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f1220 . -12) (f1220 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1220) "arg must be a vector")
# emit-tail-funcall
#    si   =-16
#    env  = ((f1220 . -12) (f1220 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1220) "arg must be a vector")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f1220)
# funcall
#    si   =-20
#    env  = ((f1220 . -12) (f1220 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f1220)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_10229"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_10229":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f1220 . -12) (f1220 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_10230"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_10230":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f1220
# emit-variable-ref
# env=((f1220 . -12) (f1220 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f1220
    movl -12(%esp), %eax  # stack load f1220
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f1220
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f1220)
# emit-expr "arg must be a vector"
# string literal
    jmp _L_10232
    .align 8,0x90
_L_10231 :
    .int 80
    .ascii "arg must be a vector"
_L_10232:
    movl $_L_10231, %eax
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
_L_10227:
     movl %eax, eh$uvector
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "length must be a fixnum >= 0"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "length must be a fixnum >= 0"))
# == uniquify-variables  ==>
# (lambda (f1221) (error (list-ref (primitives) f1221) "length must be a fixnum >= 0"))
# == vectorize-letrec  ==>
# (lambda (f1221) (error (list-ref (primitives) f1221) "length must be a fixnum >= 0"))
# == eliminate-set!  ==>
# (lambda (f1221) (let ((f1221 f1221)) (error (list-ref (primitives) f1221) "length must be a fixnum >= 0")))
# == close-free-variables  ==>
# (closure (f1221) (error list-ref primitives) (let ((f1221 f1221)) (error (list-ref (primitives) f1221) "length must be a fixnum >= 0")))
# == eliminate-quote  ==>
# (closure (f1221) (error list-ref primitives) (let ((f1221 f1221)) (error (list-ref (primitives) f1221) "length must be a fixnum >= 0")))
# == eliminate-when/unless  ==>
# (closure (f1221) (error list-ref primitives) (let ((f1221 f1221)) (error (list-ref (primitives) f1221) "length must be a fixnum >= 0")))
# == eliminate-cond  ==>
# (closure (f1221) (error list-ref primitives) (let ((f1221 f1221)) (error (list-ref (primitives) f1221) "length must be a fixnum >= 0")))
# == external-symbols  ==>
# (closure (f1221) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1221 f1221)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1221) "length must be a fixnum >= 0")))
# emit-expr (closure (f1221) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1221 f1221)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1221) "length must be a fixnum >= 0")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f1221) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1221 f1221)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1221) "length must be a fixnum >= 0")))
    movl $_L_10233, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_10234            # jump around closure body
_L_10233:
# check argument count
    cmp $4,%eax
    je _L_10235
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_10235:
# emit-tail-expr
# si=-12
# env=((f1221 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f1221 f1221)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1221) "length must be a fixnum >= 0"))
# emit-tail-let
#  si   = -12
#  env  = ((f1221 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f1221 f1221))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1221) "length must be a fixnum >= 0")
# emit-expr f1221
# emit-variable-ref
# env=((f1221 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f1221
    movl -8(%esp), %eax  # stack load f1221
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f1221 . -12) (f1221 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1221) "length must be a fixnum >= 0")
# emit-tail-funcall
#    si   =-16
#    env  = ((f1221 . -12) (f1221 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1221) "length must be a fixnum >= 0")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f1221)
# funcall
#    si   =-20
#    env  = ((f1221 . -12) (f1221 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f1221)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_10236"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_10236":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f1221 . -12) (f1221 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_10237"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_10237":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f1221
# emit-variable-ref
# env=((f1221 . -12) (f1221 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f1221
    movl -12(%esp), %eax  # stack load f1221
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f1221
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f1221)
# emit-expr "length must be a fixnum >= 0"
# string literal
    jmp _L_10239
    .align 8,0x90
_L_10238 :
    .int 112
    .ascii "length must be a fixnum >= 0"
_L_10239:
    movl $_L_10238, %eax
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
_L_10234:
     movl %eax, eh$ulength
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == uniquify-variables  ==>
# (lambda (f1222) (error (list-ref (primitives) f1222) "index out of bounds"))
# == vectorize-letrec  ==>
# (lambda (f1222) (error (list-ref (primitives) f1222) "index out of bounds"))
# == eliminate-set!  ==>
# (lambda (f1222) (let ((f1222 f1222)) (error (list-ref (primitives) f1222) "index out of bounds")))
# == close-free-variables  ==>
# (closure (f1222) (error list-ref primitives) (let ((f1222 f1222)) (error (list-ref (primitives) f1222) "index out of bounds")))
# == eliminate-quote  ==>
# (closure (f1222) (error list-ref primitives) (let ((f1222 f1222)) (error (list-ref (primitives) f1222) "index out of bounds")))
# == eliminate-when/unless  ==>
# (closure (f1222) (error list-ref primitives) (let ((f1222 f1222)) (error (list-ref (primitives) f1222) "index out of bounds")))
# == eliminate-cond  ==>
# (closure (f1222) (error list-ref primitives) (let ((f1222 f1222)) (error (list-ref (primitives) f1222) "index out of bounds")))
# == external-symbols  ==>
# (closure (f1222) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1222 f1222)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1222) "index out of bounds")))
# emit-expr (closure (f1222) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1222 f1222)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1222) "index out of bounds")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f1222) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1222 f1222)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1222) "index out of bounds")))
    movl $_L_10240, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_10241            # jump around closure body
_L_10240:
# check argument count
    cmp $4,%eax
    je _L_10242
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_10242:
# emit-tail-expr
# si=-12
# env=((f1222 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f1222 f1222)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1222) "index out of bounds"))
# emit-tail-let
#  si   = -12
#  env  = ((f1222 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f1222 f1222))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1222) "index out of bounds")
# emit-expr f1222
# emit-variable-ref
# env=((f1222 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f1222
    movl -8(%esp), %eax  # stack load f1222
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f1222 . -12) (f1222 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1222) "index out of bounds")
# emit-tail-funcall
#    si   =-16
#    env  = ((f1222 . -12) (f1222 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1222) "index out of bounds")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f1222)
# funcall
#    si   =-20
#    env  = ((f1222 . -12) (f1222 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f1222)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_10243"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_10243":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f1222 . -12) (f1222 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_10244"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_10244":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f1222
# emit-variable-ref
# env=((f1222 . -12) (f1222 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f1222
    movl -12(%esp), %eax  # stack load f1222
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f1222
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f1222)
# emit-expr "index out of bounds"
# string literal
    jmp _L_10246
    .align 8,0x90
_L_10245 :
    .int 76
    .ascii "index out of bounds"
_L_10246:
    movl $_L_10245, %eax
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
_L_10241:
     movl %eax, eh$uvector$uindex
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == uniquify-variables  ==>
# (lambda (f1223) (error (list-ref (primitives) f1223) "index out of bounds"))
# == vectorize-letrec  ==>
# (lambda (f1223) (error (list-ref (primitives) f1223) "index out of bounds"))
# == eliminate-set!  ==>
# (lambda (f1223) (let ((f1223 f1223)) (error (list-ref (primitives) f1223) "index out of bounds")))
# == close-free-variables  ==>
# (closure (f1223) (error list-ref primitives) (let ((f1223 f1223)) (error (list-ref (primitives) f1223) "index out of bounds")))
# == eliminate-quote  ==>
# (closure (f1223) (error list-ref primitives) (let ((f1223 f1223)) (error (list-ref (primitives) f1223) "index out of bounds")))
# == eliminate-when/unless  ==>
# (closure (f1223) (error list-ref primitives) (let ((f1223 f1223)) (error (list-ref (primitives) f1223) "index out of bounds")))
# == eliminate-cond  ==>
# (closure (f1223) (error list-ref primitives) (let ((f1223 f1223)) (error (list-ref (primitives) f1223) "index out of bounds")))
# == external-symbols  ==>
# (closure (f1223) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1223 f1223)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1223) "index out of bounds")))
# emit-expr (closure (f1223) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1223 f1223)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1223) "index out of bounds")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f1223) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1223 f1223)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1223) "index out of bounds")))
    movl $_L_10247, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_10248            # jump around closure body
_L_10247:
# check argument count
    cmp $4,%eax
    je _L_10249
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_10249:
# emit-tail-expr
# si=-12
# env=((f1223 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f1223 f1223)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1223) "index out of bounds"))
# emit-tail-let
#  si   = -12
#  env  = ((f1223 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f1223 f1223))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1223) "index out of bounds")
# emit-expr f1223
# emit-variable-ref
# env=((f1223 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f1223
    movl -8(%esp), %eax  # stack load f1223
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f1223 . -12) (f1223 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1223) "index out of bounds")
# emit-tail-funcall
#    si   =-16
#    env  = ((f1223 . -12) (f1223 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1223) "index out of bounds")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f1223)
# funcall
#    si   =-20
#    env  = ((f1223 . -12) (f1223 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f1223)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_10250"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_10250":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f1223 . -12) (f1223 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_10251"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_10251":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f1223
# emit-variable-ref
# env=((f1223 . -12) (f1223 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f1223
    movl -12(%esp), %eax  # stack load f1223
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f1223
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f1223)
# emit-expr "index out of bounds"
# string literal
    jmp _L_10253
    .align 8,0x90
_L_10252 :
    .int 76
    .ascii "index out of bounds"
_L_10253:
    movl $_L_10252, %eax
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
_L_10248:
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
