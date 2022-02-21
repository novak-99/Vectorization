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
	and	rsp, -32
	mov	eax, 6291840
	call	____chkstk_darwin
	sub	rsp, rax
	mov	rax, qword ptr [rip + ___stack_chk_guard@GOTPCREL]
	mov	rax, qword ptr [rax]
	mov	qword ptr [rsp + 6291816], rax
	mov	dword ptr [rsp + 156], 0
	mov	dword ptr [rsp + 152], 8
	mov	dword ptr [rsp + 148], 524288
	mov	dword ptr [rsp + 144], 1000
	mov	dword ptr [rsp + 140], 0
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	cmp	dword ptr [rsp + 140], 524288
	jge	LBB0_4
## %bb.2:                               ##   in Loop: Header=BB0_1 Depth=1
                                        ## implicit-def: $xmm0
	vcvtsi2ss	xmm0, xmm0, dword ptr [rsp + 140]
	movsxd	rax, dword ptr [rsp + 140]
	vmovss	dword ptr [rsp + 4*rax + 4194656], xmm0
	mov	ecx, dword ptr [rsp + 140]
	shl	ecx, 1
                                        ## implicit-def: $xmm0
	vcvtsi2ss	xmm0, xmm0, ecx
	movsxd	rax, dword ptr [rsp + 140]
	vmovss	dword ptr [rsp + 4*rax + 2097504], xmm0
## %bb.3:                               ##   in Loop: Header=BB0_1 Depth=1
	mov	eax, dword ptr [rsp + 140]
	add	eax, 1
	mov	dword ptr [rsp + 140], eax
	jmp	LBB0_1
LBB0_4:
	mov	dword ptr [rsp + 136], 8
LBB0_5:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_7 Depth 2
	cmp	dword ptr [rsp + 136], 524288
	jg	LBB0_12
