#include <detpic32.h>

void voltsConversion(int VAL_AD);
void delay(int ms);
void send2displays(unsigned char value);

int main(void) {
    // Configure all (digital I/O, analog input, A/D module)
    TRISB = (TRISB & 0x80FF) | 0x000F;
    LATD = (LATD & 0xFF9F);
    TRISD = (TRISD & 0xFF9F);
    // Configure A/D module; configure RD11 as a digital output port
    TRISBbits.TRISB4 = 1;
    AD1PCFGbits.PCFG4= 0;
    AD1CON1bits.SSRC = 7;

    AD1CON1bits.CLRASAM = 1;

    AD1CON3bits.SAMC = 16;
    AD1CON2bits.SMPI = 4-1;

    AD1CHSbits.CH0SA = 4;       // replace x by the desired input  
                                //  analog channel (0 to 15) 
    AD1CON1bits.ON = 1;         // Enable A/D converter 
                                //  This must the last command of the A/D 
                                //  configuration sequence 

    int j = 0;
    while(1) {
        // vars
        double v = 0;
        if(i == 0) {
            // Start conversion
            AD1CON1bits.ASM = 1;
            // Wait while conversion not done (AD1IF == 0)
            while( IFS1bits.AD1IF == 0 );
            printf("\r");
            // Read conversion result (ADC1BUFx value) and print it 
            int *p = (int *) (&ADC1BUF0);
            for( int i; i < 16; i++) {
                printf("%4d ", p[j*4]);
            }
            int VAL_AD = ADC1BUF0 + ADC1BUF1 + ADC1BUF2 + ADC1BUF3;
            v = voltsConversion(VAL_AD);
            printf("Volts: %f", v);
            // Reset AD1IF
             IFS1bits.AD1IF = 0;
        }
        send2displays(toBcd(v)); // Send voltage value to displays
        delay(10);  // Wait 10 ms (using the core timer)
        i = (i + 1) % 20; // 5Hz
    }
    return 0;
}

void voltsConversion(int VAL_AD) {
    return (VAL_AD * 33+ 511) / 1023;
}

void delay(int ms) {
    resetCoreTimer();
    while(readCoreTimer() < 20000*ms);
}

void send2displays(unsigned char value) {
    display7Scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
            //            0     1     2     3    4     5     6      7    8      9    A     b      C     d    E     F
    static char displayFlag = 0; // static variable: doesn't loose its
                                 // value between calls to function
    
    unsigned digit_low = value & 0x0F;
    unsigned digit_high = value >> 4;

    if(displayFlag == 0) {
         // select display low
        LATD = (LATD & 0xFF9F) | 0x0020; // 1111 1111 1001 1111 (reset) || 0000 0000 0010 0000(select low)
        dl = display7Scodes[dl];
        LATB = (LATB & 0x80FF) | dl << 8;
    } else {
        // select display high
        LATD = (LATD & 0xFF9F) | 0x0040; // 1111 1111 1001 1111 (reset) || 0000 0000 0100 0000(select high)
        dh = display7Scodes[dh];
        LATB = (LATB & 0x80FF) | dh << 8;
    }
    // toggle "displayFlag" variable
    displayFlag = !displayFlag;
}

unsigned char toBcd(unsigned char value) { 
	return ((value / 10) << 4) + (value % 10); 
}