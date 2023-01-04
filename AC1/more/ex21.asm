# i : $t0
# j: $t1
# array[i][j]: $t3 	
	.data
	.eqv SIZE, 3
	
str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "ponteiros"
str4:	.asciiz "\nString #"

array:	.word str1, str2, str3
	.text
	.globl main
	
main:
	la $t4, array
	
	li $t0, 0	# i = 0
for:
	bge $t0, SIZE, endfor
	
	la $a0, str4
	li $v0, 4
	syscall # print_string( "\nString #" );
	
	move $a0, $t0
	li $v0, 1
	syscall # print_int10( i ); 
	
	li $a0, ':'
	li $v0, 11
	syscall # print_char( ":" ); 
	
	li $t1, 0	# j = 0
while:
	sll $t2, $t0, 2 # i*4
	addu $t3, $t2, $t4 # i + array
	lw $t3, 0($t3) # array[i]
	addu $t3, $t3, $t1 # array[i] + j
	lb $a0, 0($t3) # array[i][j]
	
	beq $a0, '\0', endwhile
	
	li $v0, 11
	syscall # print_char(array[i][j]); 
	
	li $a0, '-'
	li $v0, 11
	syscall # print_char( "-" ); 
	
	addi $t1, $t1, 1 # j++
	j while
endwhile:
	addi $t0, $t0, 1 # i++
	j for
endfor:
	jr $ra
