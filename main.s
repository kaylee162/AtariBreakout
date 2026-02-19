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
	.file	"main.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"Atari Breakout\000"
	.align	2
.LC0:
	.ascii	"GAME BOY\000"
	.text
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	sub	sp, sp, #12
	mov	r4, #72
	mov	r5, sp
	ldr	r0, .L6
	ldr	r3, .L6+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L6+8
	ldm	r3, {r0, r1}
	stm	sp, {r0, r1}
	ldr	r6, .L6+12
	ldr	r7, .L6+16
.L2:
	mov	r0, r4
	mov	r1, #70
	ldrh	r3, [r6], #2
	ldrb	r2, [r5], #1	@ zero_extendqisi2
	add	r4, r4, #12
	mov	lr, pc
	bx	r7
	cmp	r4, #168
	bne	.L2
	mov	r1, #96
	mov	r0, #77
	ldr	r3, .L6+20
	ldr	r2, .L6+24
	ldr	r4, .L6+28
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L6+32
	str	r2, [r3]
	str	r2, [r3, #4]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	31676
	.word	fillScreen
	.word	.LC0
	.word	colors
	.word	drawChar
	.word	16668
	.word	.LC1
	.word	drawString
	.word	.LANCHOR0
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #67108864
	mov	r1, #0
	ldr	r3, .L9
	ldr	ip, .L9+4
	ldr	r2, .L9+8
	strh	ip, [r0]	@ movhi
	strh	r1, [r3, #10]	@ movhi
	ldrh	r2, [r2, #48]
	strh	r2, [r3, #8]	@ movhi
	b	goToStart
.L10:
	.align	2
.L9:
	.word	.LANCHOR0
	.word	1027
	.word	67109120
	.size	initialize, .-initialize
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"score:\000"
	.text
	.align	2
	.global	start
	.syntax unified
	.arm
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L18
	ldr	r3, .L18+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4, #10]
	tst	r3, #8
	beq	.L11
	ldrh	r3, [r4, #8]
	tst	r3, #8
	beq	.L17
.L11:
	pop	{r4, lr}
	bx	lr
.L17:
	ldr	r0, .L18+8
	ldr	r3, .L18+12
	mov	lr, pc
	bx	r3
	mov	r1, #1
	mov	r0, #180
	ldr	r3, .L18+16
	ldr	r2, .L18+20
	ldr	ip, .L18+24
	mov	lr, pc
	bx	ip
	mov	r2, #1
	ldr	r3, .L18+28
	str	r2, [r4]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	.LANCHOR0
	.word	waitForVBlank
	.word	31676
	.word	fillScreen
	.word	22212
	.word	.LC2
	.word	drawString
	.word	initGame
	.size	start, .-start
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L22
	ldr	r3, .L22+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L22+8
	ldr	r3, .L22+12
	ldr	r2, .L22+16
	mov	r1, #1
	mov	r0, #180
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L22+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L23:
	.align	2
.L22:
	.word	31676
	.word	fillScreen
	.word	drawString
	.word	22212
	.word	.LC2
	.word	.LANCHOR0
	.size	goToGame, .-goToGame
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"got too stressed?\000"
	.align	2
.LC4:
	.ascii	"you're paused now!\000"
	.text
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L26
	ldr	r3, .L26+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L26+8
	mov	r3, #16896
	mov	r1, #8
	mov	r0, #136
	ldr	r2, .L26+12
	mov	lr, pc
	bx	r4
	ldr	r2, .L26+16
	mov	r3, #16896
	mov	r1, #18
	mov	r0, #130
	mov	lr, pc
	bx	r4
	ldr	r3, .L26+20
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L26+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L27:
	.align	2
.L26:
	.word	31676
	.word	fillScreen
	.word	drawString
	.word	.LC3
	.word	.LC4
	.word	waitForVBlank
	.word	.LANCHOR0
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L40
	ldr	r3, .L40+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4, #10]
	tst	r3, #8
	beq	.L29
	ldrh	r2, [r4, #8]
	tst	r2, #8
	beq	.L38
.L29:
	tst	r3, #4
	beq	.L28
	ldrh	r3, [r4, #8]
	tst	r3, #4
	beq	.L39
.L28:
	pop	{r4, lr}
	bx	lr
.L38:
	ldr	r0, .L40+8
	ldr	r3, .L40+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+16
	mov	r1, #1
	mov	r0, #180
	ldr	r2, .L40+20
	ldr	ip, .L40+24
	mov	lr, pc
	bx	ip
	mov	r3, #1
	str	r3, [r4]
	pop	{r4, lr}
	bx	lr
.L39:
	pop	{r4, lr}
	b	goToStart
.L41:
	.align	2
.L40:
	.word	.LANCHOR0
	.word	waitForVBlank
	.word	31676
	.word	fillScreen
	.word	22212
	.word	.LC2
	.word	drawString
	.size	pause, .-pause
	.section	.rodata.str1.4
	.align	2
.LC5:
	.ascii	"omg you won!!!\000"
	.align	2
.LC6:
	.ascii	"press start to play again\000"
	.text
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L44
	ldr	r3, .L44+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L44+8
	mov	r3, #16896
	mov	r1, #8
	mov	r0, #154
	ldr	r2, .L44+12
	mov	lr, pc
	bx	r4
	ldr	r2, .L44+16
	mov	r3, #16896
	mov	r1, #18
	mov	r0, #88
	mov	lr, pc
	bx	r4
	ldr	r3, .L44+20
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L44+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L45:
	.align	2
.L44:
	.word	31676
	.word	fillScreen
	.word	drawString
	.word	.LC5
	.word	.LC6
	.word	waitForVBlank
	.word	.LANCHOR0
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L53
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L53+4
	ldrh	r2, [r3, #10]
	tst	r2, #8
	beq	.L46
	ldrh	r3, [r3, #8]
	tst	r3, #8
	beq	.L52
.L46:
	pop	{r4, lr}
	bx	lr
.L52:
	pop	{r4, lr}
	b	goToStart
.L54:
	.align	2
.L53:
	.word	waitForVBlank
	.word	.LANCHOR0
	.size	win, .-win
	.section	.rodata.str1.4
	.align	2
.LC7:
	.ascii	"you lost :(\000"
	.align	2
.LC8:
	.ascii	"better luck next time :)\000"
	.align	2
.LC9:
	.ascii	"press start to try again <3\000"
	.text
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L57
	ldr	r3, .L57+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L57+8
	mov	r3, #16896
	mov	r1, #8
	mov	r0, #172
	ldr	r2, .L57+12
	mov	lr, pc
	bx	r4
	mov	r3, #16896
	mov	r1, #18
	mov	r0, #94
	ldr	r2, .L57+16
	mov	lr, pc
	bx	r4
	ldr	r2, .L57+20
	mov	r3, #16896
	mov	r1, #28
	mov	r0, #76
	mov	lr, pc
	bx	r4
	ldr	r3, .L57+24
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L57+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L58:
	.align	2
.L57:
	.word	31676
	.word	fillScreen
	.word	drawString
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	waitForVBlank
	.word	.LANCHOR0
	.size	goToLose, .-goToLose
	.section	.rodata.str1.4
	.align	2
.LC10:
	.ascii	"%d\000"
	.text
	.align	2
	.global	game
	.syntax unified
	.arm
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L70
	ldr	r5, .L70+4
	sub	sp, sp, #8
	ldr	r3, .L70+8
	ldr	r8, .L70+12
	mov	lr, pc
	bx	r3
	ldr	r7, .L70+16
	ldr	r2, [r5]
	ldr	r1, .L70+20
	ldr	r3, .L70+24
	add	r0, r4, #12
	mov	lr, pc
	bx	r3
	ldr	r6, .L70+28
	mov	lr, pc
	bx	r7
	mov	r3, #8
	mov	r2, #12
	mov	r1, #1
	mov	r0, #220
	str	r8, [sp]
	mov	lr, pc
	bx	r6
	mov	r1, #1
	mov	r0, #220
	ldr	r3, .L70+32
	add	r2, r4, #12
	ldr	r6, .L70+36
	mov	lr, pc
	bx	r6
	ldr	r3, .L70+40
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4, #10]
	tst	r3, #8
	beq	.L60
	ldrh	r3, [r4, #8]
	tst	r3, #8
	beq	.L67
.L60:
	ldr	r3, [r5]
	cmn	r3, #1
	beq	.L68
.L61:
	cmp	r3, #30
	beq	.L69
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L69:
	ldr	r0, .L70+12
	ldr	r3, .L70+44
	mov	lr, pc
	bx	r3
	mov	r3, #16896
	mov	r1, #8
	mov	r0, #154
	ldr	r2, .L70+48
	mov	lr, pc
	bx	r6
	mov	r3, #16896
	mov	r1, #18
	mov	r0, #88
	ldr	r2, .L70+52
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r7
	mov	r3, #3
	str	r3, [r4]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L68:
	bl	goToLose
	ldr	r3, [r5]
	b	.L61
.L67:
	mov	r0, r8
	ldr	r3, .L70+44
	mov	lr, pc
	bx	r3
	mov	r3, #16896
	mov	r1, #8
	mov	r0, #136
	ldr	r2, .L70+56
	mov	lr, pc
	bx	r6
	mov	r3, #16896
	mov	r1, #18
	mov	r0, #130
	ldr	r2, .L70+60
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r7
	mov	r3, #2
	str	r3, [r4]
	b	.L60
.L71:
	.align	2
.L70:
	.word	.LANCHOR0
	.word	score
	.word	updateGame
	.word	31676
	.word	waitForVBlank
	.word	.LC10
	.word	sprintf
	.word	drawRectangle
	.word	22212
	.word	drawString
	.word	drawGame
	.word	fillScreen
	.word	.LC5
	.word	.LC6
	.word	.LC3
	.word	.LC4
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r4, .L97
	ldr	r3, .L97+4
	mov	lr, pc
	bx	r3
	ldr	r7, .L97+8
	ldr	r6, .L97+12
	ldrh	r3, [r4, #8]
	ldr	fp, .L97+16
	ldr	r9, .L97+20
	ldr	r8, .L97+24
	ldr	r10, .L97+28
	ldr	r5, .L97+32
.L73:
	strh	r3, [r4, #10]	@ movhi
	ldr	r2, [r4]
	ldrh	r3, [r5, #48]
	strh	r3, [r4, #8]	@ movhi
	cmp	r2, #4
	bhi	.L88
	ldrb	r2, [r6, r2]
	add	pc, pc, r2, lsl #2
.Lrtx76:
	nop
	.section	.rodata
.L76:
	.byte	(.L80-.Lrtx76-4)/4
	.byte	(.L79-.Lrtx76-4)/4
	.byte	(.L78-.Lrtx76-4)/4
	.byte	(.L75-.Lrtx76-4)/4
	.byte	(.L75-.Lrtx76-4)/4
	.section	.text.startup
	.p2align 2
.L75:
	mov	lr, pc
	bx	r7
	ldrh	r2, [r4, #10]
	tst	r2, #8
	ldrh	r3, [r4, #8]
	beq	.L73
	tst	r3, #8
	bne	.L73
	mov	lr, pc
	bx	r10
	ldrh	r3, [r4, #8]
	b	.L73
.L78:
	mov	lr, pc
	bx	r8
	ldrh	r3, [r4, #8]
	b	.L73
.L79:
	mov	lr, pc
	bx	r9
	ldrh	r3, [r4, #8]
	b	.L73
.L80:
	mov	lr, pc
	bx	r7
	ldrh	r2, [r4, #10]
	tst	r2, #8
	ldrh	r3, [r4, #8]
	beq	.L73
	tst	r3, #8
	bne	.L73
	ldr	r0, .L97+36
	mov	lr, pc
	bx	fp
	mov	r1, #1
	mov	r0, #180
	ldr	r3, .L97+40
	ldr	r2, .L97+44
	ldr	ip, .L97+48
	mov	lr, pc
	bx	ip
	mov	r3, #1
	str	r3, [r4]
	ldr	r3, .L97+52
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4, #8]
	b	.L73
.L88:
	ldr	r2, .L97+32
.L74:
	ldrh	r1, [r2, #48]
	ldrh	r0, [r2, #48]
	strh	r1, [r4, #10]	@ movhi
	strh	r0, [r4, #8]	@ movhi
	b	.L74
.L98:
	.align	2
.L97:
	.word	.LANCHOR0
	.word	initialize
	.word	waitForVBlank
	.word	.L76
	.word	fillScreen
	.word	game
	.word	pause
	.word	goToStart
	.word	67109120
	.word	31676
	.word	22212
	.word	.LC2
	.word	drawString
	.word	initGame
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L106
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L106+4
	ldrh	r2, [r3, #10]
	tst	r2, #8
	beq	.L99
	ldrh	r3, [r3, #8]
	tst	r3, #8
	beq	.L105
.L99:
	pop	{r4, lr}
	bx	lr
.L105:
	pop	{r4, lr}
	b	goToStart
.L107:
	.align	2
.L106:
	.word	waitForVBlank
	.word	.LANCHOR0
	.size	lose, .-lose
	.global	rSeed
	.global	oldButtons
	.global	buttons
	.global	state
	.global	scoreBuffer
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	state, %object
	.size	state, 4
state:
	.space	4
	.type	rSeed, %object
	.size	rSeed, 4
rSeed:
	.space	4
	.type	buttons, %object
	.size	buttons, 2
buttons:
	.space	2
	.type	oldButtons, %object
	.size	oldButtons, 2
oldButtons:
	.space	2
	.type	scoreBuffer, %object
	.size	scoreBuffer, 41
scoreBuffer:
	.space	41
	.ident	"GCC: (devkitARM) 15.2.0"
