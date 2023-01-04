	.data
	.eqv SIZE, 10
lista:
	.space 40
str1:
	.asciiz "\nResultado: "	

	.text
	.globl main
	
main:
	li $t0, 0 	# i = 0
	la $t2, lista
	
read:
	bge $t0, SIZE, endread
	
	li $v0, 5
	syscall
	
	sll $t1, $t0, 2
	addu $t1, $t1, $t2
	sw $v0, 0($t1)	# lista[i] = read_int(); 
	
	addi $t0, $t0, 1	# i++
	j read
######################################################################
endread:
	li $t0, 0
	la $t2, lista
	li $t3, SIZE
	sub $t3, $t3, 1
for1:
	bge $t0, $t3, endfor
	addi $t1, $t0, 1	# j = i+1
for2:
	bge $t1, SIZE, endfor2
	
	sll $t4, $t0, 2	# i*4
	addu $t5, $t4, $t2	# lista + i
	
	sll $t6, $t1, 2	# j*4
	addu $t7, $t6, $t2	# lista + j
	
	lw $t8, 0($t5)
	lw $t9, 0($t7)
if:
	ble $t8, $t9, endif
	sw $t8, 0($t7)
	sw $t9, 0($t5)
endif:
	addi $t1, $t1, 1	# j++
	j for2
endfor2:
	addi $t0, $t0, 1	# i++
	j for1 
###########################################################
endfor:
	la $a0, str1
	li $v0, 4
	syscall
	
	la $t2, lista	# p = lista
	li $t3, SIZE
	sll $t3, $t3, 2	# SIZE*4
	addu $t3, $t3, $t2	# lista+ SIZE
write:
	bge $t2, $t3, endw
	
	lw $a0, 0($t2)
	li $v0, 1
	syscall
	
	li $a0, ';'
	li $v0, 11
	syscall

	addi $t2, $t2, 4	#  p++
	j write
endw:
	jr $ra
	