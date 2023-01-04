# mapa
# i: $t0
# lista + SIZE: $t2


     .data
     .eqv SIZE, 5
lista:
     .space 20
str:
     .asciiz "\nIntroduza um numero: "
str2:
     .asciiz "\nConteudo do array:\n"
     
     .text
     
     .globl main
main:
     li $t0, 0 # i = 0
read:
     bge $t0, SIZE, endread
     
     la $a0, str
     li $v0, 4
     syscall
     
     li $v0, 5
     syscall
     
     la $t1, lista
     sll $a1, $t0, 2
     addu $t2, $a1, $t1
     sw $v0, 0($t2)

     addi $t0, $t0, 1
     j read
###############################################
endread:
     li $t0, 0 # i = 0
     la $t2, lista
     li $t1, SIZE
     sub $t1, $t1, 1 # SIZE-1
for:
     bge $t0, $t1, endfor
     addi $t3, $t0, 1 # j = i+1
for2:
     bge $t3, SIZE, endfor2
     
     sll $a0, $t0, 2 # i*4
     addu $t4, $a0, $t2 # lista+i
     
     sll $a1, $t3, 2 # j*4
     addu $t5, $a1, $t2 # lista+j
     
     lw $t6, 0($t4) # lista[i]
     lw $t7, 0($t5) # lista[j]
if:
     ble $t6, $t7, endif  
     sw $t7, 0($t4) # lista[i] = lista[j]
     sw $t6, 0($t5) # lista[j] = lista[i]
endif:     
     addi $t3, $t3, 1 # j++
     j for2
endfor2:    
     addi $t0, $t0, 1
     j for	                  
endfor:
############################################

    la $a0, str2
    li $v0, 4
    syscall
    
    la $t2, lista
    li $t3,SIZE
    sll $a0, $t3, 2
    addu $t4, $a0, $t2 # lista + SIZE
write:
    bge $t2, $t4, endw
    
    lw $a0, 0($t2)
    li $v0, 1
    syscall
    
    li $a0, ';'
    li $v0, 11
    syscall	
	
    addi $t2, $t2, 4 # p++
    j write
endw:
    jr $ra
