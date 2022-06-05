Timers

Timer de 2hz, fout = 2Hz

- k_prescaler = 20 000 000 / (65535+1) * fout(neste caso 2Hz) ) = 152 (aproximando ao mais alto é 256)

- Kprescaler = 256 --> 1:256;

- PRx = (PBCLK / Kprescaler / fout) - 1

com pbclk = 20 000 000, Kprescaler = 256, fout = 2, vai dar 39061.
