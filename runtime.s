	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 10
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
## BB#0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	subl	$160, %esp
	calll	L0$pb
L0$pb:
	popl	%eax
	movl	12(%ebp), %ecx
	movl	8(%ebp), %edx
	movl	L_dump_enabled$non_lazy_ptr-L0$pb(%eax), %esi
	movl	$0, -12(%ebp)
	movl	%edx, -16(%ebp)
	movl	%ecx, -20(%ebp)
	movl	$0, (%esi)
	movl	$0, -24(%ebp)
	movl	%eax, -88(%ebp)         ## 4-byte Spill
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	-24(%ebp), %eax
	cmpl	-16(%ebp), %eax
	jge	LBB0_6
## BB#2:                                ##   in Loop: Header=BB0_1 Depth=1
	movl	-24(%ebp), %eax
	movl	-20(%ebp), %ecx
	movl	(%ecx,%eax,4), %eax
	movl	-88(%ebp), %ecx         ## 4-byte Reload
	leal	L_.str-L0$pb(%ecx), %edx
	movl	%esp, %esi
	movl	%edx, 4(%esi)
	movl	%eax, (%esi)
	calll	_strcmp
	cmpl	$0, %eax
	jne	LBB0_4
## BB#3:                                ##   in Loop: Header=BB0_1 Depth=1
	movl	-88(%ebp), %eax         ## 4-byte Reload
	movl	L_dump_enabled$non_lazy_ptr-L0$pb(%eax), %ecx
	movl	$1, (%ecx)
LBB0_4:                                 ##   in Loop: Header=BB0_1 Depth=1
	jmp	LBB0_5
