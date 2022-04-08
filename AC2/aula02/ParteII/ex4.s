        .equ    RESET_CORE_TIMER, 12
        .equ    READ_CORE_TIMER, 11
        .equ putChar, 3
        .equ printInt, 6
        .equ inkey, 1
        .data
        .text
        .globl main

main:                                   # int main(void) {
        addiu   $sp, $sp, -24           #       abrir espaco na pilha
        sw      $ra, 0($sp)             #       guardar o $ra
        sw      $s0, 4($sp)             #       guardar o $s0
        sw      $s1, 8($sp)             #       guardar o $s1
        sw      $s2, 12($sp)            #       guardar o $s2
        sw      $s3, 16($sp)
        sw      $s4, 20($sp)
        li      $s0, 0                  #       cnt10 = 0;
        li      $s1, 0                  #       cnt5 = 0;
        li      $s2, 0                  #       cnt1 = 0;
while:                                  #       while(1) {
inputs:
        li      $v0, inkey
        syscall
ifa:
        bne     $v0, 'a', ifn
        li      $s3, 50
ifn:
        bne     $v0, 'n', ifs
        li      $s3, 100
ifs:    
        bne     $v0, 's', ifr
        li      $s4, 0
ifr:
        bne     $v0, 'r', inputif
        li      $s4, 1
inputif:
        beq     $s4, 1, continue
        j inputs
       
continue:       
        move    $a0, $s3
        jal     delay

        li      $a0, '\r'               #               $a0 = '\r'
        li      $v0, putChar            #               $v0 = 3;
        syscall                         #               putChar('\r');

        addi    $s0, $s0, 1             #               cnt10++;
        move    $a0, $s0                #               $a0 = ++cnt10;
        li      $a1, 0x0005000A         #               $a1 = 10 | 4 << 16
        li      $v0, printInt           #               $v0 = 6;
        syscall                         #               printInt(++cnt10, 10 | 5 << 16);

if:     rem     $t0, $s0, 2             #               if(cnt10 % 2 == 0) {
        bne     $t0, 0, if2           #
        addi    $s1, $s1, 1             #                       cnt5++;

if2:    rem     $t0, $s0, 10            #               if(cnt10 % 10 == 0) {
        bne     $t0, 0, endif2          #
        addi    $s2, $s2, 1             #                       cnt1++;
endif2:                                 #               }

        li      $a0, ' '                #               $a0 = ' '
        li      $v0, putChar            #               $v0 = 3;
        syscall                         #               putChar(' ');
        move    $a0, $s1                #
        li      $a1, 0x0005000A         #               $a1 = 10 | 4 << 16
        li      $v0, printInt           #               $v0 = 6;
        syscall                         #               printInt(cnt5, 10 | 5 << 16);

        li      $a0, ' '                #               $a0 = ' '
        li      $v0, putChar            #               $v0 = 3;
        syscall                         #               putChar(' ');
        move    $a0, $s2                #
        li      $a1, 0x0005000A         #               $a1 = 10 | 4 << 16
        li      $v0, printInt           #               $v0 = 6;
        syscall                         #               printInt(cnt1, 10 | 5 << 16);
      
        j       while                   #       }
        li      $v0, 0                  #       return 0;
        lw      $ra, 0($sp)             #       report o $ra
        lw      $s0, 4($sp)             #       repor o $s0
        lw      $s1, 8($sp)             #       repor o $s1
        lw      $s2, 12($sp)            #       repor o $s2
        lw      $s3, 16($sp)
        lw      $s4, 20($sp)
        addiu   $sp, $sp, 24            #       repor espaco da pilha
        jr      $ra                     # }


delay:                                  # void delay(int ms) {
        move    $t0, $a0                #       $t0 = ms;
        
for:    ble     $t0, 0, endfor          #       for(; ms > 0; ms--) {
        li      $v0, RESET_CORE_TIMER   #               
        syscall                         #               resetCoreTimer();
read:   li      $v0, READ_CORE_TIMER    #
        syscall                         #               readCoreTimer();
        blt     $v0, 20000, read        #               while(readCoreTimer() < K);
        addi    $t0, $t0, -1            #               ms--;
        j       for                     #       }
endfor:                                 #       
        jr      $ra                     # }