# p: $t0
# pultimo: $t1	
	.data
	.eqv SIZE, 3
array:
	.word str1, str2, str3
str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "ponteiros"

	.text
	.globl main
main:
	la 	$t0, array
	
	li 	$t2, SIZE
	sll 	$t2, $t2, 2
	addu 	$t1, $t2, $t0 # pultimo = array + SIZE
for:
	bge 	$t0, $t1, endw
	lw 	$a0, 0($t0) # *p
	li 	$v0, 4
	syscall
	
	li 	$a0, '\n'
	li 	$v0, 11
	syscall
	
	
	
	addi 	$t0, $t0, 4	# p++
	j for
endw:	
	jr $ra