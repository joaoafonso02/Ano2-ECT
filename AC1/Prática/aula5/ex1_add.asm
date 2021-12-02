# i: $t0
# j: $t1
# lista: $t2
# lista + i: $t3

	.data
	.eqv SIZE, 10
	.eqv read_int, 5
	.eqv print_string, 4
	.eqv print_char, 11
	.eqv print_int10, 1

lista:	.space 40
str1:	.asciiz	"Number: "
str2:	.asciiz "Ordered: "
	
	.text
	.globl main
	
main:
	li $t0, 0		# i = 0
	la $t2, lista
	
reading:
	bge $t0, SIZE, sorting	# while(i < SIZE)
	
	la $a0, str1
	li $v0, print_string
	syscall			# print_string("Number: ")
	
	li $v0, read_int
	syscall			# $v0 =  = read_int();
	
	sll $a0, $t0, 2		# i * 4
	addu $t3, $a0, $t2	# lista + i
	
	sw $v0, 0($t3)		# lista[i] = read_int();
	
	addi $t0, $t0, 1	# i++
	j reading
	
sorting:
	li $t0, 0		# i = 0
while:
	bge $t0, 9, final	# while(i < SIZE-1)
	move $t1, $t0		# j = i
	addi $t1, $t1, 1	# j = i++
while2: 
	bge $t1, SIZE, endwhile	# while(j < SIZE)
	
	sll $a0, $t0, 2		# i * 4
	addu $t3, $a0, $t2	# &lista[i]
	
	lw $t4, 0($t3)		# lista[i]
	
	sll $a1, $t1, 2		# j * 4
	addu $t5, $a1, $t2	# &lista[j]
	
	lw $t6, 0($t5)		# lista[j]
if:
	ble $t4, $t6, endif	# if(lista[i] > lista[j]) 
	
	sw $t4, 0($t5)		# lista[i] = lista[j]; 
	sw $t6, 0($t3)		# lista[j] = lista[i]; 
endif:	
	addi $t1, $t1, 1	# j++
	j while2
endwhile:
	addi $t0, $t0, 1	# i++
	j while
	
final:
	la $a0, str2
	li $v0, print_string
	syscall			# print_string("Ordered: ")
	
	li $t7, SIZE		# = SIZE
	sll $t7, $t7, 2		# SIZE * 4
	addu $t7, $t7, $t2	# &lista[SIZE]
	
writing:
	bge $t2, $t7, endw	# while(p < lista + SIZE)
	
	lw $a0, 0($t2)
	li $v0, print_int10
	syscall			# print_int10(*p)
	
	li $a0, ';'
	li $v0, print_char
	syscall			# print_char(';')
	
	addi $t2, $t2, 4	# p++
	j writing 
	
endw:
	jr $ra
	
	
	