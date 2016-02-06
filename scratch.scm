# (letrec ((f (lambda (f n) (if (fxzero? n) 1 (fx* n (f f (fxsub1 n))))))) (f f 5))
# == explicit-begins  ==>
# (letrec ((f (lambda (f n) (if (fxzero? n) 1 (fx* n (f f (fxsub1 n))))))) (f f 5))
# == eliminate-let*  ==>
# (letrec ((f (lambda (f n) (if (fxzero? n) 1 (fx* n (f f (fxsub1 n))))))) (f f 5))
# == eliminate-shadowing  ==>
# (letrec ((f (lambda (f n) (if (fxzero? n) 1 (fx* n (f f (fxsub1 n))))))) (f f 5))
# == vectorize-letrec  ==>
# (let ((f (make-vector 1))) (begin (begin (vector-set! f 0 (lambda (f n) (if (fxzero? n) 1 (fx* n ((vector-ref f 0) (vector-ref f 0) (fxsub1 n))))))) ((vector-ref f 0) (vector-ref f 0) 5)))
# == eliminate-set!  ==>
# (let ((f (make-vector 1))) (begin (begin (vector-set! f 0 (lambda (f n) (let ((f f) (n n)) (if (fxzero? n) 1 (fx* n ((vector-ref f 0) (vector-ref f 0) (fxsub1 n)))))))) ((vector-ref f 0) (vector-ref f 0) 5)))
# == close-free-variables  ==>
# (let ((f (make-vector 1))) (begin (begin (vector-set! f 0 (closure (f n) () (let ((f f) (n n)) (if (fxzero? n) 1 (fx* n ((vector-ref f 0) (vector-ref f 0) (fxsub1 n)))))))) ((vector-ref f 0) (vector-ref f 0) 5)))
# == eliminate-quote  ==>
# (let ((f (make-vector 1))) (begin (begin (vector-set! f 0 (closure (f n) () (let ((f f) (n n)) (if (fxzero? n) 1 (fx* n ((vector-ref f 0) (vector-ref f 0) (fxsub1 n)))))))) ((vector-ref f 0) (vector-ref f 0) 5)))
# == eliminate-when/unless  ==>
# (let ((f (make-vector 1))) (begin (begin (vector-set! f 0 (closure (f n) () (let ((f f) (n n)) (if (fxzero? n) 1 (fx* n ((vector-ref f 0) (vector-ref f 0) (fxsub1 n)))))))) ((vector-ref f 0) (vector-ref f 0) 5)))
# == eliminate-cond  ==>
# (let ((f (make-vector 1))) (begin (begin (vector-set! f 0 (closure (f n) () (let ((f f) (n n)) (if (fxzero? n) 1 (fx* n ((vector-ref f 0) (vector-ref f 0) (fxsub1 n)))))))) ((vector-ref f 0) (vector-ref f 0) 5)))
# == external-symbols  ==>
# (let ((f (make-vector 1))) (begin (begin (vector-set! f 0 (closure (f n) () (let ((f f) (n n)) (if (fxzero? n) 1 (fx* n ((vector-ref f 0) (vector-ref f 0) (fxsub1 n)))))))) ((vector-ref f 0) (vector-ref f 0) 5)))
# emit-scheme-entry
    .text
    .align 16, 0x90
    .globl _L_scheme_entry
_L_scheme_entry:
    movl $0, %edi  # dummy for debugging
    .global base_init_callback
    .extern base_init
    addl $-4,%esp
    jmp base_init
base_init_callback:
    addl $4,%esp
