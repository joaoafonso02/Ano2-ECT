	.data
	.eqv print_string, 4
	.eqv print_double, 3
	.eqv read_double, 7
	.eqv read_int, 5
str1:	.asciiz "\nQual o valor de X? "
str2:	.asciiz "\nQual o valor de Y? "
str3:	.asciiz "\nResultado: "
	.text
	.globl main

main:					# int main(void) {
	addiu	$sp, $sp, -4		# 	poem espaco na pilha
	sw	$ra, 0($sp)		#	guarda o $ra
					#
	li 	$v0, 6
	syscall
	
	mov.s 	$f12, $f0
	li 	$v0, 5
	syscall
	
	move 	$a0, $v0
	jal xtoy
	
	mov.s $f12, $f0
	li $v0, 2
	syscall
								#	
	lw	$ra, 0($sp)		#	repoem o valor de $ra
	addiu	$sp, $sp, 4		#	repoem o tamanho da pilha
	li	$v0, 0			#	return 0;
	jr	$ra			# }
