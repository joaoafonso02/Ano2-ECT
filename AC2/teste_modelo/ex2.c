#include <detpic32.h>

void delay(int ms);
void send2Displays(unsigned char value);

int main(void) {
    TRISB = (TRISB & 0x80FF);
    TRISD = (TRISD & 0xFF9F);
    
    while(1) {
        int i = 0;
        char c = getChar();
        
        if(c >= '0' && c <= '3') {
            send2Displays((c & 0x02));
        } else {
            do{
                send2Displays(0xFF);
                delay(10);
                LATD  = (LATD & 0xFF9F);
            }while(++i < 100);
            printStr("SYUEEYYYY");
            
        }
    }
    return 0;
}

void delay(int ms) {
    resetCoreTimer();
    while(readCoreTimer() < 20000 * ms);
}

void send2Displays (unsigned char value) {

    const char display7codes[] = {0x3F, //0
                                    0x06, //1
                                    0x5B, //2
                                    0x4F, //3
                                    0x66, //4
                                    0x6D, //5
                                    0x7D, //6
                                    0x07, //7
                                    0x7F, //8
                                    0x6F, //9
                                    0x77, //A
                                    0x7C, //b
                                    0x39, //C
                                    0x5E, //d
                                    0x79, //E
                                    0x71  //F
                                    };
    static int displayFlag = 0;
    unsigned char dh = value >> 4;
    unsigned char dl = value & 0x0F;

    if (displayFlag == 0)
    {
        LATDbits.LATD6 = 1;
        LATDbits.LATD5 = 0;
        LATB = (LATB & 0x80FF) | display7codes[dh] << 8;
    } else {
        LATDbits.LATD6 = 0;
        LATDbits.LATD5 = 1;
        LATB = (LATB & 0x80FF) | display7codes[dl] << 8;
    }

    displayFlag = !displayFlag;
    
}