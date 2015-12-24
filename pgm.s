# (symbol? (quote foo))
# == eliminate-multi-element-body  ==>
# (symbol? (quote foo))
# == eliminate-let*  ==>
# (symbol? (quote foo))
# == eliminate-shadowing  ==>
# (symbol? (quote foo))
# == vectorize-letrec  ==>
# (symbol? (quote foo))
# == eliminate-set!  ==>
# (symbol? (quote foo))
# == close-free-variables  ==>
# (symbol? (quote foo))
# == eliminate-quote  ==>
# (symbol? (string->symbol "foo"))
# == eliminate-when/unless  ==>
# (symbol? (string->symbol "foo"))
# == eliminate-cond  ==>
# (symbol? (string->symbol "foo"))
# emit-scheme-entry
    .text
    .align 4,0x90
    .globl _L_scheme_entry
_L_scheme_entry:
          .data
          .globl symbols  # symbol list as a datum 
          .globl sym2str
          .align 8
symbols:
          .int 0xFF  # holds (symbols)
sym2str:
          .int 0xFF  # to be patched
          .text
# emit-expr (cons (make-symbol "nil" ()) ())
# cons arg1=(make-symbol "nil" ()) arg2=()
# emit-expr (make-symbol "nil" ())
# make-symbol arg1="nil" arg2=()
# emit-expr "nil"
# string literal
    jmp _L_127
    .align 8,0x90
_L_126 :
    .int 12
    .ascii "nil"
_L_127:
    movl $_L_126, %eax
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
# emit-expr (symbol? (string->symbol "foo"))
# emit-expr (string->symbol "foo")
# funcall
#    si   =-8
#    env  = ()
#    expr = (funcall string->symbol "foo")
# emit-expr string->symbol
