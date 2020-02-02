#include "main.h"
#include "fft.h"

void main(void) {    
    
    configPerformance(); //enable prefetch
    
    /* fft example to measure performance */
    unsigned int i, t;
    double f;
    
    initFFT();
    
    /* init timer */
    T2CON = 0x0;
    T3CON = 0x0;
    TMR2 = 0;
    TMR3 = 0;
    
    PR2 = 0xFFFF;
    PR3 = 0xFFFF;
    
    T2CON = 0x8018;
           
    /* generate sin wave */
    for(i=0; i < N_FFT; i++)
    {
        f = sin(2 * PI2N * i);
        inB[i] = 128 + (unsigned char)(120.0 * f);
    }
    
    /* fft */
    windowFFT(inB);
    FFT();
    powerScale(inB);
    
    t = (unsigned int)(TMR3 << 16 | TMR2);
    
    while(1);    
}
