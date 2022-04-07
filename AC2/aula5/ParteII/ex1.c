#include <detpic32.h>

void send2displays(unsigned char value);
void delay(int ms);

int main(void) {
    // declare variables
    int counter = 0;
    int i
    // initialize ports
    LATB = LATB & 0x80FF;		
    LATD = LATD & 0xFF9F;	

    TRISB = TRISB & 0x80FF;     // RB8 a Rb14 saidas = 0
    TRISD = TRISD & 0xFF9F;     // Configure port as output

    while(1){
        i = 0;
        do {
            send2displays(counter)
            delay(1)// wait 1 ms
        } while(++i < 200);  // 200hz = 200 * 1ms 
        
        counter = (++counter) % 60; // increment counter (mod 60)

    }
    return 0;
    
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


void delay(int ms) {
    resetCoreTimer();
    while(readCoreTimer() < 20000 * ms);
}