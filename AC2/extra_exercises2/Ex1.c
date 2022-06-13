#include <detpic32.h>

volatile int n = -1;

void refreshDisplays() {
	static const char display7Scodes[] = {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67,0x77,0x7C,0x39,0x5E,0x79,0x71};
    static char sel = 0;

    if( n<0 ) {
        LATDbits.LATD5 = 0;
        LATDbits.LATD6 = 0;
        return;
    }

    LATDbits.LATD5 = sel;
    LATDbits.LATD6 = sel^1;
    sel = sel^1;

    char c = 0 ? display7Scodes[n % 16] : display7Scodes[n / 16];

	LATB = (LATB & 0x80FF) | display7Scodes[ n ] << 8;
}

int main(void) {
    // configuration ports
    TRISB = (TRISB & 0x80FF);
    TRISD = (TRISD & 0xFF9F);
    TRISE = (TRISE & 0xFFF0);
    // T2
    T2CONbits.TCKPS = 2;    // 1:4
    PR2 = 49999;
    TMR2 = 0;
    T2CONbits.TON = 1;

    IPC2bits.T2IP = 2; // Interrupt priority (must be in range [1..6])
    IEC0bits.T2IE = 1; // Enable timer T2 interrupts
    IFS0bits.T2IF = 0; // Reset timer T2 interrupt flag 

    EnableInterrupts();

    while(1){ 
        int c = getChar() - '0';
        if(c >= 1 && c <= 3) {
            LATE = (LATE & 0xFFF0) | (0x0001 << c);
            n = c;
        } else {
            LATE = (LATE | 0x000F);
            n = 0xFF;
            resetCoreTimer();
            while(readCoreTimer() < 20000); // 1s
            LATE = (LATE & 0xFFF0);
        }
        
    }
}

void _int_(8) isr_T2(void) {
    send2displays()
    IFS0bits.T2IF = 0; // Reset timer T2 interrupt flag 
}
