	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15, 6
	.intel_syntax noprefix
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	eax, 6291504
	call	____chkstk_darwin
	sub	rsp, rax
	mov	rax, qword ptr [rip + ___stack_chk_guard@GOTPCREL]
	mov	rax, qword ptr [rax]
	mov	qword ptr [rbp - 8], rax
	mov	dword ptr [rbp - 6291476], 0
	mov	dword ptr [rbp - 6291480], 8
	mov	dword ptr [rbp - 6291484], 524288
	mov	dword ptr [rbp - 6291488], 1000
	mov	dword ptr [rbp - 6291492], 0
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	cmp	dword ptr [rbp - 6291492], 524288
	jge	LBB0_4
## %bb.2:                               ##   in Loop: Header=BB0_1 Depth=1
	cvtsi2ss	xmm0, dword ptr [rbp - 6291492]
	movsxd	rax, dword ptr [rbp - 6291492]
	movss	dword ptr [rbp + 4*rax - 2097168], xmm0
	mov	ecx, dword ptr [rbp - 6291492]
	shl	ecx, 1
	cvtsi2ss	xmm0, ecx
	movsxd	rax, dword ptr [rbp - 6291492]
	movss	dword ptr [rbp + 4*rax - 4194320], xmm0
## %bb.3:                               ##   in Loop: Header=BB0_1 Depth=1
	mov	eax, dword ptr [rbp - 6291492]
	add	eax, 1
	mov	dword ptr [rbp - 6291492], eax
	jmp	LBB0_1
LBB0_4:
	mov	dword ptr [rbp - 6291496], 0
LBB0_5:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_7 Depth 2
	cmp	dword ptr [rbp - 6291496], 524288
	jge	LBB0_12
## %bb.6:                               ##   in Loop: Header=BB0_5 Depth=1
	mov	dword ptr [rbp - 6291500], 0
LBB0_7:                                 ##   Parent Loop BB0_5 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	cmp	dword ptr [rbp - 6291500], 1000
	jge	LBB0_10
## %bb.8:                               ##   in Loop: Header=BB0_7 Depth=2
	movsxd	rax, dword ptr [rbp - 6291500]
	movss	xmm0, dword ptr [rbp + 4*rax - 2097168] ## xmm0 = mem[0],zero,zero,zero
	movsxd	rax, dword ptr [rbp - 6291500]
	addss	xmm0, dword ptr [rbp + 4*rax - 4194320]
	movsxd	rax, dword ptr [rbp - 6291500]
	movss	dword ptr [rbp + 4*rax - 6291472], xmm0
## %bb.9:                               ##   in Loop: Header=BB0_7 Depth=2
	mov	eax, dword ptr [rbp - 6291500]
	add	eax, 1
	mov	dword ptr [rbp - 6291500], eax
	jmp	LBB0_7
LBB0_10:                                ##   in Loop: Header=BB0_5 Depth=1
	jmp	LBB0_11
LBB0_11:                                ##   in Loop: Header=BB0_5 Depth=1
	mov	eax, dword ptr [rbp - 6291496]
	add	eax, 1
	mov	dword ptr [rbp - 6291496], eax
	jmp	LBB0_5
LBB0_12:
	mov	rax, qword ptr [rip + ___stack_chk_guard@GOTPCREL]
	mov	rax, qword ptr [rax]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	LBB0_14
## %bb.13:
	xor	eax, eax
	add	rsp, 6291504
	pop	rbp
	ret
LBB0_14:
	call	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
.subsections_via_symbols
