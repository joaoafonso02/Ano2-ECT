	.data
x0:	.float 0.0
x1:	.float 2.59375
	.text
	.globl main
main:
	la $t0, x0
	l.s $f2, 0($t0) # $f2 = 0.0
	
	la $t1, x1
	l.s $f4, 0($t1) # $f4 = 2.59375; 
	
do:
	li $v0, 5
	syscall
	mtc1 $v0, $f6
	cvt.s.w $f6, $f6 # (float)val
	
	mul.s $f12, $f6, $f4 # res = (float)val * 2.59375; 
	li $v0, 2
	syscall # print_float( res );
while:
	c.eq.s $f12, $f2 
	bc1f do
	
	li $v0, 0
	jr $ra