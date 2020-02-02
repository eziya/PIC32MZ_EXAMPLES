/* Reference: Programming 32-bit Microcontrollers in C: Exploring the PIC32 by Lucio Di Jasio */

#include "fft.h"

unsigned char inB[N_FFT];
float xr[N_FFT];
float xi[N_FFT];

volatile int inCount;
float wr[N_FFT / 2];
float wi[N_FFT / 2];
short rev[N_FFT / 2];
float ww[N_FFT];

void initFFT(void) {
    int i, m, t, k;
    float *wwp;

    for (i = 0; i < N_FFT / 2; i++) {
        wr[i] = cos(PI2N * i);
        wi[i] = sin(PI2N * i);

        t = i;
        m = 0;
        k = N_FFT - 1;
        while (k > 0) {
            m = (m << 1) + (t & 1);
            t = t >> 1;
            k = k >> 1;
        }
        rev[i] = m;
    }

    for (wwp = ww, i = 0; i < N_FFT; i++)
        *wwp++ = 0.5 - 0.5 * cos(PI2N * i);
}

void FFT(void) {
    int m, k, i, j;
    float a, b, c, d, wwr, wwi, pr, pi;

    m = N_FFT / 2;
    j = 0;
    while (m > 0) {
        k = 0;
        while (k < N_FFT) {
            for (i = 0; i < m; i++) {
                a = xr[i + k];
                b = xi[i + k];
                c = xr[i + k + m];
                d = xi[i + k + m];
                wwr = wr[i << j];
                wwi = wi[i << j];
                pr = a - c;
                pi = b - d;
                xr[i + k] = a + c;
                xi[i + k] = b + d;
                xr[i + k + m] = pr * wwr - pi * wwi;
                xi[i + k + m] = pr * wwi + pi * wwr;
            }
            k += m << 1;
        }
        m >>= 1;
        j++;
    }
}

void windowFFT(unsigned char *s) {
    int i;
    float *xrp, *xip, *wwp;

    xrp = xr;
    xip = xi;
    wwp = ww;
    for (i = 0; i < N_FFT; i++) {
        *xrp++ = (*s++ -128) * (*wwp++);
        *xip++ = 0;
    }
}

void powerScale(unsigned char *r) {
    int i, j;
    float t, max;
    float xrp, xip;

    max = 0;
    for (i = 0; i < N_FFT / 2; i++) {
        j = rev[i];
        xrp = xr[j];
        xip = xi[j];
        t = xrp * xrp + xip*xip;
        xr[j] = t;
        if (t > max) max = t;
    }

    max = 255.0 / max;
    for (i = 0; i < N_FFT / 2; i++) {
        t = xr[rev[i]] * max;
        *r++ = t;
    }
}