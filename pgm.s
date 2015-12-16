# (let ((make-counter (lambda () (let ((counter -1)) (lambda () (set! counter (fxadd1 counter)) counter))))) (let ((c0 (make-counter)) (c1 (make-counter))) (c0) (cons (c0) (c1))))
# == eliminate-multi-element-body  ==>
# (let ((make-counter (lambda () (let ((counter -1)) (lambda () (set! counter (fxadd1 counter)) counter))))) (let ((c0 (make-counter)) (c1 (make-counter))) (begin (c0) (cons (c0) (c1)))))
# == eliminate-let*  ==>
# (let ((make-counter (lambda () (let ((counter -1)) (lambda () (set! counter (fxadd1 counter)) counter))))) (let ((c0 (make-counter)) (c1 (make-counter))) (begin (c0) (cons (c0) (c1)))))
# == eliminate-variable-name-shadowing  ==>
# (let ((make-counter (lambda () (let ((counter -1)) (lambda () (begin (set! counter (fxadd1 counter)) counter)))))) (let ((c0 (make-counter)) (c1 (make-counter))) (begin (c0) (cons (c0) (c1)))))
# == vectorize-letrec  ==>
# (let ((make-counter (lambda () (let ((counter -1)) (lambda () (begin (set! counter (fxadd1 counter)) counter)))))) (let ((c0 (make-counter)) (c1 (make-counter))) (begin (c0) (cons (c0) (c1)))))
# == eliminate-set!  ==>
# (let ((make-counter (lambda () (let () (let ((counter (vector -1))) (lambda () (let () (begin (vector-set! counter 0 (fxadd1 (vector-ref counter 0))) (vector-ref counter 0))))))))) (let ((c0 (make-counter)) (c1 (make-counter))) (begin (c0) (cons (c0) (c1)))))
# == close-free-variables  ==>
# (let ((make-counter (closure () () (let () (let ((counter (vector -1))) (closure () (counter counter counter) (let () (begin (vector-set! counter 0 (fxadd1 (vector-ref counter 0))) (vector-ref counter 0))))))))) (let ((c0 (make-counter)) (c1 (make-counter))) (begin (c0) (cons (c0) (c1)))))
    .text
    .align 4,0x90
    .globl _L_scheme_entry
_L_scheme_entry:
# emit-expr
# emit-let
#  si   = -8
#  env  = ()
#  bindings = ((make-counter (closure () () (let () (let ((counter (vector -1))) (closure () (counter counter counter) (let () (begin (vector-set! counter 0 (fxadd1 (vector-ref counter 0))) (vector-ref counter 0)))))))))
#  body = (let ((c0 (make-counter)) (c1 (make-counter))) (begin (c0) (cons (c0) (c1))))
# emit-expr
# emit-closure
# si = -8
# env = ()
# expr = (closure () () (let () (let ((counter (vector -1))) (closure () (counter counter counter) (let () (begin (vector-set! counter 0 (fxadd1 (vector-ref counter 0))) (vector-ref counter 0)))))))
    movl $_L_14, 0(%ebp)  # closure label
    movl %ebp, %eax    # return base ptr
    add $2, %eax      # closure tag
    add $8, %ebp      # bump ebp
    jmp _L_15
_L_14:
# emit-tail-expr
# si=-8
# env=()
# expr=(begin (let () (let ((counter (vector -1))) (closure () (counter counter counter) (let () (begin (vector-set! counter 0 (fxadd1 (vector-ref counter 0))) (vector-ref counter 0)))))))
# tail-begin body=((let () (let ((counter (vector -1))) (closure () (counter counter counter) (let () (begin (vector-set! counter 0 (fxadd1 (vector-ref counter 0))) (vector-ref counter 0)))))))
# emit-tail-expr
# si=-8
# env=()
# expr=(let () (let ((counter (vector -1))) (closure () (counter counter counter) (let () (begin (vector-set! counter 0 (fxadd1 (vector-ref counter 0))) (vector-ref counter 0))))))
# emit-tail-let
#  si   = -8
#  env  = ()
#  bindings = ()
#  body = (let ((counter (vector -1))) (closure () (counter counter counter) (let () (begin (vector-set! counter 0 (fxadd1 (vector-ref counter 0))) (vector-ref counter 0)))))
# emit-tail-expr
# si=-8
# env=()
# expr=(let ((counter (vector -1))) (closure () (counter counter counter) (let () (begin (vector-set! counter 0 (fxadd1 (vector-ref counter 0))) (vector-ref counter 0)))))
# emit-tail-let
#  si   = -8
#  env  = ()
#  bindings = ((counter (vector -1)))
#  body = (closure () (counter counter counter) (let () (begin (vector-set! counter 0 (fxadd1 (vector-ref counter 0))) (vector-ref counter 0))))
# emit-expr
# emit-expr
# make-vector 1
# emit-expr
    movl $4, %eax     # immed 1
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, -8(%esp)
# emit-expr
    movl $-4, %eax     # immed -1
    movl  %eax, %ebx
    movl -8(%esp), %eax
    movl %ebx, -1(%eax)
    movl %eax, -8(%esp)  # stack save
# emit-tail-expr
# si=-12
# env=((counter . -8))
# expr=(closure () (counter counter counter) (let () (begin (vector-set! counter 0 (fxadd1 (vector-ref counter 0))) (vector-ref counter 0))))
