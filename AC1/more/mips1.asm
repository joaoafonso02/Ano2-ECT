	.data
xn:	.double 1.0
x1:	.double 0.5
x0:	.double 0.0
str1:	.asciiz "X: "
str2:	.asciiz "\nResult: "

	.text
	.globl main
	
main:
	addiu 	$sp, $sp, -4
	sw 	$ra, 0($sp)
	
	la 	$a0, str1
	li 	$v0, 4
	syscall				# print_string("X: ")
	
	li 	$v0, 7
	syscall				# read_double()
	
	
	mov.d	$f12, $f0
	jal 	sqrt
	
	la 	$a0, str2
	li 	$v0, 4
	syscall				# print_string("\nResult: ")
	
	mov.d	$f12, $f0		# val = read_double;
	li 	$v0, 3
	syscall
	
	lw	$ra, 0($sp)
	addiu 	$sp, $sp, -4
	li 	$v0, 0
	jr $ra
################333333#############################################3
sqrt:
	la $t1, xn
	l.d $f0, 0($t1) # douvle xn = 1.0
	
	la $t2, x0
	l.d $f2, 0($t2) # 0.0
	
	li $t0, 0 # i = 0
if:
	c.le.d $f12, $f2
	bc1t else
do:
	mov.d $f4, $f0
	div.d $f6, $f12, $f0 # val/xn
	add.d $f6, $f6, $f0 # xn + val/xn
	
	la $t4, x1 
	l.d $f8, 0($t4) # 0.5
	mul.d $f0, $f8, $f6 # xn = 0.5 * (xn + val/xn);
while:
	c.eq.d $f4, $f0 # aux != xn
	bc1f do
	addi $t0, $t0, 1 # ++i
	blt $t0, 25, do # (++i < 25)
	j endif
else:
	la $t3, x0
	l.d $f0, 0($t3) # douvle xn = 1.0
endif:
	jr $ra
	
