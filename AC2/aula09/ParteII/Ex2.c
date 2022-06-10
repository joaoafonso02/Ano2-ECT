#include <detpic32.h>
void setPWM(unsigned int dutyCycle);

int main(void) {
    // T3
    T3CONbits.TCKPS = 2; // 1:4 prescaler (i.e Fout_presc = 5 MHz)
    PR3 = 49999;
    TMR3 = 0;            // Reset timer T3 count register
    T3CONbits.TON = 1;

    IPC3bits.T3IP = 2; // Interrupt priority (must be in range [1..6])
    IEC0bits.T3IE = 1;  // Enable timer T3 interrupts
    IFS0bits.T3IF = 0;  // Reset timer T3 interrupt flag

    // OC1
    OC1CONbits.OCM = 6; // PWM mode on OCx; fault pin disabled
    OC1CONbits.OCTSEL =0;   // Use timer T3 as the time base for PWM generation
    OC1RS = 12500;  // Ton constant
    OC1CONbits.ON = 1;  // Enable OC1 module 

    EnableInterrupts();
    
    while(1) ;

    return 0;
}

void _int_(12) isr_T3(void) {
    IFS0bits.T3IF = 0;  // Reset timer T3 interrupt flag
}

void setPWM(unsigned int dutyCycle) { 
    if(dutyCycle >= 0 && dutyCycle <= 100) {
        OC1RS = (PR3+1) * (dutyCycle/100);
    }
}