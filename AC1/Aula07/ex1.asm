	.data
str:	
	.asciiz	"Arquitetura de Computadores I"
	
	.text
	.globl main
	
main:			# int main(void) {
	addiu	$sp, $sp, -4 # fazer espaco na pilha 
	sw	$ra, 0($sp)	# salvaguardar o $ra
	
	la 	$a0, str
	
	jal	strlen      # strlen(str);
	move 	$a0, $v0
	li 	$v0, 1
	syscall
	
	li 	$v0, 0
	lw	$ra, 0($sp)
	addiu	$sp, $sp, 4
	jr 	$ra	
###################################################	
strlen:
	li 	$t1, 0	# len = 0
while:
	lb 	$t0, 0($a0) # *s
	addiu 	$a0, $a0, 1 # *s++
	beq	$t0, '\0', endw
	
	addi 	$t1, $t1, 1 # len++
	j while 
endw:
	move 	$v0, $t1 # return len
	jr $ra 
	
	
	