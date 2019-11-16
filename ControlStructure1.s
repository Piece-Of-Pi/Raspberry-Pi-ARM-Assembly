.section .data
x: .word 1 @ 32-bit signed integer, you can also use int directive instead of .word directive
y: .word 0 @ 32-bit signed integer,
.section .text
.globl _start
_start:
 	ldr r1, =x @ load the memory address of x into r1
	ldr r1, [r1] @ load the value x into r1
	cmp r1,#3 @if x<=3 
	ble if @if x<=3, go to if
        bgt else  @if x>3, go to else 
if: 
	sub r1, #1	@X = X - 1
        b endofif       @jump to endofif
else: 
	sub r1, #2  @X = X - 2
endofif:
	mov r7, #1 @ Program Termination: exit syscall
	svc #0 @ Program Termination: wake kernel
.end

