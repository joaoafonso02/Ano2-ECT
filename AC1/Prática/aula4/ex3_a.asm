# Register Map
# p = $t0
# pultimo = $t1
# *p = $t2
# soma = $t3

	.data
	.eqv print_int10, 1
	.eqv read_int, 5
	.eqv print_string, 4
	
str1: 	.asciiz "Introduce the number u want to achieve in this array:"
array: 	.word 7692, 23, 5, 234
size:	.eqv SIZE, 4

	.text
	.globl main

main: 
	li $t3, 0			# soma = 0
	
	li $t4, SIZE
	
	la $a0 ,str1
 	li $v0, print_string 		# (instrução virtual)
 	syscall 			# print_string(str1);
 	
 	li $v0, read_int
 	syscall
 	move $t4, $v0			# value = read_int();
	
	sub $t4, $t4, 1			# SIZE - 1 = 3
	sll $t4, $t4, 2			# 0011 --> 1100
	la $t0, array
	addu $t1, $t0, $t4		# pultimo = array + SIZE - 1
	
while:
	bgt $t0, $t1, endw
	lw $t2, 0($t0)			# t2 = *p
	add $t3, $t3, $t2		# soma = soma + (*p)
	addi $t0, $t0, 4		# p++
	
	j while
endw:
	move $a0, $t3
	li $v0, print_int10
	syscall				# print_int10(soma)
	
	jr $ra				# exits program
		
	
