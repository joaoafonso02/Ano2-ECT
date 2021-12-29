# Mapa de registos
# res: $v0
# s: $a0
# *s: $t0
# digit: $t1
# Sub-rotina terminal: não devem ser usados registos $sx

	.data
str:	.asciiz "2016 e 2020 sao anos bissextos"
	.text
	.globl main
	
main:
	addiu	$sp, $sp, -4		#
	sw	$ra, 0($sp)		#
	la	$a0, str		#	$t0 = str;
	jal	atoi			#	atoi(str);
	move	$a0, $v0		#	$a0 = return atoi(str)
	li	$v0, 1			#
	syscall		
	li $v0, 0		#
	lw	$ra, 0($sp)		# 
	addiu	$sp, $sp, 4		#
	jr	$ra			# { fim do programa
atoi:
	li $v0, 0 		# res = 0
while:
	lb $t1, 0($a0)	
	blt  $t1, '0', endw
	bgt $t1, '9', endw
	sub $t0, $t1, '0'	# digit = *s – '0' 
	addiu $a0, $a0, 1	# s++
	mulu $v0, $v0, 10	# res = 10 * res; 
	addu $v0, $v0, $t0	# res = 10 * res + digit; 
	j while
endw:
	jr $ra			#  termina sub-rotina