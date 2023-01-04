	.data
str:	.asciiz "2020 e 2024 sao anos bissextos"

	.text
	.globl main
main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	la $a0, str
	jal atoi
	
	move $a0, $v0
	li $v0,1 
	syscall  # print_int10( atoi(str) ); 
	
	li $v0, 0 # return 0;
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra
	
#####################################################
atoi:
	li $v0, 0 # res = 0
while:
	lb 	$t0, 0($a0)
	blt 	$t0, '0', endw
	bgt 	$t0, '9', endw
	addiu	$a0, $a0, 1 # *s++
	addi 	$t1, $t0,  -0x30 # digit = *s++ - '0'; 
	
	
	mul 	$v0, $v0, 10 # 10 * res 
	add 	$v0, $v0, $t1 # res = 10 * res + digit; 
	
	j while
endw:
	jr $ra
	