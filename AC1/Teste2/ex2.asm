 # f1: $s0
 # k: $s1
 # av: $s2
 # i: $s3
 # res: $s4  
   
      .data
      .eqv SIZE, 15
str1: .asciiz "Invalid argc"    
      .text
      .globl main
main:
   
   addiu $sp, $sp, -24
   sw $ra, 0($sp)
   sw $s0, 4($sp)
   sw $s1, 8($sp)
   sw $s2, 12($sp)
   sw $s3, 16($sp)
   sw $s4, 20($sp)
   
   move $s0, $a0 # f1
   move $s1, $a1 # k
   move $s2, $a2 # av[]
   
   li $s4, -1 # res = -1
if1:
   blt $s1, 2, else1
   bgt $s1, SIZE, else1
   
   li $s3, 2 # i = 2;
do:
  sll $t0, $s3, 2 # i*4
  addu $t1, $t0, $s2 # i + av
  lw $a0, 0($t1) # av[i]
  jal toi  # toi(av[i])

  addu $t2, $t0, $s0 # f1 + i
  sw $v0, 0($t2) # f1[i] = toi(av[i])
  addi $s3, $s3, 1 # i++;
while:
   blt $s3, $s1, do # while(i < k)
   move $a0, $s0
   move $a1, $s1
   jal avz
   
   move $s4, $v0 # res = avz(f1, k)
   move $a0, $s4
   li $v0, 1
   syscall # print_int10(res)     
   
   j endif1
else1:
   la $a0, str1
   li $v0, 4
   syscall # print_string("Invalid argc")
endif1:
   move $v0, $s4 # return res
   lw $ra, 0($sp)
   lw $s0, 4($sp)
   lw $s1, 8($sp)
   lw $s2, 12($sp)
   lw $s3, 16($sp)
   lw $s4, 20($sp)
   addiu $sp, $sp, 24
