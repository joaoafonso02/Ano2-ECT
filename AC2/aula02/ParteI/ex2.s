# 2. a)
    # 1ms = 0,001 segundos
    # F = 1/0,001 = 1000Hz
    # 20 000 000 / 1000 = 20 000
    # K = 20 000

# b)
    .data
    .equ readCoreTimer, 11
    .equ resetCoreTimer, 12
    .equ putChar, 3
    .equ printInt, 6

    .text
    .globl main

main:
    addiu   $sp, $sp, -8            #       abrir espaco na pilha
    sw      $ra, 0($sp)             #       guardar o $ra
    sw      $s0, 4($sp)             #       guardar o $s0
    li      $s0, 0                  #       counter = 0;
while:
    li      $a0, 1000
    jal      delay
while2:
    bge     $v0, $t1, while
    addi    $s0, $s0, 1     # counter++
    li      $a0, $s0
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

delay:
    li      $v0, resetCoreTimer
    syscall
while1:
    li      $v0, readCoreTimer
    syscall
    move    $t0, $v0
    blt     $t0, 20000, while1 

    jr $ra
