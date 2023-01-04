# intermedia
# array: $a0 -> $s0
# nval: $a1 -> $s1
# i: $s2
# media: $f20
# soma: $f22
	.data
x:	.double 0.0
	.text
	.globl var

var:
	addiu 	$sp, $sp, -24
	sw 	$ra, 0($sp)
	sw 	$s0, 4($sp)
	sw 	$s1, 8($sp)
	sw 	$s2, 12($sp)
	sw 	$f20, 16($sp)
	sw 	$f22, 20($sp)
	move 	$s0, $a0
	move 	$s1, $a1
	
	jal average
	cvt.s.d 	$f20, $f0
	
	li 	$s2, 0 # i=0
	sub.s	$f22, $f22, $f22 # soma = 0
vfor:
	bge 	$s2, $s1, evfor
	sll 	$t0, $s2, 3 # double
	addu 	$t0, $t0, $s0 # &array[i]
	l.d	$f0, 0($t0) # array[i]
	
	cvt.s.d	$f0, $f0	# $f0 = (float) array[i]
	
	sub.s	$f12, $f0, $f20 # $f0 - media
	li 	$a1, 2
	jal xtoy 	# xtoy((float)array[i] - media, 2);
	
	add.s 	$f22, $f22, $f0	# soma = xtoy((float)array[i] - media, 2);
	
	addi 	$s2, $s2, 1 # i++
	j vfor
evfor:
	cvt.d.s	$f22, $f22
	mtc1 	$s1, $f0
	
	cvt.d.w 	$f0, $f0
	
	div.d	$f0, $f22, $f0	# return (double)soma / (double)nval; 
	
	lw 	$ra, 0($sp)
	lw 	$s0, 4($sp)
	lw 	$s1, 8($sp)
	lw 	$s2, 12($sp)
	lw 	$f20, 16($sp)
	lw 	$f22, 20($sp)
	addiu 	$sp, $sp, 24
	jr $ra
	
