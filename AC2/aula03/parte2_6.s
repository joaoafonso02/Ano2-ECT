.equ SFR_BASE_HIGH,0xBF88
.equ TRISB,0x6040
.equ PORTB,0x6050
.equ LATB,0x6060
.equ TRISE,0x6100
.equ PROTE,0x6110
.equ LATE,0x6120
.equ readCoreTimer,11
.equ resetCoreTimer,12
.data
.text
.globl main
main:

subu $sp,$sp,16
sw $s0,0($sp)
sw $s1,4($sp)
sw $s2,8($sp)
sw $ra,12($sp)


lui $s0,SFR_BASE_HIGH
lw $t1,TRISE($s0)	#read
andi $t1,$t1,0xFFF0	#modify (RE[3..0] =out)
sw $t1,TRISE($s0)	#write

li $s1,0		#cnt=0

while:

lw $t1,LATE($s0)	#read
andi $t1,$t1,0xFFF0	#clean out
or $t1,$t1,$s1		#modify
sw $t1,LATE($s0)	#write


li $a0,666		#delay(666.666) = 1.5Hz
jal delay


xori $s2,$s1,0x0001	#negate lsb 0000\
sll $s2,$s2,3		#0001<<1000
srl $s1,$s1,1		#1000 >> 0100
andi $s2,$s2,0x000F
andi $s1,$s1,0x000F	#0010*1111=0010
or $s1,$s1,$s2		#0010+0001=0011


j while

lw $ra,0($sp)
lw $s2,4($sp)
lw $s1,8($sp)
lw $s0,12($sp)
addiu $sp,$sp,16
jr $ra

delay:
li $v0,resetCoreTimer
syscall
li $t0,20000
mul $t0,$t0,$a0
whiled:
li $v0,readCoreTimer
syscall
blt $v0,$t0,whiled
jr $ra


