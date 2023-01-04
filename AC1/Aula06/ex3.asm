# i: $t0
# j: $t1	
	
	.data
	.eqv SIZE, 3
array:
	.word str1, str2, str3
str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "ponteiros"
str4:
	.asciiz "\nString #"
str5:	.asciiz  ": "

	.text
	.globl main
main:	
	li	$t0, 0	# i = 0
	la 	$t4, array
for:
	bge 	$t0, SIZE, endw
	
	la 	$a0, str4
	li 	$v0,4
	syscall
	
	move 	$a0, $t0	
	li 	$v0, 1
	syscall		# print_int10( i ); 
	
	la 	$a0, str5
	li 	$v0,4
	syscall
	
	li 	$t1, 0 	# j = 0
while:
	sll 	$t2, $t0, 2	# i* 4
	addu 	$t3, $t4, $t2 # array + i -&(array[i]);	
	lw	$t3, 0($t3) # array[i]
	addu 	$t3, $t3, $t1 # $t3 = &array[i][j];
	lb 	$a0, 0($t3) # $a0 = array[i][j];
	
	beq	$a0, '\0', endwhile
	
	li	$v0, 11
	syscall		# print_char(array[i][j]);
	
	li 	$a0, '-'
	li 	$v0, 11
	syscall		# print_char('-');
		
			
	addi 	$t1, $t1, 1	# j++
	j while
endwhile:	
	addi 	$t0, $t0, 1
	j for
endw:
	jr $ra