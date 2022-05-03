#include <detpic32.h>

int main(void) {
    volatile int aux;
    // Configure A/D module; configure RD11 as a digital output port while(1)
    RISDbits.TRISD11 = 0; 
    // RB4 configured as A/D output
    RISBbits.TRISB4 = 1; 
    AD1PCFGbits.PCFG4= 0;
    AD1CON1bits.SSRC = 7;

    AD1CON1bits.CLRASAM = 1;

    AD1CON3bits.SAMC = 16;
    AD1CON2bits.SMPI = 1-1;

    while(1) {
        // Start conversion
        AD1CONbits.ASAM = 1;
        // Set LATD11 (LATD11=1)
        LATDbits.LATD11 = 1;
        // Wait while conversion not done (AD1IF == 0)
        while( IFS1bits.AD1IF == 0 ); 
        // Reset LATD11 (LATD11=0)
        LATDbits.LATD11 = 0;
        // Read conversion result (ADC1BUF0) to "aux" variable
        aux = ADC1BUF0;
        // Reset AD1IF (should be done after reading the conversion result)
        IFS1bits.AD1IF = 0;
    }
    return 0;
}