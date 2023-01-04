	.data
str1:
	.asciiz "Nr. de parametros: "
str2:
	.asciiz  "\nP"
str3:
	.asciiz ": "
	
	.text
	.globl main
	
main:
	move 	$t0, $a0
	move	$t1, $a1
	
	la 	$a0, str1
	li 	$v0, 4
	syscall		# print_string("Nr. de parametros: ");
	
	move 	$a0, $t0
	li 	$v0, 1
	syscall		# print_int10(argc); 
	li 	$t2, 0 	# i = 0
for:
	bge 	$t2, $t0, endw
	
	la 	$a0, str2
	li 	$v0, 4
	syscall
	
	move 	$a0, $t2
	li 	$v0, 1
	syscall	
	
	la 	$a0, str3
	li 	$v0, 4
	syscall
	
	sll 	$t3, $t2, 2 # i*4
	addu 	$t4, $t3, $t1 
	
	lw	$a0,0($t4)	# argv[i]
	
	li 	$v0, 4
	syscall 
	
	
	addi 	$t2, $t2, 1 # i = 0
	j for
endw:
	li 	$v0, 0
	jr $ra