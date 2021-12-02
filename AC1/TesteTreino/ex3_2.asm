# n_even: $t0
# n_odd: $t1
# p1: $t2
# p2: $t3
# N: $t4

	.data
	.eqv N, 5
	.eqv read_int, 5
	.eqv print_string, 4
	.eqv print_int10, 1
	.eqv print_char, 11
	
a:	.space 20
ba:	.space 20
str1:	.asciiz "Number: "
	
	.text
	.globl main
	
main:	
	li $t0, 0		# n_even = 0
	li $t1, 0		# n_odd = 0
	la $t2, a		# p1 = a

	li $t4, N
	sll $t4, $t4, 2		# N * 4
	addu $t4, $t4, $t2	# a + N
	
reading:	
	bge $t2, $t4, second	# while(i < SIZE)
	
	la $a0, str1
	li $v0, print_string
	syscall			# print_string("Number: ")
	
	li $v0, read_int
	syscall
	
	sw $v0, 0($t2)

	addi $t2, $t2, 4	# p1++
	j reading

second:
	la $t2, a
	la $t3, ba
	
while1:
	bge $t2, $t4, third	# while(p1 < (a + N))
	
	lw $t5, 0($t2)		# *p1
	
	rem $t7, $t5, 2		# *p1 % 2
if:	
	beqz $t7, else		# if((*p1 % 2) != 0)
	sw $t5,	0($t3)
	
	addiu $t3, $t3, 4	# *p2++
	addi $t1, $t1, 1	# n_odd++
	j endif
else:
	addi $t0, $t0, 1	# n_even++	
endif:
	addi $t2, $t2, 4	# p1++
	j while1
	
third:
	la $t3, ba		# p2 = ba
	
	sll $t6, $t1, 2		# n_odd * 4
	addu $t6, $t6, $t3	# b + n_odd
	
while3:
	bge $t3, $t6, endw

	lw $a0, 0($t3)
	li $v0, print_int10
	syscall

	li $a0, ','
	li $v0, print_char
	syscall
	
	addi $t3, $t3, 4	# p2++
	j while3
endw:
	jr $ra
	