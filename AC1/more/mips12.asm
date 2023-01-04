	.data
str1:	.asciiz "Temperatura em Fahrenheit: "
str2:	.asciiz "\nTemperatura em Celsius: "

x0:	.double	5.0
x1:	.double	9.0
x2:	.double	32.0
		
	.text
	.globl main
main:
	addiu 	$sp, $sp, -4
	sw	$ra, 0($sp)
	
	la	$a0, str1	#	$a0 = str1
	li	$v0, 4	
	syscall		#	print_string(str1);
				
	li	$v0, 7		
	syscall		 #	$f0 = read_double();
	mov.d	$f12, $f0	#	$f2 = $f0
	jal 	f2c	#	f2c(read_double());

	la	$a0, str2	#	$a0 = str2;
	li	$v0, 4			
	syscall		#	print_string(str2);
				
	mov.d	$f12, $f0	#	$f12 = return(f2c);
	li	$v0, 3			
	syscall
	
	lw	$ra, 0($sp)
	addiu 	$sp, $sp, 4
	
	li	$v0, 0
	jr $ra
############

f2c:
	la $t0, x0
	l.d $f2, 0($t0) # $f2 = 5.0
	
	la $t1, x1
	l.d $f4, 0($t1) # $f4 = 9.0; 
	
	la $t2, x2
	l.d $f6, 0($t2) # $f6 = 32.0; 
	
	sub.d $f8, $f12, $f6 # ft - 32.0
	div.d $f10, $f2, $f4 # 5.0 / 9.0
	mul.d $f0, $f10, $f8 # return (5.0 / 9.0 * (ft – 32.0));
	jr $ra
	