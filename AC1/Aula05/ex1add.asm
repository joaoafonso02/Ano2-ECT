# MAPA
# i: $t0
# j: $t1
# lista: $t2
# SIZE-1: $t3

	.data
	.eqv SIZE, 10
lista:	
	.space 40
str:
	.asciiz "\nConteudo do array:\n"
		
	.text
	.globl main
	
main:
	li $t3, 0	# i = 0
load:			# for(i=0; i < SIZE; i++)
	bge $t3, SIZE, endload  #  i < SIZE
	
	li $v0, 5
	syscall		# read_int(); 
	
	la $t0, lista
	sll $t2, $t3, 2	# i*4
	addu $t0, $t2, $t0	# &lista[0]
	sw $v0, 0($t0) # lista[i] = read_int(); 
	
	addi $t3, $t3, 1	# i++
	j load
endload:
	li $t0, 0	# i = 0
	la $t2, lista
	
	li $t3, SIZE
	sub $t3, $t3, 1	# SIZE-1
for1:
	bge $t0, $t3, endfor1
	addi $t1, $t0, 1 # j = i+1
for2:
	bge $t1, SIZE, endfor2
	la $t2, lista
	
	sll $t4, $t0, 2	# i*4
	addu $t5, $t4, $t2	# lista + i
	
	sll $t8, $t1, 2	# j*4
	addu $t9, $t8, $t2	# lista + j
	
	lw $t6, 0($t5)	# lista[i]
	lw $t7, 0($t9)	# lista[j]
if:
	ble $t6, $t7, endif
	
	sw $t6, 0($t9)	# lista[i] = lista[j]; 
	sw $t7, 0($t5)	# lista[j] = lista[i]; 
endif:	
	addi $t1, $t1, 1	# j++
	j for2
endfor2:
	addi $t0, $t0, 1	# i++
	j for1	
endfor1:
	la $a0, str
	li $v0, 4
	syscall
	
	la $t2, lista	# p = lista
	li $t3, SIZE
	sll $t3, $t3, 2	# SIZE*4
	addu $t4, $t3, $t2	# lista + SIZE
write:	
	bge $t2, $t4, endw
	
	lw $a0, 0($t2)
	li $v0, 1
	syscall
	
	li $a0, ';'
	li $v0, 11
	syscall
	
	addi $t2, $t2, 4
	j write 
endw:	
	jr $ra	
