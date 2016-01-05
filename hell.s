	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 10
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
## BB#0:
	pushl	%ebp          # preserve ebp as per the ABI, bumpts esp by -4
	movl	%esp, %ebp    # save old esp in ebp  (where it gets preserved)
        subl	$8, %esp      # bump esp by -8 reserving 2 slots!

# This trick avoids absolute addressing to access L_.str
#	calll	L0$pb
L0$pb:
#	popl	%eax
#	leal	L_.str-L0$pb(%eax), %eax
    
        leal    L_.str,%eax   # load eax with ptr to c-string
	movl	%eax, (%esp)  # push the pointer on stack as arg1
	calll	_puts         # make the call
	xorl	%eax, %eax    # clear eax  -- why???
	addl	$8, %esp      # unbump the esp
	popl	%ebp          # now restore the ebp register from the stack
	retl                  # return to the system

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Hello world!\n"


.subsections_via_symbols
