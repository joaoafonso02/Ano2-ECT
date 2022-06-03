#include <detpic32.h>

// valor máximo de PRx = 2^16 - 1 = 65536

// T2CONbits.TCKPS = 5 ------> divisão por 32 1:32 prescaler em DECIMAL 
// ver manual PIC32MX Family Reference Manual Timers pág.10

int main(void) {
    // Configure Timer T3 (2 Hz with interrupts disabled)
    
    //k_prescaler = 20 000 000 / (65535+1) * fout(neste caso 2Hz) ) = 152 (aproximando ao mais alto é 256)
    T3CONbits.TCKPS = 7; // 1:k_prescaler;  fout_presc = 78125 = 20 000 000 / 256;
    PR3 = 39063;  // Fout = 20Mhz / (256 * (39063 + 1)) = 1,999Hz          
    TMR3 = 0;  // Reset timer T3 count register
    T3CONbits.TON = 1;  // Enable timer T3   
    while(1) {
        // Wait while T3IF = 0
        while(IFS0bits.T3IF != 1);
       // Reset T3IF
        IFS0bits.T3IF = 0;
        putChar('.');
    }
    return 0; 
}