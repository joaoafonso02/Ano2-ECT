# MAPA DE REGISTOS
# p : $t0
# pultimo - $t1
# *p - $t2
# soma - $t3
# size-1 - $t4

	.data
	.eqv SIZE, 4
str1:
	.asciiz "Introduce a number: "
array:
	.word 7692, 23, 5, 234
	
	.text
	.globl main
	
main:
	li 	$t3, 0	# soma = 0
	li 	$t4, SIZE	# $t4 = SIZE
	
	la	$a0, str1
	li	$v0 4
	syscall
	
	li 	$v0, 5
	syscall
	move 	$t5, $v0
	
	sub	$t4, $t4, 1 # SIZE-1
	sll	$t4, $t4, 2	# SIZE-1 * 4
	la	$t0, array	# p = array
	addu	$t1, $t0, $t4 # pultimo=array+SIZE-1;
	
