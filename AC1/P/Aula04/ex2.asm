# MAPA DE REGISTOS
# $t0: num
# $t1: str
# $t2: *p

	.data
	.eqv read_string, 8
	.eqv print_int10, 1
	.eqv SIZE, 20

str:
	.space SIZE
	
	.text
	.globl main
	
main:
	la	$a0, str		# $a0 = str
	li	$a1, SIZE		# $a1=SIZE
	li 	$v0, read_string
	syscall			# read_string(str, SIZE); 
	
	la 	$t1, str		# p = str; 
loop:
	lb	$t2, 0($t1)	# *p
	beq	$t2, '\0', endw	# while( *p != '\0' ) 
if:
	blt	$t2, '0', endif	# if( (*p >= '0') &&
	bgt	$t2, 'g', endif	#  (*p <= '9') ) 
	addi 	$t0, $t0,	1	# num++ 
endif:
	addi 	$t1, $t1, 1	# p++
	j loop
endw:
	move 	$a0, $t0	
	li 	$v0, print_int10
	syscall			# print_int10
	
	jr 	$ra