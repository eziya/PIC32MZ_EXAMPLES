#include "main.h"

/* long loop num makes it counting slowly */
#define LOOP_NUM    25

/* From 0 to 9 */
const uint8_t SEG_NUMS[10] = {0xC0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x82, 0xF8, 0x80, 0x90};
/* P, L, A, Y */
const uint8_t SEG_CHARS[4] = {0x8C, 0xC7, 0x88, 0x91};

void performanceConfig(void)
{        
    uint32_t cp0;
    
    __asm__ volatile("di");
    
    // PRECON - Set up prefetch
    PRECONbits.PFMSECEN = 0; // Flash SEC Interrupt Enable (Do not generate an interrupt when the PFMSEC bit is set)
    PRECONbits.PREFEN = 0b11; // Predictive Prefetch Enable (Enable predictive prefetch for any address)
    PRECONbits.PFMWS = 0b010; // PFM Access Time Defined in Terms of SYSCLK Wait States (Two wait states)

    // Set up caching
    cp0 = _mfc0(16, 0);
    cp0 &= ~0x07;
    cp0 |= 0b011; // K0 = Cacheable, non-coherent, write-back, write allocate
    _mtc0(16, 0, cp0);
    
    __asm__ volatile("ei");
}

void main(void) {    
    /* disable analog input */
    ANSELJ = 0x0;
    
    /* RJ8~15 output for displaying segment */
    TRISJ = 0x00FF;
    
    /* RK0~3 Output for selecting segment */
    TRISK = 0xFFF0;    
    
    while (1) {
        /* Show 'PLAY' for 2 sec */
        for (int i = 0; i < 500; i++) {
            LATJ = (SEG_CHARS[0] << 8);
            LATK = (0x0001 << 0);
            __delay_ms(1);

            LATJ = (SEG_CHARS[1] << 8);
            LATK = (0x0001 << 1);
            __delay_ms(1);

            LATJ = (SEG_CHARS[2] << 8);
            LATK = (0x0001 << 2);
            __delay_ms(1);

            LATJ = (SEG_CHARS[3] << 8);
            LATK = (0x0001 << 3);
            __delay_ms(1);
        }

        /* Increase count from 0 to 9999 */
        for (int i = 0; i < 10000; i++) {
            for (int j = 0; j < LOOP_NUM; j++) {
                int val = i;

                LATJ = (SEG_NUMS[val % 10] << 8);
                LATK = (0x0001 << 3);
                __delay_ms(1);
                val = val / 10;

                LATJ = (SEG_NUMS[val % 10] << 8);
                LATK = (0x0001 << 2);
                __delay_ms(1);
                val = val / 10;

                LATJ = (SEG_NUMS[val % 10] << 8);
                LATK = (0x0001 << 1);
                __delay_ms(1);
                val = val / 10;

                LATJ = (SEG_NUMS[val % 10] << 8);
                LATK = (0x0001 << 0);
                __delay_ms(1);
            }
        }
    }
}
