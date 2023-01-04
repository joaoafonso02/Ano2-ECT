	.data
	.eqv id_number, 0
	.eqv first_name, 4
	.eqv last_name, 22
	.eqv grade, 40
	
str1:	.asciiz	"N. Mec: "
str2:	.asciiz	"Primeiro Nome: "
str3:	.asciiz	"Ultimo Nome: "
str4:	.asciiz	"Nota: "
	
	.text
	.globl read_data
read_data:
	li $t0, 0		# i  = 0
	move $t2, $a0 	# $t2 = student *st
	move $t1, $a1	# $t1 = int ns
fori:
	bge $t0, $t1, endfori
	
	la $a0, str1
	li $v0, 4
	syscall		# print_string("N. Mec: "); 
	
	li $v0, 5
	syscall		# read_int();
	
	mul $t3, $t0, 44	# i*44
	addu $t3, $t3, $t2	# st[i]
	sw $v0, id_number($t3)	# st[i].id_number = read_int();
	
	la $a0, str2
	li $v0, 4
	syscall		# print_string("Primeiro Nome: "); 
	
	addiu $a0, $t3, first_name	# $a0 = st[i].first_name
	li $a1, 17			# $a1 = 17
	li $v0, 8
	syscall			# read_string(st[i].first_name, 17); 
	
	la $a0, str3
	li $v0, 4
	syscall		# print_string("Ultimo Nome: "); 
	
	addiu $a0, $t3, last_name	# $a0 = st[i].last_name
	li $a1, 14			# $a1 = 14
	li $v0, 8
	syscall			# read_string(st[i].last_name, 17); 
	
	la $a0, str4
	li $v0, 4
	syscall		# print_string("Nota: "); 
	
	li $v0, 7
	syscall		# read_float();
	
	s.s $f0, grade($t3)	# st[i].grade = read_float(); 
	
	addi $t0, $t0, 1	# i++	
	j fori
endfori:	
	jr $ra