# Mapa de registos:
# $t0 – i
# $t1 – value
# $t2 - soma 
	
	.data	# 0x10010000
	
str1:
	.asciiz "numero: " # 8 + \0 = 9
	
str2:
	.asciiz "Valor ignorado\n"  	# o endereço aqui seri 0x10010000 + 0x00000009 
				# 0x10010009
	
str3:	
	.asciiz "A soma dos positivos e': "
	
	.text
	.globl main
	
main:
	li 	$t0, 0	# i = 0
	li 	$t2, 0	# soma = 0
	
for:
	bge	$t0, 5, endfor	# for(i=0, soma=0; i < 5; i++)  

	la 	$a0, str1
	li 	$v0, 4
	syscall		# print_string("Introduza um numero: "); 
	
	li 	$v0, 5
	syscall
	move	$t1, $v0	# value = read_int();
if:
	ble	$t1, 0, else	# if(value > 0
	
	add	$t2, $t2, $t1	# soma = soma + value; 
	
else:
	la 	$a0, str2
	li 	$v0, 4
	syscall		# print_string("Valor ignorado\n"); 
	

	addi 	$t0, $t0, 1	# i++
	j for
endfor:
	la 	$a0, str3
	li 	$v0, 4
	syscall
	
	move 	$a0, $t2
	li	$v0, 1
	syscall
	
	jr 	$ra	# finish prog
	
