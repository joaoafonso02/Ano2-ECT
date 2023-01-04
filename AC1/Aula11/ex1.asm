	.data
	.eqv id_number, 0
	.eqv first_name, 4
	.eqv last_name, 22 	# 4 + 18
	.eqv grade, 40	# 22 + 15 = 37 --> arredonda ao multiplo de 4,  40

	.align 2
stg:	.word 72343
	.asciiz "Napoleao" # ocupa 9
	.space 9 	# 18 - 9 pq first_name[18]
	.asciiz "Bonaparte" # ocupa 10
	.space 5	# 15 - 10 pq first_name[15]
	.float 5.1

str1:	.asciiz "\nN. Mec: "	
str2:	.asciiz "\nNome: "
str3:	.asciiz "\nNota: "
str4:	.asciiz "Primeiro nome: "

	.text
	.globl main

main:
	la	$t0, stg		#	$t0 = stg;
	
	la 	$a0, str1
	li 	$v0, 4
	syscall 	# print_string("\nN. Mec: "); 
	
	li 	$v0, 5
	syscall
	
	sw 	$v0, id_number($t0)
	
	la 	$a0, str4
	li 	$v0, 4
	syscall 	# print_string("\nPrimeiro nome: "); 
	
	addiu	$t1, $t0, first_name	# $t1 = $t0 + 4
	move	$a0, $t1		# $a0 = $t1
	li	$a1, 17		# $a1 = 17
	li	$v0, 8		
	syscall			# read_str();
	
	la 	$a0, str1
	li 	$v0, 4
	syscall 	# print_string("\nN. Mec: "); 
	
	lw 	$a0, id_number($t0)
	li 	$v0, 36
	syscall	# print_intu10(stg.id_number); 
	
	la 	$a0, str2
	li 	$v0, 4
	syscall 	# print_string("\nNome: "); 
	
	addiu	$a0, $t0, last_name
	li 	$v0, 4
	syscall	# print_intu10(stg.last_name);
	
	 li	$a0, ','
	li	$v0, 11
	syscall	# print_char(','); 
	
	addiu 	$a0, $t0, first_name
	li 	$v0, 4
	syscall	# print_string(stg.first_name);  
	
	la 	$a0, str3
	li 	$v0, 4
	syscall 	# print_string("\nNota: "); 
	
	l.s 	$f12, grade($t0)
	li 	$v0, 2				
	syscall	# print_string(stg.first_name); 
	
	li 	$v0, 0
	jr $ra