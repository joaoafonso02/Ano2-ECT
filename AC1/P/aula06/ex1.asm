# i: $t0
# array: $t1

	.data
	.eqv SIZE, 3
	.eqv print_string, 4
	.eqv print_char, 11
	
array:	.word str1, str2, str3
str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "ponteiros"
	
	.text
	.globl main
	
main:
	li $t0, 0		# i = 0

for:
	bge $t0, SIZE, endw	# while(i < SIZE)
	
	la $t1, array
	sll $t2, $t0, 2
	addu $t3, $t2, $t1
	
	lw $a0, 0($t3)
	
	li $v0, print_string	
	syscall			# print_string(array[i]); 
	
	li $a0, ' '
	li $v0, print_char
	syscall			# print_char(' '); 
	
	addi $t0, $t0, 1	#  i++
	j for

endw:
	jr $ra			# finish program 