## %bb.6:                               ##   in Loop: Header=BB0_5 Depth=1
	mov	eax, dword ptr [rsp + 136]
	mov	ecx, eax
	add	ecx, -8
	movsxd	rdx, ecx
	vmovss	xmm0, dword ptr [rsp + 4*rdx + 4194656] ## xmm0 = mem[0],zero,zero,zero
	mov	ecx, eax
	add	ecx, -7
	movsxd	rdx, ecx
	vmovss	xmm1, dword ptr [rsp + 4*rdx + 4194656] ## xmm1 = mem[0],zero,zero,zero
	mov	ecx, eax
	add	ecx, -6
	movsxd	rdx, ecx
	vmovss	xmm2, dword ptr [rsp + 4*rdx + 4194656] ## xmm2 = mem[0],zero,zero,zero
	mov	ecx, eax
	add	ecx, -5
	movsxd	rdx, ecx
	vmovss	xmm3, dword ptr [rsp + 4*rdx + 4194656] ## xmm3 = mem[0],zero,zero,zero
	mov	ecx, eax
	add	ecx, -4
	movsxd	rdx, ecx
	vmovss	xmm4, dword ptr [rsp + 4*rdx + 4194656] ## xmm4 = mem[0],zero,zero,zero
	mov	ecx, eax
	add	ecx, -3
	movsxd	rdx, ecx
	vmovss	xmm5, dword ptr [rsp + 4*rdx + 4194656] ## xmm5 = mem[0],zero,zero,zero
	mov	ecx, eax
	add	ecx, -2
	movsxd	rdx, ecx
	vmovss	xmm6, dword ptr [rsp + 4*rdx + 4194656] ## xmm6 = mem[0],zero,zero,zero
	dec	eax
	movsxd	rdx, eax
	vmovss	xmm7, dword ptr [rsp + 4*rdx + 4194656] ## xmm7 = mem[0],zero,zero,zero
	vmovss	dword ptr [rsp + 220], xmm0
	vmovss	dword ptr [rsp + 216], xmm1
	vmovss	dword ptr [rsp + 212], xmm2
	vmovss	dword ptr [rsp + 208], xmm3
	vmovss	dword ptr [rsp + 204], xmm4
	vmovss	dword ptr [rsp + 200], xmm5
	vmovss	dword ptr [rsp + 196], xmm6
	vmovss	dword ptr [rsp + 192], xmm7
	vmovss	xmm0, dword ptr [rsp + 196] ## xmm0 = mem[0],zero,zero,zero
	vmovss	xmm1, dword ptr [rsp + 192] ## xmm1 = mem[0],zero,zero,zero
	vinsertps	xmm0, xmm1, xmm0, 16 ## xmm0 = xmm1[0],xmm0[0],xmm1[2,3]
	vmovss	xmm1, dword ptr [rsp + 200] ## xmm1 = mem[0],zero,zero,zero
	vinsertps	xmm0, xmm0, xmm1, 32 ## xmm0 = xmm0[0,1],xmm1[0],xmm0[3]
	vmovss	xmm1, dword ptr [rsp + 204] ## xmm1 = mem[0],zero,zero,zero
	vinsertps	xmm0, xmm0, xmm1, 48 ## xmm0 = xmm0[0,1,2],xmm1[0]
	vmovss	xmm1, dword ptr [rsp + 212] ## xmm1 = mem[0],zero,zero,zero
	vmovss	xmm2, dword ptr [rsp + 208] ## xmm2 = mem[0],zero,zero,zero
	vinsertps	xmm1, xmm2, xmm1, 16 ## xmm1 = xmm2[0],xmm1[0],xmm2[2,3]
	vmovss	xmm2, dword ptr [rsp + 216] ## xmm2 = mem[0],zero,zero,zero
	vinsertps	xmm1, xmm1, xmm2, 32 ## xmm1 = xmm1[0,1],xmm2[0],xmm1[3]
	vmovss	xmm2, dword ptr [rsp + 220] ## xmm2 = mem[0],zero,zero,zero
	vinsertps	xmm1, xmm1, xmm2, 48 ## xmm1 = xmm1[0,1,2],xmm2[0]
	vmovaps	xmmword ptr [rsp + 176], xmm1
	vmovaps	xmmword ptr [rsp + 160], xmm0
	vmovaps	ymm8, ymmword ptr [rsp + 160]
	vmovaps	ymmword ptr [rsp + 96], ymm8
	mov	eax, dword ptr [rsp + 136]
	mov	ecx, eax
	add	ecx, -8
	movsxd	rdx, ecx
	vmovss	xmm0, dword ptr [rsp + 4*rdx + 2097504] ## xmm0 = mem[0],zero,zero,zero
	mov	ecx, eax
	add	ecx, -7
	movsxd	rdx, ecx
	vmovss	xmm1, dword ptr [rsp + 4*rdx + 2097504] ## xmm1 = mem[0],zero,zero,zero
	mov	ecx, eax
	add	ecx, -6
	movsxd	rdx, ecx
	vmovss	xmm2, dword ptr [rsp + 4*rdx + 2097504] ## xmm2 = mem[0],zero,zero,zero
	mov	ecx, eax
	add	ecx, -5
	movsxd	rdx, ecx
	vmovss	xmm3, dword ptr [rsp + 4*rdx + 2097504] ## xmm3 = mem[0],zero,zero,zero
	mov	ecx, eax
	add	ecx, -4
	movsxd	rdx, ecx
	vmovss	xmm4, dword ptr [rsp + 4*rdx + 2097504] ## xmm4 = mem[0],zero,zero,zero
	mov	ecx, eax
	add	ecx, -3
	movsxd	rdx, ecx
	vmovss	xmm5, dword ptr [rsp + 4*rdx + 2097504] ## xmm5 = mem[0],zero,zero,zero
	mov	ecx, eax
	add	ecx, -2
	movsxd	rdx, ecx
	vmovss	xmm6, dword ptr [rsp + 4*rdx + 2097504] ## xmm6 = mem[0],zero,zero,zero
	dec	eax
	movsxd	rdx, eax
	vmovss	xmm7, dword ptr [rsp + 4*rdx + 2097504] ## xmm7 = mem[0],zero,zero,zero
	vmovss	dword ptr [rsp + 348], xmm0
	vmovss	dword ptr [rsp + 344], xmm1
	vmovss	dword ptr [rsp + 340], xmm2
	vmovss	dword ptr [rsp + 336], xmm3
	vmovss	dword ptr [rsp + 332], xmm4
	vmovss	dword ptr [rsp + 328], xmm5
	vmovss	dword ptr [rsp + 324], xmm6
	vmovss	dword ptr [rsp + 320], xmm7
	vmovss	xmm0, dword ptr [rsp + 340] ## xmm0 = mem[0],zero,zero,zero
	vmovss	xmm1, dword ptr [rsp + 336] ## xmm1 = mem[0],zero,zero,zero
	vinsertps	xmm0, xmm1, xmm0, 16 ## xmm0 = xmm1[0],xmm0[0],xmm1[2,3]
	vmovss	xmm1, dword ptr [rsp + 344] ## xmm1 = mem[0],zero,zero,zero
	vinsertps	xmm0, xmm0, xmm1, 32 ## xmm0 = xmm0[0,1],xmm1[0],xmm0[3]
	vmovss	xmm1, dword ptr [rsp + 348] ## xmm1 = mem[0],zero,zero,zero
	vinsertps	xmm0, xmm0, xmm1, 48 ## xmm0 = xmm0[0,1,2],xmm1[0]
	vmovss	xmm1, dword ptr [rsp + 324] ## xmm1 = mem[0],zero,zero,zero
	vmovss	xmm2, dword ptr [rsp + 320] ## xmm2 = mem[0],zero,zero,zero
	vinsertps	xmm1, xmm2, xmm1, 16 ## xmm1 = xmm2[0],xmm1[0],xmm2[2,3]
	vmovss	xmm2, dword ptr [rsp + 328] ## xmm2 = mem[0],zero,zero,zero
	vinsertps	xmm1, xmm1, xmm2, 32 ## xmm1 = xmm1[0,1],xmm2[0],xmm1[3]
	vmovss	xmm2, dword ptr [rsp + 332] ## xmm2 = mem[0],zero,zero,zero
	vinsertps	xmm1, xmm1, xmm2, 48 ## xmm1 = xmm1[0,1,2],xmm2[0]
                                        ## implicit-def: $ymm8
	vmovaps	xmm8, xmm1
	vinsertf32x4	ymm8, ymm8, xmm0, 1
	vmovaps	ymmword ptr [rsp + 288], ymm8
	vmovaps	ymm8, ymmword ptr [rsp + 288]
	vmovaps	ymmword ptr [rsp + 64], ymm8
	mov	dword ptr [rsp + 60], 0
