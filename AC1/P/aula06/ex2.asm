# p: $t0
# pultimo: $t1
# array + SIZE: $t2

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
	la $t0, array		# p = array
	
	li $t3, SIZE		# $t3 = SIZE
	sll $t3, $t3, 2		# SIZE * 4
	addu $t3, $t3, $t0	# array + SIZE
	
	move $t1, $t3		# pultimo = array + SIZE
	
for:
	bge $t0, $t1, endw	# while(p < pultimo)
	
	lw $t4, 0($t0)		# *p
	
	move $a0, $t4
	li $v0, print_string
	syscall			# print_string(*p); 
	
	li $a0, '\n'
	li $v0, print_char
	syscall			# print_char('\n'); 
	
	addi $t0, $t0, 4	# p++
	j for

endw:
	jr $ra
	
	
	