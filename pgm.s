    .text
    .align 4,0x90
    .globl "_scheme_entry"
"_scheme_entry":
     movl $0, %eax
    and $3, %al
    cmp $0, %al
    sete %al
    movzbl %al, %eax
    sal $64, %al
    or $47, %al
    ret
