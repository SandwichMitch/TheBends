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
	.file	"game.c"
	.text
	.align	2
	.global	initGame
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #67108864
	mov	r3, #4864
	mov	r0, #2048
	ldr	r2, .L4
	push	{r4, lr}
	ldr	r4, .L4+4
	strh	r3, [r1]	@ movhi
	strh	r2, [r1, #8]	@ movhi
	mov	r3, #256
	strh	r0, [r1, #10]	@ movhi
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r3, #8192
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	mov	r3, #5120
	mov	r0, #3
	ldr	r2, .L4+24
	ldr	r1, .L4+28
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L4+32
	ldr	r1, .L4+36
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L4+40
	ldr	r1, .L4+44
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+52
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+56
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+60
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L4+64
	ldr	r3, .L4+68
	mov	lr, pc
	bx	r3
	mov	r0, #2
	mov	r2, #0
	ldr	r1, .L4+72
	ldr	r3, .L4+76
	str	r0, [r1]
	str	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	-26111
	.word	DMANow
	.word	finalprojecttilesheetM3Pal
	.word	finalprojecttilesheetM3Tiles
	.word	100679680
	.word	userinterfacedivingMap
	.word	100716544
	.word	newoceanmapXLBIGTESTMap
	.word	100728832
	.word	finalprojectspritesheetTiles
	.word	83886592
	.word	finalprojectspritesheetPal
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	loopingTrack_length
	.word	loopingTrack_data
	.word	playSoundA
	.word	totalMinutes
	.word	totalSeconds
	.size	initGame, .-initGame
	.align	2
	.global	initArea1
	.syntax unified
	.arm
	.fpu softvfp
	.type	initArea1, %function
initArea1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #15
	ldr	r2, .L8
	push	{r4, lr}
	ldr	r3, .L8+4
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	hurtFrames
	.word	initBobber
	.word	initBasket
	.word	initWildA1
	.word	initPlayer
	.word	initTreasure
	.size	initArea1, .-initArea1
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%03d\000"
	.align	2
.LC1:
	.ascii	"%04d\000"
	.text
	.align	2
	.global	updateUI
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateUI, %function
updateUI:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r5, .L12
	ldr	r6, .L12+4
	ldr	r4, .L12+8
	mov	r1, r5
	ldr	r2, [r6, #72]
	ldr	r0, .L12+12
	mov	lr, pc
	bx	r4
	mov	r1, r5
	ldr	r2, [r6, #52]
	ldr	r0, .L12+16
	mov	lr, pc
	bx	r4
	mov	r1, r5
	ldr	r2, [r6, #60]
	ldr	r0, .L12+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+24
	mov	r1, r5
	ldr	r2, [r3]
	ldr	r7, .L12+28
	ldr	r0, .L12+32
	mov	lr, pc
	bx	r4
	ldr	r2, [r6, #4]
	ldr	r1, .L12+36
	ldr	r0, .L12+40
	mov	lr, pc
	bx	r4
	mov	r1, r5
	ldr	r2, [r7, #4]
	ldr	r0, .L12+44
	mov	lr, pc
	bx	r4
	mov	r1, r5
	ldr	r2, [r7, #8]
	ldr	r0, .L12+48
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	.LC0
	.word	player
	.word	sprintf
	.word	healthPointBuffer
	.word	oxygen1Buffer
	.word	internalPressureBuffer
	.word	externalPressure
	.word	basket
	.word	externalPressureBuffer
	.word	.LC1
	.word	depthBuffer
	.word	bagCapBuffer
	.word	bagPriceBuffer
	.size	updateUI, .-updateUI
	.align	2
	.global	updateGameArea1
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGameArea1, %function
updateGameArea1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L19
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r2, .L19+4
	ldr	r3, [r2, #92]
	cmp	r3, #0
	beq	.L16
	ldr	r1, .L19+8
	ldr	r3, [r1]
	sub	r3, r3, #1
	cmp	r3, #0
	moveq	r0, #15
	str	r3, [r1]
	streq	r3, [r2, #92]
	streq	r0, [r1]
.L16:
	ldr	r3, .L19+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L19+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L19+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L19+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	updateUI
.L20:
	.align	2
.L19:
	.word	updatePlayer
	.word	player
	.word	hurtFrames
	.word	updateWildA1
	.word	spawnFishA1
	.word	updateTreasure
	.word	updateBobber
	.size	updateGameArea1, .-updateGameArea1
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"pressure danger!\000"
	.text
	.align	2
	.global	drawUI
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawUI, %function
drawUI:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r2, .L68
	ldrb	r3, [r2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L26
	ldr	r4, .L68+4
	ldr	lr, .L68+8
	ldr	ip, .L68+12
	rsb	r0, r2, #98
.L22:
	sub	r3, r3, #48
	and	r3, r3, #255
	cmp	r3, #42
	movhi	r1, r4
	lsl	r3, r3, #1
	ldrhls	r1, [lr, r3]
	add	r3, r2, r0
	lsl	r3, r3, #1
	strh	r1, [ip, r3]	@ movhi
	ldrb	r3, [r2, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L22
.L26:
	ldr	r2, .L68+16
	ldrb	r3, [r2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L24
	ldr	r4, .L68+4
	ldr	lr, .L68+8
	ldr	ip, .L68+12
	rsb	r0, r2, #194
.L23:
	sub	r3, r3, #48
	and	r3, r3, #255
	cmp	r3, #42
	movhi	r1, r4
	lsl	r3, r3, #1
	ldrhls	r1, [lr, r3]
	add	r3, r2, r0
	lsl	r3, r3, #1
	strh	r1, [ip, r3]	@ movhi
	ldrb	r3, [r2, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L23
.L24:
	ldr	r2, .L68+20
	ldrb	r3, [r2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L28
	rsb	r0, r2, #384
	ldr	r4, .L68+4
	ldr	lr, .L68+8
	ldr	ip, .L68+12
	add	r0, r0, #2
.L27:
	sub	r3, r3, #48
	and	r3, r3, #255
	cmp	r3, #42
	movhi	r1, r4
	lsl	r3, r3, #1
	ldrhls	r1, [lr, r3]
	add	r3, r2, r0
	lsl	r3, r3, #1
	strh	r1, [ip, r3]	@ movhi
	ldrb	r3, [r2, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L27
.L28:
	ldr	r3, .L68+24
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L67
.L31:
	ldr	r2, .L68+28
	ldrb	r3, [r2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L37
	rsb	r0, r2, #480
	ldr	r4, .L68+4
	ldr	lr, .L68+8
	ldr	ip, .L68+12
	add	r0, r0, #2
.L33:
	sub	r3, r3, #48
	and	r3, r3, #255
	cmp	r3, #42
	movhi	r1, r4
	lsl	r3, r3, #1
	ldrhls	r1, [lr, r3]
	add	r3, r2, r0
	lsl	r3, r3, #1
	strh	r1, [ip, r3]	@ movhi
	ldrb	r3, [r2, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L33
.L37:
	ldr	r2, .L68+32
	ldrb	r3, [r2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L35
	rsb	r0, r2, #576
	ldr	r4, .L68+4
	ldr	lr, .L68+8
	ldr	ip, .L68+12
	add	r0, r0, #2
.L34:
	sub	r3, r3, #48
	and	r3, r3, #255
	cmp	r3, #42
	movhi	r1, r4
	lsl	r3, r3, #1
	ldrhls	r1, [lr, r3]
	add	r3, r2, r0
	lsl	r3, r3, #1
	strh	r1, [ip, r3]	@ movhi
	ldrb	r3, [r2, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L34
.L35:
	ldr	r2, .L68+36
	ldrb	r3, [r2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L39
	ldr	r4, .L68+4
	ldr	lr, .L68+8
	ldr	ip, .L68+12
	rsb	r0, r2, #154
.L38:
	sub	r3, r3, #48
	and	r3, r3, #255
	cmp	r3, #42
	movhi	r1, r4
	lsl	r3, r3, #1
	ldrhls	r1, [lr, r3]
	add	r3, r2, r0
	lsl	r3, r3, #1
	strh	r1, [ip, r3]	@ movhi
	ldrb	r3, [r2, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L38
.L39:
	ldr	r2, .L68+40
	ldrb	r3, [r2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L21
	ldr	r4, .L68+4
	ldr	lr, .L68+8
	ldr	ip, .L68+12
	rsb	r0, r2, #250
.L41:
	sub	r3, r3, #48
	and	r3, r3, #255
	cmp	r3, #42
	movhi	r1, r4
	lsl	r3, r3, #1
	ldrhls	r1, [lr, r3]
	add	r3, r2, r0
	lsl	r3, r3, #1
	strh	r1, [ip, r3]	@ movhi
	ldrb	r3, [r2, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L41
.L21:
	pop	{r4, lr}
	bx	lr
.L67:
	ldr	r0, .L68+44
	ldr	r3, .L68+48
	mov	lr, pc
	bx	r3
	ldr	r0, .L68+12
	ldr	r1, .L68+52
	ldr	r3, [r0, #772]
	ldrh	r2, [r1]
	orr	r3, r3, #536870912
	orr	r3, r3, #8192
	orr	r2, r2, #8192
	str	r3, [r0, #772]
	strh	r2, [r1]	@ movhi
	b	.L31
.L69:
	.align	2
.L68:
	.word	healthPointBuffer
	.word	65535
	.word	.LANCHOR0
	.word	100679680
	.word	oxygen1Buffer
	.word	internalPressureBuffer
	.word	pressureDanger
	.word	externalPressureBuffer
	.word	depthBuffer
	.word	bagCapBuffer
	.word	bagPriceBuffer
	.word	.LC2
	.word	mgba_printf
	.word	100680456
	.size	drawUI, .-drawUI
	.align	2
	.global	drawGameArea1
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGameArea1, %function
drawGameArea1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L72
	mov	lr, pc
	bx	r3
	ldr	r3, .L72+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L72+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L72+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	drawUI
.L73:
	.align	2
.L72:
	.word	drawPlayer
	.word	drawFishA1
	.word	drawBobber
	.word	drawTreasure
	.size	drawGameArea1, .-drawGameArea1
	.align	2
	.global	tilePrinter
	.syntax unified
	.arm
	.fpu softvfp
	.type	tilePrinter, %function
tilePrinter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldrb	ip, [r0]	@ zero_extendqisi2
	cmp	ip, #0
	bxeq	lr
	add	r1, r1, r2, lsl #5
	lsl	r3, r3, #11
	add	r3, r3, r1, lsl #1
	str	lr, [sp, #-4]!
	ldr	r1, .L85
	ldr	lr, .L85+4
	add	r3, r3, #100663296
.L77:
	sub	ip, ip, #48
	and	ip, ip, #255
	cmp	ip, #42
	movhi	r2, lr
	lsl	ip, ip, #1
	ldrhls	r2, [r1, ip]
	strh	r2, [r3], #2	@ movhi
	ldrb	ip, [r0, #1]!	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L77
	ldr	lr, [sp], #4
	bx	lr
.L86:
	.align	2
.L85:
	.word	.LANCHOR0
	.word	65535
	.size	tilePrinter, .-tilePrinter
	.comm	hurtFrames,4,4
	.comm	totalSeconds,4,4
	.comm	totalMinutes,4,4
	.comm	frameCounter,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
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
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	CSWTCH.12, %object
	.size	CSWTCH.12, 86
CSWTCH.12:
	.short	257
	.short	259
	.short	261
	.short	263
	.short	265
	.short	267
	.short	269
	.short	271
	.short	273
	.short	275
	.short	-1
	.short	-1
	.short	-1
	.short	-1
	.short	-1
	.short	-1
	.short	-1
	.short	106
	.short	108
	.short	110
	.short	112
	.short	114
	.short	116
	.short	118
	.short	120
	.short	122
	.short	124
	.short	170
	.short	172
	.short	174
	.short	176
	.short	178
	.short	180
	.short	182
	.short	184
	.short	186
	.short	188
	.short	234
	.short	236
	.short	238
	.short	240
	.short	242
	.short	244
	.ident	"GCC: (devkitARM release 53) 9.1.0"
