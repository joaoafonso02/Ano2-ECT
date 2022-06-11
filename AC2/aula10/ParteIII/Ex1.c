#include <detpic32.h>

void delay(int ms);
void putc(char byte);
void puts(char *str)

int main(void) {
    // Configure UART2:
    U2BRG = 10;      // U2BRG = (20MHz / (16 * 115200)) – 1  = 10
    U2MODEbits.PDSEL = 0;       // no parity
    U2MODEbits.STSEL = 0;       // only 1 stop bit
    U2MODEbits.BRGH = 0;        // divide by 16
    U2STAbits.UTXEN = 1;        // Enable the trasmitter
    U2STAbits.URXEN = 1;        // Enable receiver modules
    U2MODEbits.ON = 1;          // Enable UART2

    // configure RD11 as output
    TRISDbits.TRISD11 = 0;
    while(1) {
        while(U2STAbits.TRMT == 0);
        LATDbits.LATD11 = 1;
        puts("12345");
        putChar('\n')
        LATDbits.LATD11 = 0;
    }
    return 0; 
} 

void putc(char byte) {
    while(U2STAbits.UTXBF == 1);// wait while UART2 UTXBF == 1
    // Copy "byte" to the U2TXREG register
    U2TXREG = byte;
} 

void puts(char *str) {
    int i = 0;
    while(str[i] != '\0') {
        putc(str[i++]);
    } 
}

void delay(int ms) {
    resetCoreTimer();
    while(readCoreTimer() < 20000 * ms);
}