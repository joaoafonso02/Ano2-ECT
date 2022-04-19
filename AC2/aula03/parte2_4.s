.equ SFR_BASE_HIGH,0xBF88
.equ TRISB,0x6040
.equ PORTB,0x6050
.equ LATB,0x6060
.equ TRISE,0x6100
.equ PORTE,0x6110
.equ LATE,0x6120
.equ readCoreTimer,11
.equ resetCoreTimer,12
.data
.text
.globl main
main:

subu $sp,$sp,12
sw $s0,0($sp)
sw $s1,4($sp)
sw $ra,8($sp)

lui $s0,SFR_BASE_HIGH
lw $t1,TRISE($s0)	#read
andi $t1,$t1,0xFFF0	#modify //RE[3..0]=out
sw $t1,TRISE($s0)	#write

lw $t1,TRISB($s0)	#read
andi $t1,$t1,0xFFFD	#modify
ori $t1,$t1,0x0002	#RB1=in //0x1111 1111 1111 1101 + 0x0010
sw $t1,TRISB($s0)	#write

li $s1,0x0008		#int cnt_d=1000;
while:			#while(1)

lw $t1,PORTB($s0)		#//read RB
andi $t1,$t1,0x0002		#//clean RB1

bne $t1,0x0000,endif		#if(RB1==0)

lw $t1,LATE($s0)		#//read LATE
andi $t1,$t1,0xFFF0		#//clean LATE		
or $t1,$t1,$s1			#LATE=LATE+cnt_d; //modify LATE
sw $t1,LATE($s0)		#//write LATE
srl $s1,$s1,1			#cnt_d >> 1 //0x1000 >> 0x0100 ...
ifd:bge $s1,0x0001,endifd	#if(cnt_d<0x0001)
li $s1,0x0008				#cnt_d=0x0008;
endifd:
j end					

endif:

bne $t1,0x0002,end		#if(RB1==1) 
lw $t1,LATE($s0)		#//read LATE
andi $t1,$t1,0xFFF0		#//clean LATE
or $t1,$t1,$s1			#LATE=LATE+cnt_e; //modify LATE
sw $t1,LATE($s0)		#//write
sll $s1,$s1,1			#cnt_e << 1 //0x0001 >> 0x0010
ife:ble $s1,0x0008,endife	#if(cnt_e>0x0008)
li $s1,0x0001				#cnt_e=0x0001;
endife:
j end

end:
li $a0,333
jal delay
j while

lw $ra,0($sp)
lw $s1,4($sp)
lw $s0,8($sp)
addiu $sp,$sp,12

jr $ra

delay:			#void delay(unsigned int ms)
li $v0,resetCoreTimer	#{
syscall			#resetCoreTimer();
li $t0,20000			#while(readCoreTimer()<20000*ms);
mul $t0,$t0,$a0	#}
whiled:
li $v0,readCoreTimer
syscall
blt $v0,$t0,whiled
jr $ra
