# i: $t0
# array: $t2

	.data
	.eqv SIZE, 3
	
array:	.word str1, str2, str3
str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "ponteiros"	
	 .text
	 .globl main
main:
	 li 	$t0, 0
for:
	bge 	$t0, SIZE, endw
	
	la 	$t2, array
	sll 	$t3, $t0, 2
	addu 	$t4, $t3, $t2 # array + i
	
	lw 	$a0, 0($t4)
	li 	$v0, 4
	syscall
	
	li 	$a0, '\n'
	li 	$v0, 11
	syscall
	
	addi 	$t0, $t0, 1
	j for
endw:
	jr $ra
	 