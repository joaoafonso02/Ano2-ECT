# MAPA
# p - $t0
# *p - $t1
	
	.data
	.eqv SIZE,10
lista:
	.word 8, -4, 3, 5, 124, -15, 87, 9, 27, 15
str1:
	.asciiz "\nConteudo do array:\n"
	
str2:
	.asciiz ";"
	
	.text
	.globl main
main:
	la $a0, str1
	li $v0, 4
	syscall  # print_string("\nConteudo do array:\n"); 

	la $t0, lista  # p = lista
	li $t2, SIZE  # SIZE = 10
	sll $t2, $t2, 2 # SIZE * 4
	addu $t3, $t2, $t0
for:
	bge $t0, $t3, endw
	
	lw $t1, 0($t0)
	
	move $a0, $t1
	li $v0, 1
	syscall
	
	la $a0, str2
	li $v0, 4
	syscall	
	
	addi $t0, $t0, 4  # p++
	j for
endw:
	jr $ra
	