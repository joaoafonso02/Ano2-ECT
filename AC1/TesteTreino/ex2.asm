# Mapa de registos
# i: $t0
# v: $t1
# &(val[0]): $t2
# ++i: $t3
# SIZE / 2: $t4
# val + i: $t5

	.data 
	.eqv SIZE, 8
	.eqv print_string, 4
	.eqv print_int10, 1 
	.eqv print_char, 11
	
val:	.word 8, 4, 15, -1987, 327, -9, 27, 16
	.space SIZE
	
str1:	.asciiz "Result is: "
	
	.text
	.globl main
	
main:						
	li $t0, 0				# i = 0;
	la $t2, val				# &val[0] = $t2
	
do:						# do { 
	sll $t5, $t0, 2				# val + i = i * 4(4 bytes/word)				   
	addu $a0, $t5, $t0	
	lw $t1, 0($a0)				# v = val[i];
	
	li $a1,SIZE                  
   	addi $a1,$a0,16                		# $a1 = &val+i + SIZE/2  (SIZE/2 == (8/2=4)*4=16)
	sw $a2,0($a1)                		# $a2 = *$a1
	
	sw $t6, 0($a2)				# val[i] = val[i+SIZE/2];
	sw $t1, 0($t6)
	
while:
	li $t4, SIZE				# $t4 = SIZE
	div $t4, $t4, 2				# SIZE /= 2
	
	addi $t3, $t0, 1			# ++i
	bge $t3, $t4, endw			# while(++i < (SIZE/2))
	
	j do
	
endw:
	la $a0, str1
	li $v0, print_string
	syscall					# print_string("Result is: ");
	li $t0,0				# i= 0;
	
do2:
	sw $a0, 4($t0)				# $a0 = val[i++]
	li $v0, print_int10
	syscall					# print_int10(val[i++]);
	
	li $a0, ','
	li $v0, print_char
	syscall					# print_char(',');
	
while2:
	li $a0,SIZE
    	sll $a0,$a0,4
	bge $t0, $a0, end
	j do2
	
end:	
	jr $ra
