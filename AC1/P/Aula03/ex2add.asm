# MAPA
# $t0: i
# $t1: res
# $t2: mdor
# $t3: mdo


	.data		# 0x100100
str1:
	.asciiz "Introduza dois numeros: "	
str2:
	.asciiz "Resultado: "	
	
	.text
	.globl main
	
main:
	li 	$t0, 0		# i = 0
	li	$t1, 0		# res = 0
	
	la	$a0, str1
	li 	$v0, 4
	syscall			# print_string("Introduza dois numeros: "); 
	
	li 	$v0, 5
	syscall
	move	$t2, $v0		# $t2 = read_int()
	
	andi 	$t2, $t2, 0x0F	# mdor = read_int() & 0x0F;
	
	li 	$v0, 5
	syscall
	move	$t3, $v0		# $t3 = read_int()
	
	andi 	$t3, $t3, 0x0F	# mdo = read_int() & 0x0F; 
while:
	beqz	$t2, endw		# (mdor != 0) &&
	addi 	$t0, $t0, 1	# i++
	bge	$t0, 4, endw	# (i++ < 4) 
	
	andi	$t4, $t2, 0x00000001	# (mdor & 0x00000001) 
if:
	beqz	$t4, endif
	add	$t1, $t1, $t3	# res = res + mdo;
	j endif
endif:
	sll	$t3, $t3, 1	# mdo = mdo << 1; 
	srl	$t2, $t2, 1	# mdor = mdor >> 1; 
	j while
	
endw:
	la	$a0, str2
	li 	$v0, 4
	syscall			# print_string("Resultado: "); 
	
	move 	$a0, $t1
	li 	$v0, 1
	syscall			# print_int10(res); 
	
	jr 	$ra