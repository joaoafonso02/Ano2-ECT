# MAPA
# i - $t0
# lista - $t1
# lista + i - $t2
# SIZE - $t3
	
	.data
	.eqv SIZE, 5						
lista:
	.space SIZE
str:
	.asciiz "\nIntroduza um numero: "
	
	.text
	.globl main	
main:
  	li $t0, 0  # i = 0
  	li $t3, SIZE  # SIZE = 5
  	
for:
	bge $t0, $t3, endw  # for(i=0; i < SIZE; i++) 
	
	la $a0, str
	li $v0, 4
	syscall	# print_string(str); 
	
	li $v0, 5
	syscall
	
	la $t1, lista  # &lista[0]
	sll $t2, $t0, 2 # i*4
	addu $t2, $t2, $t1 # lista + i
	
	sw $v0, 0($t2)
	
	addi $t0, $t0, 1  # i++ 
	j for
	
endw:
	jr $ra 