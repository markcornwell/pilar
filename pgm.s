# (let ((symlist (symbols))) (cond ((string=? str (symbol->string (car (symlist)))) (car symlist)) ((null? (cdr symlist)) (set-cdr! symlist (make-symbol "foo" (quote ())))) (else (f str (cdr symlist)))))
# == eliminate-multi-element-body  ==>
# (let ((symlist (symbols))) (cond ((string=? str (symbol->string (car (symlist)))) (car symlist)) ((null? (cdr symlist)) (set-cdr! symlist (make-symbol "foo" (quote ())))) (else (f str (cdr symlist)))))
# == eliminate-let*  ==>
# (let ((symlist (symbols))) (cond ((string=? str (symbol->string (car (symlist)))) (car symlist)) ((null? (cdr symlist)) (set-cdr! symlist (make-symbol "foo" (quote ())))) (else (f str (cdr symlist)))))
# == eliminate-shadowing  ==>
# (let ((symlist (symbols))) (cond ((string=? str (symbol->string (car (symlist)))) (car symlist)) ((null? (cdr symlist)) (set-cdr! symlist (make-symbol "foo" (quote ())))) (else (f str (cdr symlist)))))
# == vectorize-letrec  ==>
# (let ((symlist (symbols))) (cond ((string=? str (symbol->string (car (symlist)))) (car symlist)) ((null? (cdr symlist)) (set-cdr! symlist (make-symbol "foo" (quote ())))) (else (f str (cdr symlist)))))
# == eliminate-set!  ==>
# (let ((symlist (symbols))) (cond ((string=? str (symbol->string (car (symlist)))) (car symlist)) ((null? (cdr symlist)) (set-cdr! symlist (make-symbol "foo" (quote ())))) (else (f str (cdr symlist)))))
# == close-free-variables  ==>
# (let ((symlist (symbols))) (cond ((string=? str (symbol->string (car (symlist)))) (car symlist)) ((null? (cdr symlist)) (set-cdr! symlist (make-symbol "foo" (quote ())))) (else (f str (cdr symlist)))))
# == eliminate-quote  ==>
# (let ((symlist (symbols))) (cond ((string=? str (symbol->string (car (symlist)))) (car symlist)) ((null? (cdr symlist)) (set-cdr! symlist (make-symbol "foo" ()))) (else (f str (cdr symlist)))))
# == eliminate-when/unless  ==>
# (let ((symlist (symbols))) (cond ((string=? str (symbol->string (car (symlist)))) (car symlist)) ((null? (cdr symlist)) (set-cdr! symlist (make-symbol "foo" ()))) (else (f str (cdr symlist)))))
# == eliminate-cond  ==>
# (let ((symlist (symbols))) (if (string=? str (symbol->string (car (symlist)))) (car symlist) (if (null? (cdr symlist)) (set-cdr! symlist (make-symbol "foo" ())) (f str (cdr symlist)))))
# emit-scheme-entry
    .text
    .align 4,0x90
    .globl _L_scheme_entry
_L_scheme_entry:
    .data
    .globl symbols  # symbol list as a datum 
    .align 8
symbols:
    .int 0xFF       # to be patched
    .text
# emit-expr (cons (make-symbol "nil" ()) ())
# cons arg1=(make-symbol "nil" ()) arg2=()
# emit-expr (make-symbol "nil" ())
# make-symbol arg1="nil" arg2=()
# emit-expr "nil"
# string literal
    jmp _L_27
    .align 8,0x90
_L_26 :
    .int 12
    .ascii "nil"
_L_27:
    movl $_L_26, %eax
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
# emit-expr (let ((symlist (symbols))) (if (string=? str (symbol->string (car (symlist)))) (car symlist) (if (null? (cdr symlist)) (set-cdr! symlist (make-symbol "foo" ())) (f str (cdr symlist)))))
# emit-let
#  si   = -8
#  env  = ()
#  bindings = ((symlist (symbols)))
#  body = (if (string=? str (symbol->string (car (symlist)))) (car symlist) (if (null? (cdr symlist)) (set-cdr! symlist (make-symbol "foo" ())) (f str (cdr symlist))))
# emit-expr (symbols)
    movl symbols, %eax
    movl %eax, -8(%esp)  # stack save
# emit-expr (if (string=? str (symbol->string (car (symlist)))) (car symlist) (if (null? (cdr symlist)) (set-cdr! symlist (make-symbol "foo" ())) (f str (cdr symlist))))
# emit-expr (string=? str (symbol->string (car (symlist))))
# funcall
#    si   =-12
#    env  = ((symlist . -8))
#    expr = (funcall string=? str (symbol->string (car (symlist))))
# emit-expr string=?
