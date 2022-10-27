	.data
	.eqv SIZE, 10
a:	.space 80
str1:	.asciiz "\nIntroduza um número: "
str2:	.asciiz "\nValor maximo: "		
	.text
	.globl main

main:
	addiu 	$sp, $sp, -4
	sw 	$ra, 0($sp)
	
	la 	$t1, a
	li 	$t0, 0
for:
	bge 	$t0, SIZE, endfor
	sll 	$t2, $t0, 3
	addu	$t3, $t2, $t1
	
	la 	$a0, str1
	li 	$v0, 4
	syscall
	 
	li 	$v0, 5
	syscall
	
	mtc1	$v0, $f2
	cvt.d.w	$f2, $f2
	s.d	$f2, 0($t3)
	
	addi 	$t0, $t0, 1		#i++
	j for 
endfor:
	la 	$a0, a
	li 	$a1, SIZE
	jal 	max
	
	la 	$a0, str2
	li 	$v0, 4
	syscall
	
	mov.d 	$f12, $f0
	li 	$v0, 3
	syscall 
	
	lw 	$ra, 0($sp)
	addiu	$sp, $sp, 4
	li 	$v0, 0
	jr $ra
