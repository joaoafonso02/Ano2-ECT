#include <detpic32.h>

void _int_(VECTOR) isr_adc(void);

int main(void) {
    TRISBbits.TRISB4 = 1;       // RB4 digital output disconnected
    AD1PCFGbits.PCFG4 = 0;      // RB4 configured as analog input (AN4)
    AD1CON1bits.SSRC = 7;       // Conversion trigger constant
    AD1CON1bits.CLRASAM = 1;    // Stop conversion when the 1st A/D converter intetupr is generated.
                              
    AD1CON3bits.SAMC = 16;      // Sample time is 16 TAD (TAD = 100ns)
    AD1CON2bits.SMPI = 0;       // Interrupt is generated after 1 sample
    AD1CHSbits.CH0SA = 4;       // analog channel input 4
    AD1CON1bits.ON = 1;         // Enable the A/d configuration sequence

    IPC6bits.AD1IP = 2;         // configure priority of A/D interrupts
    IFS1bits.AD1IF = 0;         // clear A/D interrupt flag
    IEC1bits.AD1IE = 1;         // enable A/D interrupts
    // Configure interrupt system
    EnableInterrupts(); // Global Interrupt Enable

    // Start A/D conversion
    while(1) {}
    return 0; 
}

// Interrupt Handler
void _int_(27) isr_adc(void) {   // Replace VECTOR by the A/D vector
                                    // number - see "PIC32 family data
                                    // sheet" (pages 74-76)

    // Read conversion result (ADC1BUF0) and print it
    print(ADC1BUF0, 10 | 3 << 16)
    // Start A/D conversion
    AD1CON1bits.ASAM = 1; 
    // Reset AD1IF flag
    IFS1bits.AD1IF = 0; 
} 