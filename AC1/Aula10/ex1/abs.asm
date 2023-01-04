	.data
	
	.text
	.globl abss
	
abss:
	bge 	$a0, 0, endif
	mul 	$a0, $a0, -1 # val = -val	
endif:
	move 	$v0, $a0
	jr $ra