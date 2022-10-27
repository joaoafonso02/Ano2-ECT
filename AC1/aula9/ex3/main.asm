	.data
	.eqv SIZE, 10
a:	.space 80
		
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
	jal 	average
	
	mov.d 	$f12, $f0
	li 	$v0, 3
	syscall 
	
	lw 	$ra, 0($sp)
	addiu	$sp, $sp, 4
	li 	$v0, 0
	jr $ra