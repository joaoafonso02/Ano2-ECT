# i: $t0
# array: $t1
# array + i: $t3
# houveTroca: $t4
# array[i]: $t5
# array[i+1]: $t6

	.data
	.eqv SIZE, 10
	.eqv TRUE, 1
	.eqv FALSE, 0
	.eqv read_int, 5
	.eqv print_string, 4
	.eqv print_int10, 1
	.eqv print_char, 11
	
array:	.space 40

str1:	.asciiz "Number: "
	
	.text
	.globl main
	
main:
	li $t0, 0		# i = 0

reading:
	bge $t0, SIZE, do	# while(i < SIZE)
	la $a0, str1
	li $v0, print_string
	syscall 		# print_string("Number ")
	
	li $v0, read_int
	syscall			# $v0 = read_int
	
	la $t1, array		# $t1 = array
	sll $t2, $t0, 2		# i * 4
	addu $t3, $t2, $t1	# array + SIZE
	
	sw $v0, 0($t3)		# array[i] = read_int
	
	addi $t0, $t0, 1	# i++
	j reading
	
do:
	li $t4, FALSE		# houveTroca = FALSE; 
	li $t0, 0		# i = 0
for:
	bge $t0, 9, while
	
	la $t1, array		# $t1 = array
	sll $t2, $t0, 2		# i * 4
	addu $t3, $t2, $t1	# array + SIZE = &array[i]
	
	lw $t5, 0($t3)		# array[i]
	lw $t6, 4($t3)		# array[i+1]
if:
	ble $t5, $t6, endif	# if (array[i] > array[i+1]) 
	
	sw $t5, 4($t3)		# array[i] = array[i+1]; 
	sw $t6, 0($t3)		# array[i+1] = array[i]
	li $t4, TRUE
endif:
	addi $t0, $t0, 1	# i++
	j for
	
while:
	beq $t4, TRUE, do		# while (houveTroca==TRUE);

	la $t1, array		# p = array
	li $t7, SIZE		# $t7 = SIZE
	sll $t7, $t7, 2		# SIZE * 4
	addu $t7, $t7, $t1	# array + SIZE
	 
show:
	bge $t1, $t7, endw	# while(p < array + SIZE )
	
	lw $a0, 0($t1)		# *p
	li $v0, print_int10
	syscall			# print_int10(*p)
	
	li $a0, ';'
	li $v0, print_char
	syscall			# print_char(';')
	
	addi $t1, $t1, 4	# p++
	j show
endw:
	jr $ra
	
	
