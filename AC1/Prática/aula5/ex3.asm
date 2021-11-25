# p: $t0
# *p: $t1
# lista + SIZE: $t2
# SIZE - 1: $t3
# houve_troca: $t4
# i: $t5
# list: $t6
# list + i: $t7

	.data
	
str1: 	.asciiz "\nIntroduce a number: "

str2: 	.asciiz "\nArray content:\n"

str3: 	.asciiz "; "
	
	.align 2
list:	.space 40 		# SIZE * 4

	.eqv SIZE, 10
	.eqv TRUE, 1
	.eqv FALSE, 0
	.eqv print_string, 4
	.eqv print_int10, 1
	.eqv read_int, 5
	
	.text
	.globl main
	
main:
	la $t0, list		# p = list
	li $t2, SIZE		# $t2 = SIZE
	sll $t2, $t2, 2		# $t2 = list + SIZE
	
load:
	bge $t0, $t2, endload	#  while(p < list + SIZE)
	
	la $a0, str1
	li $v0, print_string
	syscall			# print_string("\nIntroduce a number: ")
	
	li $v0, read_int
	syscall			# $v0 = read_int()
	
	sw $v0, 0($t0)		# *p = read_int();
	
	addi $t0, $t0, 4	# p++
	
	j load
	
endload:
	la $t6, list		# read list
	
do:
	li $t4, FALSE		# houve_troca = FALSE
	li $t5, 0		# i = 0
	
	li $t9, SIZE
	sub $t3, $t9, 1		# $t3 = SIZE -1
	
for:
	bge $t5, $t3, while	# while (i < SIZE - 1)
	
	sll $t7, $t5, 2		# $t7 = i * 4
	addu $t7, $t7, $t6	# $t7 = &list[i]
	lw $t8, 0($t7)		# $t8 = list[i]
	lw $t9, 4($t7)		# $t9 = list[i+1]
if:
	ble $t8, $t9, endif	# if (list[i] > list[i+1]) 
	sw $t8, 4($t7)		# list[i] = list[i+1]; 
	sw $t9, 0($t7)		# list[i+1] = list[i]
	li $t4, TRUE		# houveTroca = TRUE
	
endif:
	addi $t5, $t5, 1	# i++
	j for
	
while:
	bnez $t4, do		# jump to do if $t0 = 0,, (FALSE = 0)
	
	la $a0, str2
	li $v0, print_string
	syscall			# print_string("\nConteudo do array:\n"); 
	
for2:
	la $t0, list		# p = list
	bge $t0, $t2, endw	# while(p < list + SIZE)
	
	lw $t1, 0($t0)		# $t1 = p*
	
	move $a0, $t1
	li $v0, print_int10
	syscall			# print_int10( *p ); 
	
	la $a0, str3
	li $v0,	print_string
	syscall			# print_string("; "); 
			
	addi $t0, $t0, 4	# p++
	
	j for2
endw:
	jr $ra
	
	
	