	.cpu arm7tdmi
	.arch armv4t
	.fpu softvfp
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
	.global	initPlayer
	.syntax unified
	.arm
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #117
	str	fp, [sp, #-4]!
	mov	r1, #154
	mov	fp, #0
	mov	ip, #35
	mov	r0, #5
	ldr	r3, .L4
	str	r2, [r3]
	str	r2, [r3, #8]
	ldr	r2, .L4+4
	str	fp, [r3, #16]
	str	ip, [r3, #20]
	str	r0, [r3, #24]
	str	r1, [r3, #4]
	str	r1, [r3, #12]
	strh	r2, [r3, #28]	@ movhi
	ldr	fp, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	.LANCHOR0
	.word	19327
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initBall
	.syntax unified
	.arm
	.type	initBall, %function
initBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #128
	mov	r3, #150
	push	{r4, lr}
	ldr	r4, .L10
	ldr	r1, .L10+4
	str	r2, [r4, #32]
	str	r3, [r4, #36]
	str	r2, [r4, #40]
	str	r3, [r4, #44]
	mov	lr, pc
	bx	r1
	ands	r0, r0, #1
	mov	r3, #3
	mvn	r2, #2
	mvneq	r0, #0
	ldr	r1, .L10+8
	str	r2, [r4, #52]
	strh	r1, [r4, #64]	@ movhi
	str	r3, [r4, #60]
	str	r3, [r4, #56]
	str	r0, [r4, #48]
	pop	{r4, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	.LANCHOR0
	.word	rand
	.word	28274
	.size	initBall, .-initBall
	.align	2
	.global	initBlocks
	.syntax unified
	.arm
	.type	initBlocks, %function
initBlocks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r7, .L26
	mov	r1, #0
	mov	r2, r7
	mov	r4, #36
	mov	lr, #4
	mov	ip, #1
	ldr	r6, .L26+4
	ldr	r5, .L26+8
.L13:
	umull	r0, r3, r5, r1
	and	r0, r1, #7
	lsl	r0, r0, #1
	lsr	r3, r3, #2
	ldrh	r0, [r6, r0]
	add	r3, r3, r3, lsl #1
	add	r1, r1, #1
	lsl	r3, r3, #1
	str	r4, [r2, #20]
	str	lr, [r2, #24]
	strh	r0, [r2, #28]	@ movhi
	str	ip, [r2, #32]
	add	r3, r3, #10
	cmp	r1, #30
	add	r2, r2, #40
	str	r3, [r2, #-36]
	bne	.L13
	mov	r1, r7
	mov	r2, #0
.L14:
	ldr	r0, [r1, #20]
	lsl	r3, r2, #2
	mla	r3, r0, r2, r3
	add	r2, r2, #1
	add	r3, r3, #2
	cmp	r2, #6
	str	r3, [r1], #40
	bne	.L14
	mov	r1, r7
	mov	r2, #0
.L15:
	ldr	r0, [r1, #260]
	lsl	r3, r2, #2
	mla	r3, r0, r2, r3
	add	r2, r2, #1
	add	r1, r1, #40
	add	r3, r3, #2
	cmp	r2, #6
	str	r3, [r1, #200]
	bne	.L15
	mov	r1, r7
	mov	r2, #0
.L16:
	ldr	r0, [r1, #500]
	lsl	r3, r2, #2
	mla	r3, r0, r2, r3
	add	r2, r2, #1
	add	r1, r1, #40
	add	r3, r3, #2
	cmp	r2, #6
	str	r3, [r1, #440]
	bne	.L16
	mov	r1, r7
	mov	r2, #0
.L17:
	ldr	r0, [r1, #740]
	lsl	r3, r2, #2
	mla	r3, r0, r2, r3
	add	r2, r2, #1
	add	r1, r1, #40
	add	r3, r3, #2
	cmp	r2, #6
	str	r3, [r1, #680]
	bne	.L17
	mov	r2, #0
.L18:
	ldr	r1, [r7, #980]
	lsl	r3, r2, #2
	mla	r3, r1, r2, r3
	add	r2, r2, #1
	add	r7, r7, #40
	add	r3, r3, #2
	cmp	r2, #6
	str	r3, [r7, #920]
	bne	.L18
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	.LANCHOR0+72
	.word	.LANCHOR1
	.word	-1431655765
	.size	initBlocks, .-initBlocks
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #154
	push	{r4, lr}
	ldr	r4, .L32
	mov	r1, #117
	str	r0, [r4, #4]
	str	r0, [r4, #12]
	mov	r0, #5
	mov	r3, #128
	mov	r2, #150
	str	r1, [r4]
	str	r1, [r4, #8]
	str	r0, [r4, #24]
	mov	r1, #35
	mov	ip, #0
	mov	r0, #0
	str	r3, [r4, #32]
	str	r3, [r4, #40]
	ldr	r3, .L32+4
	str	r2, [r4, #36]
	str	r2, [r4, #44]
	ldr	r2, .L32+8
	str	r0, [r4, #16]
	str	r1, [r4, #20]
	strh	r3, [r4, #28]	@ movhi
	str	ip, [r4, #1272]
	mov	lr, pc
	bx	r2
	ands	r0, r0, #1
	mov	r3, #3
	mvn	r2, #2
	mvneq	r0, #0
	ldr	r1, .L32+12
	str	r2, [r4, #52]
	strh	r1, [r4, #64]	@ movhi
	str	r3, [r4, #60]
	str	r3, [r4, #56]
	str	r0, [r4, #48]
	pop	{r4, lr}
	b	initBlocks
.L33:
	.align	2
.L32:
	.word	.LANCHOR0
	.word	19327
	.word	rand
	.word	28274
	.size	initGame, .-initGame
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L39
	ldrh	r3, [r3]
	ldr	r2, .L39+4
	tst	r3, #32
	ldr	r1, [r2]
	bne	.L35
	cmp	r1, #1
	mvngt	r3, #2
	addgt	r0, r1, r3
	ble	.L35
.L36:
	str	r3, [r2, #16]
	str	r1, [r2, #8]
	str	r0, [r2]
	bx	lr
.L35:
	ands	r3, r3, #16
	movne	r0, r1
	movne	r3, #0
	bne	.L36
	ldr	r0, [r2, #20]
	add	r0, r1, r0
	cmp	r0, #238
	movle	r3, #3
	addle	r0, r1, r3
	movgt	r0, r1
	b	.L36
.L40:
	.align	2
.L39:
	.word	buttons
	.word	.LANCHOR0
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateBall
	.syntax unified
	.arm
	.type	updateBall, %function
updateBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L50
	ldr	r1, [r4, #36]
	cmp	r1, #10
	movle	r3, #2
	sub	sp, sp, #20
	strle	r3, [r4, #52]
	ldr	r3, [r4, #60]
	add	r2, r1, r3
	cmp	r2, #158
	mvngt	r0, #1
	mvngt	r2, #0
	strgt	r0, [r4, #52]
	ldr	r0, [r4, #32]
	strgt	r2, [r4, #1272]
	cmp	r0, #1
	movle	r2, #1
	strle	r2, [r4, #48]
	ldr	r2, [r4, #56]
	add	ip, r0, r2
	cmp	ip, #238
	mvngt	ip, #0
	strgt	ip, [r4, #48]
	ldr	ip, [r4, #20]
	add	ip, ip, ip, lsr #31
	asr	ip, ip, #1
	str	ip, [sp, #8]
	ldr	ip, [r4, #24]
	str	ip, [sp, #12]
	ldr	ip, [r4, #4]
	str	ip, [sp, #4]
	ldr	ip, [r4]
	ldr	r5, .L50+4
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L46
	mvn	r2, #0
	mov	r1, r2
	ldr	r3, [r4, #52]
	rsb	r3, r3, #0
	str	r3, [r4, #52]
	str	r2, [r4, #48]
.L47:
	ldr	r2, [r4, #36]
	add	r2, r2, r3
	ldr	r3, [r4, #32]
	add	r3, r3, r1
	add	r1, r4, #32
	ldmia	r1, {r0-r1}
	str	r2, [r4, #36]
	str	r0, [r4, #40]
	str	r1, [r4, #44]
	str	r3, [r4, #32]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L46:
	ldr	r1, [r4, #24]
	ldr	r3, [r4, #20]
	ldr	r2, [r4]
	str	r1, [sp, #12]
	add	r3, r3, r3, lsr #31
	ldr	r1, [r4, #4]
	asr	r3, r3, #1
	stmib	sp, {r1, r3}
	add	r2, r3, r2
	str	r2, [sp]
	add	r0, r4, #32
	add	r2, r4, #56
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	movne	r2, #1
	ldr	r3, [r4, #52]
	rsbne	r3, r3, #0
	movne	r1, r2
	ldreq	r1, [r4, #48]
	strne	r3, [r4, #52]
	strne	r2, [r4, #48]
	b	.L47
.L51:
	.align	2
.L50:
	.word	.LANCHOR0
	.word	collision
	.size	updateBall, .-updateBall
	.align	2
	.global	updateBlocks
	.syntax unified
	.arm
	.type	updateBlocks, %function
updateBlocks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L68
	mov	r8, #0
	mov	r9, #1
	ldr	r10, .L68+4
	sub	sp, sp, #16
	add	r7, r4, #1200
	sub	r6, r4, #72
	b	.L58
.L54:
	add	r4, r4, #40
	cmp	r4, r7
	beq	.L67
.L58:
	ldr	r5, [r4, #32]
	cmp	r5, #1
	bne	.L54
	ldr	r0, [r4, #24]
	ldr	r1, [r4, #20]
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	str	r0, [sp, #12]
	str	r2, [sp, #4]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r6, #56
	add	r0, r6, #32
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	beq	.L54
	ldr	r3, [r4, #20]
	ldr	r1, [r4, #24]
	add	r3, r3, r3, lsr #31
	asr	r3, r3, #1
	ldr	r2, [r4, #4]
	str	r1, [sp, #12]
	str	r3, [sp, #8]
	ldr	r3, [r4]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r6, #56
	add	r0, r6, #32
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	beq	.L56
	mvn	r2, #0
	ldr	r3, [r6, #52]
	rsb	r3, r3, #0
	str	r3, [r6, #52]
	str	r2, [r6, #48]
.L57:
	ldr	r3, [r6, #1272]
	str	r8, [r4, #32]
	str	r9, [r4, #36]
	add	r4, r4, #40
	add	r3, r3, #1
	cmp	r4, r7
	str	r3, [r6, #1272]
	bne	.L58
.L67:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L56:
	ldr	r3, [r4, #20]
	add	r3, r3, r3, lsr #31
	asr	r3, r3, #1
	str	r3, [sp, #8]
	ldr	r2, [r4]
	add	r3, r3, r2
	str	r3, [sp]
	ldr	r3, [r4, #24]
	str	r3, [sp, #12]
	ldr	r3, [r4, #4]
	str	r3, [sp, #4]
	add	r2, r6, #56
	add	r0, r6, #32
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	ldrne	r3, [r6, #52]
	rsbne	r3, r3, #0
	strne	r5, [r6, #48]
	strne	r3, [r6, #52]
	b	.L57
.L69:
	.align	2
.L68:
	.word	.LANCHOR0+72
	.word	collision
	.size	updateBlocks, .-updateBlocks
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updatePlayer
	bl	updateBall
	bl	updateBlocks
	ldr	r1, .L80
	ldr	r2, [r1, #1272]
	cmp	r2, #0
	ble	.L71
	ldr	r0, .L80+4
	smull	ip, r0, r2, r0
	asr	r3, r2, #31
	rsb	r3, r3, r0, asr #1
	add	r3, r3, r3, lsl #2
	cmp	r2, r3
	beq	.L79
.L71:
	mov	r3, #0
	str	r3, [r1, #1276]
.L70:
	pop	{r4, lr}
	bx	lr
.L79:
	ldr	r3, [r1, #1276]
	cmp	r3, #0
	bne	.L70
	mov	ip, #1
	add	r0, r1, #72
	mov	r2, r0
	str	ip, [r1, #1276]
	b	.L75
.L74:
	add	r3, r3, #1
	cmp	r3, #30
	beq	.L70
.L75:
	ldr	r1, [r2, #32]
	cmp	r1, #0
	add	r2, r2, #40
	bne	.L74
	mov	r1, #1
	mov	r2, #0
	add	r3, r3, r3, lsl #2
	add	r0, r0, r3, lsl #3
	str	r1, [r0, #32]
	str	r2, [r0, #36]
	b	.L70
.L81:
	.align	2
.L80:
	.word	.LANCHOR0
	.word	1717986919
	.size	updateGame, .-updateGame
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r2, .L84
	ldr	r4, .L84+4
	sub	sp, sp, #12
	ldr	r3, [r4, #24]
	str	r2, [sp]
	add	r0, r4, #8
	ldr	r2, [r4, #20]
	ldr	r5, .L84+8
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #28]
	ldr	r3, [r4, #24]
	str	r2, [sp]
	ldr	r2, [r4, #20]
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L85:
	.align	2
.L84:
	.word	31676
	.word	.LANCHOR0
	.word	drawRectangle
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawBall
	.syntax unified
	.arm
	.type	drawBall, %function
drawBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r2, .L88
	ldr	r4, .L88+4
	sub	sp, sp, #12
	ldr	r3, [r4, #60]
	str	r2, [sp]
	add	r0, r4, #40
	ldr	r2, [r4, #56]
	ldm	r0, {r0, r1}
	ldr	r5, .L88+8
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #64]
	ldr	r3, [r4, #60]
	str	r2, [sp]
	add	r0, r4, #32
	ldr	r2, [r4, #56]
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L89:
	.align	2
.L88:
	.word	31676
	.word	.LANCHOR0
	.word	drawRectangle
	.size	drawBall, .-drawBall
	.align	2
	.global	drawBlocks
	.syntax unified
	.arm
	.type	drawBlocks, %function
drawBlocks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L101
	ldr	r8, .L101+4
	ldr	r7, .L101+8
	sub	sp, sp, #8
	add	r6, r4, #1200
	b	.L93
.L91:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	bne	.L99
.L92:
	add	r4, r4, #40
	cmp	r4, r6
	beq	.L100
.L93:
	ldr	r5, [r4, #32]
	cmp	r5, #0
	beq	.L91
	str	r8, [sp]
	add	r2, r4, #20
	add	r0, r4, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r7
	ldrh	r2, [r4, #28]
	ldr	r3, [r4, #24]
	str	r2, [sp]
	ldr	r2, [r4, #20]
	ldm	r4, {r0, r1}
	add	r4, r4, #40
	mov	lr, pc
	bx	r7
	cmp	r4, r6
	bne	.L93
.L100:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L99:
	str	r8, [sp]
	add	r2, r4, #20
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r7
	str	r5, [r4, #36]
	b	.L92
.L102:
	.align	2
.L101:
	.word	.LANCHOR0+72
	.word	31676
	.word	drawRectangle
	.size	drawBlocks, .-drawBlocks
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	drawPlayer
	bl	drawBall
	pop	{r4, lr}
	b	drawBlocks
	.size	drawGame, .-drawGame
	.align	2
	.global	activateBlock
	.syntax unified
	.arm
	.type	activateBlock, %function
activateBlock:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #1
	ldr	r1, .L110
	add	r0, r1, #72
	mov	r2, r0
	mov	r3, #0
	str	ip, [r1, #1276]
	b	.L108
.L106:
	add	r3, r3, #1
	cmp	r3, #30
	bxeq	lr
.L108:
	ldr	r1, [r2, #32]
	cmp	r1, #0
	add	r2, r2, #40
	bne	.L106
	mov	r1, #1
	mov	r2, #0
	add	r3, r3, r3, lsl #2
	add	r0, r0, r3, lsl #3
	str	r1, [r0, #32]
	str	r2, [r0, #36]
	bx	lr
.L111:
	.align	2
.L110:
	.word	.LANCHOR0
	.size	activateBlock, .-activateBlock
	.global	spawned
	.global	score
	.global	colors
	.global	blocks
	.global	ball
	.global	player
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	colors, %object
	.size	colors, 16
colors:
	.short	31
	.short	575
	.short	858
	.short	992
	.short	31744
	.short	22212
	.short	16896
	.short	31775
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	player, %object
	.size	player, 32
player:
	.space	32
	.type	ball, %object
	.size	ball, 36
ball:
	.space	36
	.space	4
	.type	blocks, %object
	.size	blocks, 1200
blocks:
	.space	1200
	.type	score, %object
	.size	score, 4
score:
	.space	4
	.type	spawned, %object
	.size	spawned, 4
spawned:
	.space	4
	.ident	"GCC: (devkitARM) 15.2.0"
