@ARM Project_A3 Register = val2 + 3 + val3 - val1
.section .data
val1: .hword -60      @int variable of value -60
val2: .word 11             @int variable of value 11 
val3: .word 16             @int variable of value 16
.section .text
.globl _start
_start: 
	ldr r1,=#val2	@move val2 to r1
	ldr r2,=#9      @move 3 to r2
	ldr r3,=#val3   @move val3 to r3
	ldr r4,=#val1   @move val1 to r4
	add r1,r2,r3  @add r1, r2, r3 and store in r1
	sub r1,r1,r4  @subtract r4 from r1 and store in r1

	mov r7,#1      @Program Termination: exit syscall
	svc #0          @Program Termination: wake kernel
.end


