# (let (($si= (make-vector 1)) ($m (make-vector 1))) (begin (begin (vector-set! $si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! $m 0 (closure (s1 s2 i) (si= $m) (let ((s1 s1) (s2 s2) (i i)) (if (fx= i (string-length s1)) () (cons (si= s1 s2 i) ((vector-ref $m 0) s1 s2 (fx+ i 1)))))))) ((vector-ref $m 0) "fi" "fo" 0)))
# == eliminate-multi-element-body  ==>
# (let (($si= (make-vector 1)) ($m (make-vector 1))) (begin (begin (vector-set! $si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! $m 0 (closure (s1 s2 i) (si= $m) (let ((s1 s1) (s2 s2) (i i)) (if (fx= i (string-length s1)) () (cons (si= s1 s2 i) ((vector-ref $m 0) s1 s2 (fx+ i 1)))))))) ((vector-ref $m 0) "fi" "fo" 0)))
# == eliminate-let*  ==>
# (let (($si= (make-vector 1)) ($m (make-vector 1))) (begin (begin (vector-set! $si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! $m 0 (closure (s1 s2 i) (si= $m) (let ((s1 s1) (s2 s2) (i i)) (if (fx= i (string-length s1)) () (cons (si= s1 s2 i) ((vector-ref $m 0) s1 s2 (fx+ i 1)))))))) ((vector-ref $m 0) "fi" "fo" 0)))
# == eliminate-shadowing  ==>
# (let (($si= (make-vector 1)) ($m (make-vector 1))) (begin (begin (vector-set! $si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! $m 0 (closure (s1 s2 i) (si= $m) (let ((s1 s1) (s2 s2) (i i)) (if (fx= i (string-length s1)) () (cons (si= s1 s2 i) ((vector-ref $m 0) s1 s2 (fx+ i 1)))))))) ((vector-ref $m 0) "fi" "fo" 0)))
# == vectorize-letrec  ==>
# (let (($si= (make-vector 1)) ($m (make-vector 1))) (begin (begin (vector-set! $si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! $m 0 (closure (s1 s2 i) (si= $m) (let ((s1 s1) (s2 s2) (i i)) (if (fx= i (string-length s1)) () (cons (si= s1 s2 i) ((vector-ref $m 0) s1 s2 (fx+ i 1)))))))) ((vector-ref $m 0) "fi" "fo" 0)))
# == eliminate-set!  ==>
# (let (($si= (make-vector 1)) ($m (make-vector 1))) (begin (begin (vector-set! $si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! $m 0 (closure (s1 s2 i) (si= $m) (let ((s1 s1) (s2 s2) (i i)) (if (fx= i (string-length s1)) () (cons (si= s1 s2 i) ((vector-ref $m 0) s1 s2 (fx+ i 1)))))))) ((vector-ref $m 0) "fi" "fo" 0)))
# == close-free-variables  ==>
# (let (($si= (make-vector 1)) ($m (make-vector 1))) (begin (begin (vector-set! $si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! $m 0 (closure (s1 s2 i) (si= $m) (let ((s1 s1) (s2 s2) (i i)) (if (fx= i (string-length s1)) () (cons (si= s1 s2 i) ((vector-ref $m 0) s1 s2 (fx+ i 1)))))))) ((vector-ref $m 0) "fi" "fo" 0)))
# == eliminate-quote  ==>
# (let (($si= (make-vector 1)) ($m (make-vector 1))) (begin (begin (vector-set! $si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! $m 0 (closure (s1 s2 i) (si= $m) (let ((s1 s1) (s2 s2) (i i)) (if (fx= i (string-length s1)) () (cons (si= s1 s2 i) ((vector-ref $m 0) s1 s2 (fx+ i 1)))))))) ((vector-ref $m 0) "fi" "fo" 0)))
# == eliminate-when/unless  ==>
# (let (($si= (make-vector 1)) ($m (make-vector 1))) (begin (begin (vector-set! $si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! $m 0 (closure (s1 s2 i) (si= $m) (let ((s1 s1) (s2 s2) (i i)) (if (fx= i (string-length s1)) () (cons (si= s1 s2 i) ((vector-ref $m 0) s1 s2 (fx+ i 1)))))))) ((vector-ref $m 0) "fi" "fo" 0)))
# == eliminate-cond  ==>
# (let (($si= (make-vector 1)) ($m (make-vector 1))) (begin (begin (vector-set! $si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! $m 0 (closure (s1 s2 i) (si= $m) (let ((s1 s1) (s2 s2) (i i)) (if (fx= i (string-length s1)) () (cons (si= s1 s2 i) ((vector-ref $m 0) s1 s2 (fx+ i 1)))))))) ((vector-ref $m 0) "fi" "fo" 0)))
# emit-scheme-entry
    .text
    .align 4,0x90
    .globl _L_scheme_entry
