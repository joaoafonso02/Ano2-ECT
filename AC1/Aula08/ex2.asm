	.data
	.eqv MAX_STR_SIZE, 33
str:
	.space MAX_STR_SIZE
	.text
	.globl main
	
main:
	addiu 	$sp, $sp, -8
	sw 	$ra, 0($sp)
	sw 	$s0, 4($sp)
do:
	li 	$a0, '\n'
	li	$v0, 11
	syscall
	
	li 	$v0, 5
	syscall
	move 	$s0, $v0
	
	move	$a0, $s0
	li 	$a1, 2
	la 	$a2, str
	jal itoa
	
	move 	$a0, $v0
	li 	$v0, 4
	syscall			# print_string( itoa(val, 2, str) ); 
	
	li 	$a0, '\n'
	li	$v0, 11
	syscall
	
	move	$a0, $s0
	li 	$a1, 8
	la 	$a2, str
	jal itoa
	
	move 	$a0, $v0
	li 	$v0, 4
	syscall			# print_string( itoa(val, 8, str) ); 
	
	li 	$a0, '\n'
	li	$v0, 11
	syscall
	
	move	$a0, $s0
	li 	$a1, 16
	la 	$a2, str
	jal itoa
	
	move 	$a0, $v0
	li 	$v0, 4
	syscall			# print_string( itoa(val, 16, str) ); 
while:
	bnez	$t0, do	#  while(val != 0); 
	
	li 	$v0, 0	# return 0
	lw 	$s0, 4($sp)
	lw 	$ra, 0($sp)
	addiu 	$sp, $sp, 8
	jr $ra
##############################################################
# Mapa de registos
# n: $a0 -> $s0
# b: $a1 -> $s1
# s: $a2 -> $s2
# p: $s3
# digit: $t0
# Sub-rotina intermédia 
itoa:
	addiu 	$sp, $sp, -20
	sw 	$ra, 0($sp)
	sw	$s0, 4($sp)
	sw	$s1, 8($sp)
	sw	$s2, 12($sp)
	sw	$s3, 16($sp)
		
	move	$s0, $a0	# s0 = n
	move	$s1, $a1	# s1 = b
	move	$s2, $a2	# s2 = s
	move	$s3, $a2	# s3 = p = s
do_itoa:
	rem	$t0, $s0, $s1 # digit = n % b
	div	$s0, $s1	  # n/b;
	mflo	$s0	  # n = n/b
	
	move	$a0, $t0	# $a0 = digit
	jal 	toascii
	sb	$v0, 0($s3)
	addiu 	$s3, $s3, 1
while_itoa:
	bgt	$s0, 0, do_itoa	
	
	sb	$0, 0($s3)
	move 	$a0, $s2
	jal 	strrev
	
	move	$v0, $s2	# return s;
	
	lw 	$ra, 0($sp)
	lw	$s0, 4($sp)
	lw	$s1, 8($sp)
	lw	$s2, 12($sp)
	lw	$s3, 16($sp)
	addiu	$sp, $sp, 20
	jr $ra
	
##############################################################
toascii:
	addi	$v0, $a0, '0'
if:
	ble	$v0, '9', endif
	addi 	$v0, $v0, 7	
endif:
	jr $ra
##############################################################	
	
##############################################################
# Mapa de registos:
# str: $a0 -> $s0 (argumento � passado em $a0)
# p1: $s1 (registo callee-saved)
# p2: $s2 (registo callee-saved)
	.text
	.globl 	strrev

strrev: 			# char * strrev(char *str) {
	addiu 	$sp, $sp, -16 	# reserva espaco na stack
 	sw 	$ra, 0($sp) # 	guarda endereco de retorno
	sw 	$s0, 4($sp) # 	guarda valor dos registos
	sw 	$s1, 8($sp) # 	$s0, $s1 e $s2
	sw 	$s2, 12($sp) 	#
	move 	$s0, $a0 		# registo "callee-saved"
	move 	$s1, $a0 		# p1 = str
	move 	$s2, $a0 		# p2 = str
while1: lb	$t1, 0($s2)		#	$t1 = *p2;
	beq	$t1, '\0', endw1# 	while( *p2 != '\0' ) {
	addiu	$s2, $s2, 1 	# 	p2++;
	j 	while1 		# }
endw1:	addiu	$s2, $s2, -1 	# 	p2--;
while2: bge	$s1, $s2, endw2		# while(p1 < p2) {
	move 	$a0, $s1 		
	move 	$a1, $s2		
 	jal 	exchange 	# exchange(p1,p2);
 	addiu	$s1, $s1, 1
 	addiu	$s2, $s2, -1
	j 	while2 	# }
endw2:	move 	$v0, $s0 		# return str
	lw 	$ra, 0($sp) 	
 	lw 	$s0, 4($sp) 	
	lw 	$s1, 8($sp)		# $s0, $s1 e $s2
	lw 	$s2, 12($sp) 		
	addiu 	$sp, $sp, 16		
	jr 	$ra 			
	
exchange:				# void exchange(char *c1, char *c2) {
	lb	$t0, 0($a0)		#	$t0 = *c1:
	lb	$t1, 0($a1)		#	$t1 = *c2;
	sb	$t0, 0($a1)
	sb	$t1, 0($a0)
	jr	$ra		# } fim do programa
	
	
