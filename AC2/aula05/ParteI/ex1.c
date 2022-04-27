void send2displays(unsigned char value) {
    display7Scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
            //            0     1     2     3    4     5     6      7    8      9    A     b      C     d    E     F
    // select display high
    LATD = (LATD & 0xFF9F) | 0x0040; // 1111 1111 1001 1111 (reset) || 0000 0000 0100 0000(select high)
    // send digit_high (dh) to display: dh = value >> 4
    unsigned dh = value >> 4;
    dh = display7Scodes[dh];
    LATB = (LATB & 0x80FF) | dh << 8;
    // select display low
    LATD = (LATD & 0xFF9F) | 0x0020; // 1111 1111 1001 1111 (reset) || 0000 0000 0010 0000(select low)
    // send digit_low (dl) to display: dl = value & 0x0F 
    unsigned dl = value & 0x0F;
    dl = display7Scodes[dl];
    LATB = (LATB & 0x80FF) | dl << 8;
}
