#include <detpic32.h>

void delay(int ms);
void putc(char byte);
char getc(void)

int main(void) {
    // Configure UART2: (115200, N, 8, 1)
    U2BRG = 10;      // U2BRG = (20MHz / (16 * 115200)) – 1  = 10
    U2MODEbits.PDSEL = 0;       // no parity
    U2MODEbits.STSEL = 0;       // only 1 stop bit
    U2MODEbits.BRGH = 0;        // divide by 16
    U2STAbits.UTXEN = 1;        // Enable the trasmitter
    U2STAbits.URXEN = 1;        // Enable receiver modules
    U2MODEbits.ON = 1;          // Enable UART2

    while(1) {
        char c = getc();        // Read character using getc()
        putc(c);
        delay(1000);// wait 1 s
    }
    return 0; 
} 

void putc(char byte) {
    while(U2STAbits.UTXBF == 1);// wait while UART2 UTXBF == 1
    // Copy "byte" to the U2TXREG register
    U2TXREG = byte;
} 

void delay(int ms) {
    resetCoreTimer();
    while(readCoreTimer() < 20000 * ms);
}

char getc(void) {
    while (U2STAbits.URXDA == 0);
    return U2RXREG;
    // Return U2RXREG
}