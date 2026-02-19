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
	.file	"gba.c"
	.text
	.align	2
	.global	drawRectangle
	.syntax unified
	.arm
	.type	drawRectangle, %function
drawRectangle:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r3, #0
	bxle	lr
	add	r3, r3, r1
	str	lr, [sp, #-4]!
	rsb	r1, r1, r1, lsl #4
	rsb	lr, r3, r3, lsl #4
	add	r3, r0, r1, lsl #4
	add	r0, r0, lr, lsl #4
	mov	r1, #67108864
	mov	lr, #0
	ldr	ip, .L11
	ldr	ip, [ip]
	orr	r2, r2, #-2130706432
	add	r3, ip, r3, lsl #1
	add	r0, ip, r0, lsl #1
	add	ip, sp, #4
.L3:
	str	lr, [r1, #220]
	str	ip, [r1, #212]
	str	r3, [r1, #216]
	add	r3, r3, #480
	cmp	r3, r0
	str	r2, [r1, #220]
	bne	.L3
	ldr	lr, [sp], #4
	bx	lr
.L12:
	.align	2
.L11:
	.word	.LANCHOR0
	.size	drawRectangle, .-drawRectangle
	.align	2
	.global	fillScreen
	.syntax unified
	.arm
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r3, #67108864
	mov	lr, #0
	ldr	r1, .L15
	sub	sp, sp, #12
	ldr	r1, [r1]
	ldr	r2, .L15+4
	add	ip, sp, #6
	strh	r0, [sp, #6]	@ movhi
	str	lr, [r3, #220]
	str	ip, [r3, #212]
	str	r1, [r3, #216]
	str	r2, [r3, #220]
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L16:
	.align	2
.L15:
	.word	.LANCHOR0
	.word	-2130668032
	.size	fillScreen, .-fillScreen
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L18:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bhi	.L18
	mov	r2, #67108864
.L19:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L19
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	collision
	.syntax unified
	.arm
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, [sp, #8]
	ldr	ip, [sp, #16]
	add	ip, lr, ip
	cmp	ip, r1
	ble	.L27
	add	r1, r1, r3
	cmp	r1, lr
	bgt	.L29
.L27:
	mov	r0, #0
	ldr	lr, [sp], #4
	bx	lr
.L29:
	ldr	r3, [sp, #4]
	ldr	r1, [sp, #12]
	add	r3, r3, r1
	cmp	r3, r0
	ble	.L27
	ldr	r3, [sp, #4]
	add	r0, r0, r2
	cmp	r0, r3
	movle	r0, #0
	movgt	r0, #1
	ldr	lr, [sp], #4
	bx	lr
	.size	collision, .-collision
	.align	2
	.global	drawChar
	.syntax unified
	.arm
	.type	drawChar, %function
drawChar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	lr, .L40
	ldr	ip, .L40+4
	ldr	lr, [lr]
	sub	sp, sp, #8
	rsb	r1, r1, r1, lsl #4
	add	r2, r2, r2, lsl #1
	add	r1, r0, r1, lsl #4
	strh	r3, [sp, #6]	@ movhi
	add	ip, ip, r2, lsl #4
	add	lr, lr, r1, lsl #1
	add	r4, r0, #6
.L31:
	mov	r2, lr
	sub	r3, ip, #48
.L33:
	ldrb	r1, [r3]	@ zero_extendqisi2
	cmp	r1, #0
	ldrhne	r1, [sp, #6]
	add	r3, r3, #6
	strhne	r1, [r2]	@ movhi
	cmp	r3, ip
	add	r2, r2, #480
	bne	.L33
	add	r0, r0, #1
	cmp	r0, r4
	add	ip, r3, #1
	add	lr, lr, #2
	bne	.L31
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	.LANCHOR0
	.word	fontdata+48
	.size	drawChar, .-drawChar
	.align	2
	.global	drawString
	.syntax unified
	.arm
	.type	drawString, %function
drawString:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, r2
	ldrb	r2, [r2]	@ zero_extendqisi2
	sub	sp, sp, #8
	cmp	r2, #0
	strh	r3, [sp, #6]	@ movhi
	beq	.L42
	mov	r6, r1
	mov	r4, r0
.L44:
	mov	r0, r4
	mov	r1, r6
	ldrh	r3, [sp, #6]
	bl	drawChar
	ldrb	r2, [r5, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	add	r4, r4, #6
	bne	.L44
.L42:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
	.size	drawString, .-drawString
	.align	2
	.global	DMANow
	.syntax unified
	.arm
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	add	r0, r0, r0, lsl #1
	lsl	r0, r0, #2
	add	r0, r0, #67108864
	orr	r3, r3, #-2147483648
	str	ip, [r0, #184]
	str	r1, [r0, #176]
	str	r2, [r0, #180]
	str	r3, [r0, #184]
	bx	lr
	.size	DMANow, .-DMANow
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM) 15.2.0"
