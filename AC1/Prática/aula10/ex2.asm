# Mapa de Registos
# $f12 - val
# $f2 - aux
# $f4 - xn
# $f6 = 0.5
# $t0 - i
	
	.data
x:	.double 1.0
y:	.double	0.5
z:	.double 0.0

	.text
	.globl sqrt
	
sqrt:
	la 	$t0, x		# $t0 = 1.0
	l.d	$f4, 0($t0)	# xn = 1.0;
	
	la	$t0, y		# $t0 = 0.5
	l.d	$f6, 0($t0)	# $f6 = 0.5
	
	la 	$t0, z		# $t0 = 0.0
	l.d	$f8, 0($t0)	# $f8 = 0.0
		
	li 	$t0, 0		# i = 0
if:
	c.le.d	$f12, $f8	# if(val > 0.0) 
	bc1t	else
do:
	mov.d	$f2, $f4	# aux = xn
	div.d	$f4, $f12, $f2	# val/xn
	add.d	$f4, $f4, $f2	# xn + val/xn
	mul.d	$f4, $f4, $f6	# xn = 0.5 * (xn + val/xn); 
while:
	c.eq.d	$f2, $f4 	# aux != xn
	bc1t endif
	
	addi	$t0, $t0, 1	# ++i
	blt	$t0, 25, do	# ++i < 25
	j endif
else:
	mov.d 	$f4, $f8	# xn = 0.0; 
endif:
	mov.d	$f0, $f4	# return xn; 
	jr $ra