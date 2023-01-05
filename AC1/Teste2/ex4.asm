#typedef struct
#{		Allign    SIZE    OFF
 # int acc;                4        4      0
 # unsigned char nm;       1        1      4
 # double grade;           8        8     5->8
 # char quest[14];          1      14     16
 # int cq;                 4        4     30->32
#} t_kvd;                  8      36->40

# Mapa de registos:
# nv: $a0
# pt: $a1
# i: $t0
# j: $t1
# sum: $f0

	.data
	.eqv acc, 0
	.eqv nm, 4
	.eqv grade, 8
	.eqv quest,16
	.eqv cq, 32
sum:	.double 0.0
	.text
	.globl func4
func4:	
	la $t3, sum
	l.s $f0, $0($t3) # double sum = 0.0
	
	li $t0, 0 # i = 0
for:
	bge $t0, $a0, endfor 
	li $t1, 0  # j = 0
do:
	addu $t2, $a1, 16 # $t2= &(pt->quest[0])
	addu $t2, $t2, $t1 # t2 = &(pt->quest[j])
	lb $t2, 0($t2) 
	
	mtc1 $t2, $f2
	cvt.d.w $f2, $f2 # (double)pt->quest[j]
	add.d $f0, $f0, $f2 # sum += (double)pt->quest[j]
	
	addi $t1, $t1, 1 # j++	
while:
	lbu $t2, nm($a1) # pt->nm
	blt $t1, $t2, do # while(j < pt->nm);

	l.d $f4, grade($a1) # pt->grade
	div.d $f0, $f0, $f4 # sum / pt->grade
	cvt.w.d $f0, $f0
	mfc1 $t3, $f0
	sw $t3, 0($a1) # pt-> acc = (int) ( sum / pt->grade)
	
	addi $t0, $t0, 1 # i++
	addiu $a1, $a1, 40 # pt++
	j for
endfor:
	lw $t5, cq($a1) # pt->cq
	mtc1 $t5, $f6
	cvt.d.w $f6, $f6 # (double) pt->c1
	mul.d $f0, $f4, $f6 # return (pt->grade * (double) pt->c1 )
	
	jr $ra

