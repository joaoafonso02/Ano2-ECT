# mapa
# i: $t0
# v: $t1
# &(val[0]): $t2

     .data 
     .eqv SIZE, 8
val:
     .word 8,4,15,-1987,237,-9,27,16
str1:
     .asciiz "\nResult is: "
     .text
     .globl main
main:
     li $t0, 0 # i = 0
     la $t2, val
     li $t3, SIZE
     div $t3, $t3, 2 # SIZE/2
 do:
     sll $a0, $t0, 2 # i*4
     addu $t4, $a0, $t2 # val + i
     lw $t1,0($t4) # val[i]
     
     sll $a1, $t3, 2 # SIZE/2 * 4
     addu $t5, $a1, $t4 # val + i + SIZE/2
     lw $t6, 0($t5) # val[i + SIZE/2]
     
     sw $t6, 0($t4) # val[i] = val[i + SIZE/2]
     sw $t1, 0($t5) # val[i + SIZE/2] = val[i]
 while:
     addi $t0, $t0, 1 # ++i
     blt $t0, $t3, do
     
     la $a0, str1
     li $v0, 4
     syscall
     
     li $t0, 0 # i = 0
     la $t2, val
do2:
     sll $a0, $t0, 2  # i*4
     addu $t4, $a0, $t2
     
     lw $a0, 0($t4) # val[i]
     addi $t0, $t0, 1 # i++
     li $v0, 1
     syscall
     
     li $a0, ','
     li $v0, 11
     syscall
while2:
     blt $t0, SIZE, do2
     jr $ra
    