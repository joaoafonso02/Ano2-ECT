#include <detpic32.h>

void send2displays(unsigned char value);
void delay(int ms);

int main(void) {
    // reset
    LATD = (LATD & 0xFF9F);
    LATB = (LATB & 0x80FF);
    // configure RB8-RB14 as outputs
    TRISB = (TRISB & 0x80FF);
    // configure RD5-RD6 as outputs
    TRISD = (TRISD & 0xFF9F);
    while(1){
        send2displays(0x15);
        //delay(200) // wait 0.2s - 5Hz
        // delay(50) - 20Hz
        // delay(20) - 50Hz
        delay(1) //  - 100Hz
    }
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

void delay(int ms) {
    resetCoreTimer();
    while(readCoreTimer() < 20000 * ms)
}