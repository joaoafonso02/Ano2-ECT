# Mapa de registos
# val : $t0
# n : $t1
# min : #t2
# max : $t3

	.data
	.eqv print_string, 4
	.eqv read_int, 5
	.eqv print_char, 11
	.eqv print_int10, 1
	
str1: 	.asciiz "Digite até 20 inteiros (zero para terminar): "
str2: 	.asciiz "Máximo/mínimo são: "
	.text
	.globl main
	
main:
	li $t1, 0			# n = 0;
	li $t2, 0x7FFFFFFF		# min = 0x7FFFFFFF
	li $t3, 0x80000000		# max = 0x80000000
	
	la $a0, str1
	li $v0, print_string
	syscall				# print_string("Digite até 20 inteiros (zero para terminar): ")
	
do:	
	li $v0, read_int
	syscall	
	move $t0, $v0			# val = read_int();
	
	beqz $t0, endif			# if(val != 0)
if1:	ble $t0, $t3, if2		# if(val > max)
	move $t3, $t0			# max = val;
	 
if2:	bge $t0, $t2, endif		# if(val < min)
	move $t2, $t0			# min = val;
	
endif:
	addi $t1, $t1, 1		# n++;

while: 
	bge $t1, 20, endw		# while((n < 20) &&
	beqz $t0, endw			# (val != 0))
	
	j do				#do{}

endw: 
	la $a0, str2
	li $v0, print_string
	syscall 			# print_string("Máximo/mínimo são: ")
	
	move $a0, $t3
	li $v0, print_int10
	syscall
	
	li $a0, ':'
	li $v0, print_char
	syscall
	
	move $a0, $t2
	li $v0, print_int10
	syscall
	
	jr $ra
	
	
	
	
	
