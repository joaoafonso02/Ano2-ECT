	.data 
	
	.text
	.globl main
	
main:
	ori 	$v0, $0, 5		# input
	syscall
	
	or 	$a0, $0, $v0	# x = input
	
	ori 	$t0, $0, 8		# $t0 = 8
	add 	$t1, $a0, $a0 	# 2x
	sub 	$t1, $t1, $t0	# 2x - 8
	
	or 	$a0, $0, $t1 
	ori 	$v0, $0, 34
	syscall
	
	jr 	$ra