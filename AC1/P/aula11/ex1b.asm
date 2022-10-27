	.data 
	.eqv id_number, 0
	.eqv first_name, 4
	.eqv last_name, 22
	.eqv grade, 40
	.eqv print_intu10, 36
	.eqv print_string, 4
	.eqv print_char, 11
	.eqv print_float, 2
	.eqv read_string, 8
	.eqv read_int, 5
stg:
	.word 72343
	.asciiz "Napoleao"
	.space 9
	.asciiz	"Bonaparte"
	.space 5
	.float	5.1	
	 
str1:	.asciiz "\nN. Mec: "
str2:	.asciiz "\nNome: "
str3:	.asciiz "\nNota: "
str4:	.asciiz "\nPrimeiro Nome: "

	.text
	.globl main
	
main:
	la 	$t0, stg
	
	la 	$a0, str1
	li 	$v0, print_string
	syscall					# print_string("\nN. Mec: "); 
	
	li	$v0, read_int			
	syscall				
	sw	$v0, id_number($t0)		# stg.id_nunmber = $v0
	
	la	$a0, str4		
	li	$v0, print_string		
	syscall		
	
	addiu 	$t1, $t0, first_name		# $t1 = $t0 + 4
	move 	$a0, $t1
	li 	$a1, 18
	li 	$v0, read_string
	syscall 
	
	lw 	$a0, id_number($t0)		# stg.id_number
	li 	$v0, print_intu10
	syscall					# print_intu10(stg.id_number); 
	
	la 	$a0, str2
	li 	$v0, print_string
	syscall					# print_string("\nNome: "); 
	
	addiu	$a0, $t0, last_name
	li 	$v0, print_string
	syscall					# print_string(stg.last_name); 
	
	li	$a0, ','
	li	$v0, print_char
	syscall					# print_char(','); 
	
	addiu 	$a0, $t0, first_name
	li 	$v0, print_string
	syscall					# print_string(stg.first_name); 
	
	la 	$a0, str3
	li 	$v0, print_string
	syscall					# print_string("\nNota: "); 
	
	l.s 	$f12, grade($t0)
	li 	$v0, 2				
	syscall					# print_float(stg.grade); 
	
	li 	$v0, 0				# return 0;
	jr	$ra
		