# MAPA
# $t0: i
# $t1: value
# $t2: bit

	.data 
	
str1:
	.asciiz "Introduza um numero: "
str2:
	.asciiz "\nO valor em binário é: "
	
	.text
	.globl main
	
main:
	la 	$a0, str1
	li 	$v0, 4
	syscall		# print_string("Introduza um numero: "); 
	
	li 	$v0, 5
	syscall
	move 	$t1, $v0	# value = read_int(); 
	
	la 	$a0, str2
	li 	$v0, 4
	syscall		# print_string("\nO valor em binário e': "); 
	
	li 	$t0, 0	# i = 0
for:
	bge	$t0, 32, endfor 	# for(i=0; i < 32; i++) {
	rem 	$t3, $t0, 4	# i % 4
if1:
	bnez	$t3, endif1
	li 	$a0, ' '
	li 	$v0, 11
	syscall			# 		print_char(' '); 
	
endif1:	
	andi	$t2, $t1,  0x80000000	# 	bit = value & 0x80000000; // isola bit 31  
if:
	beq	$t2, 0, else	# 	if(bit != 0) 
	
	li 	$a0, '1'
	li 	$v0, 11
	syscall			# 		print_char('1'); 
	
	j endif
else:
	li 	$a0, '0'
	li 	$v0, 11
	syscall			# 		print_char('0'); 
endif:
	sll	$t1, $t1, 1	# 	value = value << 1; // shift left de 1 bit  }
					
	addi 	$t0, $t0, 1	# i++
	j for			# }
endfor:
	jr 	$ra	# finish program
	