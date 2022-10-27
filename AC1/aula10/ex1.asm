	.data
real:	.float 2.5
one:	.float 1.0

	.text
	.globl main

main:
	addiu 	$sp, $sp, -4
	sw 	$ra, 0($sp)
	
	l.s	$f12, real
	li	$a0, -3
	jal 	xtoy
	
	mov.s	$f12, $f0
	li 	$v0, 2
	syscall
	
	 lw 	$ra, 0($sp)
	 addiu 	$sp, $sp, 4
	 jr $ra 

#---------------------------------------------------------------
xtoy:
	addiu	$sp, $sp, -12
	sw 	$ra, 0($sp)
	sw	$s0, 4($sp)
	s.s	$f20, 8($sp)
	
	move 	$s0, $a0			# y1 = y
	mov.s	$f20, $f12			# x1 = x
	jal 	abs
	move 	$t1, $v0			# int abs1 = abs(y)
	
	li 	$t0, 0
	l.s	$f0, one
	
xtoiwhile:
	bge	$t0, $t1, xtoiendwhile		# while(i < abs(y))
xtoi_if:
	blez	$s0, xtoi_else			# if(y > 0)
	mul.s	$f0, $f0, $f20			# result *= x
	j 	xtoiendwhile
xtoi_else:
	div.s	$f0, $f0, $f20			# result /= x
xtoi_endif:
	addi	$t0, $t0, 1			# i++
	j xtoiwhile
 
xtoiendwhile:	
	lw 	$ra, 0($sp)
	lw	$s0, 4($sp)
	l.s	$f20, 8($sp)			# epilogo
	addiu 	$sp, $sp, 12
	jr $ra
	
#----------------------------------------------------------------
abs:
	move 	$v0, $a0
abs_if:
	bgez	$a0, abs_endif
	mul	$v0, $v0, -1
	
abs_endif:
	jr $ra