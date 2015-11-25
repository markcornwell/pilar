# (procedure? (lambda (x) x))
# == annotate ==>
# (procedure? (closure (x) () x))
# == transform ==>

# (procedure? (closure (x) () x))

    .text
    .align 4,0x90
    .globl _L_scheme_entry
_L_scheme_entry:
