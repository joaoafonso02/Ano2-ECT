# Register map
# num = $t0
# p = $t1
# *p = $t2
	
	.data
	.eqv read_string, 8
	.eqv SIZE, 20
	.eqv print_int10, 1
str:	.space SIZE
	
msg:	.asciiz "Introduce a string:"
	.text
	.globl main
	
main: 	
	la $a0, msg
	li $v0, read_string
	syscall
	
	
	la $a0, str 		# $a0=&str[0] (endereço da posição
				#  0 do array, i.e., endereço
				#  inicial do array)
	li $t0, 0		# int num = 0; 
	
	li $a1, SIZE
	li $v0, read_string
	syscall 		# read_string(str, SIZE);  Le do teclado uma string com um máximo de 20 carateres 
	
	la $t1, str 		# p = str; 
	
while:				# while( *p != '\0' ) 
	lb $t2, 0($t1)
	beq $t2, 0, smth
	blt $t2, '0', endif	# (*p >= '0') && (*p <= '9')
	bgt $t2, '9', endif
	
	addi $t0, $t0, 1	# num++; 
	
endif:
	addiu $t1, $t1, 1	# p++;
	j while
	
smth:
	move $a0, $t0
	li $v0, print_int10
	syscall			# print_int10(num)
	
	jr $ra
	