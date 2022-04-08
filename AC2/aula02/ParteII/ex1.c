void delay(unsigned int ms);

int main(void) {

    int cnt1 = 0;
    int cnt5 = 0;
    int cnt10 = 0;
    while(1) {
        delay(100);

        putChar('\r');
        printInt(++cnt10, 0x0005000A);

        if(cnt10 % 2 == 0){
            cnt5++;
        }

        if(cnt10 % 10 == 0){
            cnt1++;
        }

        putChar(' ');
        printInt(cnt5, 0x0005000A);
        putChar(' ');
        printInt(cnt1, 0x0005000A);
    }
    return 0;
}


void delay(unsigned int ms){
   resetCoreTimer();
   while(readCoreTimer() < 20000);
}