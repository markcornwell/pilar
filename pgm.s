# -536870912
# == annotate ==>
# -536870912
# == transform ==>

# (codes () -536870912)

# emit-codes expr=(codes () -536870912)
#  bindings=()
#  lvars=()
#  codes=()
#  labels=()
#  env=()
#  ---- >>>>> emit-codes start ----
#  ---- <<<<< emit-codes end ------
    .text
    .align 4,0x90
    .globl _L_scheme_entry
_L_scheme_entry:
    movl $-2147483648, %eax     # immed -536870912
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
