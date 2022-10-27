# MAPA
# i - $t0
# lista - $t1
# lista + i - $t2
# houveTroca - $t3
	
	.data
	.eqv SIZE, 10
	.eqv TRUE, 1
	.eqv FALSE, 0
lista:
	.space SIZE
str1:
	.asciiz "\nIntroduza um numero: "
str2:
	.asciiz "\nConteudo do array:\n"
str3:
	.asciiz "; "
	
	.text
	.globl main

# inserir aqui o código para leitura de 
# valores e preenchimento do array 
main:	
	li $t0, 0  # i = 0
for:		# for(i=0; i < SIZE; i++) 
	bge $t0, SIZE, endfor
	
	la $a0,  str1
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	la $t1, lista
	sll $t2, $t0, 2
	addu $t2, $t2, $t1
	
	sw $v0, 0($t2)
	
	addi $t0, $t0, 1
	j for
	
endfor:

do:
	li $t3, FALSE  # houveTroca = FALSE; 
	li $t0, 0	# i = 0
		
for2:	# for (i=0; i < SIZE-1; i++) 
	bge $t0, 9, endfor2
	
	la $t1, lista 
	sll $t2, $t0, 2
	addu $t2, $t2, $t1
	
	lw $t5, 0($t2) # lista[i] 
	lw $t6, 4($t2) # lista[i+1] 
	
if:	# if (lista[i] > lista[i+1]) 
	ble $t5, $t6, endif
	
	sw $t5, 4($t2)
	sw $t6, 0($t2)
	li $t3, TRUE
	
endif:
	addi $t0, $t0, 1
	j for2
endfor2:

while:
	beq $t3, TRUE, do	
endwhile:
	li	$v0, 4	#
	la	$a0, str2		#	
	syscall		
	li $t0, 0
for3:
	bge $t0, SIZE, endw
	la $t1, lista
	sll $t3, $t0, 2
	addu $t3, $t1, $t3
	
	lw $a0, 0($t3)
	li $v0, 1
	syscall
	
	li	$v0, 4	#
	la	$a0, str3		#
	syscall	
	
	addi $t0, $t0, 1
	j for3

endw:
	jr $ra	
	