	.data
	.eqv SIZE, 10
x0:	.double 0.0
a:	.space 80
	.text
	.globl main
main:
	addiu $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	
	li $s0, 0 # i = 0
	la $t2, a # lista
for:
	bge $s0, SIZE, endfor
	
	sll $t0, $s0, 3 # i*8
	addu $t3, $t0, $t2 # i + a
	
	li $v0, 5
	syscall
	mtc1 $v0, $f2
	cvt.d.w $f2, $f2
	
	s.d $f2, 0($t3)
	
	addi $s0, $s0, 1 # i++
	j for
endfor:
	la $a0, a
	li $a1, SIZE
	jal average
	
	mov.d	$f12, $f0	
	
	li $v0, 3
	syscall # print_double( average(a, SIZE) ); 

	li $v0, 0 # return 0
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	addiu $sp, $sp, 8
	jr $ra
####################################################
average:
	move $t0, $a1 # i = n
	move $t2, $a0
	
	la $t1, x0
	l.d $f0, 0($t1) # $f4 = 0.0 = sum
fora:
	ble $t0, 0, endfora
	
	addi $t3, $t0, -1
	sll $t3, $t3, 3 # (i-1)*8
	addu $t5, $t2, $t3 # $t5 = &(array[i-1]);
	
	l.d $f6, 0($t5)
	add.d $f0, $f0, $f6
			
	addi $t0, $t0, -1 # i--
	j fora
endfora:
	mtc1 $a1, $f8
	cvt.d.w $f8, $f8 # (double)n
	
	div.d $f0, $f0, $f8
	
	jr $ra