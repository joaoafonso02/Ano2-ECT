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
     li $t0, 0  # n_even = 0
     li $t1, 0  # n_odd = 0
     la $t2, a  # p1 = a
     
     li $t4, N
     sll $a0, $t4, 2
     addu $t5, $a0, $t2 # a + N
######################################
read:
     bge $t2, $t5, endread
     
     li $v0, 5
     syscall
     sw $v0, 0($t2)
     
     addi $t2, $t2, 4 # p1++
     j read
endread:
     la $t2, a  # p1 = a
     la $t3, ba # p2 = b
######################################
count:
     bge $t2, $t5, endcount
     lw $t6, 0($t2)
     rem $t7, $t6, 2 # *p % 2
if:
     beqz $t7, endif
     
     sw $t6, 0($t3) # *p2 = *p1
     addi $t3, $t3, 4 # *p2++
     
     addi $t1, $t1, 1 # n_odd++
     j endif
else:
     addi $t0, $t0, 1 # n_even++
endif:
     addi $t2, $t2, 4 # p1++
     j count
endcount:	
     la $t3, ba # p2 = b
     sll $a0, $t1, 2
     addu $t8, $a0, $t3 # b + n_odd
######################################
write:
     bge $t3, $t8, endw
     
     lw $a0, 0($t3)
     li $v0, 1
     syscall

     addi $t3, $t3, 4 # p2++
     j write
endw:
     jr $ra