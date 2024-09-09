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
	.file	"state.c"
	.text
	.align	2
	.global	interruptHandler
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L17
	ldrh	r1, [r3, #2]
	tst	r1, #1
	push	{r4, lr}
	strh	r2, [r3, #8]	@ movhi
	beq	.L3
	ldr	r3, .L17+4
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L5
	ldr	r2, [r3, #28]
	ldr	r1, [r3, #20]
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #28]
	blt	.L5
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L15
	ldr	r1, .L17+8
	ldr	r0, .L17+12
	ldr	r1, [r1]
	strh	r2, [r0, #2]	@ movhi
	str	r2, [r3, #12]
	str	r2, [r1, #20]
.L5:
	ldr	r3, .L17+16
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L3
	ldr	r2, [r3, #28]
	ldr	r1, [r3, #20]
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #28]
	blt	.L3
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L16
	ldr	r1, .L17+8
	ldr	r0, .L17+12
	ldr	r1, [r1]
	strh	r2, [r0, #6]	@ movhi
	str	r2, [r3, #12]
	str	r2, [r1, #32]
.L3:
	mov	r1, #1
	ldr	r3, .L17
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L15:
	ldm	r3, {r0, r1}
	ldr	r3, .L17+20
	mov	lr, pc
	bx	r3
	b	.L5
.L16:
	ldm	r3, {r0, r1}
	ldr	r3, .L17+24
	mov	lr, pc
	bx	r3
	b	.L3
.L18:
	.align	2
.L17:
	.word	67109376
	.word	soundA
	.word	dma
	.word	67109120
	.word	soundB
	.word	playSoundA
	.word	playSoundB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	push	{r4, r5, r6, lr}
	mov	r4, #0
	ldr	r1, .L21
	mov	r3, #256
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	ldr	r1, .L21+4
	mov	r2, #83886080
	ldr	r5, .L21+8
	mov	lr, pc
	bx	r5
	ldr	r2, .L21+12
	ldr	r0, .L21+16
	ldr	r3, .L21+20
	str	r4, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L21+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L21+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L21+32
	strb	r4, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	1044
	.word	finalprojectstartscreenPal
	.word	DMANow
	.word	won
	.word	finalprojectstartscreenBitmap
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	r3, .L25
	mov	lr, pc
	bx	r3
	ldr	r3, .L25+4
	ldr	r1, .L25+8
	ldrh	r0, [r3, #48]
	ldr	r2, .L25+12
	ldr	r3, .L25+16
	strh	r0, [r1]	@ movhi
	strh	r4, [r2]	@ movhi
	str	r4, [r3]
	bl	goToStart
	ldr	r3, .L25+20
	mov	lr, pc
	bx	r3
	mov	r2, #1
	mov	r0, #67108864
	mov	ip, #8
	ldr	r3, .L25+24
	ldr	r1, .L25+28
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r2, .L25+32
	ldr	r3, .L25+36
	strh	ip, [r0, #4]	@ movhi
	str	r2, [r1, #4092]
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	mgba_open
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	rSeed
	.word	setupSounds
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.word	cheatActive
	.size	initialize, .-initialize
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r1, .L29
	push	{r4, lr}
	mov	r3, #256
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L29+4
	ldr	r4, .L29+8
	mov	lr, pc
	bx	r4
	ldr	r0, .L29+12
	ldr	r3, .L29+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L29+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L29+24
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L29+28
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	1044
	.word	instructions2Pal
	.word	DMANow
	.word	instructions2Bitmap
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	updateLobby
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateLobby, %function
updateLobby:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L33
	ldr	r0, .L33+4
	ldr	r3, [r1]
	ldr	r2, [r0]
	add	r3, r3, #1
	add	r2, r2, #3
	cmp	r3, #5
	str	r3, [r1]
	str	r2, [r0]
	bxne	lr
	mov	r0, #0
	ldr	r2, .L33+8
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	str	r0, [r1]
	bx	lr
.L34:
	.align	2
.L33:
	.word	lobbyFrameCounter
	.word	waveHOff
	.word	skyHOff
	.size	updateLobby, .-updateLobby
	.align	2
	.global	drawLobby
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLobby, %function
drawLobby:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r3, .L39
	ldrh	r1, [r3]
	ldr	r3, .L39+4
	push	{r4, lr}
	strh	r1, [r2, #16]	@ movhi
	ldrh	r1, [r3]
	ldr	r0, .L39+8
	strh	r1, [r2, #24]	@ movhi
	mov	r3, #28
	mov	r2, #1
	mov	r1, #10
	ldr	r4, .L39+12
	mov	lr, pc
	bx	r4
	mov	r2, #3
	mov	r3, #28
	mov	r1, #11
	ldr	r0, .L39+16
	mov	lr, pc
	bx	r4
	mov	r2, #0
.L36:
	lsl	r3, r2, #1
	add	r3, r3, #100663296
	add	r3, r3, #57344
	ldrh	r1, [r3]
	add	r2, r2, #1
	orr	r1, r1, #8192
	cmp	r2, #1024
	strh	r1, [r3]	@ movhi
	bne	.L36
	pop	{r4, lr}
	bx	lr
.L40:
	.align	2
.L39:
	.word	waveHOff
	.word	skyHOff
	.word	highScoreBuffer
	.word	tilePrinter
	.word	scoreBuffer
	.size	drawLobby, .-drawLobby
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"cheat disabledd\000"
	.align	2
.LC1:
	.ascii	"cheat enabled\000"
	.text
	.align	2
	.global	lobby
	.syntax unified
	.arm
	.fpu softvfp
	.type	lobby, %function
lobby:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L54
	ldr	r3, .L54+4
	mov	lr, pc
	bx	r3
	bl	updateLobby
	bl	drawLobby
	ldrh	r3, [r5]
	tst	r3, #2
	beq	.L42
	ldr	r2, .L54+8
	ldrh	r2, [r2]
	ands	r4, r2, #2
	beq	.L52
.L42:
	tst	r3, #8
	beq	.L41
	ldr	r3, .L54+8
	ldrh	r3, [r3]
	ands	r4, r3, #8
	beq	.L53
.L41:
	pop	{r4, r5, r6, lr}
	bx	lr
.L53:
	ldr	r2, .L54+12
	ldr	r3, .L54+16
	ldr	r0, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldr	r2, .L54+20
	strh	r4, [r3, #16]	@ movhi
	strh	r4, [r3, #18]	@ movhi
	strh	r4, [r3, #20]	@ movhi
	strh	r4, [r3, #22]	@ movhi
	mov	lr, pc
	bx	r2
	ldr	r3, .L54+24
	mov	lr, pc
	bx	r3
	mov	r0, #3
	ldr	r1, .L54+28
	ldr	r2, .L54+32
	ldr	r3, .L54+36
	strb	r0, [r1]
	str	r4, [r2]
	str	r4, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L52:
	ldr	r3, .L54+40
	ldr	r6, .L54+44
	ldr	r1, [r3]
	mov	r2, r4
	ldr	r3, .L54+48
	ldr	r0, .L54+52
	mov	lr, pc
	bx	r3
	ldr	r3, [r6]
	cmp	r3, #0
	beq	.L43
	ldr	r3, .L54+56
	ldr	r0, .L54+60
	mov	lr, pc
	bx	r3
	str	r4, [r6]
	ldrh	r3, [r5]
	b	.L42
.L43:
	ldr	r3, .L54+56
	ldr	r0, .L54+64
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldrh	r3, [r5]
	str	r2, [r6]
	b	.L42
.L55:
	.align	2
.L54:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	rSeed
	.word	srand
	.word	initArea1
	.word	initGame
	.word	state
	.word	died
	.word	score
	.word	shortDing_length
	.word	cheatActive
	.word	playSoundB
	.word	shortDing_data
	.word	mgba_printf
	.word	.LC0
	.word	.LC1
	.size	lobby, .-lobby
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"Score is %d\000"
	.align	2
.LC3:
	.ascii	"High score before is %d\000"
	.align	2
.LC4:
	.ascii	"new high score!\000"
	.align	2
.LC5:
	.ascii	"high score is now %d\000"
	.align	2
.LC6:
	.ascii	"%03d\000"
	.text
	.align	2
	.global	goToLobby
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLobby, %function
goToLobby:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	ip, #67108864
	mov	lr, #3840
	mov	r4, #0
	ldr	r3, .L64
	ldr	r2, .L64+4
	ldr	r1, .L64+8
	ldr	r0, .L64+12
	strh	lr, [ip]	@ movhi
	ldr	r5, .L64+16
	strh	r3, [ip, #10]	@ movhi
	strh	r2, [ip, #8]	@ movhi
	mov	r3, #256
	strh	r1, [ip, #12]	@ movhi
	mov	r2, #83886080
	strh	r0, [ip, #14]	@ movhi
	ldr	r1, .L64+20
	strh	r4, [ip, #16]	@ movhi
	mov	r0, #3
	strh	r4, [ip, #18]	@ movhi
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L64+24
	ldr	r1, .L64+28
	mov	lr, pc
	bx	r5
	mov	r2, #83886080
	mvn	r1, #32768
	mov	r3, #8192
	strh	r1, [r2, #68]	@ movhi
	mov	r0, #3
	ldr	r2, .L64+32
	ldr	r1, .L64+36
	mov	lr, pc
	bx	r5
	mov	r3, #8192
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L64+40
	mov	lr, pc
	bx	r5
	mov	r3, #8192
	mov	r0, #3
	ldr	r2, .L64+44
	ldr	r1, .L64+48
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L64+52
	ldr	r1, .L64+56
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L64+60
	ldr	r1, .L64+64
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L64+68
	ldr	r1, .L64+72
	mov	lr, pc
	bx	r5
	ldr	r2, .L64+76
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L64+80
	mov	lr, pc
	bx	r5
	mov	r2, r4
.L57:
	lsl	r3, r2, #1
	add	r3, r3, #100663296
	add	r0, r3, #49152
	ldrh	r1, [r0]
	orr	r1, r1, #4096
	strh	r1, [r0]	@ movhi
	add	r3, r3, #57344
	ldrh	r1, [r3]
	add	r2, r2, #1
	orr	r1, r1, #8192
	cmp	r2, #1024
	strh	r1, [r3]	@ movhi
	bne	.L57
	mov	r1, #0
	ldr	r3, .L64+84
	ldr	ip, [r3]
	ldr	r3, .L64+88
	cmp	ip, r1
	str	r1, [r3]
	ldr	r2, .L64+92
	ldreq	r3, .L64+96
	ldr	r0, .L64+100
	str	r1, [r2]
	str	r1, [r0]
	ldr	r6, .L64+104
	ldreq	r1, [r3, #8]
	ldr	r4, .L64+108
	ldr	r0, .L64+112
	ldr	r5, .L64+116
	str	r1, [r6]
	mov	lr, pc
	bx	r5
	ldr	r1, [r4]
	ldr	r0, .L64+120
	mov	lr, pc
	bx	r5
	ldr	r3, [r6]
	ldr	r1, [r4]
	cmp	r3, r1
	bgt	.L63
.L59:
	ldr	r0, .L64+124
	mov	lr, pc
	bx	r5
	ldr	r5, .L64+128
	ldr	r2, [r6]
	ldr	r1, .L64+132
	ldr	r0, .L64+136
	mov	lr, pc
	bx	r5
	ldr	r2, [r4]
	ldr	r1, .L64+132
	ldr	r0, .L64+140
	mov	lr, pc
	bx	r5
	mov	r2, #2
	ldr	r3, .L64+144
	strb	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L63:
	ldr	r0, .L64+148
	str	r3, [r4]
	mov	lr, pc
	bx	r5
	ldr	r1, [r4]
	b	.L59
.L65:
	.align	2
.L64:
	.word	6917
	.word	6660
	.word	6147
	.word	7178
	.word	DMANow
	.word	boatwaveTSPal
	.word	83886112
	.word	lobbybgTSPal
	.word	100679680
	.word	boatwaveTSTiles
	.word	lobbybgTSTiles
	.word	100696064
	.word	finalprojecttilesheetM3Tiles
	.word	100712448
	.word	lobbybgTM2Map
	.word	100718592
	.word	boatbgTM3Map
	.word	100716544
	.word	wavebg3TMMap
	.word	100720640
	.word	lobbyUITMMap
	.word	died
	.word	skyHOff
	.word	waveHOff
	.word	basket
	.word	lobbyFrameCounter
	.word	score
	.word	.LANCHOR0
	.word	.LC2
	.word	mgba_printf
	.word	.LC3
	.word	.LC5
	.word	sprintf
	.word	.LC6
	.word	scoreBuffer
	.word	highScoreBuffer
	.word	state
	.word	.LC4
	.size	goToLobby, .-goToLobby
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L78
	ldr	ip, [r4]
	mov	r2, #83886080
	add	ip, ip, #1
	ldr	r1, .L78+4
	mov	r3, #256
	mov	r0, #3
	ldr	r5, .L78+8
	str	ip, [r4]
	mov	lr, pc
	bx	r5
	ldr	r0, .L78+12
	ldr	r3, .L78+16
	mov	lr, pc
	bx	r3
	ldr	r5, .L78+20
	ldr	r3, .L78+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L78+28
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L67
	ldr	r2, .L78+32
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L76
.L67:
	tst	r3, #4
	beq	.L66
	ldr	r3, .L78+32
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L77
.L66:
	pop	{r4, r5, r6, lr}
	bx	lr
.L77:
	pop	{r4, r5, r6, lr}
	b	goToInstructions
.L76:
	ldr	r3, .L78+36
	ldr	r0, [r4]
	mov	lr, pc
	bx	r3
	bl	goToLobby
	ldrh	r3, [r5]
	b	.L67
.L79:
	.align	2
.L78:
	.word	rSeed
	.word	finalprojectstartscreenPal
	.word	DMANow
	.word	finalprojectstartscreenBitmap
	.word	drawFullscreenImage4
	.word	oldButtons
	.word	waitForVBlank
	.word	flipPage
	.word	buttons
	.word	srand
	.size	start, .-start
	.align	2
	.global	goToGameArea1
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGameArea1, %function
goToGameArea1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L82
	mov	lr, pc
	bx	r3
	mov	r1, #3
	mov	r3, #0
	ldr	r2, .L82+4
	ldr	ip, .L82+8
	ldr	r0, .L82+12
	strb	r1, [r2]
	str	r3, [ip]
	str	r3, [r0]
	pop	{r4, lr}
	bx	lr
.L83:
	.align	2
.L82:
	.word	initGame
	.word	state
	.word	died
	.word	score
	.size	goToGameArea1, .-goToGameArea1
	.align	2
	.global	gameArea2
	.syntax unified
	.arm
	.fpu softvfp
	.type	gameArea2, %function
gameArea2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	gameArea2, .-gameArea2
	.align	2
	.global	goToGameArea2
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGameArea2, %function
goToGameArea2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #4
	ldr	r3, .L86
	strb	r2, [r3]
	bx	lr
.L87:
	.align	2
.L86:
	.word	state
	.size	goToGameArea2, .-goToGameArea2
	.align	2
	.global	gameArea3
	.syntax unified
	.arm
	.fpu softvfp
	.type	gameArea3, %function
gameArea3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	gameArea3, .-gameArea3
	.align	2
	.global	goToGameArea3
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGameArea3, %function
goToGameArea3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #5
	ldr	r3, .L90
	strb	r2, [r3]
	bx	lr
.L91:
	.align	2
.L90:
	.word	state
	.size	goToGameArea3, .-goToGameArea3
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	ldr	r2, .L104
	push	{r4, r5, r6, lr}
	ldr	r0, .L104+4
	strh	r2, [r3]	@ movhi
	ldr	r3, .L104+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L104+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L104+16
	mov	lr, pc
	bx	r3
	mov	r1, #6
	ldr	r5, .L104+20
	ldrh	r3, [r5]
	ldr	r2, .L104+24
	tst	r3, #8
	str	r1, [r2]
	beq	.L93
	ldr	r2, .L104+28
	ldrh	r2, [r2]
	ands	r4, r2, #8
	beq	.L102
.L93:
	tst	r3, #4
	beq	.L92
	ldr	r3, .L104+28
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L103
.L92:
	pop	{r4, r5, r6, lr}
	bx	lr
.L103:
	pop	{r4, r5, r6, lr}
	b	goToInstructions
.L102:
	ldr	r3, .L104+32
	mov	lr, pc
	bx	r3
	mov	ip, #3
	ldr	r0, .L104+36
	ldr	r1, .L104+40
	ldr	r2, .L104+44
	ldrh	r3, [r5]
	strb	ip, [r0]
	str	r4, [r1]
	str	r4, [r2]
	b	.L93
.L105:
	.align	2
.L104:
	.word	1044
	.word	pauseScreenBitmap
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	flipPage
	.word	oldButtons
	.word	oldState
	.word	buttons
	.word	initGame
	.word	state
	.word	died
	.word	score
	.size	pause, .-pause
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r1, .L108
	push	{r4, lr}
	mov	r3, #256
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L108+4
	ldr	r4, .L108+8
	mov	lr, pc
	bx	r4
	ldr	r0, .L108+12
	ldr	r3, .L108+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L108+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L108+24
	mov	lr, pc
	bx	r3
	mov	r2, #6
	ldr	r3, .L108+28
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L109:
	.align	2
.L108:
	.word	1044
	.word	pauseScreenPal
	.word	DMANow
	.word	pauseScreenBitmap
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r0, .L124
	ldr	r3, .L124+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L124+8
	ldr	r3, .L124+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L124+16
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L110
	ldr	r5, .L124+20
	ldrh	r3, [r5]
	tst	r3, #4
	bne	.L110
	ldr	r6, .L124+24
	ldr	r3, [r6]
	cmp	r3, #6
	bne	.L122
	ldr	r3, [r6]
	cmp	r3, #6
	beq	.L123
.L110:
	pop	{r4, r5, r6, lr}
	bx	lr
.L122:
	bl	goToStart
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L110
	ldrh	r3, [r5]
	tst	r3, #4
	bne	.L110
	ldr	r3, [r6]
	cmp	r3, #6
	bne	.L110
.L123:
	pop	{r4, r5, r6, lr}
	b	goToPause
.L125:
	.align	2
.L124:
	.word	instructions2Bitmap
	.word	drawFullscreenImage4
	.word	oldButtons
	.word	waitForVBlank
	.word	flipPage
	.word	buttons
	.word	oldState
	.size	instructions, .-instructions
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L133
	ldr	r4, .L133+4
	mov	lr, pc
	bx	r4
	mov	r1, #1
	ldr	r3, .L133+8
	ldr	ip, .L133+12
	ldr	lr, [r3, #8]
	ldr	r2, .L133+16
	ldr	r0, .L133+20
	ldr	r3, .L133+24
	str	lr, [ip]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L133+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L133+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L133+36
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L126
	ldr	r3, .L133+40
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L132
.L126:
	pop	{r4, lr}
	bx	lr
.L132:
	pop	{r4, lr}
	b	goToStart
.L134:
	.align	2
.L133:
	.word	winScreenPal
	.word	DMANow
	.word	basket
	.word	score
	.word	won
	.word	winScreenBitmap
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	flipPage
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r1, .L137
	push	{r4, lr}
	mov	r3, #256
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L137+4
	ldr	r4, .L137+8
	mov	lr, pc
	bx	r4
	ldr	r3, .L137+12
	ldr	r2, .L137+16
	ldr	r1, [r3, #8]
	ldr	r0, .L137+20
	ldr	r3, .L137+24
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L137+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L137+32
	mov	lr, pc
	bx	r3
	mov	r2, #7
	ldr	r3, .L137+36
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L138:
	.align	2
.L137:
	.word	1044
	.word	winScreenPal
	.word	DMANow
	.word	basket
	.word	score
	.word	winScreenBitmap
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	gameArea1
	.syntax unified
	.arm
	.fpu softvfp
	.type	gameArea1, %function
gameArea1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L151
	mov	lr, pc
	bx	r3
	ldr	r3, .L151+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L151+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L151+12
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L151+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L151+20
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L149
.L140:
	ldr	r3, .L151+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L139
	ldr	r3, .L151+28
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L150
.L139:
	pop	{r4, lr}
	bx	lr
.L149:
	bl	goToWin
	b	.L140
.L150:
	pop	{r4, lr}
	b	goToPause
.L152:
	.align	2
.L151:
	.word	updateGameArea1
	.word	drawGameArea1
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	won
	.word	oldButtons
	.word	buttons
	.size	gameArea1, .-gameArea1
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r1, .L155
	push	{r4, lr}
	mov	r3, #256
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L155+4
	ldr	r4, .L155+8
	mov	lr, pc
	bx	r4
	mov	r1, #1
	ldr	r2, .L155+12
	ldr	r0, .L155+16
	ldr	r3, .L155+20
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L155+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L155+28
	mov	lr, pc
	bx	r3
	mov	r2, #8
	ldr	r3, .L155+32
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L156:
	.align	2
.L155:
	.word	1044
	.word	loseScreenPal
	.word	DMANow
	.word	died
	.word	loseScreenBitmap
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L164
	ldr	r3, .L164+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L164+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L164+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L164+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L157
	ldr	r3, .L164+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L163
.L157:
	pop	{r4, lr}
	bx	lr
.L163:
	pop	{r4, lr}
	b	goToStart
.L165:
	.align	2
.L164:
	.word	loseScreenBitmap
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	flipPage
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.align	2
	.global	setupInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #1
	mov	lr, #8
	mov	ip, #67108864
	ldr	r3, .L168
	ldr	r1, .L168+4
	ldr	r0, .L168+8
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	strh	lr, [ip, #4]	@ movhi
	str	r0, [r1, #4092]
	ldr	lr, [sp], #4
	bx	lr
.L169:
	.align	2
.L168:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.comm	highScoreBuffer,3,4
	.comm	scoreBuffer,3,4
	.global	highScore
	.comm	score,4,4
	.comm	cheatActive,4,4
	.comm	oldState,4,4
	.comm	lobbyFrameCounter,4,4
	.comm	skyHOff,4,4
	.comm	waveHOff,4,4
	.comm	died,4,4
	.comm	won,4,4
	.comm	basket,1612,4
	.comm	treasure,80,4
	.comm	wildFishArea1,400,4
	.comm	fishType,1,1
	.comm	fishSize,1,1
	.comm	direction,1,1
	.comm	soundB,32,4
	.comm	soundA,32,4
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
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	highScore, %object
	.size	highScore, 4
highScore:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