LBB0_5:                                 ##   in Loop: Header=BB0_1 Depth=1
	movl	-24(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -24(%ebp)
	jmp	LBB0_1
LBB0_6:
	movl	$65536, -28(%ebp)       ## imm = 0x10000
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	calll	_allocate_protected_space
	movl	%eax, -32(%ebp)
	movl	-32(%ebp), %eax
	addl	-28(%ebp), %eax
	movl	%eax, -36(%ebp)
	movl	$524288, -40(%ebp)      ## imm = 0x80000
	movl	-40(%ebp), %eax
	movl	%eax, (%esp)
	calll	_allocate_protected_space
	movl	-88(%ebp), %ecx         ## 4-byte Reload
	movl	L_dump_enabled$non_lazy_ptr-L0$pb(%ecx), %edx
	movl	%eax, -44(%ebp)
	cmpl	$0, (%edx)
	je	LBB0_8
## BB#7:
	movl	-88(%ebp), %eax         ## 4-byte Reload
	leal	L_.str1-L0$pb(%eax), %ecx
	movl	L___stderrp$non_lazy_ptr-L0$pb(%eax), %edx
	movl	(%edx), %edx
	movl	-44(%ebp), %esi
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%esi, 8(%esp)
	calll	_fprintf
	movl	-88(%ebp), %ecx         ## 4-byte Reload
	leal	L_.str2-L0$pb(%ecx), %edx
	movl	L___stderrp$non_lazy_ptr-L0$pb(%ecx), %esi
	movl	(%esi), %esi
	movl	-32(%ebp), %edi
	movl	%esi, (%esp)
	movl	%edx, 4(%esp)
	movl	%edi, 8(%esp)
	movl	%eax, -92(%ebp)         ## 4-byte Spill
	calll	_fprintf
	movl	-88(%ebp), %ecx         ## 4-byte Reload
	leal	L_.str3-L0$pb(%ecx), %edx
	movl	L___stderrp$non_lazy_ptr-L0$pb(%ecx), %esi
	movl	(%esi), %esi
	movl	-36(%ebp), %edi
	movl	%esi, (%esp)
	movl	%edx, 4(%esp)
	movl	%edi, 8(%esp)
	movl	%eax, -96(%ebp)         ## 4-byte Spill
	calll	_fprintf
	movl	%eax, -100(%ebp)        ## 4-byte Spill
LBB0_8:
	leal	-80(%ebp), %eax
	movl	-36(%ebp), %ecx
	movl	-44(%ebp), %edx
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	movl	%edx, 8(%esp)
	calll	_scheme_entry
	movl	%eax, -84(%ebp)
	movl	-84(%ebp), %eax
	movl	%eax, (%esp)
	calll	_print_ptr
	movl	-88(%ebp), %eax         ## 4-byte Reload
	leal	L_.str4-L0$pb(%eax), %ecx
	movl	%ecx, (%esp)
	calll	_printf
	movl	-88(%ebp), %ecx         ## 4-byte Reload
	movl	L_dump_enabled$non_lazy_ptr-L0$pb(%ecx), %edx
	cmpl	$0, (%edx)
	movl	%eax, -104(%ebp)        ## 4-byte Spill
	je	LBB0_10
## BB#9:
	movl	$10, %eax
	movl	-44(%ebp), %ecx
	movl	%ecx, (%esp)
	movl	$10, 4(%esp)
	movl	%eax, -108(%ebp)        ## 4-byte Spill
	calll	_dump
	movl	-88(%ebp), %eax         ## 4-byte Reload
	leal	L_.str5-L0$pb(%eax), %ecx
	movl	L___stderrp$non_lazy_ptr-L0$pb(%eax), %edx
	movl	(%edx), %edx
	movl	-84(%ebp), %esi
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%esi, 8(%esp)
	calll	_fprintf
	movl	-88(%ebp), %ecx         ## 4-byte Reload
	leal	L_.str6-L0$pb(%ecx), %edx
	movl	$4, %esi
	movl	L___stderrp$non_lazy_ptr-L0$pb(%ecx), %edi
	movl	(%edi), %edi
	movl	%edi, (%esp)
	movl	%edx, 4(%esp)
	movl	$4, 8(%esp)
	movl	%eax, -112(%ebp)        ## 4-byte Spill
	movl	%esi, -116(%ebp)        ## 4-byte Spill
	calll	_fprintf
	movl	-88(%ebp), %ecx         ## 4-byte Reload
	leal	L_.str7-L0$pb(%ecx), %edx
	movl	$4, %esi
	movl	L___stderrp$non_lazy_ptr-L0$pb(%ecx), %edi
	movl	(%edi), %edi
	movl	%edi, (%esp)
	movl	%edx, 4(%esp)
	movl	$4, 8(%esp)
	movl	%eax, -120(%ebp)        ## 4-byte Spill
	movl	%esi, -124(%ebp)        ## 4-byte Spill
	calll	_fprintf
	movl	-88(%ebp), %ecx         ## 4-byte Reload
	leal	L_.str8-L0$pb(%ecx), %edx
	movl	$4, %esi
	movl	L___stderrp$non_lazy_ptr-L0$pb(%ecx), %edi
	movl	(%edi), %edi
	movl	%edi, (%esp)
	movl	%edx, 4(%esp)
	movl	$4, 8(%esp)
	movl	%eax, -128(%ebp)        ## 4-byte Spill
	movl	%esi, -132(%ebp)        ## 4-byte Spill
	calll	_fprintf
	movl	-88(%ebp), %ecx         ## 4-byte Reload
	leal	L_.str9-L0$pb(%ecx), %edx
	movl	$4, %esi
	movl	L___stderrp$non_lazy_ptr-L0$pb(%ecx), %edi
	movl	(%edi), %edi
	movl	%edi, (%esp)
	movl	%edx, 4(%esp)
	movl	$4, 8(%esp)
	movl	%eax, -136(%ebp)        ## 4-byte Spill
	movl	%esi, -140(%ebp)        ## 4-byte Spill
	calll	_fprintf
	movl	-88(%ebp), %ecx         ## 4-byte Reload
	leal	L_.str10-L0$pb(%ecx), %edx
	movl	$4, %esi
	movl	L___stderrp$non_lazy_ptr-L0$pb(%ecx), %edi
	movl	(%edi), %edi
	movl	%edi, (%esp)
	movl	%edx, 4(%esp)
	movl	$4, 8(%esp)
	movl	%eax, -144(%ebp)        ## 4-byte Spill
	movl	%esi, -148(%ebp)        ## 4-byte Spill
	calll	_fprintf
	movl	%eax, -152(%ebp)        ## 4-byte Spill
LBB0_10:
	movl	-32(%ebp), %eax
	movl	-28(%ebp), %ecx
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	calll	_deallocate_protected_space
	movl	-44(%ebp), %eax
	movl	-40(%ebp), %ecx
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	calll	_deallocate_protected_space
	xorl	%eax, %eax
	addl	$160, %esp
	popl	%esi
	popl	%edi
	popl	%ebp
	retl

	.align	4, 0x90
_allocate_protected_space:              ## @allocate_protected_space
## BB#0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	subl	$96, %esp
	calll	L1$pb
L1$pb:
	popl	%eax
	movl	8(%ebp), %ecx
	movl	%ecx, -12(%ebp)
	movl	%eax, -32(%ebp)         ## 4-byte Spill
	calll	_getpagesize
	xorl	%ecx, %ecx
	movl	$3, %edx
	movl	$4098, %esi             ## imm = 0x1002
	movl	%eax, -16(%ebp)
	movl	-12(%ebp), %eax
	addl	-16(%ebp), %eax
	subl	$1, %eax
	movl	%edx, -36(%ebp)         ## 4-byte Spill
	cltd
	idivl	-16(%ebp)
	imull	-16(%ebp), %eax
	movl	%eax, -24(%ebp)
	movl	-24(%ebp), %eax
	movl	-16(%ebp), %edi
	shll	$1, %edi
	addl	%edi, %eax
	movl	%esp, %edi
	movl	%eax, 4(%edi)
	movl	$0, 24(%edi)
	movl	$0, 20(%edi)
	movl	$0, 16(%edi)
	movl	$4098, 12(%edi)         ## imm = 0x1002
	movl	$3, 8(%edi)
	movl	$0, (%edi)
	movl	%esi, -40(%ebp)         ## 4-byte Spill
	movl	%ecx, -44(%ebp)         ## 4-byte Spill
	calll	_mmap$UNIX2003
	movl	$4294967295, %ecx       ## imm = 0xFFFFFFFF
	movl	%eax, -28(%ebp)
	cmpl	%ecx, -28(%ebp)
	jne	LBB1_2
## BB#1:
	movl	-32(%ebp), %eax         ## 4-byte Reload
	leal	L_.str13-L1$pb(%eax), %ecx
	movl	%ecx, (%esp)
	calll	_printf
	movl	$4294967295, %ecx       ## imm = 0xFFFFFFFF
	movl	$-1, (%esp)
	movl	%eax, -48(%ebp)         ## 4-byte Spill
	movl	%ecx, -52(%ebp)         ## 4-byte Spill
	calll	_exit
LBB1_2:
	xorl	%eax, %eax
	movl	-28(%ebp), %ecx
	movl	-16(%ebp), %edx
	movl	%ecx, (%esp)
	movl	%edx, 4(%esp)
	movl	$0, 8(%esp)
	movl	%eax, -56(%ebp)         ## 4-byte Spill
	calll	_mprotect$UNIX2003
	movl	%eax, -20(%ebp)
	cmpl	$0, -20(%ebp)
	je	LBB1_4
## BB#3:
	movl	-32(%ebp), %eax         ## 4-byte Reload
	leal	L_.str14-L1$pb(%eax), %ecx
	movl	%ecx, (%esp)
	calll	_printf
	movl	$4294967294, %ecx       ## imm = 0xFFFFFFFE
	movl	$-2, (%esp)
	movl	%eax, -60(%ebp)         ## 4-byte Spill
	movl	%ecx, -64(%ebp)         ## 4-byte Spill
	calll	_exit
LBB1_4:
	xorl	%eax, %eax
	movl	-28(%ebp), %ecx
	addl	-16(%ebp), %ecx
	addl	-24(%ebp), %ecx
	movl	-16(%ebp), %edx
	movl	%ecx, (%esp)
	movl	%edx, 4(%esp)
	movl	$0, 8(%esp)
	movl	%eax, -68(%ebp)         ## 4-byte Spill
	calll	_mprotect$UNIX2003
	movl	%eax, -20(%ebp)
	cmpl	$0, -20(%ebp)
	je	LBB1_6
## BB#5:
	movl	-32(%ebp), %eax         ## 4-byte Reload
	leal	L_.str15-L1$pb(%eax), %ecx
	movl	%ecx, (%esp)
	calll	_printf
	movl	$4294967293, %ecx       ## imm = 0xFFFFFFFD
	movl	$-3, (%esp)
	movl	%eax, -72(%ebp)         ## 4-byte Spill
	movl	%ecx, -76(%ebp)         ## 4-byte Spill
	calll	_exit
LBB1_6:
	movl	-28(%ebp), %eax
	addl	-16(%ebp), %eax
	addl	$96, %esp
	popl	%esi
	popl	%edi
	popl	%ebp
	retl

	.align	4, 0x90
_print_ptr:                             ## @print_ptr
## BB#0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	subl	$100, %esp
	calll	L2$pb
L2$pb:
	popl	%eax
	movl	8(%ebp), %ecx
	leal	L_.str16-L2$pb(%eax), %edx
	movl	L___stderrp$non_lazy_ptr-L2$pb(%eax), %esi
	movl	%ecx, -8(%ebp)
	movl	(%esi), %ecx
	movl	-8(%ebp), %esi
	movl	%ecx, (%esp)
	movl	%edx, 4(%esp)
	movl	%esi, 8(%esp)
	movl	%eax, -12(%ebp)         ## 4-byte Spill
	calll	_fprintf
	movl	-8(%ebp), %ecx
	andl	$3, %ecx
	cmpl	$0, %ecx
	movl	%eax, -16(%ebp)         ## 4-byte Spill
	jne	LBB2_2
## BB#1:
	movl	-12(%ebp), %eax         ## 4-byte Reload
	leal	L_.str17-L2$pb(%eax), %ecx
	movl	-8(%ebp), %edx
	sarl	$2, %edx
	movl	%ecx, (%esp)
	movl	%edx, 4(%esp)
	calll	_printf
	movl	%eax, -20(%ebp)         ## 4-byte Spill
	jmp	LBB2_39
LBB2_2:
	movl	-8(%ebp), %eax
	andl	$7, %eax
	cmpl	$3, %eax
	jne	LBB2_4
## BB#3:
	movl	-8(%ebp), %eax
	subl	$3, %eax
	movl	%eax, (%esp)
	calll	_print_symbol
	jmp	LBB2_38
LBB2_4:
	movl	-8(%ebp), %eax
	andl	$255, %eax
	cmpl	$15, %eax
	jne	LBB2_18
## BB#5:
	movl	-8(%ebp), %eax
	sarl	$8, %eax
	cmpl	$9, %eax
	jne	LBB2_7
## BB#6:
	movl	-12(%ebp), %eax         ## 4-byte Reload
	leal	L_.str18-L2$pb(%eax), %ecx
	movl	%ecx, (%esp)
	calll	_printf
	movl	%eax, -24(%ebp)         ## 4-byte Spill
	jmp	LBB2_17
LBB2_7:
	movl	-8(%ebp), %eax
	sarl	$8, %eax
	cmpl	$10, %eax
	jne	LBB2_9
## BB#8:
	movl	-12(%ebp), %eax         ## 4-byte Reload
	leal	L_.str19-L2$pb(%eax), %ecx
	movl	%ecx, (%esp)
	calll	_printf
	movl	%eax, -28(%ebp)         ## 4-byte Spill
	jmp	LBB2_16
LBB2_9:
	movl	-8(%ebp), %eax
	sarl	$8, %eax
	cmpl	$13, %eax
	jne	LBB2_11
## BB#10:
	movl	-12(%ebp), %eax         ## 4-byte Reload
	leal	L_.str20-L2$pb(%eax), %ecx
	movl	%ecx, (%esp)
	calll	_printf
	movl	%eax, -32(%ebp)         ## 4-byte Spill
	jmp	LBB2_15
LBB2_11:
	movl	-8(%ebp), %eax
	sarl	$8, %eax
	cmpl	$32, %eax
	jne	LBB2_13
## BB#12:
	movl	-12(%ebp), %eax         ## 4-byte Reload
	leal	L_.str21-L2$pb(%eax), %ecx
	movl	%ecx, (%esp)
	calll	_printf
	movl	%eax, -36(%ebp)         ## 4-byte Spill
	jmp	LBB2_14
LBB2_13:
	movl	-12(%ebp), %eax         ## 4-byte Reload
	leal	L_.str22-L2$pb(%eax), %ecx
	movl	-8(%ebp), %edx
	sarl	$8, %edx
	movl	%ecx, (%esp)
	movl	%edx, 4(%esp)
	calll	_printf
	movl	%eax, -40(%ebp)         ## 4-byte Spill
LBB2_14:
	jmp	LBB2_15
LBB2_15:
	jmp	LBB2_16
LBB2_16:
	jmp	LBB2_17
LBB2_17:
	jmp	LBB2_37
LBB2_18:
	movl	-8(%ebp), %eax
	andl	$7, %eax
	cmpl	$6, %eax
	jne	LBB2_20
## BB#19:
	movl	-12(%ebp), %eax         ## 4-byte Reload
	leal	L_.str23-L2$pb(%eax), %ecx
	movl	%ecx, (%esp)
	calll	_printf
	movl	-8(%ebp), %ecx
	subl	$6, %ecx
	movl	%ecx, (%esp)
	movl	%eax, -44(%ebp)         ## 4-byte Spill
	calll	_print_string
	movl	-12(%ebp), %eax         ## 4-byte Reload
	leal	L_.str23-L2$pb(%eax), %ecx
	movl	%ecx, (%esp)
	calll	_printf
	movl	%eax, -48(%ebp)         ## 4-byte Spill
	jmp	LBB2_36
LBB2_20:
	movl	-8(%ebp), %eax
	andl	$7, %eax
	cmpl	$5, %eax
	jne	LBB2_22
## BB#21:
	movl	-12(%ebp), %eax         ## 4-byte Reload
	leal	L_.str24-L2$pb(%eax), %ecx
	movl	%ecx, (%esp)
	calll	_printf
	movl	-8(%ebp), %ecx
	subl	$5, %ecx
	movl	%ecx, (%esp)
	movl	%eax, -52(%ebp)         ## 4-byte Spill
	calll	_print_vector
	movl	-12(%ebp), %eax         ## 4-byte Reload
	leal	L_.str25-L2$pb(%eax), %ecx
	movl	%ecx, (%esp)
	calll	_printf
	movl	%eax, -56(%ebp)         ## 4-byte Spill
	jmp	LBB2_35
LBB2_22:
	movl	-8(%ebp), %eax
	andl	$7, %eax
	cmpl	$1, %eax
	jne	LBB2_24
## BB#23:
	movl	-12(%ebp), %eax         ## 4-byte Reload
	leal	L_.str26-L2$pb(%eax), %ecx
	movl	%ecx, (%esp)
	calll	_printf
	movl	-8(%ebp), %ecx
	subl	$1, %ecx
	movl	%ecx, (%esp)
	movl	%eax, -60(%ebp)         ## 4-byte Spill
	calll	_print_pairs
	movl	-12(%ebp), %eax         ## 4-byte Reload
	leal	L_.str25-L2$pb(%eax), %ecx
	movl	%ecx, (%esp)
	calll	_printf
	movl	%eax, -64(%ebp)         ## 4-byte Spill
	jmp	LBB2_34
LBB2_24:
	cmpl	$47, -8(%ebp)
	jne	LBB2_26
## BB#25:
	movl	-12(%ebp), %eax         ## 4-byte Reload
	leal	L_.str27-L2$pb(%eax), %ecx
	movl	%ecx, (%esp)
	calll	_printf
	movl	%eax, -68(%ebp)         ## 4-byte Spill
	jmp	LBB2_33
LBB2_26:
	cmpl	$111, -8(%ebp)
	jne	LBB2_28
## BB#27:
	movl	-12(%ebp), %eax         ## 4-byte Reload
	leal	L_.str28-L2$pb(%eax), %ecx
	movl	%ecx, (%esp)
	calll	_printf
	movl	%eax, -72(%ebp)         ## 4-byte Spill
	jmp	LBB2_32
LBB2_28:
	cmpl	$63, -8(%ebp)
	jne	LBB2_30
## BB#29:
	movl	-12(%ebp), %eax         ## 4-byte Reload
	leal	L_.str29-L2$pb(%eax), %ecx
	movl	%ecx, (%esp)
	calll	_printf
	movl	%eax, -76(%ebp)         ## 4-byte Spill
	jmp	LBB2_31
LBB2_30:
	movl	-12(%ebp), %eax         ## 4-byte Reload
	leal	L_.str30-L2$pb(%eax), %ecx
	movl	-8(%ebp), %edx
	movl	%ecx, (%esp)
	movl	%edx, 4(%esp)
	calll	_printf
	movl	%eax, -80(%ebp)         ## 4-byte Spill
LBB2_31:
	jmp	LBB2_32
LBB2_32:
	jmp	LBB2_33
LBB2_33:
	jmp	LBB2_34
LBB2_34:
	jmp	LBB2_35
LBB2_35:
	jmp	LBB2_36
LBB2_36:
	jmp	LBB2_37
LBB2_37:
	jmp	LBB2_38
LBB2_38:
	jmp	LBB2_39
LBB2_39:
	addl	$100, %esp
	popl	%esi
	popl	%ebp
	retl

	.align	4, 0x90
_dump:                                  ## @dump
## BB#0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$60, %esp
	calll	L3$pb
L3$pb:
	popl	%eax
	movl	12(%ebp), %ecx
	movl	8(%ebp), %edx
	movl	%edx, -16(%ebp)
	movl	%ecx, -20(%ebp)
	movl	%eax, -24(%ebp)         ## 4-byte Spill
LBB3_1:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$0, -20(%ebp)
	jle	LBB3_3
## BB#2:                                ##   in Loop: Header=BB3_1 Depth=1
	movl	-24(%ebp), %eax         ## 4-byte Reload
	leal	L_.str40-L3$pb(%eax), %ecx
	movl	L___stderrp$non_lazy_ptr-L3$pb(%eax), %edx
	movl	(%edx), %edx
	movl	-16(%ebp), %esi
	movl	-16(%ebp), %edi
	movsbl	3(%edi), %edi
	movl	-16(%ebp), %ebx
	movsbl	2(%ebx), %ebx
	movl	-16(%ebp), %eax
	movsbl	1(%eax), %eax
	movl	%eax, -28(%ebp)         ## 4-byte Spill
	movl	-16(%ebp), %eax
	movsbl	(%eax), %eax
	movl	%eax, -32(%ebp)         ## 4-byte Spill
	movl	-16(%ebp), %eax
	movsbl	(%eax), %eax
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%esi, 8(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 16(%esp)
	movl	-28(%ebp), %ecx         ## 4-byte Reload
	movl	%ecx, 20(%esp)
	movl	-32(%ebp), %ecx         ## 4-byte Reload
	movl	%ecx, 24(%esp)
	movl	%eax, 28(%esp)
	calll	_fprintf
	movl	-20(%ebp), %ecx
	addl	$4294967295, %ecx       ## imm = 0xFFFFFFFF
	movl	%ecx, -20(%ebp)
	movl	-16(%ebp), %ecx
	addl	$4, %ecx
	movl	%ecx, -16(%ebp)
	movl	%eax, -36(%ebp)         ## 4-byte Spill
	jmp	LBB3_1
LBB3_3:
	addl	$60, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl

	.align	4, 0x90
_deallocate_protected_space:            ## @deallocate_protected_space
## BB#0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	subl	$36, %esp
	calll	L4$pb
L4$pb:
	popl	%eax
	movl	12(%ebp), %ecx
	movl	8(%ebp), %edx
	movl	%edx, -8(%ebp)
	movl	%ecx, -12(%ebp)
	movl	%eax, -28(%ebp)         ## 4-byte Spill
	calll	_getpagesize
	xorl	%ecx, %ecx
	movl	%eax, -16(%ebp)
	movl	-12(%ebp), %eax
	addl	-16(%ebp), %eax
	subl	$1, %eax
	cltd
	idivl	-16(%ebp)
	imull	-16(%ebp), %eax
	movl	%eax, -24(%ebp)
	movl	-8(%ebp), %eax
	subl	-16(%ebp), %ecx
	addl	%ecx, %eax
	movl	-24(%ebp), %ecx
	movl	-16(%ebp), %esi
	shll	$1, %esi
	addl	%esi, %ecx
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	calll	_munmap$UNIX2003
	movl	%eax, -20(%ebp)
	cmpl	$0, -20(%ebp)
	je	LBB4_2
## BB#1:
	movl	-28(%ebp), %eax         ## 4-byte Reload
	leal	L_.str41-L4$pb(%eax), %ecx
	movl	%ecx, (%esp)
	calll	_printf
	movl	%eax, -32(%ebp)         ## 4-byte Spill
LBB4_2:
	addl	$36, %esp
	popl	%esi
	popl	%ebp
	retl

	.globl	_unshift
	.align	4, 0x90
_unshift:                               ## @unshift
## BB#0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	calll	L5$pb
L5$pb:
	popl	%eax
	movl	8(%ebp), %ecx
	movl	%ecx, -4(%ebp)
	movl	-4(%ebp), %ecx
	andl	$3, %ecx
	cmpl	$0, %ecx
	movl	%eax, -8(%ebp)          ## 4-byte Spill
	jne	LBB5_2
## BB#1:
	movl	-4(%ebp), %eax
	sarl	$2, %eax
	addl	$24, %esp
	popl	%ebp
	retl
LBB5_2:
	movl	-8(%ebp), %eax          ## 4-byte Reload
	leal	L_.str11-L5$pb(%eax), %ecx
	movl	%ecx, (%esp)
	calll	_printf
	movl	$4294967292, %ecx       ## imm = 0xFFFFFFFC
	movl	$-4, (%esp)
	movl	%eax, -12(%ebp)         ## 4-byte Spill
	movl	%ecx, -16(%ebp)         ## 4-byte Spill
	calll	_exit

	.globl	_shift
	.align	4, 0x90
_shift:                                 ## @shift
## BB#0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%eax
	movl	8(%ebp), %eax
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	shll	$2, %eax
	addl	$4, %esp
	popl	%ebp
	retl

	.globl	_string_data
	.align	4, 0x90
_string_data:                           ## @string_data
## BB#0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	subl	$6, %eax
	movl	%eax, -8(%ebp)
	movl	-8(%ebp), %eax
	addl	$4, %eax
	addl	$8, %esp
	popl	%ebp
	retl

	.globl	_s_nop
	.align	4, 0x90
_s_nop:                                 ## @s_nop
## BB#0:
	pushl	%ebp
	movl	%esp, %ebp
	popl	%ebp
	retl

	.globl	_s_42
	.align	4, 0x90
_s_42:                                  ## @s_42
## BB#0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	$42, %eax
	movl	$42, (%esp)
	movl	%eax, -4(%ebp)          ## 4-byte Spill
	calll	_shift
	addl	$8, %esp
	popl	%ebp
	retl

	.globl	_s_true
	.align	4, 0x90
_s_true:                                ## @s_true
## BB#0:
	pushl	%ebp
	movl	%esp, %ebp
	movl	$111, %eax
	popl	%ebp
	retl

	.globl	_s_false
	.align	4, 0x90
_s_false:                               ## @s_false
## BB#0:
	pushl	%ebp
	movl	%esp, %ebp
	movl	$47, %eax
	popl	%ebp
	retl

	.globl	_s_once
	.align	4, 0x90
_s_once:                                ## @s_once
## BB#0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%eax
	movl	8(%ebp), %eax
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	addl	$4, %esp
	popl	%ebp
	retl

	.globl	_s_twice
	.align	4, 0x90
_s_twice:                               ## @s_twice
## BB#0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%eax
	movl	8(%ebp), %eax
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	shll	$1, %eax
	addl	$4, %esp
	popl	%ebp
	retl

	.globl	_s_write
	.align	4, 0x90
_s_write:                               ## @s_write
## BB#0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	subl	$52, %esp
	calll	L14$pb
L14$pb:
	popl	%eax
	movl	16(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	8(%ebp), %esi
	leal	L_.str12-L14$pb(%eax), %eax
	movl	%esi, -8(%ebp)
	movl	%edx, -12(%ebp)
	movl	%ecx, -16(%ebp)
	movl	%eax, (%esp)
	calll	_printf
	movl	-8(%ebp), %ecx
	movl	%ecx, (%esp)
	movl	%eax, -24(%ebp)         ## 4-byte Spill
	calll	_unshift
	movl	-12(%ebp), %ecx
	movl	%ecx, (%esp)
	movl	%eax, -28(%ebp)         ## 4-byte Spill
	calll	_string_data
	movl	-16(%ebp), %ecx
	movl	%ecx, (%esp)
	movl	%eax, -32(%ebp)         ## 4-byte Spill
	calll	_unshift
	movl	-28(%ebp), %ecx         ## 4-byte Reload
	movl	%ecx, (%esp)
	movl	-32(%ebp), %ecx         ## 4-byte Reload
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_write$UNIX2003
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	calll	_shift
	addl	$52, %esp
	popl	%esi
	popl	%ebp
	retl

	.align	4, 0x90
_print_symbol:                          ## @print_symbol
## BB#0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	movl	(%eax), %eax
	subl	$6, %eax
	movl	%eax, -8(%ebp)
	movl	-8(%ebp), %eax
	movl	%eax, (%esp)
	calll	_print_string
	addl	$24, %esp
	popl	%ebp
	retl

	.align	4, 0x90
_print_string:                          ## @print_string
## BB#0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	subl	$52, %esp
	calll	L16$pb
L16$pb:
	popl	%eax
	movl	8(%ebp), %ecx
	leal	L_.str31-L16$pb(%eax), %edx
	movl	L___stderrp$non_lazy_ptr-L16$pb(%eax), %esi
	movl	%ecx, -8(%ebp)
	movl	(%esi), %ecx
	movl	-8(%ebp), %esi
	movl	%ecx, (%esp)
	movl	%edx, 4(%esp)
	movl	%esi, 8(%esp)
	movl	%eax, -20(%ebp)         ## 4-byte Spill
	calll	_fprintf
	movl	-8(%ebp), %ecx
	andl	$4294967292, %ecx       ## imm = 0xFFFFFFFC
	movl	-8(%ebp), %edx
	cmpl	%edx, %ecx
	movl	%eax, -24(%ebp)         ## 4-byte Spill
	je	LBB16_2
## BB#1:
	movl	-20(%ebp), %eax         ## 4-byte Reload
	leal	L_.str32-L16$pb(%eax), %ecx
	movl	-8(%ebp), %edx
	movl	%ecx, (%esp)
	movl	%edx, 4(%esp)
	calll	_printf
	movl	$4294967295, %ecx       ## imm = 0xFFFFFFFF
	movl	$-1, (%esp)
	movl	%eax, -28(%ebp)         ## 4-byte Spill
	movl	%ecx, -32(%ebp)         ## 4-byte Spill
	calll	_exit
LBB16_2:
	movl	-8(%ebp), %eax
	movl	(%eax), %eax
	shrl	$2, %eax
	movl	%eax, -12(%ebp)
	movl	$0, -16(%ebp)
LBB16_3:                                ## =>This Inner Loop Header: Depth=1
	movl	-16(%ebp), %eax
	cmpl	-12(%ebp), %eax
	jae	LBB16_9
## BB#4:                                ##   in Loop: Header=BB16_3 Depth=1
	movl	-16(%ebp), %eax
	movl	-8(%ebp), %ecx
	movsbl	4(%ecx,%eax), %eax
	cmpl	$92, %eax
	je	LBB16_6
## BB#5:                                ##   in Loop: Header=BB16_3 Depth=1
	movl	-16(%ebp), %eax
	movl	-8(%ebp), %ecx
	movsbl	4(%ecx,%eax), %eax
	cmpl	$34, %eax
	jne	LBB16_7
LBB16_6:                                ##   in Loop: Header=BB16_3 Depth=1
	movl	-20(%ebp), %eax         ## 4-byte Reload
	leal	L_.str33-L16$pb(%eax), %ecx
	movl	%ecx, (%esp)
	calll	_printf
	movl	%eax, -36(%ebp)         ## 4-byte Spill
LBB16_7:                                ##   in Loop: Header=BB16_3 Depth=1
	movl	-20(%ebp), %eax         ## 4-byte Reload
	leal	L_.str34-L16$pb(%eax), %ecx
	movl	-16(%ebp), %edx
	movl	-8(%ebp), %esi
	movsbl	4(%esi,%edx), %edx
	movl	%ecx, (%esp)
	movl	%edx, 4(%esp)
	calll	_printf
	movl	%eax, -40(%ebp)         ## 4-byte Spill
## BB#8:                                ##   in Loop: Header=BB16_3 Depth=1
	movl	-16(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -16(%ebp)
	jmp	LBB16_3
LBB16_9:
	addl	$52, %esp
	popl	%esi
	popl	%ebp
	retl

	.align	4, 0x90
_print_vector:                          ## @print_vector
## BB#0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	subl	$36, %esp
	calll	L17$pb
L17$pb:
	popl	%eax
	movl	8(%ebp), %ecx
	leal	L_.str35-L17$pb(%eax), %edx
	movl	L___stderrp$non_lazy_ptr-L17$pb(%eax), %esi
	movl	%ecx, -8(%ebp)
	movl	-8(%ebp), %ecx
	movl	(%ecx), %ecx
	shrl	$2, %ecx
	movl	%ecx, -12(%ebp)
	movl	(%esi), %ecx
	movl	-8(%ebp), %esi
	movl	%ecx, (%esp)
	movl	%edx, 4(%esp)
	movl	%esi, 8(%esp)
	movl	%eax, -20(%ebp)         ## 4-byte Spill
	calll	_fprintf
	movl	$0, -16(%ebp)
	movl	%eax, -24(%ebp)         ## 4-byte Spill
LBB17_1:                                ## =>This Inner Loop Header: Depth=1
	movl	-16(%ebp), %eax
	cmpl	-12(%ebp), %eax
	jae	LBB17_6
## BB#2:                                ##   in Loop: Header=BB17_1 Depth=1
	movl	-16(%ebp), %eax
	movl	-8(%ebp), %ecx
	movl	4(%ecx,%eax,4), %eax
	movl	%eax, (%esp)
	calll	_print_ptr
	movl	-16(%ebp), %eax
	addl	$1, %eax
	cmpl	-12(%ebp), %eax
	jae	LBB17_4
## BB#3:                                ##   in Loop: Header=BB17_1 Depth=1
	movl	-20(%ebp), %eax         ## 4-byte Reload
	leal	L_.str36-L17$pb(%eax), %ecx
	movl	%ecx, (%esp)
	calll	_printf
	movl	%eax, -28(%ebp)         ## 4-byte Spill
LBB17_4:                                ##   in Loop: Header=BB17_1 Depth=1
	jmp	LBB17_5
LBB17_5:                                ##   in Loop: Header=BB17_1 Depth=1
	movl	-16(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -16(%ebp)
	jmp	LBB17_1
LBB17_6:
	addl	$36, %esp
	popl	%esi
	popl	%ebp
	retl

	.align	4, 0x90
_print_pairs:                           ## @print_pairs
## BB#0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$60, %esp
	calll	L18$pb
L18$pb:
	popl	%eax
	movl	8(%ebp), %ecx
	leal	L_.str37-L18$pb(%eax), %edx
	movl	L___stderrp$non_lazy_ptr-L18$pb(%eax), %esi
	movl	%ecx, -16(%ebp)
	movl	(%esi), %ecx
	movl	-16(%ebp), %esi
	movl	-16(%ebp), %edi
	movl	(%edi), %edi
	movl	-16(%ebp), %ebx
	movl	4(%ebx), %ebx
	movl	%ecx, (%esp)
	movl	%edx, 4(%esp)
	movl	%esi, 8(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 16(%esp)
	movl	%eax, -20(%ebp)         ## 4-byte Spill
	calll	_fprintf
	movl	-16(%ebp), %ecx
	andl	$4294967288, %ecx       ## imm = 0xFFFFFFF8
	movl	-16(%ebp), %edx
	cmpl	%edx, %ecx
	movl	%eax, -24(%ebp)         ## 4-byte Spill
	je	LBB18_2
## BB#1:
	movl	-20(%ebp), %eax         ## 4-byte Reload
	leal	L_.str38-L18$pb(%eax), %ecx
	movl	-16(%ebp), %edx
	movl	%ecx, (%esp)
	movl	%edx, 4(%esp)
	calll	_printf
	movl	$4294967295, %ecx       ## imm = 0xFFFFFFFF
	movl	$-1, (%esp)
	movl	%eax, -28(%ebp)         ## 4-byte Spill
	movl	%ecx, -32(%ebp)         ## 4-byte Spill
	calll	_exit
LBB18_2:
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	calll	_print_ptr
	movl	-16(%ebp), %eax
	cmpl	$63, 4(%eax)
	jne	LBB18_4
## BB#3:
	jmp	LBB18_8
LBB18_4:
	movl	-16(%ebp), %eax
	movl	4(%eax), %eax
	andl	$7, %eax
	cmpl	$1, %eax
	jne	LBB18_6
## BB#5:
	movl	-20(%ebp), %eax         ## 4-byte Reload
	leal	L_.str36-L18$pb(%eax), %ecx
	movl	%ecx, (%esp)
	calll	_printf
	movl	-16(%ebp), %ecx
	movl	4(%ecx), %ecx
	subl	$1, %ecx
	movl	%ecx, (%esp)
	movl	%eax, -36(%ebp)         ## 4-byte Spill
	calll	_print_pairs
	jmp	LBB18_7
LBB18_6:
	movl	-20(%ebp), %eax         ## 4-byte Reload
	leal	L_.str39-L18$pb(%eax), %ecx
	movl	%ecx, (%esp)
	calll	_printf
	movl	-16(%ebp), %ecx
	movl	4(%ecx), %ecx
	movl	%ecx, (%esp)
	movl	%eax, -40(%ebp)         ## 4-byte Spill
	calll	_print_ptr
LBB18_7:
	jmp	LBB18_8
LBB18_8:
	addl	$60, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl

	.comm	_dump_enabled,4,2       ## @dump_enabled
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"-d"

L_.str1:                                ## @.str1
	.asciz	"heap       %p\n"

L_.str2:                                ## @.str2
	.asciz	"stack top  %p\n"

L_.str3:                                ## @.str3
	.asciz	"stack base %p\n"

L_.str4:                                ## @.str4
	.asciz	"\n"

L_.str5:                                ## @.str5
	.asciz	"value = %x\n"

L_.str6:                                ## @.str6
	.asciz	"int    %ld\n"

L_.str7:                                ## @.str7
	.asciz	"long   %ld\n"

L_.str8:                                ## @.str8
	.asciz	"ptr    %ld\n"

L_.str9:                                ## @.str9
	.asciz	"pair   %ld\n"

L_.str10:                               ## @.str10
	.asciz	"pair*  %ld\n"

L_.str11:                               ## @.str11
	.asciz	"unrecognized datum in foreign function call; exiting\n"

L_.str12:                               ## @.str12
	.asciz	"inside s_write\n"

L_.str13:                               ## @.str13
	.asciz	"MAP FAILED exiting\n"

L_.str14:                               ## @.str14
	.asciz	"mprotect returned non-zero status; exiting\n"

L_.str15:                               ## @.str15
	.asciz	"mprotect failed; exiting\n"

L_.str16:                               ## @.str16
	.asciz	"print_ptr %x\n"

L_.str17:                               ## @.str17
	.asciz	"%d"

L_.str18:                               ## @.str18
	.asciz	"#\\tab"

L_.str19:                               ## @.str19
	.asciz	"#\\newline"

L_.str20:                               ## @.str20
	.asciz	"#\\return"

L_.str21:                               ## @.str21
	.asciz	"#\\space"

L_.str22:                               ## @.str22
	.asciz	"#\\%c"

L_.str23:                               ## @.str23
	.asciz	"\""

L_.str24:                               ## @.str24
	.asciz	"#("

L_.str25:                               ## @.str25
	.asciz	")"

L_.str26:                               ## @.str26
	.asciz	"("

L_.str27:                               ## @.str27
	.asciz	"#f"

L_.str28:                               ## @.str28
	.asciz	"#t"

L_.str29:                               ## @.str29
	.asciz	"()"

L_.str30:                               ## @.str30
	.asciz	"#<unknown 0x%08x>"

L_.str31:                               ## @.str31
	.asciz	"print_string %p"

L_.str32:                               ## @.str32
	.asciz	"error: print_string: s=%x must be 8-byte aligned\n"

L_.str33:                               ## @.str33
	.asciz	"\\"

L_.str34:                               ## @.str34
	.asciz	"%c"

L_.str35:                               ## @.str35
	.asciz	"print_vector %p\n"

L_.str36:                               ## @.str36
	.asciz	" "

L_.str37:                               ## @.str37
	.asciz	"print_pairs %p (car=%x  cdr=%x)\n"

L_.str38:                               ## @.str38
	.asciz	"error: print_pairs p=%x must be 8-byte aligned\n"

L_.str39:                               ## @.str39
	.asciz	" . "

L_.str40:                               ## @.str40
	.asciz	"@%8p  %02hhx %02hhx %02hhx %02hhx  %ld\n"

L_.str41:                               ## @.str41
	.asciz	"munmap returned non-zero status\n"


	.section	__IMPORT,__pointers,non_lazy_symbol_pointers
L___stderrp$non_lazy_ptr:
	.indirect_symbol	___stderrp
	.long	0
L_dump_enabled$non_lazy_ptr:
	.indirect_symbol	_dump_enabled
	.long	0

.subsections_via_symbols
