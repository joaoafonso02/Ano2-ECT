#include <detpic32.h>

void send2displays(unsigned char value);
void delay(int ms);
unsigned char toBcd(unsigned char value);
int voltageConversion(int VAL_AD);

int main(void) {
    int ns = 1;
    TRISBbits.TRISB4 = 1;       // RB4 digital output disconnected 
    AD1PCFGbits.PCFG4 = 0;      // RB4 configured as analog input (AN4)
    AD1CON1bits.SSRC = 7;       // Conversion trigger selection bits: in this 
                                // mode an internal counter ends sampling and 
                                // starts conversion
    AD1CON1bits.CLRASAM = 1;    // Stop conversions when the 1st A/D converter
                                // interrupt is generated. At the same time 
                                // hardware clears the ASAM bit
    AD1CON3bits.SAMC = 16;      // Sample time is 16 TAD (TAD = 100 ns)
    AD1CON2bits.SMPI = ns-1;
    
    AD1CHSbits.CH0SA = 4;
    AD1CON1bits.ON = 1;         // Enable A/D converter
    
    // Configure the A/D module and port RB4 as analog input 
    while(1) {
        AD1CON1bits.ASAM = 1; // Start conversion
        while (IFS1bits.AD1IF == 0);// Wait while conversion not done (AD1IF == 0)
        int *p = (int *)(&ADC1BUF0);
        int i, 
        double media = 0;
        printf('\r')
        for( i = 0; i < 16; i++ ) {
            printInt( p[i*4]
            media += p[i*4];
            printStr(' ')
        }
        voltageConversion(media /= ns);
        send2displays(toBcd(media))

        delay(10);
        IFS1bits.AD1IF = 0; // Reset AD1IF          
    }
    return 0;
}

int voltageConversion(int VAL_AD){
    return (VAL_AD * 33 + 511) / 1023;
}

void send2displays(unsigned char value) {
    static const char display7Scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
                                      //   0     1     2     3     4     5     6     7     8     9     A     B     C     D     E     F 
    static char displayFlag = 0; // static variable: doesn't loose its
                                       // value between calls to function

    unsigned char dh = value >> 4;  // send digit_high (dh) to display: dh = value >> 4
    unsigned char dl = value & 0x0F; // send digit_low (dl) to display: dl = value & 0x0F }
    // if "displayFlag" is 0 then send digit_low to display_low 
    if(displayFlag == 0) {
        LATD = (LATD | 0xFF9F) | 0x0020;   
        dl = display7Scodes[dl];
        LATB = (LATB & 0x80FF) | dl << 8;
    } // else send digit_high to didplay_high 
    else {
        LATD = (LATD | 0xFF9F) | 0x0040;   
        dh = display7Scodes[dh];
        LATB = (LATB & 0x80FF) | dh << 8;
    }
    displayFlag = !displayFlag; // toggle "displayFlag" variable
}

unsigned char toBcd(unsigned char value){
    return ((value / 10) << 4) + (value % 10);
}

void delay(int ms) {
    resetCoreTimer();
    while(readCoreTimer() < 20000 * ms);
}