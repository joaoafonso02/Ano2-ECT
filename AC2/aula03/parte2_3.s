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
sw $s1,0($sp)
sw $ra,4($sp)

lui $s0,SFR_BASE_HIGH	#perguntar se o SFR_BASE HIGH tem de ser salvaguardado. Se não tiver, ele tem de ser posto dentro do ciclo while que faz o contador...?
lw $t1,TRISE($s0)	#read
andi $t1,$t1,0xFFF0	#modify //RE[3..0]=out
sw $t1,TRISE($s0)	#write

lw $t1,TRISB($s0)	#read
andi $t1,$t1,0xFFF7	#modify //RB3=in
ori $t1,$t1,0x0008	#
sw $t1,TRISB($s0)	#write			
			
			#TRISB3=1;
			#TRISE3=0; TRISE2=0; TRISE1=0; TRISE0=0;
li $s1,0		#int cnt=0;

while:			#while(1)
			#{
			
lw $t1,PORTB($s0)	#//read port RB	
andi $t1,$t1,0x0008	#//clean RB3
bne $t1,0x0000,endif	#if (RB3==0)
			#{
lw $t2,LATE($s0)		#//read LATE	
andi $t2,$t2,0xFFF0		#//clean LATE[3..0]
or $t2,$t2,$s1			#LATE=LATE+cnt;
sw $t2,LATE($s0)		#//write LATE
addiu $s1,$s1,-1		#cnt--;
j endif2

endif:
bne $t1,0x0008,endif2	#if(RB3==1)
			#{
lw $t2,LATE($s0)		#//read LATE
andi $t2,$t2,0xFFF0		#//clean LATE
or $t2,$t2,$s1			#LATE=LATE+cnt;
sw $t2,LATE($s0)		#//write LATE
addiu $s1,$s1,1		#cnt++;
j endif2		#}

endif2:
li $a0,500		#delay(500); // 2Hz
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
li $t0,20000
mul $t0,$t0,$a0		#//20000*ms
whiled: 			
li $v0,readCoreTimer
syscall			
blt $v0,$t0,whiled		#while(readCoreTimer()<20000*ms);
jr $ra			#}
