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
	.file	"player.c"
	.text
	.align	2
	.global	initBobber
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBobber, %function
initBobber:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #1
	mov	r0, #10
	push	{r4, lr}
	mov	r2, #0
	mov	r4, #120
	mov	lr, #4
	mov	ip, #32
	ldr	r3, .L4
	str	r0, [r3, #4]
	strb	r1, [r3, #72]
	ldr	r0, .L4+4
	str	r4, [r3]
	str	lr, [r3, #16]
	str	r2, [r3, #60]
	str	r2, [r3, #64]
	str	r2, [r3, #56]
	str	r2, [r3, #68]
	str	r1, [r3, #20]
	str	r1, [r3, #52]
	str	ip, [r0]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	bobber
	.word	bobberReach
	.size	initBobber, .-initBobber
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L8
	ldr	r0, [r3]
	subs	r0, r0, #0
	movne	r0, #1
	mov	r1, #1
	mov	r2, #0
	push	{r4, r5, r6, r7, r8, lr}
	mov	ip, #100
	mov	r4, #16
	mov	lr, #32
	mov	r8, #120
	mov	r7, #8
	mov	r6, #15
	mov	r5, #6
	ldr	r3, .L8+4
	str	r0, [r3, #88]
	ldr	r0, .L8+8
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r1, [r3, #28]
	str	r1, [r3, #32]
	str	r1, [r3, #36]
	str	r1, [r0]
	ldr	r1, .L8+12
	str	r2, [r1]
	ldr	r1, .L8+16
	strb	r2, [r3, #100]
	str	r2, [r1]
	ldr	r1, .L8+20
	str	r8, [r3]
	str	r7, [r3, #4]
	str	r6, [r3, #24]
	str	r5, [r3, #40]
	str	r2, [r3, #44]
	str	r2, [r3, #48]
	str	r2, [r3, #60]
	str	r2, [r3, #64]
	str	r2, [r3, #76]
	str	r2, [r3, #92]
	str	r4, [r3, #16]
	str	r4, [r3, #84]
	str	r2, [r1]
	str	lr, [r3, #20]
	str	lr, [r3, #80]
	str	ip, [r3, #52]
	str	ip, [r3, #72]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	cheatActive
	.word	player
	.word	playerTileDepth
	.word	pressureFrameCounter
	.word	externalPressure
	.word	pressureDanger
	.size	initPlayer, .-initPlayer
	.align	2
	.global	updateBobber
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBobber, %function
updateBobber:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L33
	ldr	r2, [r3]
	cmp	r2, #63
	bgt	.L31
.L26:
	mov	r2, #1
	str	r2, [r3, #52]
	bx	lr
.L31:
	ldr	r1, [r3, #24]
	add	r1, r2, r1
	cmp	r1, #176
	bgt	.L26
	ldr	r1, [r3, #52]
	cmp	r1, #0
	bxne	lr
	ldr	r1, .L33+4
	ldr	r0, [r1, #28]
	cmp	r0, #1
	str	lr, [sp, #-4]!
	beq	.L32
	cmp	r0, #0
	bne	.L10
	ldr	r0, .L33+8
	ldr	ip, [r1]
	ldr	r0, [r0]
	ldr	lr, [r1, #4]
	sub	r1, ip, r0
	cmp	r2, r1
	movle	r0, #1
	str	ip, [r3, #8]
	str	lr, [r3, #12]
	str	lr, [r3, #4]
	ldr	r1, [r3, #16]
	strle	r0, [r3, #68]
	ble	.L19
	ldr	r0, [r3, #68]
	cmp	r0, #0
	bne	.L19
	sub	r2, r2, r1
	str	r2, [r3]
.L10:
	ldr	lr, [sp], #4
	bx	lr
.L19:
	add	r2, r2, r1
	cmp	ip, r2
	str	r2, [r3]
	bgt	.L10
.L30:
	mov	r2, #1
	ldr	lr, [sp], #4
	str	r2, [r3, #52]
	bx	lr
.L32:
	ldr	lr, [r1, #76]
	cmp	lr, #0
	ldm	r1, {r0, ip}
	ldrne	r1, [r1, #16]
	str	r0, [r3, #8]
	addne	r0, r0, r1
	ldr	r1, .L33+8
	ldr	r1, [r1]
	add	r1, r0, r1
	strne	r0, [r3, #8]
	cmp	r2, r1
	str	ip, [r3, #12]
	str	ip, [r3, #4]
	movge	ip, #1
	ldr	r1, [r3, #16]
	strge	ip, [r3, #68]
	bge	.L17
	ldr	ip, [r3, #68]
	cmp	ip, #0
	addeq	r2, r2, r1
	streq	r2, [r3]
	beq	.L10
.L17:
	sub	r2, r2, r1
	cmp	r2, r0
	str	r2, [r3]
	ble	.L30
	b	.L10
.L34:
	.align	2
.L33:
	.word	bobber
	.word	player
	.word	bobberReach
	.size	updateBobber, .-updateBobber
	.align	2
	.global	fireBobber
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBobber, %function
fireBobber:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L42
	ldr	r2, [r3, #28]
	cmp	r2, #1
	ldr	r1, [r3, #4]
	ldr	r2, [r3]
	beq	.L41
.L36:
	ldr	r3, .L42+4
	stmib	r3, {r1, r2}
	str	r2, [r3]
	str	r1, [r3, #12]
.L37:
	mov	r2, #0
	str	r2, [r3, #68]
	str	r2, [r3, #52]
	bx	lr
.L41:
	ldr	r0, [r3, #76]
	cmp	r0, #0
	beq	.L36
	ldr	ip, [r3, #16]
	ldr	r0, [r3, #20]
	ldr	r3, .L42+4
	add	r2, r2, ip
	add	r0, r0, r1
	str	r0, [r3, #4]
	str	r2, [r3]
	str	r2, [r3, #8]
	str	r1, [r3, #12]
	b	.L37
.L43:
	.align	2
.L42:
	.word	player
	.word	bobber
	.size	fireBobber, .-fireBobber
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L112
	ldr	r3, [r4, #44]
	cmp	r3, #0
	bne	.L46
	mov	r2, #32
	mov	r1, #16
	ldr	r0, [r4, #52]
	cmp	r0, #0
	str	r2, [r4, #20]
	ldr	r5, .L112+4
	str	r3, [r4, #76]
	str	r1, [r4, #16]
	ldr	r2, [r4, #72]
	ble	.L102
	cmp	r2, #0
	ble	.L104
.L48:
	ldr	r0, .L112+8
	ldr	r3, [r5]
	ldr	r1, [r4, #88]
	ldr	r2, [r0]
	cmp	r1, #0
	add	r3, r3, #1
	movne	r1, r2
	str	r2, [r4, #64]
	str	r3, [r5]
	strne	r2, [r4, #60]
	bne	.L50
	ldr	r1, [r4, #60]
	cmp	r2, r1
	movge	ip, #0
	movlt	ip, #1
	cmp	r3, #120
	movle	ip, #0
	cmp	ip, #0
	subne	r1, r1, #1
	strne	r1, [r4, #60]
.L50:
	add	r2, r2, #10
	cmp	r2, r1
	blt	.L105
	mov	r1, #0
	ldr	r2, .L112+12
	str	r1, [r2]
.L52:
	cmp	r3, #120
	movgt	r2, #0
	ldrgt	r3, [r4, #52]
	ldr	r6, .L112+16
	subgt	r3, r3, #1
	strgt	r3, [r4, #52]
	ldrh	r3, [r6]
	strgt	r2, [r5]
	tst	r3, #128
	bne	.L55
	ldr	ip, .L112+20
	ldr	r2, [ip]
	ldr	r1, [r4, #4]
	ldr	lr, [r4, #12]
	add	r2, r2, #1
	add	r1, r1, lr
	cmp	r2, #30
	str	r2, [ip]
	str	r1, [r4, #4]
	ble	.L55
	ldr	r2, [r4, #20]
	rsb	r2, r2, #1280
	cmp	r1, r2
	bgt	.L55
	ldr	lr, .L112+24
	ldr	r1, [r4, #60]
	ldr	r2, [r0]
	ldr	lr, [lr]
	cmp	r1, r2
	addlt	r1, r1, lr, lsl #1
	strlt	r1, [r4, #60]
	mov	r1, #0
	add	r2, r2, lr
	str	r2, [r0]
	str	r1, [ip]
.L55:
	tst	r3, #64
	bne	.L59
	ldr	r1, [r4, #4]
	ldr	r2, [r4, #12]
	sub	r1, r1, r2
	cmp	r1, #7
	movle	lr, #0
	movgt	lr, #1
	ldr	ip, .L112+20
	ldr	r2, [ip]
	sub	r2, r2, #1
	ands	lr, lr, r2, lsr #31
	str	r1, [r4, #4]
	str	r2, [ip]
	bne	.L106
.L59:
	ands	r0, r3, #32
	and	r2, r3, #16
	bne	.L61
	mov	ip, #1
	ldr	r1, [r4]
	cmp	r2, #0
	ldr	r2, [r4, #8]
	str	r0, [r4, #28]
	ldr	r0, .L112+28
	sub	r2, r1, r2
	str	r2, [r4]
	str	ip, [r4, #76]
	str	ip, [r0]
	bne	.L63
.L62:
	mov	r2, #1
	mov	ip, #0
	str	r1, [r4]
	str	r2, [r4, #28]
	str	r2, [r4, #76]
	str	ip, [r0]
.L63:
	mov	r1, #32
	mov	r2, #16
	str	r1, [r4, #16]
	str	r2, [r4, #20]
.L66:
	ldr	r2, .L112+32
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L67
	tst	r3, #1
	beq	.L107
.L67:
	tst	r3, #2
	movne	r3, #1
	strne	r3, [r4, #12]
	bne	.L70
	mov	r0, #2
	ldr	r3, [r5]
	ldr	r2, .L112+36
	smull	ip, r1, r2, r3
	asr	r2, r3, #31
	rsb	r2, r2, r1, asr #1
	add	r2, r2, r2, lsl r0
	cmp	r3, r2
	ldreq	r2, [r4, #52]
	add	r3, r3, r3, lsl #4
	subeq	r2, r2, #1
	streq	r2, [r4, #52]
	add	r3, r3, r3, lsl #8
	ldr	r2, .L112+40
	add	r3, r3, r3, lsl #16
	ldr	r1, .L112+44
	sub	r2, r2, r3
	cmp	r1, r2, ror #3
	ldrcs	r3, [r4, #60]
	subcs	r3, r3, #1
	str	r0, [r4, #12]
	strcs	r3, [r4, #60]
.L70:
	ldr	r5, [r4]
	cmp	r5, #63
	movle	r3, #64
	movle	r5, r3
	ldr	r0, [r4, #16]
	strle	r3, [r4]
	ldr	lr, [r4, #4]
	add	r3, r0, r5
	ldr	ip, [r4, #20]
	cmp	r3, #200
	rsbgt	r5, r0, #200
	add	r3, lr, ip
	strgt	r5, [r4]
	cmp	r3, #320
	bge	.L73
	mov	r3, #83886080
	ldr	r2, .L112+48
	strh	r2, [r3, #4]	@ movhi
.L74:
	ldr	r3, [r4, #80]
	rsb	r3, r3, #160
	add	r3, r3, r3, lsr #31
	sub	r3, lr, r3, asr #1
	cmp	r3, #0
	add	r1, r3, #255
	movge	r1, r3
	ldr	r6, .L112+52
	asr	r1, r1, #8
	cmp	r5, #0
	add	r1, r1, #26
	str	r1, [r6]
	movlt	r1, #0
	ldr	r2, [r4, #84]
	rsb	r2, r2, #240
	add	r2, r2, r2, lsr #31
	sub	r2, r5, r2, asr #1
	ldr	r6, .L112+56
	ldr	r5, .L112+60
	strlt	r1, [r4]
	cmp	lr, #0
	str	r3, [r5]
	str	r2, [r6]
	blt	.L108
.L77:
	ldr	r1, [r4]
	rsb	r0, r0, #256
	cmp	r1, r0
	rsb	ip, ip, #1280
	strgt	r0, [r4]
	cmp	ip, lr
	strlt	ip, [r4, #4]
	cmp	r2, #0
	blt	.L109
	cmp	r3, #0
	blt	.L110
	cmp	r2, #16
	movgt	r2, #16
	strgt	r2, [r6]
	cmp	r3, #1120
	movgt	r3, #1120
	strgt	r3, [r5]
.L46:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L44
	ldr	r3, [r4, #24]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #24]
	bne	.L44
	ldr	r2, [r4, #36]
	cmp	r2, #5
	addne	r3, r2, #1
	mov	r2, #15
	str	r3, [r4, #36]
	str	r2, [r4, #24]
.L44:
	pop	{r4, r5, r6, lr}
	bx	lr
.L105:
	mov	ip, #1
	ldr	r2, .L112+36
	smull	lr, r1, r2, r3
	asr	r2, r3, #31
	rsb	r2, r2, r1, asr #2
	add	r2, r2, r2, lsl #2
	ldr	r1, .L112+12
	cmp	r3, r2, lsl ip
	str	ip, [r1]
	ldreq	r2, [r4, #72]
	subeq	r2, r2, #2
	streq	ip, [r4, #92]
	streq	r2, [r4, #72]
	b	.L52
.L102:
	ldr	r1, [r5]
	tst	r1, #1
	str	r3, [r4, #52]
	moveq	r3, #1
	subeq	r2, r2, #1
	streq	r2, [r4, #72]
	streq	r3, [r4, #92]
	cmp	r2, #0
	bgt	.L48
	b	.L104
.L61:
	cmp	r2, #0
	beq	.L111
	ldr	r2, [r4, #76]
	cmp	r2, #0
	beq	.L66
	b	.L63
.L73:
	ldr	r1, .L112+64
	sub	r2, r3, #320
	sub	r2, r2, #1
	cmp	r2, r1
	bhi	.L75
	mov	r3, #83886080
	ldr	r2, .L112+68
	strh	r2, [r3, #4]	@ movhi
	b	.L74
.L109:
	mov	r2, #0
	cmp	r3, r2
	str	r2, [r6]
	strlt	r2, [r5]
	blt	.L46
	cmp	r3, #1120
	movgt	r3, #1120
	strgt	r3, [r5]
	b	.L46
.L104:
	ldr	r3, .L112+72
	mov	lr, pc
	bx	r3
	b	.L48
.L75:
	cmp	r3, #640
	movgt	r3, #83886080
	ldrgt	r2, .L112+76
	strhgt	r2, [r3, #4]	@ movhi
	b	.L74
.L110:
	mov	r3, #0
	cmp	r2, #16
	str	r3, [r5]
	movgt	r3, #16
	strgt	r3, [r6]
	b	.L46
.L107:
	bl	fireBobber
	ldrh	r3, [r6]
	b	.L67
.L106:
	mov	r1, #30
	ldr	lr, .L112+24
	ldr	r2, [r0]
	ldr	lr, [lr]
	sub	r2, r2, lr
	str	r2, [r0]
	str	r1, [ip]
	b	.L59
.L108:
	ldr	r3, .L112+80
	mov	lr, pc
	bx	r3
	ldr	r0, [r4, #16]
	ldr	lr, [r4, #4]
	ldr	ip, [r4, #20]
	ldr	r2, [r6]
	ldr	r3, [r5]
	b	.L77
.L111:
	ldr	r1, [r4, #8]
	ldr	r2, [r4]
	ldr	r0, .L112+28
	add	r1, r1, r2
	b	.L62
.L113:
	.align	2
.L112:
	.word	player
	.word	playerFrameCounter
	.word	externalPressure
	.word	pressureDanger
	.word	buttons
	.word	pressureFrameCounter
	.word	.LANCHOR0
	.word	flip
	.word	oldButtons
	.word	1717986919
	.word	143165576
	.word	35791394
	.word	863
	.word	currentSBB
	.word	hOff
	.word	vOff
	.word	318
	.word	32736
	.word	goToLose
	.word	31759
	.word	goToWin
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	drawBobber
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBobber, %function
drawBobber:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L121
	ldr	r3, [r1, #52]
	cmp	r3, #0
	ldrb	r3, [r1, #72]	@ zero_extendqisi2
	bne	.L115
	ldr	r2, .L121+4
	ldr	r0, .L121+8
	ldr	ip, [r2]
	ldr	r2, [r1]
	ldr	r0, [r0]
	ldr	r1, [r1, #4]
	sub	r2, r2, ip
	ldr	ip, .L121+12
	str	lr, [sp, #-4]!
	sub	r1, r1, r0
	ldr	lr, .L121+16
	lsl	r2, r2, #23
	add	r0, ip, r3, lsl #3
	lsr	r2, r2, #23
	lsl	r3, r3, #3
	and	r1, r1, #255
	strh	lr, [r0, #4]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	strh	r1, [ip, r3]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L115:
	mov	r1, #512
	ldr	r2, .L121+12
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L122:
	.align	2
.L121:
	.word	bobber
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.word	29095
	.size	drawBobber, .-drawBobber
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L141
	ldr	r3, .L141+4
	ldr	r2, [r1, #4]
	ldr	r3, [r3]
	push	{r4, r5, lr}
	ldr	lr, [r1, #76]
	sub	r2, r2, r3
	cmp	lr, #0
	and	r2, r2, #255
	mvneq	r2, r2, lsl #17
	mvneq	r2, r2, lsr #17
	ldrb	r0, [r1, #100]	@ zero_extendqisi2
	ldrne	ip, .L141+8
	ldreq	ip, .L141+8
	ldr	r4, .L141+12
	lslne	r0, r0, #3
	lsleq	r0, r0, #3
	orrne	r2, r2, #16384
	ldr	r5, [r4]
	strh	r2, [ip, r0]	@ movhi
	ldr	r2, [r1]
	ldr	r4, .L141+16
	sub	r2, r2, r5
	lsl	r2, r2, #23
	ldr	r5, [r4]
	lsr	r2, r2, #23
	add	r4, ip, r0
	orr	r2, r2, #32768
	cmp	r5, #0
	strh	r2, [r4, #2]	@ movhi
	orrne	r2, r2, #4096
	strhne	r2, [r4, #2]	@ movhi
	ldrh	r2, [r1, #36]
	cmp	lr, #0
	lslne	r2, r2, #2
	lsleq	r2, r2, #1
	ldr	lr, [r1, #88]
	addne	r2, r2, #129
	addeq	r2, r2, #1
	lsl	r2, r2, #22
	lsr	r2, r2, #22
	cmp	lr, #0
	add	lr, ip, r0
	strh	r2, [lr, #4]	@ movhi
	mvnne	r2, r2, lsl #17
	mvnne	r2, r2, lsr #17
	strhne	r2, [lr, #4]	@ movhi
	ldr	r2, [r1, #92]
	cmp	r2, #0
	addne	r0, ip, r0
	ldrhne	r2, [r0, #4]
	orrne	r2, r2, #24576
	strhne	r2, [r0, #4]	@ movhi
	mov	r0, #67108864
	ldr	r2, .L141+20
	ldr	r2, [r2]
	rsbs	r1, r3, #0
	lsl	r2, r2, #24
	and	r1, r1, #255
	and	r3, r3, #255
	orr	r2, r2, #-2147483648
	rsbpl	r3, r1, #0
	orr	r2, r2, #65536
	lsl	r3, r3, #16
	lsr	r2, r2, #16
	lsr	r3, r3, #16
	strh	r2, [r0, #8]	@ movhi
	pop	{r4, r5, lr}
	strh	r3, [r0, #18]	@ movhi
	bx	lr
.L142:
	.align	2
.L141:
	.word	player
	.word	vOff
	.word	shadowOAM
	.word	hOff
	.word	flip
	.word	currentSBB
	.size	drawPlayer, .-drawPlayer
	.comm	flip,4,4
	.global	pressureModifier
	.comm	bobberReach,4,4
	.comm	playerTileDepth,4,4
	.comm	pressureDanger,4,4
	.comm	externalPressure,4,4
	.comm	currentSBB,4,4
	.comm	pressureFrameCounter,4,4
	.comm	playerFrameCounter,4,4
	.comm	lastYBoundary,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	bobber,76,4
	.comm	player,104,4
	.comm	basket,1612,4
	.comm	treasure,80,4
	.comm	wildFishArea1,400,4
	.comm	fishType,1,1
	.comm	fishSize,1,1
	.comm	direction,1,1
	.comm	bagPriceBuffer,4,4
	.comm	bagCapBuffer,4,4
	.comm	healthPointBuffer,3,4
	.comm	depthBuffer,4,4
	.comm	externalPressureBuffer,4,4
	.comm	internalPressureBuffer,4,4
	.comm	oxygen2Buffer,4,4
	.comm	oxygen1Buffer,4,4
	.comm	colors,1,1
	.comm	state,1,1
	.comm	rSeed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	pressureModifier, %object
	.size	pressureModifier, 4
pressureModifier:
	.word	1
	.ident	"GCC: (devkitARM release 53) 9.1.0"
