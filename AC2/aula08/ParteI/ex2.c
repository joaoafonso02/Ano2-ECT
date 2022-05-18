#include <detpic32.h>

int main(void){
    // Configure Timer T3 with interrupts enabled 
    EnableInterrupts();
    while(1);
    return 0;
}
void_int_(VECTOR)isr_T3(void) {//ReplaceVECTORbythetimerT3 // vector number
     
    putChar('.');
    // Reset T3 interrupt flag
    IEC0bits.T2IE = 1;
}
