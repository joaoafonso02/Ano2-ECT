	.equ	SFR_BASE_HI, 0xBF88
	.equ	TRISE, 0x6100
	.equ	LATE, 0x6120
	.equ	getChar, 2
	.equ 	resetCoreTimer, 12
	.equ	readCoreTimer, 11
	.data
	.text
	.globl main

main:
    addiu   $sp, $sp, -12
    sw      $ra, 0($sp)
    sw      $s0, 4($sp)
    sw      $s1, 8($sp)

    lui     $t0, SFR_BASE_HI
    lw      $t1, TRISE($t0)
    andi    $t1, $t1, 0xFFE0
    sw      $t1, TRISE($t0)

loop:
    li      $v0, getChar
    syscall
    move    $s0, $v0

    lw      $t1, LATE($t0)
    andi    $t1, $t1, 0xFFFE
if0:
    bne     $s0, '0', if1
    ori     $t1, $t1, 0x0001
    sw      $t1, LATE($t0)
if1:
    bne     $s0, '1', if2
    ori     $t1, $t1, 0x0002
    sw      $t1, LATE($t0)

    j loop
    lw      $ra, 0($sp)
    lw      $s0, 4($sp)
    lw      $s1, 8($sp)
    addi    $sp, $sp, 12
    jr      $ra