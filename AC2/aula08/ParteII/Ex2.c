#include <detpic32.h>

unsigned char count = 0;

int main(void) {
    TRISEbits.TRISE0 = 0;
    TRISDbits.TRISD8 = 1; // output

    // T2
    T2CONbits.TCKPS = 7; // prescaler = 1:256 --> 994 
    PR2 = 236741; // PRx = (PBCLK / Kprescaler / fout) - 1
    TMR2 = 0; 
    T2CONbits.TON = 1;

    IPC2bits.T2IP = 1; // Interrupt priority (must be in range [1..6])
    IEC0bits.T2IE = 1; // Enable timer T2 interrupts
    IFS0bits.T2IF = 0; // Reset timer T2 interrupt flag

    // INT1
    IPC1bits.INT1IP = 2; // Interrupt priority 26
    IEC0bits.INT1IE = 1; // Enable INT1 interrupts
    IFS0bits.INT1IF = 0; // Reset timer INT1 interrupt flag

    EnableInterrupts();

    while(1);

    return 0;
}

void int(8) isr_T2(void) {
    count++;
     if (count >= 1 && count != 101) {  // 0,33 hz -> 3 segundos
        LATEbits.LATE0 = 1;
    } else {
        LATEbits.LATE0 = 0;
        IEC0bits.T2IE = 0; 
    }
    IFS0bits.T2IF = 0; 
}



void int(7) isr_INT1(void) {
    count = 0;
    IEC0bits.T2IE = 1;  // Enable timer T2 interrupts
    IFS0bits.INT1IF = 0;
}