.equ SFR_BASE_HIGH,0xBF88
.equ TRISE,0x6100
.equ PORTE,0x6110
.equ LATE,0x6120
.equ TRISB,0x6040
.equ PORTB,0x6050
.equ LATB,0x6060
.data
.text
.globl main
main:

lui $t0,SFR_BASE_HIGH
lw $t1,TRISB($t0)
andi $t1,$t1,0xFFF0	#read
ori $t1,$t1,0x000F	#modify, RB[0..3]=in
sw $t1,TRISB($t0)	#write

lw $t1,TRISE($t0)
andi $t1,$t1,0xFFF0	#read, modify, RE[0..3] = out
sw $t1,TRISE($t0)	#write

loop:

lw $t1,PORTB($t0)
andi $t1,$t1,0x000F	#discard other inputs, except for RB[0..3]
xori $t3,$t1,0x0009	#negate RB0 and RB3 
lw $t1,LATE($t0)
andi $t1,$t1,0xFFF0	#cleaning output before pling input
or $t1,$t1,$t3		#RE0=RB0\ , RE3=RB3\, #RE1=RB1, RE2=RB2			
sw $t1,LATE($t0)				
						
j loop						
jr $ra