_L_scheme_entry:
          .data
          .globl symbols  # symbol list as a datum 
          .globl s2sym
          .align 8
symbols:
          .int 0xFF  # holds (symbols)
          .align 8
s2sym:
          .int 0xFF  # holds pgm-str-sym
          .text
# emit-expr (cons (make-symbol "nil" ()) ())
# cons arg1=(make-symbol "nil" ()) arg2=()
# emit-expr (make-symbol "nil" ())
# make-symbol arg1="nil" arg2=()
# emit-expr "nil"
# string literal
    jmp _L_359
    .align 8,0x90
_L_358 :
    .int 12
    .ascii "nil"
_L_359:
    movl $_L_358, %eax
    orl $6, %eax
    movl %eax, -8(%esp)
# emit-expr ()
    movl $63, %eax     # immed ()
    movl %eax, 4(%ebp)
    movl -8(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $3, %eax
    add  $8, %ebp
# make-symbol end
    movl %eax, -8(%esp)
# emit-expr ()
    movl $63, %eax     # immed ()
    movl %eax, 4(%ebp)
    movl -8(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl %eax, symbols
# emit-expr (let (($si= (make-vector 1)) ($m (make-vector 1))) (begin (begin (vector-set! $si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! $m 0 (closure (s1 s2 i) (si= $m) (let ((s1 s1) (s2 s2) (i i)) (if (fx= i (string-length s1)) () (cons (si= s1 s2 i) ((vector-ref $m 0) s1 s2 (fx+ i 1)))))))) ((vector-ref $m 0) "fi" "fo" 0)))
# emit-let
#  si   = -8
#  env  = ()
#  bindings = (($si= (make-vector 1)) ($m (make-vector 1)))
#  body = (begin (begin (vector-set! $si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! $m 0 (closure (s1 s2 i) (si= $m) (let ((s1 s1) (s2 s2) (i i)) (if (fx= i (string-length s1)) () (cons (si= s1 s2 i) ((vector-ref $m 0) s1 s2 (fx+ i 1)))))))) ((vector-ref $m 0) "fi" "fo" 0))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
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
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, -12(%esp)  # stack save
# emit-expr (begin (begin (vector-set! $si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! $m 0 (closure (s1 s2 i) (si= $m) (let ((s1 s1) (s2 s2) (i i)) (if (fx= i (string-length s1)) () (cons (si= s1 s2 i) ((vector-ref $m 0) s1 s2 (fx+ i 1)))))))) ((vector-ref $m 0) "fi" "fo" 0))
# emit-begin
#   expr=(begin (begin (vector-set! $si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! $m 0 (closure (s1 s2 i) (si= $m) (let ((s1 s1) (s2 s2) (i i)) (if (fx= i (string-length s1)) () (cons (si= s1 s2 i) ((vector-ref $m 0) s1 s2 (fx+ i 1)))))))) ((vector-ref $m 0) "fi" "fo" 0))
#   env=(($m . -12) ($si= . -8))
# emit-expr (begin (vector-set! $si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! $m 0 (closure (s1 s2 i) (si= $m) (let ((s1 s1) (s2 s2) (i i)) (if (fx= i (string-length s1)) () (cons (si= s1 s2 i) ((vector-ref $m 0) s1 s2 (fx+ i 1))))))))
# emit-begin
#   expr=(begin (vector-set! $si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! $m 0 (closure (s1 s2 i) (si= $m) (let ((s1 s1) (s2 s2) (i i)) (if (fx= i (string-length s1)) () (cons (si= s1 s2 i) ((vector-ref $m 0) s1 s2 (fx+ i 1))))))))
#   env=(($m . -12) ($si= . -8))
# emit-expr (vector-set! $si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i)))))
# emit-expr $si=
# emit-variable-ref
# env=(($m . -12) ($si= . -8))
# var=$si=
    movl -8(%esp), %eax  # stack load $si=
# end emit-variable-ref
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl %eax, -20(%esp)
# emit-expr (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))
# emit-closure
# si = -24
# env = (($m . -12) ($si= . -8))
# expr = (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))
    movl $_L_360, 0(%ebp)  # closure label
    movl %ebp, %eax    # return base ptr
    add $2, %eax      # closure tag
    add $8, %ebp      # bump ebp
    jmp _L_361
_L_360:
# emit-tail-expr
# si=-20
# env=((i . -16) (s2 . -12) (s1 . -8))
# expr=(begin (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))
# tail-begin (begin (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))
#   env=((i . -16) (s2 . -12) (s1 . -8))
# emit-tail-expr
# si=-20
# env=((i . -16) (s2 . -12) (s1 . -8))
# expr=(let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i)))
# emit-tail-let
#  si   = -20
#  env  = ((i . -16) (s2 . -12) (s1 . -8))
#  bindings = ((s1 s1) (s2 s2) (i i))
#  body = (char=? (string-ref s1 i) (string-ref s2 i))
# emit-expr s1
# emit-variable-ref
# env=((i . -16) (s2 . -12) (s1 . -8))
# var=s1
    movl -8(%esp), %eax  # stack load s1
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-expr s2
# emit-variable-ref
# env=((i . -16) (s2 . -12) (s1 . -8))
# var=s2
    movl -12(%esp), %eax  # stack load s2
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr i
# emit-variable-ref
# env=((i . -16) (s2 . -12) (s1 . -8))
# var=i
    movl -16(%esp), %eax  # stack load i
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-tail-expr
# si=-32
# env=((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8))
# expr=(char=? (string-ref s1 i) (string-ref s2 i))
# tail primcall
# char= c1=(string-ref s1 i) c2=(string-ref s2 i)
# emit-expr (string-ref s1 i)
# emit-expr s1
# emit-variable-ref
# env=((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8))
# var=s1
    movl -20(%esp), %eax  # stack load s1
# end emit-variable-ref
    movl %eax, -32(%esp)
# emit-expr i
# emit-variable-ref
# env=((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8))
# var=i
    movl -28(%esp), %eax  # stack load i
# end emit-variable-ref
    sar $2, %eax
    movl -32(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
    movb %ah, -32(%esp)
# emit-expr (string-ref s2 i)
# emit-expr s2
# emit-variable-ref
# env=((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8))
# var=s2
    movl -24(%esp), %eax  # stack load s2
# end emit-variable-ref
    movl %eax, -36(%esp)
# emit-expr i
# emit-variable-ref
# env=((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8))
# var=i
    movl -28(%esp), %eax  # stack load i
# end emit-variable-ref
    sar $2, %eax
    movl -36(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
    cmp %ah, -32(%esp)
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
#return from tail (char=? (string-ref s1 i) (string-ref s2 i))
    ret
     ret   # return thru stack
    .align 4,0x90
_L_361:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! $m 0 (closure (s1 s2 i) (si= $m) (let ((s1 s1) (s2 s2) (i i)) (if (fx= i (string-length s1)) () (cons (si= s1 s2 i) ((vector-ref $m 0) s1 s2 (fx+ i 1))))))))
# emit-begin
#   expr=(begin (vector-set! $m 0 (closure (s1 s2 i) (si= $m) (let ((s1 s1) (s2 s2) (i i)) (if (fx= i (string-length s1)) () (cons (si= s1 s2 i) ((vector-ref $m 0) s1 s2 (fx+ i 1))))))))
#   env=(($m . -12) ($si= . -8))
# emit-expr (vector-set! $m 0 (closure (s1 s2 i) (si= $m) (let ((s1 s1) (s2 s2) (i i)) (if (fx= i (string-length s1)) () (cons (si= s1 s2 i) ((vector-ref $m 0) s1 s2 (fx+ i 1)))))))
# emit-expr $m
# emit-variable-ref
# env=(($m . -12) ($si= . -8))
# var=$m
    movl -12(%esp), %eax  # stack load $m
# end emit-variable-ref
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl %eax, -20(%esp)
# emit-expr (closure (s1 s2 i) (si= $m) (let ((s1 s1) (s2 s2) (i i)) (if (fx= i (string-length s1)) () (cons (si= s1 s2 i) ((vector-ref $m 0) s1 s2 (fx+ i 1))))))
# emit-closure
# si = -24
# env = (($m . -12) ($si= . -8))
# expr = (closure (s1 s2 i) (si= $m) (let ((s1 s1) (s2 s2) (i i)) (if (fx= i (string-length s1)) () (cons (si= s1 s2 i) ((vector-ref $m 0) s1 s2 (fx+ i 1))))))
    movl $_L_362, 0(%ebp)  # closure label
# emit-variable-ref
# env=(($m . -12) ($si= . -8))
# var=$m
    movl -12(%esp), %eax  # stack load $m
# end emit-variable-ref
   movl  %eax, 8(%ebp)
    movl %ebp, %eax    # return base ptr
    add $2, %eax      # closure tag
    add $16, %ebp      # bump ebp
    jmp _L_363
_L_362:
# emit-tail-expr
# si=-20
# env=((i . -16) (s2 . -12) (s1 . -8) ($m . 8) (si= . 4))
# expr=(begin (let ((s1 s1) (s2 s2) (i i)) (if (fx= i (string-length s1)) () (cons (si= s1 s2 i) ((vector-ref $m 0) s1 s2 (fx+ i 1))))))
# tail-begin (begin (let ((s1 s1) (s2 s2) (i i)) (if (fx= i (string-length s1)) () (cons (si= s1 s2 i) ((vector-ref $m 0) s1 s2 (fx+ i 1))))))
#   env=((i . -16) (s2 . -12) (s1 . -8) ($m . 8) (si= . 4))
# emit-tail-expr
# si=-20
# env=((i . -16) (s2 . -12) (s1 . -8) ($m . 8) (si= . 4))
# expr=(let ((s1 s1) (s2 s2) (i i)) (if (fx= i (string-length s1)) () (cons (si= s1 s2 i) ((vector-ref $m 0) s1 s2 (fx+ i 1)))))
# emit-tail-let
#  si   = -20
#  env  = ((i . -16) (s2 . -12) (s1 . -8) ($m . 8) (si= . 4))
#  bindings = ((s1 s1) (s2 s2) (i i))
#  body = (if (fx= i (string-length s1)) () (cons (si= s1 s2 i) ((vector-ref $m 0) s1 s2 (fx+ i 1))))
# emit-expr s1
# emit-variable-ref
# env=((i . -16) (s2 . -12) (s1 . -8) ($m . 8) (si= . 4))
# var=s1
    movl -8(%esp), %eax  # stack load s1
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-expr s2
# emit-variable-ref
# env=((i . -16) (s2 . -12) (s1 . -8) ($m . 8) (si= . 4))
# var=s2
    movl -12(%esp), %eax  # stack load s2
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr i
# emit-variable-ref
# env=((i . -16) (s2 . -12) (s1 . -8) ($m . 8) (si= . 4))
# var=i
    movl -16(%esp), %eax  # stack load i
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-tail-expr
# si=-32
# env=((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8) ($m . 8) (si= . 4))
# expr=(if (fx= i (string-length s1)) () (cons (si= s1 s2 i) ((vector-ref $m 0) s1 s2 (fx+ i 1))))
# emit-expr (fx= i (string-length s1))
# emit-expr (string-length s1)
# emit-expr s1
# emit-variable-ref
# env=((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8) ($m . 8) (si= . 4))
# var=s1
    movl -20(%esp), %eax  # stack load s1
# end emit-variable-ref
    movl -6(%eax), %eax
    movl %eax, -32(%esp)
# emit-expr i
# emit-variable-ref
# env=((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8) ($m . 8) (si= . 4))
# var=i
    movl -28(%esp), %eax  # stack load i
# end emit-variable-ref
    cmp -32(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_364
# emit-tail-expr
# si=-32
# env=((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8) ($m . 8) (si= . 4))
# expr=()
    movl $63, %eax     # immed ()
    ret                  # tail return
    jmp _L_365
_L_364:
# emit-tail-expr
# si=-32
# env=((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8) ($m . 8) (si= . 4))
# expr=(cons (si= s1 s2 i) ((vector-ref $m 0) s1 s2 (fx+ i 1)))
# tail primcall
# cons arg1=(si= s1 s2 i) arg2=((vector-ref $m 0) s1 s2 (fx+ i 1))
# emit-expr (si= s1 s2 i)
# funcall
#    si   =-32
#    env  = ((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8) ($m . 8) (si= . 4))
#    expr = (funcall si= s1 s2 i)
# emit-expr si=
# emit-variable-ref
# env=((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8) ($m . 8) (si= . 4))
# var=si=
    movl 2(%edi), %eax  # frame load si=
# end emit-variable-ref
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
# emit-expr s1
# emit-variable-ref
# env=((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8) ($m . 8) (si= . 4))
# var=s1
    movl -20(%esp), %eax  # stack load s1
# end emit-variable-ref
    mov %eax, -44(%esp)    # arg s1
# emit-expr s2
# emit-variable-ref
# env=((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8) ($m . 8) (si= . 4))
# var=s2
    movl -24(%esp), %eax  # stack load s2
# end emit-variable-ref
    mov %eax, -48(%esp)    # arg s2
# emit-expr i
# emit-variable-ref
# env=((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8) ($m . 8) (si= . 4))
# var=i
    movl -28(%esp), %eax  # stack load i
# end emit-variable-ref
    mov %eax, -52(%esp)    # arg i
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp    # adjust base
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp    # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -32(%esp)
# emit-expr ((vector-ref $m 0) s1 s2 (fx+ i 1))
# funcall
#    si   =-36
#    env  = ((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8) ($m . 8) (si= . 4))
#    expr = (funcall (vector-ref $m 0) s1 s2 (fx+ i 1))
# emit-expr (vector-ref $m 0)
# emit-expr $m
# emit-variable-ref
# env=((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8) ($m . 8) (si= . 4))
# var=$m
    movl 6(%edi), %eax  # frame load $m
# end emit-variable-ref
    movl %eax, -44(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl -44(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -44(%esp)  # stash funcall-oper in closure slot
# emit-expr s1
# emit-variable-ref
# env=((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8) ($m . 8) (si= . 4))
# var=s1
    movl -20(%esp), %eax  # stack load s1
# end emit-variable-ref
    mov %eax, -48(%esp)    # arg s1
# emit-expr s2
# emit-variable-ref
# env=((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8) ($m . 8) (si= . 4))
# var=s2
    movl -24(%esp), %eax  # stack load s2
# end emit-variable-ref
    mov %eax, -52(%esp)    # arg s2
# emit-expr (fx+ i 1)
# emit-expr 1
    movl $4, %eax     # immed 1
    movl %eax, -56(%esp)  # fx+ push arg1
# emit-expr i
# emit-variable-ref
# env=((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8) ($m . 8) (si= . 4))
# var=i
    movl -28(%esp), %eax  # stack load i
# end emit-variable-ref
    addl -56(%esp), %eax  # fx+ arg1 arg2
    mov %eax, -56(%esp)    # arg (fx+ i 1)
    movl -44(%esp), %edi   # load new closure to %edi  <<--- must have loaded 0 into edi
    add $-36, %esp    # adjust base
    call *-2(%edi)        # call thru closure ptr    <<------ blows here %edi = 0
    add $36, %esp    # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, 4(%ebp)
    movl -32(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
#return from tail (cons (si= s1 s2 i) ((vector-ref $m 0) s1 s2 (fx+ i 1)))
    ret
_L_365:
     ret   # return thru stack
    .align 4,0x90
_L_363:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=(($m . -12) ($si= . -8))
# emit-expr (begin ((vector-ref $m 0) "fi" "fo" 0))
# emit-begin
#   expr=(begin ((vector-ref $m 0) "fi" "fo" 0))
#   env=(($m . -12) ($si= . -8))
# emit-expr ((vector-ref $m 0) "fi" "fo" 0)
# funcall
#    si   =-16
#    env  = (($m . -12) ($si= . -8))
#    expr = (funcall (vector-ref $m 0) "fi" "fo" 0)
# emit-expr (vector-ref $m 0)
# emit-expr $m
# emit-variable-ref
# env=(($m . -12) ($si= . -8))
# var=$m
    movl -12(%esp), %eax  # stack load $m
# end emit-variable-ref
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -24(%esp)  # stash funcall-oper in closure slot
# emit-expr "fi"
# string literal
    jmp _L_367
    .align 8,0x90
_L_366 :
    .int 8
    .ascii "fi"
_L_367:
    movl $_L_366, %eax
    orl $6, %eax
    mov %eax, -28(%esp)    # arg fi
# emit-expr "fo"
# string literal
    jmp _L_369
    .align 8,0x90
_L_368 :
    .int 8
    .ascii "fo"
_L_369:
    movl $_L_368, %eax
    orl $6, %eax
    mov %eax, -32(%esp)    # arg fo
# emit-expr 0
    movl $0, %eax     # immed 0
    mov %eax, -36(%esp)    # arg 0
    movl -24(%esp), %edi   # load new closure to %edi
    add $-16, %esp    # adjust base
    call *-2(%edi)        # call thru closure ptr   
    add $16, %esp    # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=(($m . -12) ($si= . -8))
    ret
    .text
    .align 4,0x90
    .globl _scheme_entry
_scheme_entry:
    movl 4(%esp), %ecx
    movl %ebx, 4(%ecx)
    movl %esi, 16(%ecx)
    movl %edi, 20(%ecx)
    movl %ebp, 24(%ecx)
    movl %esp, 28(%ecx)
    movl 12(%esp), %ebp
    movl 8(%esp), %esp
    call _L_scheme_entry
    movl 4(%ecx), %ebx
    movl 16(%ecx), %esi
    movl 20(%ecx), %edi
    movl 24(%ecx), %ebp
    movl 28(%ecx), %esp
    ret
