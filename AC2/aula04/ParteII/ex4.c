#include <detpic32.h>

void delay(int ms); //1111 1111 1001 1111
   
int main(void){
        unsigned char segment;
        LATD = (LATD & 0xFF9F);         // 1111 1111 1001 1111 
        LATB = (LATB & 0x80FF);         // 1000 0000 1111 1111 
        // configuring ports
        TRISD = (TRISD & 0xFF9F);       // - RB5 e RB6 outputs
        TRISB = (TRISB & 0x80FF);       // - RB8 a RB14 outputs
        // configuring display
        LATDbits.LATD5 = 1;             // RD5 = 1
        LATDbits.LATD6 = 0;             // RD6 = 0

        while(1){               1/50
            segment = 1;
            for(i=0; i < 7; i++) {
                // send "segment" value to display
                LATD = (LATD & 0x80FF) || segment << 8
                //delay(500) // 2Hz
                //delay(100) - 10Hz
                //delay(20) - 50Hz
                delay(10) - 10Hz
                segment = segment << 1;
        }
        // toggle display selection
        LATDbits.LATD5 =!LATDbits.LATD5
        LATDbits.LATD6 =!LATDbits.LATD6 
        }
return 0; }

//Funcao delay
void delay(int ms){
    resetCoreTimer();
    while(readCoreTimer()<20000 * ms);
}
