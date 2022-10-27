	.data
	.text
	.globl main
	
main:
	ori 	$v0, $0, 5
	syscall
	move 	$t0, $v0

	ori 	$t1, $0, 5
	
	and 	$t2, $t1, $t0
	or 	$t3, $t1, $t0
	nor	$t4, $t1, $t0
	xor 	$t5, $t1, $t0
	
	
	jr $ra