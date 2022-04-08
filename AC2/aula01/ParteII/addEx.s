    .data
    .equ UP, 1
    .equ DOWN, 0
    .equ inkey, 1
    .equ printInt, 6 
    .text
    .globl main

main:                          # int main(void)
    addiu   $sp, $sp, -12           #      abrir
    sw      $ra, 0($sp)             #      guardar o $ra
    sw      $s0, 4($sp)             #      guardar o $s0
    sw      $s1, 8($sp)             #      guardar o $s1
    li      $s0, 0             # state = 0 
    li      $s1, 0             # count = 0
do:
    li      $a0, '\r'          # // Carriage return character
    li      $v0, putChar
    syscall

    move    $a0, $s1
    li      $a1, 3
    sll     $a1, $a1, 16
    ori     $a1, $a1, 10
    li      $v0, printInt       # 0x0003000A: decimal w/ 3 digits
    syscall                    

    li      $a0, '\t'           # // Tab character
    li      $v0, putChar
    syscall

    move    $a0, $t1
    li      $a1, 8
    sll     $a1, $a1, 16
    ori     $a1, $a1, 2
    li      $v0, printInt       # 0x00080002: binary w/ 8 bits
    syscall
    
    li      $a0, 5
    jal		wait				# // wait 0.5s

    li      $v0, inkey
    syscall                     
    move    $a0, $v0            # c = inkey();
if1:
    bne     $a0, '+', if2       # if( c == '+' )
    li      $s0, UP             # state = UP;
if2:
    bne     $a0, '-', if3       # if( c == '-' )
    li      $s0, DOWN           # state = DOWN;
if3:
    bne     $a0, UP, if4       # if( c == UP )
    addi    $s1, $s1, 1         # cnt + 1
    andi	$s1, $s1, 0xFF	    # // Up counter MOD 256
    j while
if4:
    bne     $a0, 'r', if5      # if( c == 'r' )
    li      $s1, 0              # cnt = 0
    j while
if5:
    bne     $a0, 's', else      # if( c == 's' )
    j       endw
else:
    addu    $s1, $s1, -1        # cnt - 1
    andi	$s1, $s1, 0xFF	    # // Down counter MOD 256
while:
    bne     $a0, 'q', do        #  while( c != 'q' );
    lw      $ra, 0($sp)             #       repor $ra
    lw      $s0, 4($sp)             #       repor $s0
    lw      $s1, 8($sp)             #       repor $s1  
    addi    $sp, $sp, 12
    li      $v0, 0                  #       return 0;
    li      $v0, 0
endw:
    jr      $ra
    


#---------------------------------------------------------------------------
wait:                           # void wait(int ts)
for:
    li      $t2, 0              # i = 0
    li      $t1, 515000 
    mul     $t3, $a1, $t1    #  515000 * ts
    bge		$t2, $t3, endfor    # for(i=0; i < 515000 * ts; i++); // wait approximately ts/10 seconds
    addi    $t2, $t2, 1         # i++
    j for
endfor:
    jr $ra
    
    