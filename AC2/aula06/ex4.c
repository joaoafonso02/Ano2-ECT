#include <detpic32.h>

int main(void) {
    TRISBbits.TRISB4 = 1; // RB4 configured as A/D
    AD1PCFGbits.PCFG4= 0;
    AD1CON1bits.SSRC = 7;

    AD1CON1bits.CLRASAM = 1;
    
    AD1CON3bits.SAMC = 16;
    AD1CON2bits.SMPI = 4-1;

    while(1) {
        // Start conversion
        AD1CON1bits.ASAM = 1
        // Wait while conversion not done (AD1IF == 0)
        while( IFS1bits.AD1IF == 0 ); 
        // Read conversion result (ADC1BUFx value) and print it 
        int *p = (int *)(&ADC1BUF0);
        for( i = 0; i < 16; i++ ) {
            printInt( p[i*4], 10 | 4 << 16 );
            printStr(" ");
        } 
        printStr("\n");
        // Reset AD1IF
        IFS1bits.AD1IF = 0;
    }

}