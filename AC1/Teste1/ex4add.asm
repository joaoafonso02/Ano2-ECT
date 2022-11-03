	.data		# 0x10010028
X:
	.asciiz "6C1E0DB2A3"
Y:
	.word 0x5CEB, 0x1F4B8, 0xB17A, 0xCA23, 0x3AC
Z:
	.space 30
	.align 3
T:
	.double 10.547681
	
	.text
	.globl main
main:
	la $t0, Y
	la $t1, Z
	la $t4, T
	subu $t2, $t1, $t0
	addu $2, $t1, $t2
loop:
	lw $t3, 0($t0)
	srl $t3, $t3, 8
	sw $t3, -4($t2)
	addiu $t0, $t0, 4
	addiu $t2, $t2, -4
	blt $t0, $t1, loop
endw:
	la $t1, X
	lw $v0, 0($t1)
exit:
	jr $ra		
