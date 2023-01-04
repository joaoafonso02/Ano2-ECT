	.data
	.eqv print_string, 4
	.eqv print_double, 3
	.eqv read_double, 7
	.eqv read_int, 5
x0:	.float 1.0
str1:	.asciiz "\nQual o valor de X? "
str2:	.asciiz "\nQual o valor de Y? "
str3:	.asciiz "\nResultado: "
	.text
	.globl main

main:					# int main(void) {
	addiu	$sp, $sp, -4		# 	poem espaco na pilha
	sw	$ra, 0($sp)		#	guarda o $ra
		
	la $a0, str1
	li $v0, 4
	syscall
				#
	li 	$v0, 6
	syscall
	
	la $a0, str2
	li $v0, 4
	syscall
	
	mov.s 	$f12, $f0
	li 	$v0, 5
	syscall
	
	move 	$a0, $v0
	jal xtoy
	
	la $a0, str3
	li $v0, 4
	syscall
	
	mov.s $f12, $f0
	li $v0, 2
	syscall
								#	
	lw	$ra, 0($sp)		#	repoem o valor de $ra
	addiu	$sp, $sp, 4		#	repoem o tamanho da pilha
	li	$v0, 0			#	return 0;
	jr	$ra			# }ra
##############################################
xtoy:
	addiu $sp, $sp, -12
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	s.s $f20, 8($sp)# guarda o $f20
	
	mov.s $f20, $f12 # float x
	move $s0, $a0 # int y 
	
	jal abs
	move $t1, $v0 # abs(y)
	
	li $t0, 0 # i = 0
	la $t2, x0
	l.s $f0, 0($t2) # rersult = 1.0
forx:
	bge $t0, $t1, endforx 
if1:
	ble $s0, 0, else1
	mul.s $f0, $f0, $f20 # result *= x; 
	j endif
else1:
	div.s $f0, $f0, $f20 # result /= x; 
endif:	
	addi $t0, $t0, 1 # i++
	j forx
endforx:
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	l.s $f20, 8($sp)#	guarda o $f20
	addiu $sp, $sp, 20
	jr $ra
####################################################
abs:
	move $v0, $a0
if2:
	bge $v0, 0, endif2
	mul $v0, $v0, -1 # val = -val
endif2:
	jr $ra

