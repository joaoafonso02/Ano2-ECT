#include <detpic32.h>

int main(void){
    display7Scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
            //            0     1     2     3    4     5     6      7    8      9    A     b      C     d    E     F
    // reset
    LATD = (LATD & 0xFF9F);  
    LATB = (LATB & 0x80FF);
    // configure
    TRISD = (TRISD & 0xFF9F);       // RD5 to RD6 as outputs
    TRISB = (TRISB & 0x80FF);       // configure RB8 to RB14
    // Select display high
    LATD = (LATD | 0x0040);  
    while(1) {
        // read dip-switch
        int i = PORTB & 0x000F; // RB0_3 active
        // convert to 7 segments code
        int something = display7Scodes[i];
        // send to display
        LATB = something << 8;
    }
    return 0;
}