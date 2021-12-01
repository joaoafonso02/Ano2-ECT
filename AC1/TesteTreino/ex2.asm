# i: $t0
# val: $t1
# &(val[0]): $t3

	.data
	.eqv SIZE, 8
	.eqv print_int10, 1
	.eqv print_char, 11
	.eqv print_string, 4
	
val:	.word 8,4,15,-1987,327,-9,27,16
str1:	.asciiz "\nResult is: "

	.text
	.globl main
	
main:
	li $t0, 0		# i = 0
	la $t3, val		# $t3 = &(val[0])
	
do:
	sll $t4, $t0, 2		# i * 4
	addu $t2, $t4, $t3	# &(val[i])
	
	lw $t4, 0($t2)		# $t4 = val[i]
	lw $t5, 16($t2)		# $t5 = val[i + SIZE/2]
	
	sw $t4, 16($t2)		# val[i] = val[i + SIZE/2]
	sw $t5, 0($t2)		# val[i + SIZE/2] = val[i]
	
while:
	addi $t0, $t0, 1	# ++i
	bge $t0, 4, result	# while(++i < SIZE / 2)
	j do
	
result:
	la $a0, str1
	li $v0, print_string
	syscall			# print_string("Result is: ")
	
	li $t0, 0		# i = 0
do2:
	addu $a0, $t3, $t0
	
	lw $a0, 0($a0)
	li $v0, print_int10
	syscall			# print_int10(val[i]);
	
	addi $t0,$t0,4		# i++;
	
	li $a0, ','
	li $v0, print_char	# print_char(',');
	syscall
	
	li $a0, SIZE
	sll $a0, $a0, 2
	
	blt $t0, $a0, do2	# } while( i < SIZE);
		
	jr $ra