# i: $t0
# lista: $t1
# lista + i: $t2

	.data 
	.eqv SIZE, 5
	.eqv print_string, 4
	.eqv read_int, 5

lista:	.space 20			# SPACE * 4

str1: 	.asciiz "\nIntroduza um numero: "
	
	.text
	.globl main
	
main:
	li $t0, 0			# i = 0
	
for:
	bge $t0, SIZE, endw		# while(i < SIZE)
	
	la $a0, str1
	li $v0, print_string
	syscall				# print_string("\nIntroduza um numero: "); 
	
	li $v0, read_int
	syscall				# $v0 = read_int()
	
	
	la $t1, lista			# $t1 = lista
	
	sw $v0, 0($t1)
	
	sll $t2, $t0, 2
	addu $t2, $t2, $t1		# lista + SIZE

	addi $t0, $t0, 1		# i++
	j for
	
endw:
	jr $ra