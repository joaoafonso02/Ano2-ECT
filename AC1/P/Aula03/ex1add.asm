	
# $t0: gray
# $t1: bin
# t2: mask
	.data
str1:
	.asciiz "Introduza um numero: "
str2:
	.asciiz "\nValor em código Gray: "
str3:
	.asciiz "\nValor em binario: "
	.text
	.globl main
	
main:
	la 	$a0, str1
	li 	$v0, 4
	syscall
		
	li 	$v0, 5
	syscall
	move 	$t0, $v0		# gray = read_int(); 
	
	srl	$t2, $t0, 1	# mask = gray >> 1; 
	move	$t1, $t0		# bin = gray; 
while:
	beqz	$t2, endw		# while(mask != 0) 
	
	xor	$t1, $t1, $t2	# bin = bin ^ mask; 
	srl	$t2, $t2, 1	# mask = mask >> 1; 
	j while
	
endw:
	la 	$a0, str2
	li 	$v0, 4
	syscall
	
	move 	$a0, $t0
	li 	$v0, 34
	syscall
	
	la 	$a0, str3
	li 	$v0, 4
	syscall
	
	move 	$a0, $t1
	li 	$v0, 34
	syscall
	
	jr 	$ra
	