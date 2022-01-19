	.data
sum:	.double	0.0
	.text
	.globl average
	
average:			# double average(double *array, int n) 
	la 	$t0, sum		
	l.d	$f0, 0($t0)	# double sum = 0.0; 
	
	move 	$t0, $a0
	move 	$t1, $a1	# int i = n; 
for:
	ble 	$t1, $0, endfor	# while(i > 0)
	addiu 	$t2, $t1, -1	# aux = i-1
	sll 	$t3, $t2, 3	# aux * 8	(double - 4*2)
	addu	$t4, $t3, $t0	# & array[i-1]
	
	l.d	$f2, 0($t4)
	add.d	$f0, $f0, $f2	# sum += array[i-1]; 
	
	addiu 	$t1, $t1, -1	# i--
	j for
endfor:
	mtc1	$a1, $f4
	cvt.d.w	$f4, $f4
	div.d	$f0, $f0, $f4
	jr $ra
	