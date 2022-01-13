# Mapa de registos
# n: $a0 -> $s0
# b: $a1 -> $s1
# s: $a2 -> $s2
# p: $s3
# digit: $t0 

	.data
	.eqv MAX_STR_SIZE, 33 
	.eqv print_string, 4
	.eqv read_int, 5
str:	.space 33
str1:	.asciiz "\n"
	.text
	.globl main
	
main:
	addiu 	$sp $sp, -8
	sw 	$ra, 0($sp)
do:
	li 	$v0, read_int
	syscall
	move 	$s0, $v0	# val = read_int();
	
	move 	$a0, $s0
	li 	$a1, 2
	la 	$a2, str
	jal itoa
	move  	$a0, $v0
	li 	$v0, print_string
	syscall 		# print_string( itoa(val, 2, str) ); 
	
	move 	$a0, $s0
	li	$a1, 8
	la 	$a2, str
	jal itoa
	move 	$a0, $v0
	li 	$v0, print_string
	syscall 		# print_string( itoa(val, 8, str) ); 
	
	move 	$a0, $s0
	li 	$a1, 16
	la	$a2, str
	jal itoa
	move 	$a0, $v0
	li 	$v0, print_string
	syscall 		# print_string( itoa(val, 16, str) ); 
	
	li	$v0, print_string
	la	$a0, str1
	syscall
while:
	beqz 	$s0, endw

endw:
	li 	$v0, 0		# return 0
	lw 	$ra, 0($sp)
	addiu 	$sp, $sp, 8
	jr 	$ra
#-----------------------------------------------------------------------------------	
itoa:
	addiu 	$sp, $sp, -20
	sw 	$ra, 0($sp)
	sw 	$s0, 4($sp)	# n
	sw 	$s1, 8($sp)	# b
	sw 	$s2, 12($sp)	# *s
	sw 	$s3, 16($sp)	# *s
	
	move 	$s0, $a0
	move 	$s1, $a1
	move 	$s2, $a2
	move 	$s3, $a2
doit:
	rem 	$t0, $s1, $s2	# digit = n % b; 
	div	$s0, $s2	# n /b
	mflo 	$s0		# n = n / b; 
	move 	$a0, $t0
	jal toascii		# *p++ = toascii( digit ); 
	sb 	$v0, 0($s3)
	addiu 	$s3, $s3, 1
whileit:
	bgez $s0, endewit	# while( n > 0 ); 
endewit:
	sb 	$0, 0($s3)	# *p = '\0'; 
	move 	$a0, $s2
	jal strrev		# strrev( s ); 
	move 	$v0, $s2	# return s; 
		
	lw	$ra, 0($sp)		
	lw	$s0, 4($sp)		
	lw	$s1, 8($sp)		
	lw	$s2, 12($sp)		
	lw	$s3, 16($sp)		
	addiu 	$sp, $sp, 20		
	jr $ra
#-----------------------------------------------------------------------------------
toascii:
	addi 	$v0, $a0, '0'	# v += '0'; 
ifto:
	ble 	$v0, '9', endifto	# if( v > '9' ) 
	addiu 	$v0, $v0, 7	# v += 7; // 'A' - '9' - 1 
endifto:
	jr $ra
#-----------------------------------------------------------------------------------
strrev: 					# char * strrev(char *str) {
	addiu 	$sp, $sp, -16 			# reserva espaço na stack
 	sw 	$ra, 0($sp) 			# guarda endereço de retorno
	sw 	$s0, 4($sp) 			# guarda valor dos registos
	sw 	$s1, 8($sp) 			# 	$s0, $s1 e $s2
	sw 	$s2, 12($sp) 			
	move 	$s0, $a0 			# registo "callee-saved"
	move 	$s1, $a0 			# p1 = str
	move 	$s2, $a0 			# p2 = str
while1: 
	lb	$t1, 0($s2)			# $t1 = *p2;
	beq	$t1, '\0', endw1		# while( *p2 != '\0' ) {
	addiu	$s2, $s2, 1 			# 	p2++;
	j 	while1 				# }
endw1:	
	addiu	$s2, $s2, -1 			# p2--;
while2: 
	bge	$s1, $s2, endw2			# while(p1 < p2) {
	move 	$a0, $s1 			
	move 	$a1, $s2			
 	jal 	exchange 			# exchange(p1,p2);
 	addiu	$s1, $s1, 1			
 	addiu	$s2, $s2, -1			
	j 	while2 				
endw2:	
	move 	$v0, $s0 			# return str
	lw 	$ra, 0($sp) 			# repõe endereço de retorno
 	lw 	$s0, 4($sp) 			# repõe o valor dos registos
	lw 	$s1, 8($sp)			# 	$s0, $s1 e $s2
	lw 	$s2, 12($sp) 			
	addiu 	$sp, $sp, 16			# liberta espaço da stack
	jr 	$ra 				# termina a sub-rotina
#------------------------------------------------------------	
exchange:
	lb	$t0, 0($a0)			# $t0 = *c1:
	lb	$t1, 0($a1)			# $t1 = *c2;
	sb	$t0, 0($a1)
	sb	$t1, 0($a0)
	jr	$ra				# } fim do programa

#------------------------------------------------------------	
strcpy:						# char *strcpy(char *dst char *src) {
	move	$t2, $a0			#
dopy:						#
	lb	$t1, 0($a1)			# $t1 = src[i];
	sb	$t1, 0($a0)			# dts[i] = src[i];
	addiu	$a0, $a0, 1
	addiu	$a1, $a1, 1
dowhilepy:
	bne	$t1, '\0', do			# while(src[i] != '\0');
	move	$v0, $t2			# return dst;
	jr	$ra				# fim do programa
