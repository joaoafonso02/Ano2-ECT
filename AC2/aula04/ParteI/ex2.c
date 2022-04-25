#include <detpic32.h>

void delay(int ms)

int main(void) {
    LATE = (LATE & 0xFFF0);  // reset
    TRISE = (TRISE & 0xFFF0); // portos RE0 a RE3 outputs

    int counter = 0

    while(1){
        delay(250); // Wait 0.5s
        counter = (counter+1) & 0x000F;
    }
return 0;
}

//Funcao delay
void delay(int ms){
    resetCoreTimer();
    while(readCoreTimer()<20000 * ms);
}

