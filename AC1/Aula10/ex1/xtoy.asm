# Mapa de Registos
# $t30 - i
# $s1 -> $s0 - y
# $f0 - result
# $f22 -> $f20 - x
	
	.data 
x0:	.float 1.0
	.text
	.globl xtoy
	
xtoy:
	addiu	$sp, $sp, -12	# 	poem espaco na pilha
	sw	$ra, 0($sp)		#	guarda o $ra
	sw	$s0, 4($sp)		#	guarda o $s0
	s.s	$f20, 8($sp)	#	guarda o $f20
	mov.s	$f20,  $f12
	move 	$s0, $a0
	
	jal abss
	move 	$t1, $v0
	
	li 	$t0, 0	# i = 0
	la 	$t2, x0
	l.s	$f0, 0($t2) # result = 1.0
for:				# for(i=0, result=1.0; i < abs(y); i++) 
	bge	$t0, $t1, endfor 
if:
	ble 	$s0, 0, else
	mul.s	$f0, $f0, $f20	# result *= x; 
	j endif
else:
	div.s	$f0, $f0, $f20	# result /= x; 
endif:	
	addi 	$t0, $t0, 1 # i++
	j for
endfor:
	lw	$ra, 0($sp)		#	guarda o $ra
	lw	$s0, 4($sp)		#	guarda o $s0
	l.s	$f20, 8($sp)	#	guarda o $f20
	addiu	$sp, $sp, 12	# 	repõe espaco na pilha
	jr $ra
