#include <detpic32.h>

void putc(char byte2send){
    while(U2STAbits.UTXB == 1);// wait while UTXBF == 1
    U2TXREG = byte2send;   // Copy byte2send to the UxTXREG register
} 

void putString(char *str) {
    int i = 0;
    while(*str != '\n') {
        putc(*str++)
    }
}

void configUART(void) {
    U2BRG = 1040; // (20 000 000 / (16 * 1200)) - 1
    U2MODE.BRGH = 0 // div 16

    U2MODE.PDSEL = 0 // 8bit, no parity
    U2MODE.STSEL = 0; // 1 stop bit

    U2STAbits.UTXEN = 1; // enable transmitter (ver nota abaixo)
    U2STAbits.URXEN = 1; // enable receiver
    U2MODEbits.ON = 1; // enable UART
    
    U2STAbits.UTXISEL = 0; // not necessary
}

int main(void) {
    configUART();
    while(1) {
        putString("RB30=\n");
        putc(PORTBbits.RB3); // nao sei oq por aqui, n há placa hj
        putc(PORTBbits.RB2);
        putc(PORTBbits.RB1);
        putc(PORTBbits.RB0);
        // 2 Hz
        resetCoreTimer();
        while(readCoreTimer() < (20000000 / 2)); 
    }
}