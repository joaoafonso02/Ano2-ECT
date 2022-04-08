    .data
    .equ getchar, 2
    .equ putChar, 3

    .text
    .globl main

main:                           # int main(void)
do:
    li      $v0, getchar
    syscall

    move    $a0, $v0            # c = getChar();
    li      $v0, putChar        # putChar( c );
    syscall                     

while:
    bne     $a0, '\n', do       #  while( c != '\n' );
    jr      $ra
    