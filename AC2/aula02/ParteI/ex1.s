# a)
    # 20 000 000 -- 1    segundo
    #  200 000 -- 0,01 segundos
    # counterFrequency = 1/0.01 = 100Hz

# b)
    .data
    .equ readCoreTimer, 11
    .equ resetCoreTimer, 12
    .equ putChar, 3
    .equ printInt, 6

    .text
    .globl main

main:
    li      $t0, 0          # count = 0
    li      $t1, 200000     # F = 100Hz
    #li      $t1, 2 000 000     # F = 10Hz
    #li      $t1, 4 000 000     # F = 5Hz
    #li      $t1, 20 000 000     # F = 1Hz
while:
    li      $v0, resetCoreTimer
    syscall
while2:
    bge     $v0, $t1, while
    addi    $t0, $t0, 1     # counter++
    li      $a0, $t0
    li      $a1, 4
    sll		$a1, $a1, 16		
    ori		$a1, $a1, 10	# 10 | 4 << 16

    li      $v0, printInt
    syscall

    li      $a0, '\r'
    li      $v0, putChar
    syscall

    li     $v0, 0
    jr     $ra