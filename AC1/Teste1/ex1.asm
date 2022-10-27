	.data
str:
	.asciiz "Digite ate 20 nos (0 para terminar): "
str1:
	.asciiz "Máximo/min são: "
	.text
	.globl main
	
main:
	li $t1, 0 
	li $t2, 0x7FFFFFFF
	li $t3, 0x80000000
do:
	li $v0, 5
	syscall
	move $t0, $v0
if:
	beqz $t0, endif
if2:
	ble $t0, $t3, else
	move $t3, $t0
	j endif
else:
	bge $t0, $t2, endif
	move $t2, $t0
endif:
	addi $t1, $t1, 1
while:
	bge $t1, 20, endw
	beqz $t0, endw
	j do
endw:
	la $a0, str1
	li $v0, 4
	syscall
	
	move $a0, $t3
	li $v0, 1
	syscall
	
	li $a0, ':'
	li $v0, 11
	syscall
	
	move $a0, $t2
	li $v0, 1
	syscall
	
	jr $ra
