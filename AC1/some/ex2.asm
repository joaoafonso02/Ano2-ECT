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
       
do:
     sll $a0, $t0, 2 # i * 4
     addu $t4, $a0, $t2 # lista+i
     lw $t6, 0($t4) # v = val[i]

     li $t3, SIZE
     div $t3, $t3, 2 # SIZE / 2
     sll $t5, $t3, 2 # *4   
     
     addu $t7, $t5, $t4 # val + i + SIZE/2
     lw $t8, 0($t7) # val[i + SIZE/2]
     
     sw $t8, 0($t4) # val[i] = val[i + SIZE/2]
     sw $t6, 0($t7) # val[i + SIZE/2] = val[i]
while:
     addi $t0, $t0, 1 # ++i
     blt $t0, $t3, do    
     
write: 

     la $a0, str1
     li $v0, 4
     syscall
     
     li $t0, 0 # i = 0
     la $t2, val
     
do2:
     sll $t6, $t0, 2 # i*4
     addu $t4, $t6, $t2
     lw $a0, 0($t4)
     addi $t0, $t0, 1
     li $v0, 1
     syscall
     
     li $a0, ','
     li $v0, 11
     syscall
     
     
 while2:              
     blt $t0, SIZE, do2