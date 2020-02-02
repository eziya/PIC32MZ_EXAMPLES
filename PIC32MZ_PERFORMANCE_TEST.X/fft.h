/* Reference: Programming 32-bit Microcontrollers in C: Exploring the PIC32 by Lucio Di Jasio */

#ifndef FFT_H
#define	FFT_H

#include <math.h>

#define N_FFT 256
#define PI2N 2 * M_PI / N_FFT

extern unsigned char inB[];
extern volatile int inCount;

void initFFT(void);
void windowFFT(unsigned char *source);
void FFT(void);
void powerScale(unsigned char *dest);

#endif	/* FFT_H */

