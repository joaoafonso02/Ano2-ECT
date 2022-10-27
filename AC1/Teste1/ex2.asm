# MAPA
# i: $t0
# v: $t1
# &(val[0]): $t2

	.data
	.eqv SIZE, 8
val:
	.word 8,4,15,-1997,327,-9,27,16
str1:
	.asciiz "Result is: "
	
	.text
	.globl main
main:
	li $t0, 0  # i = 0
do:
	li $v0, 5
	syscall
	move $t1, $v0
	
	la $t2, val
	sll $t3, $t0, 2
	addu $t4, $t2, $t3	# &(val[0])
	
	lw $t5, 0($t4)	# v = val[i]
	lw $t6, 16($t4)	# val[i + SIZE/2]
	
	sw $t5, 16($t4) 	# val[i] = val[i + SIZE/2]
	sw $t6, 0($t4)	# val[i + SIZE/2] = val[i]
while:	
	addi $t0, $t0, 1
	bge $t0, 4, endw
	j do
endw:	
	la $a0, str1
	li $v0, 4
	syscall
	
	li $t0, 0

do2:
	sll $t5, $t0, 2
	addu $t5, $t5, $t2
	
	lw $a0, 0($t5)
	li $v0, 1
	syscall
	
	addi $t0, $t0, 1	# i++
	li $a0, ','
	li $v0, 11
	syscall
while2:
	bge $t0, SIZE, endw2
	j do2
endw2:
	jr $ra
