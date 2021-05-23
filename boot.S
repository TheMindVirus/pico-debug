.section .text

.global _start
.global _halt

.global led_on
.global led_off

.org 0x1
_start:
	sub r1, r1, r1
	add r1, r1, #0xD0
	lsl r1, r1, #8
	add r1, r1, #0x00
	lsl r1, r1, #8
	add r1, r1, #0x00
	lsl r1, r1, #8
	add r1, r1, #0x00
	sub r2, r2, r2
	ldr r2, [r1]
	cmp r1, #0
	bne _halt //Continue CPUID 0, Halt CPUID 1

	sub r1, r1, r1
	add r1, r1, #0x40
	lsl r1, r1, #8
	add r1, r1, #0x01
	lsl r1, r1, #8
	add r1, r1, #0x40
	lsl r1, r1, #8
	add r1, r1, #0xCC
	sub r2, r2, r2
	add r2, r2, #0x5F
	str r2, [r1] //GPIO25 in F5 (SIO)

	sub r1, r1, r1
	add r1, r1, #0x40
	lsl r1, r1, #8
	add r1, r1, #0x01
	lsl r1, r1, #8
	add r1, r1, #0xC0
	lsl r1, r1, #8
	add r1, r1, #0x68
	sub r2, r2, r2
	add r2, r2, #0x33
	str r2, [r1] //GPIO25 12mA Drive Strength

	sub r1, r1, r1
	add r1, r1, #0xD0
	lsl r1, r1, #8
	add r1, r1, #0x00
	lsl r1, r1, #8
	add r1, r1, #0x00
	lsl r1, r1, #8
	add r1, r1, #0x24
	sub r2, r2, r2
	add r2, r2, #0x02
	lsl r2, r2, #8
	add r2, r2, #0x00
	lsl r2, r2, #8
	add r2, r2, #0x00
	lsl r2, r2, #8
	add r2, r2, #0x00
	str r2, [r1] //GPIO25 Output Enable

	ldr r3, =main
	blx r3

	b   _halt

led_on:
	sub r1, r1, r1
	add r1, r1, #0xD0
	lsl r1, r1, #8
	add r1, r1, #0x00
	lsl r1, r1, #8
	add r1, r1, #0x00
	lsl r1, r1, #8
	add r1, r1, #0x14
	sub r2, r2, r2
	add r2, r2, #0x02
	lsl r2, r2, #8
	add r2, r2, #0x00
	lsl r2, r2, #8
	add r2, r2, #0x00
	lsl r2, r2, #8
	add r2, r2, #0x00
	str r2, [r1] //GPIO25 Output On
	blx lr

led_off:
	sub r1, r1, r1
	add r1, r1, #0xD0
	lsl r1, r1, #8
	add r1, r1, #0x00
	lsl r1, r1, #8
	add r1, r1, #0x00
	lsl r1, r1, #8
	add r1, r1, #0x14
	sub r2, r2, r2
	add r2, r2, #0x00
	lsl r2, r2, #8
	add r2, r2, #0x00
	lsl r2, r2, #8
	add r2, r2, #0x00
	lsl r2, r2, #8
	add r2, r2, #0x00
	str r2, [r1] //GPIO25 Output Off
	blx lr

_halt:
	wfe
	b   _halt