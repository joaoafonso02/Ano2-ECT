#include <detpic32.h>

int main(void){
    // Configure Timer T3 with interrupts enabled 

    T3CONbits.TCKPS = 7; // 1:k_prescaler;  fout_presc = 78125 = 20 000 000 / 256;
    PR3 = 39063;  // Fout = 20Mhz / (256 * (39063 + 1)) = 1,999Hz          
    TMR3 = 0;  // Reset timer T3 count register
    T3CONbits.TON = 1;  // Enable timer T3   

    IPC3bits.T3IP = 2;      // Interrupt priority 2
    IEC0bits.T3IE = 1;      // Enable timer T3 interrupts
    IFS0bits.T3IF = 0;      // Reset timer T3 interrupt flag 

    EnableInterrupts();

    while(1);

    return 0;
}

void _int_(12) isr_T3(void) { //ReplaceVECTORbythetimerT3 // vector number
    putChar('.');
    // Reset T3 interrupt flag
    IFS0bits.T3IF = 0;
}
