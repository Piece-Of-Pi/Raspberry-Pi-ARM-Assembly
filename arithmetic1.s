@Arithmetic program
.section .data
.section .text
.globl _start
_start:
    mov r1, #10        @load r1 with 10
    mov r2, #11        @load r2 with 11
    mov r3, #7         @load r3 with 7
    mov r4, #2         @load r4 with 2
    add r1, r1, r2     @add 10 + 11 and store in r1
    mul r3, r4, r3     @2x7 and store in r3
    sub r1, r1, r3     @(10 + 11) - (7 x 2) and store in r1

    mov r7, #1         @Program Termination: exit syscall
    svc #0             @Program Termination: wake kernel
.end
