# n: $t0
# rv: $t1
# sum: $t2
# nit: $t3
# pt: $t4
# lista: $t7
	.data 
	.eqv SIZE, 8

list:	.space SIZE
str1:	.asciiz "Media invalida!\n"

	.text
	.globl main
main:
	li $t2, 0 # sum = 0
	li $t3, 0 # nit = 0
	la $t4, list # pt = &list
	
	li $a0, SIZE
	sll $a0, $a0, 2 # SIZE*4
	addu $t5, $a0, $t4 # list + SIZE
for1:
	bge $t4, $t5, endfor1
	
	li $v0, 5
	syscall # read_int();
	
	sw $v0, 0($t4) # *pt = read_int();
	
	addi $t4, $t4, 4 # pt++
	j for1
endfor1:
	li $t0, 0 # n = 0
	la $t7, list # &list
for2:	
	bge $t0, SIZE, endfor2
	
	sll $a1, $t0, 2 # n*4
	addu $t6, $a1, $t7 # list + n
	lw $t8, 0($t6) # list[n]
if1:
	blt $t8, 0, endif1
	add $t2, $t2, $t8 # sum += list[n]
	addi $t3, $t3, 1 # nit++
endif1:	
	addi $t0, $t0, 1 # n++
	j for2
endfor2:
if2:
	ble $t3, 0, else2
	
	div $a0, $t2, $t3 # sum / nit
	li $v0, 1
	syscall # print_int10(sum / nit)
	
	li $t1, 0 # rv = 0 
	j endif2
else2:
	la $a0, str1
	li $v0, 4
	syscall # print_strinteg("Media invalida!\n")
			
	li $t1, -1 # rv = -1
endif2:
	move $v0, $t1
	jr $ra