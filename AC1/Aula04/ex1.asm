# MAPA DE REGISTOS
# $t0: i
# $t1: num
# $t2: str
# $t3: SIZE + 1
# $a0: str	
	
	.data
	.eqv SIZE, 20
str:
	.space SIZE
	.text
	.globl main
	
main:
	la	$a0, str		# $a0=&str[0] (endereço da posição 0
	
	li 	$a1, SIZE		# $a1=SIZE
	li 	$v0, 8
	syscall			# read_string(str, SIZE); 
	
	li 	$t0, 0		# i = 0
	li 	$t1, 0		# num = 0
loop:				
	la	$t2, str		# $t2 = str[0]
	addu 	$t3, $t2, $t0	# lista + i
	lb	$t4, 0($t3)	# str[i]
	
	beq	$t4, '\0', endw	# while( str[i] != '\0' ) 
if:
	blt	$t4, '0', endif	# (str[i] >= '0') && 
	bgt	$t4, '9', endif	# (str[i] <= '9')
	addi 	$t1, $t1, 1	# num++
endif:
	addi 	$t0, $t0, 1	# i++
	j loop
endw:
	move 	$a0, $t1		# $a0 = num
	li 	$v0, 1
	syscall			# print_int10(num); 
	
	jr	$ra		# finish program