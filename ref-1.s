	.file	"7.c"
	.intel_syntax noprefix
	.text
	.globl	f
	.type	f, @function
f:
	push	rbp
	push	r12				#r12 = n
	push	r13				#i = 1
	mov	rbp, rsp
	movsd	xmm2, xmm0			#double x 
	movsd	xmm0, QWORD PTR .LC0[rip]	#f_x
	movsd	xmm3, xmm0		
	mov	r12, 100			#n = 100
	movsd	xmm0, xmm2
	movsd	xmm4, xmm0			#p = x
	movsd	xmm0, QWORD PTR .LC0[rip]	#f = 1
	movsd	xmm5, xmm0
	mov	r13, 1				#int i = 1
	jmp	.L2
.L5:
	mov	rax, r13
	and	eax, 1
	test	eax, eax
	je	.L3
	movsd	xmm0, xmm4
	divsd	xmm0, xmm5
	movsd	xmm1, xmm3
	subsd	xmm1, xmm0
	movapd	xmm0, xmm1
	movsd	xmm3, xmm0
	jmp	.L4
.L3:
	movsd	xmm0, xmm4
	divsd	xmm0, xmm5
	movsd	xmm1, xmm3
	addsd	xmm0, xmm1
	movsd	xmm3, xmm0
.L4:
	movsd	xmm0, xmm4
	mulsd	xmm0, xmm2
	movsd	xmm4, xmm0
	mov	rax, r13
	add	eax, 1
	cvtsi2sd	xmm0, eax
	movsd	xmm1, xmm5
	mulsd	xmm0, xmm1
	movsd	xmm5, xmm0
	add	r13, 1
.L2:
	mov	rax, r13
	cmp	rax, r12
	jl	.L5
	movsd	xmm0, xmm3			#return f_x
	pop	r13
	pop	r12
	pop	rbp
	ret
	.size	f, .-f
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.align 8
.LC6:
	.long	0
	.long	1077215232
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
.LC1:
	.string	"Wrong input, check README.md"
.LC2:
	.string	"r"
.LC3:
	.string	"w"
.LC4:
	.string	"Wrong file"
.LC5:
	.string	"%lf"
.LC7:
	.string	"too small result"
.LC8:
	.string	"%.9lf"
	.text
	.globl	main
	.type	main, @function
