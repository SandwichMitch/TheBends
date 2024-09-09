	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L18
	mov	lr, pc
	bx	r3
	ldr	r6, .L18+4
	ldr	r7, .L18+8
	ldr	r5, .L18+12
	ldr	fp, .L18+16
	ldr	r10, .L18+20
	ldr	r9, .L18+24
	ldr	r8, .L18+28
	ldr	r4, .L18+32
.L2:
	ldrb	r2, [r6]	@ zero_extendqisi2
	ldrh	r3, [r7]
.L3:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #8
	ldrls	pc, [pc, r2, asl #2]
	b	.L3
.L5:
	.word	.L13
	.word	.L12
	.word	.L11
	.word	.L10
	.word	.L9
	.word	.L8
	.word	.L7
	.word	.L6
	.word	.L4
.L4:
	ldr	r3, .L18+36
	mov	lr, pc
	bx	r3
	b	.L2
.L6:
	ldr	r3, .L18+40
	mov	lr, pc
	bx	r3
	b	.L2
.L7:
	ldr	r3, .L18+44
	mov	lr, pc
	bx	r3
	b	.L2
.L8:
	ldr	r3, .L18+48
	mov	lr, pc
	bx	r3
	b	.L2
.L9:
	ldr	r3, .L18+52
	mov	lr, pc
	bx	r3
	b	.L2
.L10:
	mov	lr, pc
	bx	r8
	b	.L2
.L11:
	mov	lr, pc
	bx	r9
	b	.L2
.L12:
	mov	lr, pc
	bx	r10
	b	.L2
.L13:
	mov	lr, pc
	bx	fp
	b	.L2
.L19:
	.align	2
.L18:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	instructions
	.word	lobby
	.word	gameArea1
	.word	67109120
	.word	lose
	.word	win
	.word	pause
	.word	gameArea3
	.word	gameArea2
	.size	main, .-main
	.comm	colors,1,1
	.comm	state,1,1
	.comm	rSeed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	bagPriceBuffer,4,4
	.comm	bagCapBuffer,4,4
	.comm	healthPointBuffer,3,4
	.comm	depthBuffer,4,4
	.comm	externalPressureBuffer,4,4
	.comm	internalPressureBuffer,4,4
	.comm	oxygen2Buffer,4,4
	.comm	oxygen1Buffer,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
