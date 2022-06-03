#include <detpic32.h>

int main(void) {
    // T3 
    T3CONbits.TCKPS = 5; // 20 000 000 / (65535+1)*25 = 1:32 prescaler
    PR3 = 24999; // 20 000 000 / (32*(x+1)) = 25
    TMR3 = 0; 
    T3CONbits.TON = 1; 
 
    IPC3bits.T3IP = 2; // Interrupt priority (must be in range [1..6])
    IEC0bits.T3IE = 1; // Enable timer T3 interrupts
    IFS0bits.T3IF = 0; // Reset timer T3 interrupt flag

    // T1
    T3CONbits.TCKPS = 6; // 20 000 000 / (65535+1)*5 --> 1:64 
    PR3 = 62499;
    TMR3 = 0; 
    T3CONbits.TON = 1; 
 
    IPC1bits.T1IP = 3; // Interrupt priority (must be in range [1..6])
    IEC0bits.T1IE = 1; // Enable timer T1 interrupts
    IFS0bits.T1IF = 0; // Reset timer T1 interrupt flag


    EnableInterrupts();

    while(1);

    return 0;
} 

void _int_(12) isr_T3(void) {
    putChar('3');
    IFS0bits.T3IF = 0; 
} 

void _int_(4) isr_T1(void) {
    putChar('1');
    IFS0bits.T3IF = 0; 
} 