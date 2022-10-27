# Mapa de Registos
# *p: $t0
# *(p+1): $t1
# aux: $t2
# i: $t3
# houve_troca: $t4
# p: $t5
# pUltimo: $t6

	.data
	.eqv SIZE, 10
	.eqv TRUE, 1
	.eqv FALSE, 0
lista:
	.space 40
str:
	.asciiz "\nIntroduza um numero: "
	
	.text
	.globl main
main:
	li $t3, 0	# i = 0
load:			# for(i=0; i < SIZE; i++)
	bge $t3, SIZE, endload  #  i < SIZE
	
	la $a0, str
	li $v0, 4
	syscall		# print_string(str); 
	
	li $v0, 5
	syscall		# read_int(); 
	
	la $t0, lista
	sll $t2, $t3, 2	# i*4
	addu $t0, $t2, $t0	# &lista[0]
	sw $v0, 0($t0) # lista[i] = read_int(); 
	
	addi $t3, $t3, 1	# i++
	j load
endload:
	la $t5, lista	# $t0 = lista = p
	li $t6, SIZE
	sub $t6, $t6, 1	# SIZE -1 
	sll $t6, $t6, 2
	addu $t6, $t6, $t5	# pUltimo = lista + (SIZE - 1); 
do:
	la $t5, lista	# $t0 = lista = p
	li $t4, FALSE	# houveTroca = FALSE;
for:
	bge $t5, $t6, while	# for (p = lista; p < pUltimo; p++) 
	lw $t0, 0($t5)	# *p 
	lw $t1, 4($t5)	# *(p+1)
if:
	ble $t0, $t1, endif
	sw $t0, 4($t5)	# *p = *(p+1)
	sw $t1, 0($t5)	# *(p+1) = *p
	li $t4, TRUE	# houveTroca = TRUE
endif:
	addi $t5, $t5, 4	# p++
	j for
while:
	beq $t4, TRUE, do
endw:
	la $t0, lista  # p = lista
	li $t6, SIZE  # SIZE = 10
	sll $t6, $t6, 2 # SIZE * 4
	addu $t7, $t6, $t0 # lista + SIZE
write:
	bge $t0, $t7, endwrite
	
	lw $a0, 0($t0)
	li $v0, 1
	syscall
	
	li $a0, ';'
	li $v0, 11
	syscall
	
	addi $t0, $t0, 4	# p++
	j write
endwrite:
	jr $ra
