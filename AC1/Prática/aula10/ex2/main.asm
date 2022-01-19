	.data
str1:	.asciiz "X: "
str2:	.asciiz "\nResult: "

	.text
	.globl main
	
main:
	addiu 	$sp, $sp, -4
	sw 	$ra, 0($sp)
	
	la 	$a0, str1
	li 	$v0, 4
	syscall				# print_string("X: ")
	
	li 	$v0, 7
	syscall				# read_double()
	
	
	mov.d	$f12, $f0
	jal 	sqrt
	
	la 	$a0, str2
	li 	$v0, 4
	syscall				# print_string("\nResult: ")
	
	mov.d	$f12, $f0		# val = read_double;
	li 	$v0, 3
	syscall
	
	lw	$ra, 0($sp)
	addiu 	$sp, $sp, -4
	li 	$v0, 0
	jr $ra