# emit-expr (let ((f (make-vector 1))) (begin (begin (vector-set! f 0 (closure (f n) () (let ((f f) (n n)) (if (fxzero? n) 1 (fx* n ((vector-ref f 0) (vector-ref f 0) (fxsub1 n)))))))) ((vector-ref f 0) (vector-ref f 0) 5)))
# emit-let
#  si   = -8
#  env  = ()
#  bindings = ((f (make-vector 1)))
#  body = (begin (begin (vector-set! f 0 (closure (f n) () (let ((f f) (n n)) (if (fxzero? n) 1 (fx* n ((vector-ref f 0) (vector-ref f 0) (fxsub1 n)))))))) ((vector-ref f 0) (vector-ref f 0) 5))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_165152"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_165152:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_165153
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_165153:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, -8(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f 0 (closure (f n) () (let ((f f) (n n)) (if (fxzero? n) 1 (fx* n ((vector-ref f 0) (vector-ref f 0) (fxsub1 n)))))))) ((vector-ref f 0) (vector-ref f 0) 5))
# emit-begin
#   expr=(begin (begin (vector-set! f 0 (closure (f n) () (let ((f f) (n n)) (if (fxzero? n) 1 (fx* n ((vector-ref f 0) (vector-ref f 0) (fxsub1 n)))))))) ((vector-ref f 0) (vector-ref f 0) 5))
#   env=((f . -8))
# emit-expr (begin (vector-set! f 0 (closure (f n) () (let ((f f) (n n)) (if (fxzero? n) 1 (fx* n ((vector-ref f 0) (vector-ref f 0) (fxsub1 n))))))))
# emit-begin
#   expr=(begin (vector-set! f 0 (closure (f n) () (let ((f f) (n n)) (if (fxzero? n) 1 (fx* n ((vector-ref f 0) (vector-ref f 0) (fxsub1 n))))))))
#   env=((f . -8))
# emit-expr (vector-set! f 0 (closure (f n) () (let ((f f) (n n)) (if (fxzero? n) 1 (fx* n ((vector-ref f 0) (vector-ref f 0) (fxsub1 n)))))))
# emit-expr f
# emit-variable-ref
# env=((f . -8))
# var=f
    movl -8(%esp), %eax  # stack load f
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_165154
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_165154:
    movl %eax, -12(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_165155"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_165155:
# check bounds on vector index
    movl -12(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_165157
    cmp  $0,%eax
    jge _L_165156
_L_165157:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_165156:
    movl %eax, -16(%esp)
# emit-expr (closure (f n) () (let ((f f) (n n)) (if (fxzero? n) 1 (fx* n ((vector-ref f 0) (vector-ref f 0) (fxsub1 n))))))
# emit-closure
# si = -20
# env = ((f . -8))
# expr = (closure (f n) () (let ((f f) (n n)) (if (fxzero? n) 1 (fx* n ((vector-ref f 0) (vector-ref f 0) (fxsub1 n))))))
    movl $_L_165158, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_165159            # jump around closure body
_L_165158:
# check argument count
    cmp $8,%eax
    je _L_165160
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_165160:
# emit-tail-expr
# si=-16
# env=((n . -12) (f . -8) (f . -8))
# expr=(let ((f f) (n n)) (if (fxzero? n) 1 (fx* n ((vector-ref f 0) (vector-ref f 0) (fxsub1 n)))))
# emit-tail-let
#  si   = -16
#  env  = ((n . -12) (f . -8) (f . -8))
#  bindings = ((f f) (n n))
#  body = (if (fxzero? n) 1 (fx* n ((vector-ref f 0) (vector-ref f 0) (fxsub1 n))))
# emit-expr f
# emit-variable-ref
# env=((n . -12) (f . -8) (f . -8))
# var=f
    movl -8(%esp), %eax  # stack load f
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr n
# emit-variable-ref
# env=((n . -12) (f . -8) (f . -8))
# var=n
    movl -12(%esp), %eax  # stack load n
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((n . -20) (f . -16) (n . -12) (f . -8) (f . -8))
# expr=(if (fxzero? n) 1 (fx* n ((vector-ref f 0) (vector-ref f 0) (fxsub1 n))))
# emit-expr (fxzero? n)
# emit-expr n
# emit-variable-ref
# env=((n . -20) (f . -16) (n . -12) (f . -8) (f . -8))
# var=n
    movl -20(%esp), %eax  # stack load n
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_165163"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $56,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_165163:
    cmp $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_165161
# emit-tail-expr
# si=-24
# env=((n . -20) (f . -16) (n . -12) (f . -8) (f . -8))
# expr=1
    movl $4, %eax     # immed 1
    ret                  # immediate tail return
    jmp _L_165162
_L_165161:
# emit-tail-expr
# si=-24
# env=((n . -20) (f . -16) (n . -12) (f . -8) (f . -8))
# expr=(fx* n ((vector-ref f 0) (vector-ref f 0) (fxsub1 n)))
# tail primcall
# emit-expr ((vector-ref f 0) (vector-ref f 0) (fxsub1 n))
# funcall
#    si   =-24
#    env  = ((n . -20) (f . -16) (n . -12) (f . -8) (f . -8))
#    expr = (funcall (vector-ref f 0) (vector-ref f 0) (fxsub1 n))
# emit-expr (vector-ref f 0)
# emit-expr f
# emit-variable-ref
# env=((n . -20) (f . -16) (n . -12) (f . -8) (f . -8))
# var=f
    movl -16(%esp), %eax  # stack load f
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_165164
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_165164:
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_165165"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_165165:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_165167
    cmp  $0,%eax
    jge _L_165166
_L_165167:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_165166:
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_165168"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_165168":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr (vector-ref f 0)
# emit-expr f
# emit-variable-ref
# env=((n . -20) (f . -16) (n . -12) (f . -8) (f . -8))
# var=f
    movl -16(%esp), %eax  # stack load f
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_165169
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_165169:
    movl %eax, -36(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_165170"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_165170:
# check bounds on vector index
    movl -36(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_165172
    cmp  $0,%eax
    jge _L_165171
_L_165172:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_165171:
    movl -36(%esp), %esi
    movl -1(%eax,%esi), %eax
    mov %eax, -36(%esp)  # arg (vector-ref f 0)
# emit-expr (fxsub1 n)
# emit-expr n
# emit-variable-ref
# env=((n . -20) (f . -16) (n . -12) (f . -8) (f . -8))
# var=n
    movl -20(%esp), %eax  # stack load n
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_165173"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $52,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_165173:
    addl $-4, %eax
    mov %eax, -40(%esp)  # arg (fxsub1 n)
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_165174"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $88,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_165174:
    sar $2, %eax
    movl %eax, -24(%esp)
# emit-expr n
# emit-variable-ref
# env=((n . -20) (f . -16) (n . -12) (f . -8) (f . -8))
# var=n
    movl -20(%esp), %eax  # stack load n
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_165175"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $88,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_165175:
    imul -24(%esp), %eax
#return from tail (fx* n ((vector-ref f 0) (vector-ref f 0) (fxsub1 n)))
    ret
_L_165162:
    .align 4,0x90
_L_165159:
    movl -12(%esp), %ebx
    movl -16(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f . -8))
# emit-expr (begin ((vector-ref f 0) (vector-ref f 0) 5))
# emit-begin
#   expr=(begin ((vector-ref f 0) (vector-ref f 0) 5))
#   env=((f . -8))
# emit-expr ((vector-ref f 0) (vector-ref f 0) 5)
# funcall
#    si   =-12
#    env  = ((f . -8))
#    expr = (funcall (vector-ref f 0) (vector-ref f 0) 5)
# emit-expr (vector-ref f 0)
# emit-expr f
# emit-variable-ref
# env=((f . -8))
# var=f
    movl -8(%esp), %eax  # stack load f
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_165176
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_165176:
    movl %eax, -20(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_165177"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_165177:
# check bounds on vector index
    movl -20(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_165179
    cmp  $0,%eax
    jge _L_165178
_L_165179:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_165178:
    movl -20(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_165180"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_165180":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr (vector-ref f 0)
# emit-expr f
# emit-variable-ref
# env=((f . -8))
# var=f
    movl -8(%esp), %eax  # stack load f
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_165181
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_165181:
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_165182"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_165182:
# check bounds on vector index
    movl -24(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_165184
    cmp  $0,%eax
    jge _L_165183
_L_165184:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_165183:
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
    mov %eax, -24(%esp)  # arg (vector-ref f 0)
# emit-expr 5
    movl $20, %eax     # immed 5
    mov %eax, -28(%esp)  # arg 5
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f . -8))
    ret
    .text
    .align 16, 0x90
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
