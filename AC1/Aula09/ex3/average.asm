	.data
x0:	.double 0.0
	.text
	.globl average
	
average:
	la	$t0, x0	# $t0 = $x0
	l.d	$f0, 0($t0)	# sum = (double)x0;
	
	move	$t0, $a0	# $t0 = &(array)
	move	$t1, $a1	# i = n;
for1:
	ble	$t0, 0, endfor1
	
	addi	$t3, $t1, -1 # aux = i-1;
	sll	$t3, $t3, 3	# aux = (i-1)*8;
	addu	$t2, $t0, $t3 # $t2 = &(array[i-1]);
	
	l.d	$f2, 0($t2)	# $f4 = (double)array[i-1];
	add.d	$f0, $f0, $f2 # sum += arryu[i-1]
	
	addi 	$t0, $t0, -1
	j for1
endfor1:
	mtc1	$a1, $f4
	cvt.d.w	$f4, $f4
	div.d	$f0, $f0, $f4
	jr	$ra		# }	