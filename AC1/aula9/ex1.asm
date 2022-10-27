# res: $f8
# val: $t0
	.data
	.eqv read_int, 5
	.eqv print_float, 
const1:	.float 2.59375

	.text
	.globl main
	
main:				# int main(void) {

do:
	li 	$v0, read_int
	syscall
	move 	$t0, $v0	# val = read_int();
	
	mtc1 	$t0, $f0
	cvt.s.w	$f0, $f0	# float(val)
	l.s	$f2, const1	# $f2 = const1
	
	mul.s	$f8, $f0, $f2	# res = (float)val * 2.59375; 
	
	li 	$v0, 2 
	mov.s 	$f12, $f8
	syscall			# print_float( res ); 
	mtc1	$0, $f4		# $f4 = 0.0
	
	cvt.s.w	$f4, $f4
	c.eq.s	$f8, $f4
	bc1f 	do		# while(res != 0.0); 
	
	li 	$v0, 0		# return 0
	jr 	$ra
	