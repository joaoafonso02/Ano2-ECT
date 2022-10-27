# str: $a0
# p1: $s1
# p2: $s2

	.data
str1:	.asciiz "ITED - orievA ed edadisrevinU"
	.text
	.globl main
	
main:
	addiu $sp, $sp, -4		# esvaziar lista
	sw $ra, 0($sp)
	
	la $a0, str1
	jal strrev
	
	move $a0, $v0
	li $v0, 4
	syscall
	
	li $v0, 0
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra
	
strrev:
	addiu $sp, $sp, -16		# reserva espaço na stack
	sw $ra, 0($sp)			# guarda endereço de retorno 
	sw $s0, 4($sp)			#
	sw $s1, 8($sp)			# guarda valor dos registos $s0, $s1, $s2
	sw $s2, 12($sp)			#
	move $s0, $a0
	move $s1, $a0			# p1 = str 
	move $s2, $a0			# p2 = str 
while:
	lb $t1, 0($s2)
	beq $t1, '\0', endwhile		# while(*p2 != '\0') 
	addiu $s2, $s2, 1		# p2++
	j while
	
endwhile:
	addiu $s2, $s2, -1		# p2--
	
while2:
	bge $s1, $s2, endw		# while( p1 < p2 ) 
	move $a0, $s1
	move $a1, $s2
	
	jal exchange			# exchange(p1, p2);
	addiu $s1, $s1, 1		# p1++; 
	addiu $s2, $s2, -1		# p2--; 
	
	j while2
	
endw:
	move $v0, $s0
	lw $ra, 0($sp)			# guarda endereço de retorno 
	lw $s0, 4($sp)			#
	lw $s1, 8($sp)			# guarda valor dos registos $s0, $s1, $s2
	lw $s2, 12($sp)			#
	addiu $sp, $sp, 16		# liberta espaço da stack
	jr $ra
	
exchange:
	lb $t0, 0($a0)
	lb $t1, 0($a1)
	sb $t0, 0($a1)
	sb $t1, 0($a0)
	jr $ra
	