# variables
# $t0 --> gray
# $t1 --> num
# $t2 --> wresult (bin = num)
# $t3 --> temp var

	.data
	.text
	.globl main
	
main: 	li $t0,15		# gray = wanted value
	move $t1, $t0		# num = gray
	srl $t3,$t1,4		# num >> 4
	xor $t1,$t1,$t3		# num = num ^ (num >> 4); 
	
	srl $t3,$t1,2		# num >> 2
	xor $t1,$t1,$t3 	# num = num ^ (num >> 2); 
	
	srl $t3,$t1,1 		# num >> 1
	xor $t1,$t1,$t3		# num = num ^ (num >> 1); 
	
	move $t2,$t1		# bin = num
	
	jr $ra			# finish program