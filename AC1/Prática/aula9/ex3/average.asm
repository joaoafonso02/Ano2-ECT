# $t0: *array
# $t1: i = n
# $t2: sum

	.data
sum:	.double 0.0
	.text
	.globl average
	
average:			# double average(double *array, int n) 
	la 	$t0, sum
	l.d 	$f0, 0($t0)	
	
	move 	$t0, $a0
	move 	$t1, $a1	# int i = n; 
for:
	ble	$t1, $0, endfor	# for(; i > 0; i--) 
	addiu 	$t3, $t1, -1	# aux = i-1
	sll	$t3, $t3, 3	# (aux = i-1) * 8
	addu 	$t4, $t0, $t3	# & array[i-1]
	l.d 	$f4, 0($t4)
	add.d 	$f0, $f0, $f4
	
	addiu 	$t1, $t1, -1	# i--
	j for
endfor:
	mtc1	$a1, $f2
	cvt.d.w	$f2, $f2	# (double)n
	div.d	$f0, $f0, $f2	# return sum / (double)n
	jr 	$ra