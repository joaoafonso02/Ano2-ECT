	.data
	.eqv SIZE, 10
a:	.space 80			# SIZE * 8
	.text
	.globl main
	
main:
	addiu	$sp, $sp, -4		# poem espaco na pilha
	sw	$ra, 0($sp)		# guarda o $ra
	la	$t1, a			# $t1 = &a
	li 	$t0, 0			# i = 0
for:
	bge	$t0, SIZE, endfor	# while(i < SIZE)
	sll 	$t2, $t0, 3		# * 8
	addu 	$t3, $t2, $t1		# &a[i]
	
	li 	$v0, 5
	syscall
	
	mtc1 	$v0, $f2		# $f2 = read_int();
	cvt.d.w	$f2, $f2	
	s.d	$f2, 0($t3)		# a[i] = (double)read_int(); 
	
	addi	$t0, $t0, 1		# i++
	j for
endfor:
	la 	$a0, a			# $a0 = a
	li 	$a1, SIZE		# $a1 = SIZE
	jal average			# average(a, SIZE)
		
	mov.d 	$f12, $f0
	li 	$v0, 3
	syscall				# print_double( average(a, SIZE) ); 
	
	lw 	$ra, 0($sp)
	addiu 	$sp, $sp, 4

	li 	$v0, 0			# return 0; 
	jr 	$ra
