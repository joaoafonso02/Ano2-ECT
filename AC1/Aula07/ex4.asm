	.data
	.eqv SIZE, 50	
str1:	.asciiz "Arquitetura de "
str4:	.asciiz "Computadores I"
str2:	.space SIZE
str3:	.asciiz "\n"

	.text
	.globl main
main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	la $a0, str2
	la $a1, str1
	jal strcpy # strcpy(str2, str1); 
	
	la $a0, str2
	li $v0, 4
	syscall # print_string(str2); 
	
	la $a0, str3
	li $v0, 4
	syscall # print_string("\n"); 
	
	la $a0, str2
	la $a1, str4
	jal strcat
	
	move $a0, $v0
	li $v0, 4
	syscall # print_string( strcat(str2, "Computadores I") ); 
	
	li $v0, 0
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra

###################################################
strcpy:
	li 	$t0, 0
				
do:			
	addu 	$t1, $a0, $t0 # $t1 = &dst[i]			#
	addu 	$t2, $a1, $t0 # $t2 = &src[i]
				
	lb	$t3, 0($t2)	# src[i]		# $t1 = src[i];
	sb	$t3, 0($t1) # dst[i] = src[i]			# dts[i] = src[i];
dowhile:
	addi 	$t0, $t0, 1 # i++
	bne  	$t3, '\0', do # while(src[i] != '\0');
	move	$v0, $a0 # return dst			# return dst;
	jr	$ra				# fim do programa
#############################################
strcat:
	addiu $sp, $sp, -16
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	sw $s2, 12($sp)
	
	move $s0, $a0
	move $s1, $a0 # char *p = dst
	move $s2, $a1 # src
while:
	lb $t1, 0($s0) # *p
	beq $t1, '\0', endw
	
	addiu $s0, $s0, 1 # p++
	j while
endw:
	move $a0, $s0
	move $a1, $s2
	jal strcpy
	
	move $v0, $s1
	
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $s2, 12($sp)
	addiu $sp, $sp, 16
	jr $ra
	