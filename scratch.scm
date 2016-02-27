
(let ((n 3))
  (let ((v0 (make-string n)))
    (let ((v1 (make-string (string-length v0))))
      (string-set! v0 (fx- (string-length v0) 3) #\a)
      (string-ref v0 0))))

# == explicit-begins  ==>
# (let ((n 3)) (let ((v0 (make-string n))) (let ((v1 (make-string (string-length v0)))) (begin (string-set! v0 (fx- (string-length v0) 3) #\a) (string-ref v0 0)))))
# == eliminate-let*  ==>
# (let ((n 3)) (let ((v0 (make-string n))) (let ((v1 (make-string (string-length v0)))) (begin (string-set! v0 (fx- (string-length v0) 3) #\a) (string-ref v0 0)))))
# == uniquify-variables  ==>
# (let ((f298 3)) (let ((f302 (make-string f298))) (let ((f304 (make-string (string-length f302)))) (begin (string-set! f302 (fx- (string-length f302) 3) #\a) (string-ref f302 0)))))
# == vectorize-letrec  ==>
# (let ((f298 3)) (let ((f302 (make-string f298))) (let ((f304 (make-string (string-length f302)))) (begin (string-set! f302 (fx- (string-length f302) 3) #\a) (string-ref f302 0)))))
# == eliminate-set!  ==>
# (let ((f298 3)) (let ((f302 (make-string f298))) (let ((f304 (make-string (string-length f302)))) (begin (string-set! f302 (fx- (string-length f302) 3) #\a) (string-ref f302 0)))))
# == close-free-variables  ==>
# (let ((f298 3)) (let ((f302 (make-string f298))) (let ((f304 (make-string (string-length f302)))) (begin (string-set! f302 (fx- (string-length f302) 3) #\a) (string-ref f302 0)))))
# == eliminate-quote  ==>
# (let ((f298 3)) (let ((f302 (make-string f298))) (let ((f304 (make-string (string-length f302)))) (begin (string-set! f302 (fx- (string-length f302) 3) #\a) (string-ref f302 0)))))
# == eliminate-when/unless  ==>
# (let ((f298 3)) (let ((f302 (make-string f298))) (let ((f304 (make-string (string-length f302)))) (begin (string-set! f302 (fx- (string-length f302) 3) #\a) (string-ref f302 0)))))
# == eliminate-cond  ==>
# (let ((f298 3)) (let ((f302 (make-string f298))) (let ((f304 (make-string (string-length f302)))) (begin (string-set! f302 (fx- (string-length f302) 3) #\a) (string-ref f302 0)))))

# == external-symbols  ==>

# (let ((f298 3))
    (let ((f302 (make-string f298)))
      (let ((f304 (make-string (string-length f302))))
	(begin
	  (string-set! f302 (fx- (string-length f302) 3) #\a)
	  (string-ref f302 0)))))

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
# emit-expr (let ((f298 3)) (let ((f302 (make-string f298))) (let ((f304 (make-string (string-length f302)))) (begin (string-set! f302 (fx- (string-length f302) 3) #\a) (string-ref f302 0)))))
# emit-let
#  si   = -8
#  env  = ()
#  bindings = ((f298 3))
#  body = (let ((f302 (make-string f298))) (let ((f304 (make-string (string-length f302)))) (begin (string-set! f302 (fx- (string-length f302) 3) #\a) (string-ref f302 0))))
# emit-expr 3
    movl $12, %eax     # immed 3
    movl %eax, -8(%esp)  # stack save
# emit-expr (let ((f302 (make-string f298))) (let ((f304 (make-string (string-length f302)))) (begin (string-set! f302 (fx- (string-length f302) 3) #\a) (string-ref f302 0))))
# emit-let
#  si   = -12
#  env  = ((f298 . -8))
#  bindings = ((f302 (make-string f298)))
#  body = (let ((f304 (make-string (string-length f302)))) (begin (string-set! f302 (fx- (string-length f302) 3) #\a) (string-ref f302 0)))
# emit-expr (make-string f298)
# make-string len=f298
# emit-expr f298
# emit-variable-ref
# env=((f298 . -8))
# var=f298
    movl -8(%esp), %eax  # stack load f298
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1716"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1716:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_1717
# invoke error handler eh_length
    .extern mrc_eh$ulength
    movl mrc_eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1717:
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
# emit-expr (let ((f304 (make-string (string-length f302)))) (begin (string-set! f302 (fx- (string-length f302) 3) #\a) (string-ref f302 0)))
# emit-let
#  si   = -16
#  env  = ((f302 . -12) (f298 . -8))
#  bindings = ((f304 (make-string (string-length f302))))
#  body = (begin (string-set! f302 (fx- (string-length f302) 3) #\a) (string-ref f302 0))
# emit-expr (make-string (string-length f302))
# make-string len=(string-length f302)
# emit-expr (string-length f302)
# emit-expr f302
# emit-variable-ref
# env=((f302 . -12) (f298 . -8))
# var=f302
    movl -12(%esp), %eax  # stack load f302
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_1718
# invoke error handler eh_string
    .extern mrc_eh$ustring
    movl mrc_eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $160,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1718:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1719"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1719:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_1720
# invoke error handler eh_length
    .extern mrc_eh$ulength
    movl mrc_eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1720:
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
    movl %eax, -16(%esp)  # stack save
# emit-expr (begin (string-set! f302 (fx- (string-length f302) 3) #\a) (string-ref f302 0))
# emit-begin
#   expr=(begin (string-set! f302 (fx- (string-length f302) 3) #\a) (string-ref f302 0))
#   env=((f304 . -16) (f302 . -12) (f298 . -8))
# emit-expr (string-set! f302 (fx- (string-length f302) 3) #\a)
# emit-expr f302
# emit-variable-ref
# env=((f304 . -16) (f302 . -12) (f298 . -8))
# var=f302
    movl -12(%esp), %eax  # stack load f302
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_1721
# invoke error handler eh_string
    .extern mrc_eh$ustring
    movl mrc_eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $168,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1721:
    movl %eax, -20(%esp)
# emit-expr (fx- (string-length f302) 3)
# emit-expr 3
    movl $12, %eax     # immed 3
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1722"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $92,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1722:
    movl %eax, -20(%esp)
# emit-expr (string-length f302)
# emit-expr f302
# emit-variable-ref
# env=((f304 . -16) (f302 . -12) (f298 . -8))
# var=f302
    movl -12(%esp), %eax  # stack load f302
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_1723
# invoke error handler eh_string
    .extern mrc_eh$ustring
    movl mrc_eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $160,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1723:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1724"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $92,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1724:
    subl -20(%esp), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1725"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $168,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1725:
# check bounds on string index
    movl -20(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_1727
    cmp  $0,%eax
    jge _L_1726
_L_1727:
# invoke error handler eh_string_index
    .extern mrc_eh$ustring$uindex
    movl mrc_eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $168,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1726:
    movl %eax, -24(%esp)
# emit-expr #\a
    movl $24847, %eax     # immed #\a
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_1728"
# invoke error handler eh_character
    .extern mrc_eh$ucharacter
    movl mrc_eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $168,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1728:
    movl -20(%esp), %ebx
    movl -24(%esp), %esi
    sar $2, %esi
    movb  %ah, -2(%ebx,%esi)
# emit-expr (begin (string-ref f302 0))
# emit-begin
#   expr=(begin (string-ref f302 0))
#   env=((f304 . -16) (f302 . -12) (f298 . -8))
# emit-expr (string-ref f302 0)
# emit-expr f302
# emit-variable-ref
# env=((f304 . -16) (f302 . -12) (f298 . -8))
# var=f302
    movl -12(%esp), %eax  # stack load f302
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_1729
# invoke error handler eh_string
    .extern mrc_eh$ustring
    movl mrc_eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $164,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1729:
    movl %eax, -20(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_1730"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $164,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_1730:
# check bounds on string index
    movl -20(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_1732
    cmp  $0,%eax
    jge _L_1731
_L_1732:
# invoke error handler eh_string_index
    .extern mrc_eh$ustring$uindex
    movl mrc_eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $164,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_1731:
    sar $2, %eax
    movl -20(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f304 . -16) (f302 . -12) (f298 . -8))
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
