#include <detpic32.h>

void delay(int ms);

int main(void) {

    //reset and configure
    
    TRISD = (TRISD & 0xFF9F);
    TRISB = (TRISB & 0x80FF) | 0x000F;  // reset and configuring inputs
    TRISE = (TRISE & 0xFFF0);
    
    int counter = 0;
    int freq = 2 * (1 + 0); // 0 como default
    while(1) {
        int k = inkey();
        
        if(k >= '0' && k <= '4') {
            freq = 2 * (1 + k);
        } else if(k == 13 ){ // enter
        }
        printf("\r%4d, %3d Hz", counter, freq);
    
        counter = (++counter) % 100;
        
        delay(1000/k);
    }
    return 0;
}


void delay(int ms) {
    resetCoreTimer();
    while(readCoreTimer() < 20000*ms);
}