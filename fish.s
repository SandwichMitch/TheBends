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
	.file	"fish.c"
	.text
	.align	2
	.global	initWildA1
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initWildA1, %function
initWildA1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, #5
	mov	r5, #36
	mov	r8, #1
	mov	r10, #16
	ldr	r4, .L6
	ldr	r7, .L6+4
	ldr	r6, .L6+8
.L2:
	mov	lr, pc
	bx	r7
	mov	r2, #0
	mov	lr, #2
	mov	ip, #15
	mov	r1, #6
	smull	r3, fp, r6, r0
	asr	r3, r0, #31
	add	fp, fp, r0
	rsb	r3, r3, fp, asr #7
	rsb	r3, r3, r3, lsl #3
	str	r5, [r4, #4]
	add	r3, r3, r3, lsl #5
	add	r5, r5, #16
	sub	r3, r0, r3
	cmp	r5, #116
	add	r0, r9, #1
	strb	r9, [r4, #76]
	str	r8, [r4, #8]
	str	r10, [r4, #16]
	str	r10, [r4, #20]
	str	r8, [r4, #44]
	str	r8, [r4, #28]
	str	r3, [r4]
	str	r2, [r4, #48]
	str	r2, [r4, #52]
	str	r2, [r4, #56]
	str	r2, [r4, #68]
	str	lr, [r4, #64]
	str	ip, [r4, #24]
	str	r1, [r4, #40]
	and	r9, r0, #255
	add	r4, r4, #80
	bne	.L2
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	wildFishArea1
	.word	rand
	.word	-1915071997
	.size	initWildA1, .-initWildA1
	.align	2
	.global	spawnFishA1
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnFishA1, %function
spawnFishA1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L26
	ldr	r6, .L26+4
	ldr	fp, .L26+8
	ldr	r10, .L26+12
	ldr	r9, .L26+16
	ldr	r8, .L26+20
	sub	sp, sp, #12
	add	r7, r4, #400
.L19:
	ldr	r5, [r4, #48]
	cmp	r5, #0
	bne	.L9
	ldr	r3, [r4, #68]
	cmp	r3, #0
	ble	.L25
.L9:
	add	r4, r4, #80
	cmp	r4, r7
	bne	.L19
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L25:
	mov	lr, pc
	bx	r6
	smull	r3, r1, fp, r0
	asr	r3, r0, #31
	rsb	r3, r3, r1, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	add	r3, r3, #1
	cmp	r3, #70
	bgt	.L10
	mov	r3, #2
	str	r5, [r4, #60]
	str	r3, [r4, #64]
.L11:
	ldr	r3, [r10, #44]
	cmp	r3, #0
	movne	r1, #4
	movne	r3, #50
	strne	r1, [r4, #60]
	ldr	r1, [r9, #4]
	strne	r3, [r4, #64]
	sub	r3, r1, #480
	sub	r3, r3, #1
	cmp	r3, r8
	bhi	.L15
	mov	r0, #2
	ldr	r3, [r4, #64]
	lsl	r3, r3, #1
	str	r3, [r4, #64]
	str	r0, [r4, #72]
.L16:
	str	r1, [sp, #4]
	mov	lr, pc
	bx	r6
	ldr	ip, .L26+24
	smull	r3, ip, r0, ip
	asr	r3, r0, #31
	rsb	r3, r3, ip, asr #1
	add	ip, r3, r3, lsl #5
	ldr	r1, [sp, #4]
	add	r3, r3, ip, lsl #1
	rsb	r3, r3, r3, lsl #2
	sub	r1, r1, #100
	sub	r3, r0, r3
	add	r3, r3, r1
	str	r3, [r4, #4]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	and	r0, r0, #1
	mov	r3, r0
	rsblt	r3, r0, #0
	mov	r1, #0
	str	r3, [r4, #28]
	mov	r3, #1
	cmp	r0, #0
	ldreq	r5, [r4, #16]
	rsbeq	r5, r5, #240
	str	r5, [r4]
	str	r3, [r4, #8]
	str	r3, [r4, #44]
	str	r3, [r4, #48]
	str	r1, [r4, #52]
	b	.L9
.L10:
	cmp	r3, #85
	bgt	.L12
	mov	r1, #1
	mov	r3, #3
	str	r1, [r4, #60]
	str	r3, [r4, #64]
	b	.L11
.L15:
	cmp	r1, #960
	movgt	r0, #7
	movle	r3, #0
	ldrgt	r3, [r4, #64]
	addgt	r3, r3, r3, lsl #1
	strgt	r3, [r4, #64]
	strgt	r0, [r4, #72]
	strle	r3, [r4, #72]
	b	.L16
.L12:
	cmp	r3, #95
	movle	r1, #2
	movle	r3, #4
	movgt	r1, #3
	movgt	r3, #5
	str	r1, [r4, #60]
	str	r3, [r4, #64]
	b	.L11
.L27:
	.align	2
.L26:
	.word	wildFishArea1
	.word	rand
	.word	1374389535
	.word	treasure
	.word	player
	.word	478
	.word	42735993
	.size	spawnFishA1, .-spawnFishA1
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Bag has a current capacity of %d, total value of %d"
	.ascii	"\000"
	.text
	.align	2
	.global	transferFish
	.syntax unified
	.arm
	.fpu softvfp
	.type	transferFish, %function
transferFish:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	ldr	r3, .L33
	ldr	r6, .L33+4
	ldr	r1, [r3]
	mov	r2, #0
	ldr	r0, .L33+8
	ldr	r3, .L33+12
	ldr	r5, [r6, #4]
	mov	lr, pc
	bx	r3
	mov	lr, #0
	ldr	r1, [r4, #64]
	ldr	r2, [r6, #8]
	ldr	r3, .L33+16
	add	r2, r1, r2
	cmp	r2, r3
	ldrgt	r3, .L33+20
	ldr	r7, [r4, #60]
	add	r5, r5, r5, lsl #2
	strgt	r3, [r6, #8]
	movgt	r2, r3
	add	r3, r6, r5, lsl #4
	str	r7, [r3, #72]
	str	r1, [r3, #76]
	ldr	r1, [r4, #56]
	str	r1, [r3, #68]
	ldr	r3, [r4, #60]
	strle	r2, [r6, #8]
	mov	ip, #1
	cmp	r3, #4
	moveq	r3, #30
	mov	r0, #60
	str	lr, [r4, #48]
	mov	lr, #0
	ldr	r1, [r6, #4]
	str	ip, [r4, #52]
	ldr	ip, .L33+24
	str	r0, [r4, #68]
	add	r1, r1, #1
	streq	r3, [r4, #68]
	ldr	r0, .L33+28
	ldr	r3, .L33+32
	str	r1, [r6, #4]
	str	lr, [ip, #56]
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	shortDing_length
	.word	basket
	.word	shortDing_data
	.word	playSoundB
	.word	998
	.word	999
	.word	bobber
	.word	.LC0
	.word	mgba_printf
	.size	transferFish, .-transferFish
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"hooked!\000"
	.align	2
.LC2:
	.ascii	"hostile fish attack!\000"
	.text
	.align	2
	.global	updateWildA1
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateWildA1, %function
updateWildA1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L79
	ldr	r4, .L79+4
	str	r2, [r3]
	ldr	r7, .L79+8
	ldr	r5, .L79+12
	ldr	r8, .L79+16
	ldr	fp, .L79+20
	ldr	r10, .L79+24
	ldr	r9, .L79+28
	sub	sp, sp, #28
	add	r6, r4, #400
.L63:
	ldr	r3, [r4, #60]
	cmp	r3, #0
	moveq	r3, #1
	streq	r3, [r4, #32]
	ldr	r3, [r4, #48]
	cmp	r3, #0
	beq	.L37
	ldr	r3, [r7, #4]
	ldr	r2, [r4, #4]
	sub	r0, r3, #80
	cmp	r2, r0
	mov	r1, #0
	movlt	r0, #60
	add	r3, r3, #80
	str	r1, [r4, #68]
	strlt	r1, [r4, #48]
	strlt	r0, [r4, #68]
	cmp	r2, r3
	movgt	r3, #60
	movgt	r1, #0
	strgt	r3, [r4, #68]
	ldr	r3, [r4]
	strgt	r1, [r4, #48]
	cmp	r3, #63
	ble	.L65
	ldr	r0, [r4, #16]
	add	ip, r3, r0
	cmp	ip, #192
	movle	ip, #0
	movgt	ip, #1
.L40:
	str	r3, [sp]
	ldr	r3, [r4, #20]
	str	r0, [sp, #8]
	str	r2, [sp, #4]
	ldr	r0, [r5, #60]
	ldr	r2, [r5]
	ldr	r1, [r5, #4]
	ldr	lr, [r5, #64]
	str	r3, [sp, #12]
	add	r0, r2, r0
	add	r2, r5, #24
	ldm	r2, {r2, r3}
	add	r1, r1, lr
	str	ip, [r4, #44]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L41
	add	r2, r5, #56
	ldmda	r2, {r2, r3}
	orr	r3, r3, r2
	cmp	r3, #0
	bne	.L41
	ldr	r3, [r9, #4]
	cmp	r3, #19
	ble	.L75
.L41:
	ldr	r3, [r4, #60]
	cmp	r3, #4
	beq	.L48
.L47:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bne	.L49
.L50:
	ldr	r2, [r4, #28]
	cmp	r2, #1
	beq	.L53
	ldr	r3, [r4]
	ldr	r1, [r4, #8]
	sub	r3, r3, r1
	cmp	r3, #0
	str	r3, [r4]
	blt	.L76
.L54:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L59
	ldr	r3, [r4, #24]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #24]
	bne	.L59
	ldr	r2, [r4, #36]
	cmp	r2, #5
	addne	r3, r2, #1
	mov	r2, #15
	str	r3, [r4, #36]
	str	r2, [r4, #24]
.L59:
	add	r4, r4, #80
	cmp	r4, r6
	bne	.L63
.L35:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L37:
	ldr	r3, [r4, #68]
	sub	r3, r3, #1
	str	r3, [r4, #68]
	b	.L59
.L65:
	mov	ip, #1
	ldr	r0, [r4, #16]
	b	.L40
.L75:
	ldr	r0, .L79+32
	mov	lr, pc
	bx	r10
	ldr	r3, [r4, #60]
	cmp	r3, #4
	movne	r3, #1
	strne	r3, [r5, #56]
	strne	r3, [r4, #52]
	beq	.L77
.L49:
	ldr	r3, [r5, #52]
	ldr	r2, [r5]
	cmp	r3, #0
	ldr	r3, [r5, #4]
	stm	r4, {r2, r3}
	beq	.L54
	mov	r0, r4
	bl	transferFish
	b	.L54
.L77:
	ldr	r3, [r7, #88]
	cmp	r3, #0
	beq	.L35
	mov	r3, #1
	str	r3, [r5, #56]
	str	r3, [r4, #52]
.L48:
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #16]
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r7, #16
	ldm	r2, {r2, r3}
	ldm	r7, {r0, r1}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L47
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bne	.L49
	ldr	r3, [r7, #92]
	cmp	r3, #0
	bne	.L50
	ldr	r2, [r7, #72]
	mov	r0, fp
	sub	r2, r2, #5
	str	r3, [sp, #20]
	str	r2, [r7, #72]
	mov	lr, pc
	bx	r10
	mov	r2, #1
	ldr	r1, [r4, #28]
	cmp	r1, r2
	str	r2, [r7, #92]
	ldr	r3, [sp, #20]
	beq	.L78
	ldr	r3, [r4, #52]
	cmp	r3, #0
	str	r2, [r4, #28]
	bne	.L49
.L53:
	ldr	r3, [r4]
	ldr	r1, [r4, #8]
	ldr	r2, [r4, #16]
	add	r3, r3, r1
	rsb	r2, r2, #240
	cmp	r3, r2
	str	r3, [r4]
	bge	.L57
	b	.L54
.L76:
	cmp	r2, #0
	bne	.L54
.L57:
	mov	r3, #0
	str	r3, [r4, #48]
	b	.L54
.L78:
	ldr	r2, [r4, #52]
	cmp	r2, #0
	str	r3, [r4, #28]
	bne	.L49
	ldr	r3, [r4]
	ldr	r2, [r4, #8]
	sub	r3, r3, r2
	cmp	r3, #0
	str	r3, [r4]
	bge	.L54
	b	.L57
.L80:
	.align	2
.L79:
	.word	activeFish
	.word	wildFishArea1
	.word	player
	.word	bobber
	.word	collision
	.word	.LC2
	.word	mgba_printf
	.word	basket
	.word	.LC1
	.size	updateWildA1, .-updateWildA1
	.align	2
	.global	initBasket
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBasket, %function
initBasket:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L82
	str	r2, [r3, #8]
	str	r2, [r3, #4]
	bx	lr
.L83:
	.align	2
.L82:
	.word	basket
	.size	initBasket, .-initBasket
	.align	2
	.global	updateBasket
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBasket, %function
updateBasket:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	updateBasket, .-updateBasket
	.align	2
	.global	initTreasure
	.syntax unified
	.arm
	.fpu softvfp
	.type	initTreasure, %function
initTreasure:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #11
	str	lr, [sp, #-4]!
	mov	r1, #0
	mov	lr, #115
	mov	r2, #8
	ldr	r3, .L87
	ldr	ip, .L87+4
	strb	r0, [r3, #76]
	str	lr, [r3]
	str	r1, [r3, #48]
	str	r1, [r3, #44]
	str	ip, [r3, #4]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	ldr	lr, [sp], #4
	bx	lr
.L88:
	.align	2
.L87:
	.word	treasure
	.word	1220
	.size	initTreasure, .-initTreasure
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"treasure being drawn at this x of %d\000"
	.text
	.align	2
	.global	updateTreasure
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateTreasure, %function
updateTreasure:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r5, .L97
	ldr	r4, .L97+4
	ldr	r3, [r5, #4]
	ldr	r2, [r4, #4]
	add	r3, r3, #119
	cmp	r3, r2
	sub	sp, sp, #20
	blt	.L90
	ldr	r3, [r4, #44]
	cmp	r3, #0
	bne	.L90
	mov	r1, #115
	mov	r2, #1
	ldr	r0, .L97+8
	ldr	r3, .L97+12
	str	r1, [r4]
	str	r2, [r4, #48]
	mov	lr, pc
	bx	r3
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #16]
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	str	r2, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r5, #16
	ldm	r5, {r0, r1}
	ldm	r2, {r2, r3}
	ldr	r5, .L97+16
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L89
	ldr	r2, .L97+20
	ldr	r1, .L97+24
	ldr	r3, [r2, #8]
	cmp	r1, r3, lsl #1
	lsl	r3, r3, #1
	ldrlt	r3, .L97+28
	str	r3, [r2, #8]
	mov	r2, #0
	mov	r3, #1
	str	r2, [r4, #48]
	str	r3, [r4, #44]
	b	.L89
.L90:
	mov	r3, #0
	str	r3, [r4, #48]
.L89:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L98:
	.align	2
.L97:
	.word	player
	.word	treasure
	.word	.LC3
	.word	mgba_printf
	.word	collision
	.word	basket
	.word	998
	.word	999
	.size	updateTreasure, .-updateTreasure
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"Treasure being drawn at %d, %d\000"
	.text
	.align	2
	.global	drawTreasure
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawTreasure, %function
drawTreasure:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L104
	ldr	r3, [r4, #48]
	cmp	r3, #0
	bne	.L103
	mov	r1, #512
	ldrb	r3, [r4, #76]	@ zero_extendqisi2
	ldr	r2, .L104+4
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	pop	{r4, lr}
	bx	lr
.L103:
	ldm	r4, {r1, r2}
	ldr	r0, .L104+8
	ldr	r3, .L104+12
	mov	lr, pc
	bx	r3
	mov	ip, #115
	mov	r0, #13
	ldr	r3, .L104+16
	ldr	r2, [r4, #4]
	ldr	lr, [r3]
	ldr	r1, .L104+4
	ldrb	r3, [r4, #76]	@ zero_extendqisi2
	sub	r2, r2, lr
	and	r2, r2, #255
	lsl	lr, r3, #3
	add	r3, r1, r3, lsl #3
	strh	r2, [r1, lr]	@ movhi
	strh	ip, [r3, #2]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L105:
	.align	2
.L104:
	.word	treasure
	.word	shadowOAM
	.word	.LC4
	.word	mgba_printf
	.word	vOff
	.size	drawTreasure, .-drawTreasure
	.align	2
	.global	drawFishA1
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFishA1, %function
drawFishA1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #512
	ldr	r2, .L130
	ldr	r1, .L130+4
	ldr	r3, .L130+8
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldrh	r4, [r2]
	ldr	lr, .L130+12
	ldr	r2, .L130+16
	ldrh	r5, [r1]
	add	r1, r3, #400
.L115:
	ldr	ip, [r3, #48]
	cmp	ip, #0
	beq	.L107
	ldr	ip, [r3, #44]
	cmp	ip, #0
	bne	.L107
	ldr	ip, [r3, #60]
	cmp	ip, #0
	ldr	r8, [r3, #28]
	bne	.L108
	ldr	ip, [r3, #36]
	ldr	r6, [r3]
	lsl	ip, ip, #1
	ldr	r9, [r3, #4]
	add	ip, ip, #193
	ldr	r10, [r3, #72]
	sub	r6, r6, r4
	lsl	ip, ip, #22
	cmp	r8, #0
	ldrb	r8, [r3, #76]	@ zero_extendqisi2
	lsr	ip, ip, #22
	sub	r9, r9, r5
	and	r6, r6, lr
	orr	ip, ip, r10, lsl #12
	and	r9, r9, #255
	add	r10, r2, r8, lsl #3
	orr	r6, r6, #16384
	lsl	r8, r8, #3
	strh	ip, [r10, #4]	@ movhi
	strh	r9, [r2, r8]	@ movhi
	strh	r6, [r10, #2]	@ movhi
	beq	.L125
.L110:
	add	r3, r3, #80
	cmp	r3, r1
	bne	.L115
.L126:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L107:
	ldrb	ip, [r3, #76]	@ zero_extendqisi2
	add	r3, r3, #80
	lsl	ip, ip, #3
	cmp	r3, r1
	strh	r0, [r2, ip]	@ movhi
	bne	.L115
	b	.L126
.L108:
	cmp	ip, #1
	beq	.L127
	cmp	ip, #2
	beq	.L128
	cmp	ip, #3
	beq	.L129
	cmp	ip, #4
	bne	.L112
	ldr	ip, [r3]
	ldr	r9, [r3, #4]
	ldr	r6, [r3, #72]
	ldrb	r10, [r3, #76]	@ zero_extendqisi2
	sub	ip, ip, r4
	and	ip, ip, lr
	sub	r9, r9, r5
	lsl	r6, r6, #12
	add	fp, r2, r10, lsl #3
	orr	ip, ip, #16384
	lsl	r10, r10, #3
	and	r9, r9, #255
	orr	r6, r6, #464
	strh	ip, [fp, #2]	@ movhi
	strh	r9, [r2, r10]	@ movhi
	strh	r6, [fp, #4]	@ movhi
	b	.L112
.L125:
	add	r3, r3, #80
	orr	r6, r6, #4096
	cmp	r3, r1
	strh	r6, [r10, #2]	@ movhi
	bne	.L115
	b	.L126
.L127:
	ldr	ip, [r3]
	ldr	r6, [r3, #4]
	ldrb	r9, [r3, #76]	@ zero_extendqisi2
	ldr	r10, [r3, #72]
	ldr	r7, .L130+20
	sub	ip, ip, r4
	and	ip, ip, lr
	sub	r6, r6, r5
	add	fp, r2, r9, lsl #3
	orr	ip, ip, #16384
	lsl	r9, r9, #3
	and	r6, r6, #255
	orr	r10, r7, r10, lsl #12
	strh	ip, [fp, #2]	@ movhi
	strh	r6, [r2, r9]	@ movhi
	strh	r10, [fp, #4]	@ movhi
.L112:
	cmp	r8, #1
	bne	.L110
	ldrb	ip, [r3, #76]	@ zero_extendqisi2
	add	ip, r2, ip, lsl #3
	ldrh	r6, [ip, #2]
	add	r3, r3, #80
	orr	r6, r6, #4096
	cmp	r3, r1
	strh	r6, [ip, #2]	@ movhi
	bne	.L115
	b	.L126
.L129:
	ldr	ip, [r3]
	ldr	r6, [r3, #4]
	ldrb	r9, [r3, #76]	@ zero_extendqisi2
	ldr	r10, [r3, #72]
	ldr	r7, .L130+24
	sub	ip, ip, r4
	and	ip, ip, lr
	sub	r6, r6, r5
	add	fp, r2, r9, lsl #3
	orr	ip, ip, #16384
	lsl	r9, r9, #3
	and	r6, r6, #255
	orr	r10, r7, r10, lsl #12
	strh	ip, [fp, #2]	@ movhi
	strh	r6, [r2, r9]	@ movhi
	strh	r10, [fp, #4]	@ movhi
	b	.L112
.L128:
	ldr	ip, [r3]
	ldr	r6, [r3, #4]
	ldrb	r9, [r3, #76]	@ zero_extendqisi2
	ldr	r10, [r3, #72]
	ldr	r7, .L130+28
	sub	ip, ip, r4
	and	ip, ip, lr
	sub	r6, r6, r5
	add	fp, r2, r9, lsl #3
	orr	ip, ip, #16384
	lsl	r9, r9, #3
	and	r6, r6, #255
	orr	r10, r7, r10, lsl #12
	strh	ip, [fp, #2]	@ movhi
	strh	r6, [r2, r9]	@ movhi
	strh	r10, [fp, #4]	@ movhi
	b	.L112
.L131:
	.align	2
.L130:
	.word	hOff
	.word	vOff
	.word	wildFishArea1
	.word	511
	.word	shadowOAM
	.word	263
	.word	323
	.word	259
	.size	drawFishA1, .-drawFishA1
	.comm	activeFish,4,4
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
	.comm	basket,1612,4
	.comm	treasure,80,4
	.comm	wildFishArea1,400,4
	.comm	fishType,1,1
	.comm	fishSize,1,1
	.comm	direction,1,1
	.ident	"GCC: (devkitARM release 53) 9.1.0"