LBB0_7:                                 ##   Parent Loop BB0_5 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	cmp	dword ptr [rsp + 60], 1000
	jge	LBB0_10
## %bb.8:                               ##   in Loop: Header=BB0_7 Depth=2
	vmovaps	ymm0, ymmword ptr [rsp + 96]
	vmovaps	ymm1, ymmword ptr [rsp + 64]
	vmovaps	ymmword ptr [rsp + 256], ymm0
	vmovaps	ymmword ptr [rsp + 224], ymm1
	vmovaps	ymm0, ymmword ptr [rsp + 256]
	vaddps	ymm0, ymm0, ymmword ptr [rsp + 224]
	vmovaps	ymmword ptr [rsp], ymm0
## %bb.9:                               ##   in Loop: Header=BB0_7 Depth=2
	mov	eax, dword ptr [rsp + 60]
	add	eax, 1
	mov	dword ptr [rsp + 60], eax
	jmp	LBB0_7
LBB0_10:                                ##   in Loop: Header=BB0_5 Depth=1
	jmp	LBB0_11
LBB0_11:                                ##   in Loop: Header=BB0_5 Depth=1
	mov	eax, dword ptr [rsp + 136]
	add	eax, 8
	mov	dword ptr [rsp + 136], eax
	jmp	LBB0_5
LBB0_12:
	mov	rax, qword ptr [rip + ___stack_chk_guard@GOTPCREL]
	mov	rax, qword ptr [rax]
	mov	rcx, qword ptr [rsp + 6291816]
	cmp	rax, rcx
	jne	LBB0_14
## %bb.13:
	xor	eax, eax
	mov	rsp, rbp
	pop	rbp
	vzeroupper
	ret
LBB0_14:
	vzeroupper
	call	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
.subsections_via_symbols
