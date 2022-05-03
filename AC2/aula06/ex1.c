#include <detpic32.h>

int main(void) {
    TRISBbits.TRISB4 = 1; // RB4 configured as A/D
    AD1PCFGbits.PCFG4= 0;
    AD1CON1bits.SSRC = 7;

    AD1CON1bits.CLRASAM = 1;
    
    AD1CON3bits.SAMC = 16;
    AD1CON2bits.SMPI = 1-1;

    while(1) {
        // Start conversion
        AD1CON1bits.ASAM = 1
        // Wait while conversion not done (AD1IF == 0)
        while( IFS1bits.AD1IF == 0 ); 
        // Read conversion result (ADC1BUF0 value) and print it 
        printInt(ADC1BUF0, 16 | 3 << 16);
        printStr("\n");
        // Reset AD1IF
        IFS1bits.AD1IF = 0;
    }

}