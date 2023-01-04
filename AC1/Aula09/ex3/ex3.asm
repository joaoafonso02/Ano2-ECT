	.data
	.eqv SIZE, 10
a:
	.space 80	# 10*8
	
	.text
	.globl main

# Mapa de registos
# $t0 - i
# $t1 - &a;
# $t2 - aux;
# $t3 = &(a[i]);

main:
	addiu 	$sp, $sp, -4
	sw	$ra, 0($sp)
	
	li 	$t0, 0	# i = 0
	la 	$t1, a	# t1 = &a
for:
	bge	$t0, SIZE, endfor
	sll	$t2, $t0, 3	# i*8 - double
	addu	$t3, $t1, $t2 # a + i
	
	li 	$v0, 5
	syscall
	mtc1 	$v0, $f2
	cvt.d.w	$f2, $f2
	s.d	$f2, 0($t3)
	
	addi 	$t0, $t0, 1
	j for
endfor:
	la	$a0, a
	li 	$a1, SIZE
	jal 	average
	
	mov.d	$f12, $f0	
	li 	$v0, 3
	syscall
	
	lw	$ra, 0($sp)
	addiu 	$sp, $sp, 4
	
	li $v0, 0
	jr $ra
	
