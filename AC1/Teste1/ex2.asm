# mapa de registos
# i: $t0
# v: $t1
# &(val[0]): $t2	
	
	.data
	.eqv SIZE, 32
var:
	.word 8, 4, 15, -1987, 327, -9, 27, 16
str:
	.asciiz "Result is: "	
	
	.text
	.globl main
main:
	li $t0, 0
	la $t2, var 	
do:
	addu $t4, $t2, $t0
	lw $t1, 0($t4)
	
 	li $a0, SIZE
 	div $t8, $a0, 2 
 	
 	addu $t5, $t8, $t4
 	lw $t6, 0($t5)
 	
 	sw $t1, 0($t5)
 	sw $t6, 0($t4)
 while:
 	addi $t0, $t0, 4
 	blt $t0, $t8, do
 end:
 	la $a0, str
 	li $v0, 4
 	syscall
 	
 	li $t0, 0
 	la $t2, var
 	
 do2:
 	addu $t4, $t2, $t0
 	lw $a0, 0($t4)
 	li $v0, 1
 	syscall

 	addi $t0, $t0, 4
 	
 	li $a0, ','
 	li $v0, 11
 	syscall
 while2:
 	blt $t0, SIZE, do2
 	jr $ra
	