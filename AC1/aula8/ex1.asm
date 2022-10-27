# Mapa de registos
# res: $v0
# s: $a0
# *s: $t1
# digit: $t0

	.data
	.eqv print_int10, 1
	
str1:	.asciiz "2020 e 2024 sao anos bissextos"

	.text
	.globl main

main:
	addiu 	$sp, $sp, -4	# esvaziar stack
	sw 	$ra, 0($sp)
	
	la 	$a0, str1
	jal 	atoi
	move 	$a0, $v0
	li 	$v0, print_int10	# print_int10( atoi(str) ); 
	syscall
	
	li 	$v0, 0		# return 0
	lw	$ra, 0($sp)		
	addiu	$sp, $sp, 4		
	jr	$ra		# { fim do programa
	
atoi:
	li 	$v0, 0		# res = 0;
while:
	lb	$t1, 0($a0)
	blt	$t1, '0', endw
	bgt 	$t1, '9', endw
	sub 	$t0, $t1, '0'
	addiu 	$a0, $a0, 1 	# *s++
	mulu 	$v0, $v0, 10	#res = 10 * res 
	addu 	$v0, $v0, $t0 	# res + digit; 
	j while
endw:
	jr 	$ra