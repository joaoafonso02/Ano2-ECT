.data
	.eqv	SIZE, 5
a:	.space 	40			# size*8 
	.text
	.globl 	main	
	
main:	
	addiu	$sp,$sp,-4		# reservar espaço na stack
	sw	$ra,0($sp)		# guarda registo $ra na stack
	
	li	$t0,0			# i = 0
	la	$t1,a			# $f2 = *array[0]
	
for:	bge	$t0,SIZE,endfor		# for(i = 0; i < SIZE; i++)
	
	sll	$t2,$t0,3		# $t2 = i*8
	addu	$t3,$t2,$t1		# $t3 = array[i]
	
	li	$v0,5			
	syscall				# read_int();
	mtc1	$v0,$f4			# 
	cvt.d.w	$f4,$f4			# $f4 = (double)read_int()
	s.d	$f4,0($t3)		# a[i] = (double)read_int();
	
	addi	$t0,$t0,1		# i++
	j	for
endfor:
	la	$a0,a			# $a0 = a
	li	$a1,SIZE		# $a1 = SIZE
	jal	max			# max(a, SIZE)
	
	mov.d 	$f12,$f0
	li	$v0,3		
	syscall				# print_double()
	
	li	$v0,0			# return 0;
	
	lw	$ra,0($sp)		# repoe registo $ra 
	addiu	$sp,$sp,4		# repoe espaço na stack
	
	li	$v0,0			# return 0;
	jr	$ra
##############################################
max:
	move $t0, $a0 # p
	move $t1, $a1 # n
	
	addiu $t2, $t1, -1 # n-1
	sll $t2, $t2, 3 # n-1 * 8
	addu $t3, $t2, $t0  # double *u = p+n–1; 
	
	l.d $f2, 0($t0) # *p = max
	addi $t0, $t0, 8 # p++
form:
	bgt $a0, $t3, endform
	l.d $f4, 0($a0) # *p
ifm:	
	c.le.d $f4, $f2
	bc1t endifm
	mov.d $f2, $f4
endifm:
	addi $a0, $a0, 8 # p++
	j form
endform:
	mov.d $f0, $f2
	jr $ra
