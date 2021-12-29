# sum: $t1
# c: $t2
# array: $t3

	.data
	.eqv SIZE 5
	.eqv read_int, 5
	.eqv print_string, 4
	.eqv print_int10, 1

array: 	.space 20
str1:	.asciiz "Number: "
str2: 	.asciiz "Sum is: "
	.text
	.globl main
	
main:
	li $t1, 0		# sum = 0
	li $t2, 0		# c = 0
	la $t3, array		# $t3 = array
	
write:
	bge $t2, SIZE, endwrite	# while(c < SIZE)
	
	la $a0, str1
	li $v0, print_string
	syscall			# print_string("Number: ")
	
	li $v0, read_int
	syscall
	
	sll $t0, $t2, 2		# c * 4
	addu $t0, $t0, $t3	# array + c
	
	sw $v0, 0($t0)		# array[i] = read_int();
	
	addi $t2, $t2, 1	# c++
	j write
	
endwrite:	
	li $t2, 0		# c = 0
sum:
	bge $t2, SIZE, endsum	# while(c < SIZE)
	
	sll $t0, $t2, 2		# c * 4
	addu $t0, $t0, $t3	# array + c
	
	lw $t4, 0($t0)
	
	addi $t1, $t0, 4
	addi $t2, $t2, 1
	
	addi $t3, $t3, 4
	j sum

endsum:
	move $a0, $t1
	li $v0, print_int10
	syscall
	
	
	