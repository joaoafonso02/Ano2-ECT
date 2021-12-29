# O argumento da função é passado em $a0
# O resultado é devolvido em $v0
# Sub-rotina terminal: não devem ser usados registos $sx 
	.data
str1:	.asciiz "Arquitetura de Computadores I"

	.text
	.globl main
	
main:				# int main(void) {
	addiu $sp, $sp, -4	# espaço na pilha
	sw $ra, 0($sp)		
	
	la $a0, str1		# $a0 = str
	jal strlen		# temp = strlen(str)
	
	move $a0, $v0
	li $v0, 1
	syscall			# print_int10(temp)
	
	li $v0, 0		# return 0; 
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra
	
strlen:
	li $t1, 0		# len = 0
while:
	lb $t0, 0($a0) 		# while(*s++ != '\0')
	addiu $a0, $a0, 1	
	beq $t0, '\0', endw	# (*s++ != '\0')
	addi $v0, $v0,1		# len++
	j while
	
endw:
	jr $ra