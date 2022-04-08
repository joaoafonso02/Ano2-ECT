    .data
    .equ resetCoreTimer, 12
    .equ readCoreTimer, 11

    .text
    .globl main

main:
    addiu   $sp, $sp, -4           
    sw      $ra, 0($sp)             

    lw      $ra, 0($sp)             
    addiu   $sp, $sp, 4             
    jr      $ra                     
#------------------------------------------------------------
timeDone:
    li      $t0, 0              # unsigned int retValue = 0;
if:
    ble     $a1, 0, else        # if (reset > 0)
    li      $v0, resetCoreTimer
    syscall                     # resetCoreTimer();

    j endif
else:
    li      $v0, readCoreTimer
    syscall
    move    $t1, $v0            # curCount = readCoreTimer();

    mul     $t2, $a0, 20000     # K * ms
if2:
    ble     $t1, $t2, endif
    div     $t3, $t1, 20000      # retValue = curCount / K;
endif:
    move    $v0, $t3
    jr      $ra
