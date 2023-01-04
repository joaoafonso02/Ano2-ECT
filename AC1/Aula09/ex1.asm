	.data
k1:
	.float 2.59375
k2:
	.float 0.0	

	.text
	.globl main
main:
do:
	li 	$v0, 5
	syscall		# val = read_int(); 
	
	la 	$t0, k1
	l.s	$f4, 0($t0) # 2.59375
	
	mtc1	$v0, $f6	# $f6 = val;
	cvt.s.w	$f6, $f6	# $f6 = (float)val;
	
	mul.s 	$f12, $f6, $f4 # res = (float)val * 2.59375; 
	
	li 	$v0, 2
	syscall
	
while:
	#la	$t0, k2	# $t0 = &k2
	#l.s	$f8, 0($t0)	# $f8 = 0.0;
	mtc1	$0, $f8	# $f8 = 0.0; (caso especial não é preciso converter)
	c.eq.s	$f12, $f8	# condition: $f12 == $f8
	bc1f	do	# while($f12 != $f8);
	
	li 	$v0, 0
	
	jr $ra