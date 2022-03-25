.equ SFR_BASE_HIGH,0xBF88
.equ TRISE,0x6100
.equ PORTE,0x6110
.equ LATE,0x6120
.equ TRISD,0x60C0
.equ PORTD,0x60D0
.equ LATD,0x60E0
.equ resetCoreTimer,12
.equ readCoreTimer,11
.data
.text
.globl main
main:

subu $sp,$sp,12
sw $s0,0($sp)
sw $s1,4($sp)
sw $ra,8($sp)

li $s1,0		#int v=0;

lui $s0,SFR_BASE_HIGH
lw $t1,TRISE($s0)	#read
andi $t1,$t1,0xFFFE	#modify (RE0=out)
sw $t1,TRISE($s0)	#write

lw $t1,TRISD($s0)	#read
andi $t1,$t1,0xFFFE	#modify (RD0=out)
sw $t1,TRISD($s0)	#write

while:			#while(1)
			#{
lw $t1,LATE($s0)
andi $t1,$t1,0xFFFE	#cleaning output before placing input
or $t1,$t1,$s1		#LATE0=v;
sw $t1,LATE($s0)	#write into output

lw $t1,LATD($s0)	
andi $t1,$t1,0xFFFE	#cleaning output before placing input
or $t1,$t1,$s1		#LATD0=v;
sw $t1,LATD($s0)	#write into output

li $a0,500		#delay(500) // 500 ms = 2Hz de freq., o led fica aceso 500 ms, depois apagado 500 ms
jal delay

xori $s1,$s1,1		#v^= 1 // v = v xor 1

j while		#}

lw $ra,8($sp)
lw $s1,4($sp)
lw $s0,0($sp)
addiu $sp,$sp,12

jr $ra

delay:			#delay(unsigned int ms)
li $v0,resetCoreTimer	#{
syscall			#resetCoreTimer();
li $t1,20000			#	
mul $t1,$t1,$a0		#(ms*20000)
whiled:			#
li $v0,readCoreTimer		#
syscall			#
blt $v0,$t1,whiled		#while(readCoreTimer()<20000*ms);				#
jr $ra			#}			



