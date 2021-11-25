# p: $t0
# *p: $t1
# lista + SIZE: $t2

	.data
	.eqv SIZE, 10
	.eqv print_string, 4
	.eqv print_int10, 1
	
lista:	.word 8, -4, 3, 5, 124, -15, 87, 9, 27, 15

str1: 	.asciiz "\nConteudo do array:\n"

str2:	.asciiz "; "

	.text
	.globl main
	
main:
	la $t0, lista		# p = lista
	
	li $t2, SIZE		# $t2 = size
	sll $t2, $t2, 2
	addu $t2, $t2, $t0	# $t2 = lista + size
	
for:
	bge $t0, $t2, endw	# while( p < lista + SIZE)
	
	lw $t1, 0($t0)		# *p
	
	move $a0, $t1
	li $v0, print_int10	
	syscall 		# print_int10( *p ); 
	
	la $a0, str2
	li $v0, print_string
	syscall			# print_string("; ");
	
	addi $t0, $t0, 4	#p++
	j for
	
endw:
	jr $ra



