#include <detpic32.h>

volatile int duty = 0;
int round_div(int a,int b) { return (a + b / 2) / b; }

void setPWM(unsigned int dutyCycle){ 
  if(dutyCycle>100) return;
  OC3RS = (dutyCycle*(19999+1)/100); // Determine OC3RS as a function of "dutyCycle" 
  printf("%d", OC3RS);
}

void _int_(27) isr_adc(void) {
    setPWM((ADC1BUF0*33 + 511)/1023);
    IFS1bits.AD1IF = 0;
}

void _int_(4) isr_T1(void) {
    AD1CON1bits.ASAM = 1; // Start conversion 
    IFS0bits.T1IF = 0; 
}
int main(void) {
    // T1 - 1kHz
    T1CONbits.TCKPS = 0; //1:1
    PR1 = 19999;
    TMR1 = 0; // Reset timer T1 count register
    T1CONbits.TON = 1; 

    IPC1bits.T1IP = 2; // Interrupt priority (must be in range [1..6])
    IEC0bits.T1IE = 1; // Enable timer T2 interrupts
    IFS0bits.T1IF = 0; // Reset timer T2 interrupt flag 
    // OC3
    OC3CONbits.OCM = 6; // PWM mode on OCx; fault pin disabled
    OC3CONbits.OCTSEL =0;// Use timer T2 as the time base for PWM generation
    OC3CONbits.ON = 1; // Enable OC3 module
    // ADC
    TRISBbits.TRISB4 = 1; // RBx digital output disconnected
    AD1PCFGbits.PCFG4= 0; // RBx configured as analog input
    AD1CON1bits.SSRC = 7; // Conversion trigger selection bits: in this

    AD1CON1bits.CLRASAM = 1; // Stop conversions when the 1st A/D converter

    AD1CON3bits.SAMC = 16; // Sample time is 16 TAD (TAD = 100 ns)
    AD1CON2bits.SMPI = 8-1; // Interrupt is generated after XX samples

    AD1CHSbits.CH0SA = 4; 

    IPC6bits.AD1IP = 2; // configure priority of A/D interrupts
    IFS1bits.AD1IF = 0; // clear A/D interrupt flag
    IEC1bits.AD1IE = 1; // enable A/D interrupts

    EnableInterrupts();

    while(1) {
        AD1CON1bits.ON = 1; // Enable A/D converter
        resetCoreTimer();
        while(readCoreTimer()< (20000000/10));
    }
    return 0;
}