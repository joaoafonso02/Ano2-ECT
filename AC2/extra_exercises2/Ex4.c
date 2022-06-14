#include <detpic32.h>

volatile int dutyCicle = 10;
int round_div(int a,int b) { return (a + b / 2) / b; }

void send2displays(unsigned char value) { 
    static const char display7Scodes[] = {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67,0x77,0x7C,0x39,0x5E,0x79,0x71};
    
    static char flag = 0;

    if(value == 100) {
        LATB |= 0x0000;
        LATDbits.LAD14 = 1;
    } else {
        if(flag == 0){
            LATDbits.LATD5 = 1;
            LATDbits.LATD6 = 0;
            LATB = (LATB & 0x80FF) | ((display7Scodes[value % 10]) << 8);
        }else{
            LATDbits.LATD5 = 0;
            LATDbits.LATD6 = 1;
            LATB = (LATB & 0x80FF) | ((display7Scodes[value / 10]) << 8);
        }
        LATDbits.LAD14 = 0;
    }

    flag = flag ^ 1;
}

int main(void) {
    // T1 - 1kHz
    T1CONbits.TON = 0;
    T1CONbits.TCKPS = 0;  // 0,3 --> 1:1 --> 0000
    PR1 = round_div(20000000, (1000 * 1)) - 1;
    TMR1 = 0;
    IPC1bits.T1IP = 1; // prioridade da interrupção (1 a 6)
    IFS0bits.T1IF = 0; // limpar pedido de interrupção do temporizador x
    IEC0bits.T1IE = 1; // ativar pedidos de interrupção do temporizador x
    T1CONbits.TON = 1;
    // T5 - 100Hz
    T5CONbits.TON = 0;
    T5CONbits.TCKPS = 2;
    PR5 = round_div(20000000 , (100 * 4)) - 1;
    TMR5 = 0;
    IPC5bits.T5IP = 1; // prioridade da interrupção (1 a 6)
    IFS0bits.T5IF = 0; // limpar pedido de interrupção do temporizador x
    IEC0bits.T5IE = 1; // ativar pedidos de interrupção do temporizador x
    T5CONbits.TON = 1;
    // OC3
    OC3CONbits.OCM = 6;
    OC3CONbits.OCTSEL = 2 - 2; // 0=temporizador 2, 1=temporizador 3
    OC3RS = ((PR1 + 1) * dutyCicle + 50) / 100; // duty=duty cycle pretendido
    OC3CONbits.ON = 1;
    // OC5
    OC5CONbits.OCM = 6;
    OC5CONbits.OCTSEL = 2 - 2; // 0=temporizador 2, 1=temporizador 3
    OC5RS = ((PR1 + 1) * dutyCicle + 50) / 100; // duty=duty cycle pretendido
    OC5CONbits.ON = 1;
    // ADC
    TRISBbits.TRISB4 = 1; // configurar RB4 como entrada
    AD1PCFGbits.PCFG4= 0; // configurar AN4 como entrada analógica
    AD1CON1bits.SSRC = 7;
    AD1CON1bits.CLRASAM = 1;

    AD1CON3bits.SAMC = 16; // tempo de conversão: 16 TAD (1TAD = 100ns)
    AD1CON2bits.SMPI = 8 - 1; // N conversões
    AD1CHSbits.CH0SA = 4; // AN4
    AD1CON1bits.ON = 1; // ativar conversões A/D

    IPC6bits.AD1IP = 1; // prioridade da interrupção A/D (1 a 6)
    IFS1bits.AD1IF = 0; // limpar pedido de interrupção A/D
    IEC1bits.AD1IE = 1; // ativar pedidos de interrupção A/D

    EnableInterrupts(); // o MIPS aceita pedidos de interrupção

    while(1) {
        AD1CON1bits.ASAM = 1;
        resetCoreTimer();
        while(readCoreTimer() < 2000000); // 20000000/10
    }
    return 0;
}

void _int_(4) isr_timer_1(void) {
    IFS0bits.T1IF = 0; // limpar o pedido de interrupção
}

void _int_(27) isr_adc(void) {
    while( IFS1bits.AD1IF == 0 );
    int val = 4, i;
    for( i = 0; i < 8; i++) {
        val += (&ADC1BUF0)[4 * i];
    }
    val /= 8;
    dutyCicle = (val*100 + 511) / 1023;
    OC3RS = ((PR1 + 1) * dutyCicle + 50) / 100;

    IFS1bits.AD1IF = 0;
}

void _int_(20) isr_timer_5(void) {
    send2displays(dutyCicle);
    IFS0bits.T5IF = 0; // limpar pedido de interrupção do temporizador x
}
