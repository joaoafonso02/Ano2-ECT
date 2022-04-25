#include <detpic32.h>

int main(void) {
    LATD = (LATD & 0xFF9F);         // 1111 1111 1001 1111 
    LATB = (LATB & 0x80FF);         // 1000 0000 1111 1111 
    // configuring ports
    TRISD = (TRISD & 0xFF9F);       // - RB5 e RB6 outputs
    TRISB = (TRISB & 0x80FF);       // - RB8 a RB14 outputs
    // configuring display
    LATDbits.LATD5 = 1;             // RD5 = 1
    LATDbits.LATD6 = 0;             // RD6 = 0

    while(1) {
        char c = getChar();
        switch(c) {
            case 'a':
            case 'A':
                LATB = 0x0100;       // RD8 = 1
                break;
            case 'b':
            case 'B':
                LATB = 0x0200;       // RD9 = 1
                break;
            case 'c':
            case 'C':
                LATB = 0x0400;       // RD10 = 1
                break;
            case 'd':
            case 'D':
                LATB = 0x0800;        // RD11 = 1
                break;
            case 'e':
            case 'E':
                LATB = 0x1000;        // RD12 = 1
                break;
            case 'f':
            case 'F':
                LATB = 0x2000;        // RD13 = 1
                break;
            case 'g':
            case 'G':
                LATB = 0x4000;        // RD14 = 1
                break;
            default:
                break;
        }
    }

    return 0;

}