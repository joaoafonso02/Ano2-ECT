# i: $t0
# j: $t1
# array[i][j]: $t2
# array: $t6

	.data
	.eqv SIZE, 3
	.eqv print_string, 4
	.eqv print_int10, 1
	.eqv print_char, 11

array:	.word str3, str4, str5
str1:	.asciiz "\nString #"
str2:	.asciiz ": "
str3:	.asciiz "Array"
str4:	.asciiz "de"
str5:	.asciiz "ponteiros"

	.text
	.globl main

main:
	li $t0, 0		# i = 0

 while:
 	bge $t0, SIZE, endw	# while(i < SIZE)

 	la $t6, array		# $t6 = array
 
 	la $a0, str1
 	li $v0, print_string
 	syscall			# print_string( "\nString #" ); 
 	
 	move $a0, $t0		# $a0 = i
 	li $v0, print_int10
 	syscall			# print_int10( i );
 	
 	la $a0, str2
 	li $v0, print_string
 	syscall			# print_string( ": " ); 
 	
 	li $t1, 0		# j = 0

 while2:
 	sll $t4, $t0, 2		# i * 4
 	addu $t3, $t6, $t4	# $t5 = &array[i];
 	lw $t3, 0($t3)		# $t5 = array[i];
 	addu $t3, $t3, $t1	# $t5 = &array[i][j];
 	lb $t3, 0($t3)		# $t5 = array[i][j]
 	
 	beq $t3, '\0', endw2	# while(array[i][j] != '\0') 
	
	move $a0, $t3
	li $v0, print_char
	syscall			# print_char(array[i][j]); 
	
	li $a0, '-'
	li $v0, print_char
	syscall			# print_char('-'); 
	  
 	addi $t1, $t1, 1	# j++
 	j while2
 	
 endw2:
 	addi $t0, $t0, 1	# i++
 	j while
 endw:
 	jr $ra
	