# mapa
# n_even: $t0
# n_odd: $t1
# p1: $t2
# p2: $t3

     .data 
     .eqv N, 5
a:
     .space 20
ba:
     .space 20
 
     .text
     .globl main
main:
     li $t0, 0 # n_even = 0
     li $t1, 0 # n_odd = 0
     
     la $t2, a # p1
     la $t3, ba # p2
     
     li $t4, N
     sll $t4, $t4, 2 # N*4
     addu $t5, $t4, $t2 # a + N
for:
     bge $t2, $t5, endfor
     
     li $v0, 5
     syscall
     sw $v0, 0($t2) # *p1 = read_int()
     
     addi $t2, $t2, 4 # p1++
     j for
endfor:
############################################
     la $t2, a # p1
     la $t3, ba # p2
for2:
     bge $t2, $t5, endfor2
     lw $t6, 0($t2) # *p1
     rem $a0, $t6, 2 # *p1 %2
if:
     beqz $a0, else
     
     sw $t6, 0($t3) # *p2 = *p1
     addi $t3, $t3, 4 # *p2++
     
     addi $t1, $t1, 1 # n_odd+
     j endif
else:
     addi $t0, $t0, 1 # n_even+
endif:     
     addi $t2, $t2, 4 # p1++
     j for2
endfor2:
############################################
     la $t3, ba # p2
     
     sll $t8, $t1, 2
     addu $t9, $t8, $t3 # b + n_odd
write:
     bge $t3, $t9, endwrite

     lw $a0, 0($t3)
     li $v0, 1
     syscall

     li $a0, ','
     li $v0, 11
     syscall
	
     addi $t3, $t3, 4 # *p2++
     j write
     
endwrite:
     jr $ra

