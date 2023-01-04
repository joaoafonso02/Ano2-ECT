	.data
	.eqv id_number, 0
	.eqv first_name, 4
	.eqv last_name, 22
	.eqv grade, 40
stg:
	.word 72343
	.asciiz "Napoleao" #ocupa 9
	.space 9 # pq irst_name[18]
	.asciiz "Bonaparte" # ocupa 10
	.space 5
	.float 5.1

str1:	.asciiz "\nN. Mec: "	
str2:	.asciiz "\nNome: "
str3:	.asciiz "\nNota: "
str4:	.asciiz "Primeiro nome: "

	.text
	.globl main
main:
	la $a0, str1
	li $v0, 4
	syscall # print_string("\nN. Mec: "); 
	
	la $t0, stg
	
	li $v0, 5
	syscall
	
	sw $v0, id_number($t0) # stg.id_number
	# lw	$a0,0($t0)	# 	
	move $a0, $v0
	li $v0, 36
	syscall # print_intu10(stg.id_number); 
	
	la $a0, str2
	li $v0, 4
	syscall # print_string("\n\nNome: "); 
	
	addiu $t1, $t0, last_name
	move $a0, $t1 
	li $v0, 4
	syscall
	
	li $a0, ','
	li $v0, 11
	syscall
	
	addiu $t2, $t0, first_name
	move $a0, $t2
	li $v0, 4
	syscall
	
	la $a0, str3
	li $v0, 4
	syscall # print_string("\nNota: "); 
	
	l.s $f12, grade($t0)
	li	$v0,2		#
	syscall			#	print_float(stg.grade);	
	
	li $v0, 0
	jr $ra
	
	
	
