#include <detpic32.h>

void delay(int ms);

int main(void) {
    TRISEbits.TRISE0 = 1;   // RE0 out
    TRISEbits.TRISE8 = 0; // RD8 input

    while(1) {
        if(PORTDbits.PORTD8 == 1) {
            LATEbits.LATE0 = 1;
            delay(3000);
            LATEbits.LATE0 = 0;
        }
    }
}

void delay(int ms) {
    resetCoreTimer();
    while(readCoreTimer() < 20000*ms);
}