	.data
	.eqv SIZE, 5
x0:	.float 0.
array:	.space 40 # 8*5
str1:	.asciiz "X: "
str2:	.asciiz "var: "
str3:	.asciiz "stdev: "
	
	.text
	.globl main
	
main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	la $a0, str1
	li $v0, 4
	syscall # str1
	
	li 	$t0, 0	# i = 0
	la 	$t1, array	# t1 = &a
for:
	bge	$t0, SIZE, endfor
	sll	$t2, $t0, 3	# i*8 - double
	addu	$t3, $t1, $t2 # a + i
	
	li 	$v0, 5
	syscall
	mtc1 	$v0, $f2
	cvt.d.w	$f2, $f2
	s.d	$f2, 0($t3)
	
	addi 	$t0, $t0, 1
	j for
endfor:
	la	$a0, array
	li 	$a1, SIZE # nval
 	jal 	var
	
	mov.d	$f12, $f0	
	li 	$v0, 3
	syscall
	
	
	la $a0, str2
	li $v0, 4
	syscall # str2
	
	lw	$ra, 0($sp)
	addiu 	$sp, $sp, 4
	
	li $v0, 0
	jr $ra
#########################################################################################
average:
	la	$t0, x0	# $t0 = $x0
	l.d	$f0, 0($t0)	# sum = (double)x0;
	
	move	$t0, $a0	# $t0 = &(array)
	move	$t1, $a1	# i = n;
for1:
	ble	$t0, 0, endfor1
	
	addi	$t3, $t1, -1 # aux = i-1;
	sll	$t3, $t3, 3	# aux = (i-1)*8;
	addu	$t2, $t0, $t3 # $t2 = &(array[i-1]);
	
	l.d	$f2, 0($t2)	# $f4 = (double)array[i-1];
	add.d	$f0, $f0, $f2 # sum += arryu[i-1]
	
	addi 	$t0, $t0, -1
	j for1
endfor1:
	mtc1	$a1, $f4
	cvt.d.w	$f4, $f4
	div.d	$f0, $f0, $f4
	jr	$ra		# }	
##########################################################################################
var:
	addiu $sp, $sp, -24
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	sw $s2, 12($sp)
	s.s $f20, 16($sp)
	s.d $f22, 20($sp)
	
	move $s0, $a0 # array
	move $s1, $a1 # nval
	
	jal average
	
	cvt.s.w $f20, $f0 # media = (float)average(array, nval); 
	sub.s $f22, $f22, $f22 # soma = 0
	li $s2, 0 # i =0
for2:
	bge $s2, $s1, endfor2
	
	sll $t0, $s2, 3 # i*8
	addu $t0, $t0, $s0 # array + i
	l.d $f2, 0($t0) # double(array[i])
	cvt.s.d $f2, $f2 # (float)array[i]
	
	sub.d $f12, $f2, $f20 # (float)array[i] - media
	li $a0, 2
	jal xtoy
	
	add.s $f20, $f20, $f0 # soma += xtoy((float)array[i] - media, 2); 
	
	addi $s2, $s2, 1 # i++
	j for2
endfor2:
	cvt.d.s $f20, $f20
	mtc1 $a0, $f4
	cvt.d.w $f4, $f4
	
	div.d $f0, $f20, $f4 # return (double)soma / (double)nval; 
	
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $s2, 12($sp)
	lw $s3, 16($sp)
	lw $s4, 20($sp)
	addiu $sp, $sp, 24
	jr $ra
######################################################
	
xtoy:
	addiu	$sp, $sp, -12	# 	poem espaco na pilha
	sw	$ra, 0($sp)		#	guarda o $ra
	sw	$s0, 4($sp)		#	guarda o $s0
	s.s	$f20, 8($sp)	#	guarda o $f20
	mov.s	$f20,  $f12
	move 	$s0, $a0
	
	jal abss
	move 	$t1, $v0
	
	li 	$t0, 0	# i = 0
	la 	$t2, x0
	l.s	$f0, 0($t2) # result = 1.0
forx:				# for(i=0, result=1.0; i < abs(y); i++) 
	bge	$t0, $t1, endforx
if:
	ble 	$s0, 0, elsex
	mul.s	$f0, $f0, $f20	# result *= x; 
	j endifx
elsex:
	div.s	$f0, $f0, $f20	# result /= x; 
endifx:	
	addi 	$t0, $t0, 1 # i++
	j forx
endforx:
	lw	$ra, 0($sp)		#	guarda o $ra
	lw	$s0, 4($sp)		#	guarda o $s0
	l.s	$f20, 8($sp)	#	guarda o $f20
	addiu	$sp, $sp, 12	# 	repõe espaco na pilha
	jr $ra
#################
	
abss:
	bge 	$a0, 0, endif
	mul 	$a0, $a0, -1 # val = -val	
endif:
	move 	$v0, $a0
	jr $ra


	

	
	
	
	
	