# Mapa de registos
# houve_troca: $t4
# i: $t5
# lista: $t6
# lista + i: $t7 	
	.data
	.eqv SIZE, 10
	.eqv TRUE, 1
	.eqv FALSE, 0
lista:
	.space 40
str2:
	.asciiz "\nConteudo do array:\n"
	.text
	.globl main
	
main:
	li $t0, 0	# i = 0
	la $t2, lista 
read:
	bge $t0, SIZE, endread
	
	li $v0, 5
	syscall
	
	sll $t1, $t0, 2
	addu $t1, $t1, $t2
	sw $v0, 0($t1)
	
	addi $t0, $t0, 1	# i++
	j read
endread:
#############################################################
	li $t3, SIZE
	sub $t3, $t3, 1
	
do:
	li $t4, FALSE
	la $t2, lista
	li $t0, 0	# i = 0
	
	li $v0, 1
	syscall
for:
	bge $t0, $t3, while
	
	sll $t1, $t0, 2	# i*2
	addu $t5, $t1, $t2	# lista+i
	
	lw $t6, 0($t5)
	lw $t7, 4($t5)
if:
	ble $t6, $t7, endif
	sw $t6, 4($t5)
	sw $t7, 0($t5)
	li $t4, TRUE
endif:	
	addi $t0, $t0, 1	# i++
	j for
	
while:
	beq $t4, TRUE, do
#######################################################################
endwhile:
	la $t5, lista 	# p = lista
	li $t3, SIZE
	sll $t3, $t3, 2
	addu $t6, $t3, $t2 	# pultimo  =  lista + SIZE;
write:
	bge $t5, $t6, endw
	
	lw $a0, 0($t5)
	li $v0, 1
	syscall
	
	li $a0, ';'
	li $v0, 11
	syscall
	
	addi $t5, $t5, 4	# p++
	j write
endw:
	jr $ra
