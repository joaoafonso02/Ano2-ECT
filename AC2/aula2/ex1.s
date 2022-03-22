    .equ resetCoreTimer, 12
    .equ readCoreTimer, 11
    .equ putChar, 3
    .equ printInt, 6

    .data
    
    .text
    .globl main
main:
    li $t0, 0        
while:
    li $v0, resetCoreTimer
    syscall
while1:
    li $v0, readCoreTimer
    syscall
    
    blt $v0, 200000, while1
    
    addi $t0, $t0, 1
    move $a0, $t0

    ori $a1, $0, 4
    sll $a1, 16
    ori $a1, $a1, 10
        li $v0, printInt
    syscall

    li $a0, '\r'    
    li $v0, putChar
    syscall

    j while
endw:
    li $v0, 0
    jr $ra