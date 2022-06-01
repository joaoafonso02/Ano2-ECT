#include <detpic32.h>

int main(void) {
    // Configure UART2:
    // 1 - Configure BaudRate Generator
    U2BRG = 10;      // U2BRG = (20MHz / (16 * 115200)) – 1  = 10
    // 2 – Configure number of data bits, parity and number of stop bits
    U2MODEbits.PDSEL = 0;
    U2MODEbits.STSEL = 0;       // only 1 stop bit
    U2MODEbits.BRGH = 0;        // divide by 16
    // 3 – Enable the trasmitter and receiver modules (see register U2STA) --> procurar "STA", clicar no link e pesquisar o transmit e receiver enable bits
    U2STAbits.UTXEN = 1;        // Enable the trasmitter
    U2STAbits.URXEN = 1;        // Enable receiver modules
    // 4 – Enable UART2 (see register U2MODE)
    U2MODEbits.ON = 1;          // Enable UART2
} 

#include <detpic32.h>

void delay(int ms);
void putc(char byte);

int main(void) {
    // Configure UART2:
    U2BRG = 10;      // U2BRG = (20MHz / (16 * 115200)) – 1  = 10
    // 2 – Configure number of data bits, parity and number of stop bits --> procurar por parity
    U2MODEbits.PDSEL = 0;       // no parity
    U2MODEbits.STSEL = 0;       // only 1 stop bit
    U2MODEbits.BRGH = 0;        // divide by 16
    // 3 – Enable the trasmitter and receiver modules (see register U2STA) --> procurar "STA", clicar no link e pesquisar o transmit e receiver enable bits
    U2STAbits.UTXEN = 1;        // Enable the trasmitter
    U2STAbits.URXEN = 1;        // Enable receiver modules
    // 4 – Enable UART2 (see register U2MODE)
    U2MODEbits.ON = 1;          // Enable UART2

    while(1) {
        putc('+');
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