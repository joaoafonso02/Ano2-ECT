# i: $t0
# v: $t1
# &val[0]: $t2 = val

	.data
	.eqv SIZE, 8
	.eqv print_string, 4
	.eqv print_int10, 1
	.eqv print_char, 11
	
val:	.word 8,4,15,-1987,327,-9,27,16
str2:	.asciiz "\nResult is: "
	
	.text
	.globl main
	
main:
	la $t1, val 		# $t1 = val = &val[0]
	li $t0, 0		# i = 0
	
do:
	sll $t4, $t0, 2		# i * 4
	addu $t4, $t4, $t1	# &array[i]
	
	lw $t5, 0($t4)		# array[i]
	lw $t6, 16($t4)		# array[i + SIZE/2]
	
	sw $t5, 16($t4)		# array[i] = array[i + SIZE/2]
	sw $t6, 0($t4)		# array[i + SIZE/2] = array[i]
	
while:
	addi $t0, $t0, 1	# i++
	li $t3, SIZE		# $t3 = SIZE
	div $t3, $t3, 2		# SIZE / 2
	
	bge $t0, $t3, write
	j do
	
write:
	la $a0, str2
	li $v0, print_string
	syscall
	
	li $t0, 0		# i = 0
	
do2:
	sll $t4, $t0, 2
	addu $t4, $t4, $t1
	
	lw $a0, 0($t4)
	li $v0, print_int10
	syscall
	
	addi $t0, $t0, 1	# i++
	li $a0, ','
	li $v0, print_char
	syscall
while2:
	bge $t0, SIZE, endw
	j do2
	
endw:
	jr $ra