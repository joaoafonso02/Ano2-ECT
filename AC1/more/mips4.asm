	.data
	.eqv SIZE, 30
	
str1:	.asciiz "\ITED - orievA ed edadisrevinU"
str2:	.space SIZE 
str3:	.asciiz "\n"
str4:	.asciiz "\nString length: "
	.text
	.globl main
	
main:
	addiu $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	
	la $a0, str1 
	jal strlen # strlen(str1)
if:
	bgt $v0, SIZE, else
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
	jal strrev # strrev(str2)
	
	move $a0, $v0
	li $v0, 4
	syscall # print_string(strrev(str2)); 
	
	li $s0, 0 # exit_value = 0; 
	
	j endif # weird
else:
	la $a0, str4
	li $v0, 4
	syscall # print_string("String length");
	
	la $a0, str1
	jal strlen # strlen(str1)
	
	move $a0, $v0
	li $v0, 1
	syscall # print_int10(strlen(str1)); 
			
	li $s0, -1 # exit_value = -1; 
endif:
	move $v0, $s0 # return exit_value; 
	
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	addiu $sp, $sp, 4
	jr $ra
###################################################
strcpy:
	li $t0, 0 # i = 0
docp:
	addu $t1, $a0, $t0 # $t1 = &dst[i]			#
	addu $t2, $a1, $t0 # $t2 = &src[i]
	
	lb $t3, 0($t2) # src[i]
	
	sb $t3, 0($t1) # dst[i] = src[i]; 
whilecp: 
	addi $t0, $t0, 1 # i++
	bne $t3, '\0', docp 
	move $v0, $a0 # return dst
	jr $ra 

###################################################	
strlen:
	li 	$v0, 0	# len = 0
while:
	lb 	$t0, 0($a0) # *s
	addiu 	$a0, $a0, 1 # *s++
	beq	$t0, '\0', endw
	
	addi 	$v0, $v0, 1 # len++
	j while 
endw:
	jr $ra 
#####################################################
strrev:
	addiu 	$sp, $sp, -16
	sw 	$ra, 0($sp)
	sw 	$s0, 4($sp)
	sw 	$s1, 8($sp)
	sw 	$s2, 12($sp)
	
	move 	$s0, $a0 # registo "callee-saved"
	move 	$s1, $a0 # p1 = str 
	move 	$s2, $a0 # p2 = str 
while1:
            lb	$t1, 0($s2) # *p2 
            beq	$t1, '\0', endw1	# while( *p2 != '\0' ) {
	addiu	$s2, $s2, 1 # p2++
	j while1
endw1:
	addiu	$s2, $s2, -1 # p2--
while2:
	bge	$s1, $s2, endw2
	move 	$a0, $s1 		
	move 	$a1, $s2		
 	jal 	exchange 	# exchange(p1,p2);
	
	addiu	$s1, $s1, 1 # p1++
	addiu	$s2, $s2, -1 # p2--
	j while2
endw2:
	move 	$v0, $s0
	
	lw 	$ra, 0($sp)
	lw 	$s0, 4($sp)
	lw 	$s1, 8($sp)
	lw 	$s2, 12($sp)
	addiu 	$sp, $sp, 16
	jr $ra

#########################################
exchange:			 # void exchange(char *c1, char *c2) {
	lb	$t0, 0($a0) # $t0 = *c1:
	lb 	$t1, 0($a1) # $t1 = *c2:
	sb   	$t0, 0($a1)
	sb	$t1, 0($a0)
	jr $ra
	
	
	
	