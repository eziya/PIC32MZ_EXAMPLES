#include "main.h"

void main(void) {   
        
    ANSELB = 0; //disable analog input
    ANSELH = 0; //disable analog input

    TRISBbits.TRISB12 = 1; //RB2 intput
    TRISHbits.TRISH2 = 0; //RH2 output

    while (1) {        
        /* check button */
        if (PORTBbits.RB12 != 0) { 
            /* toggle LED */
            LATHbits.LATH2 = ~LATHbits.LATH2;
            __delay_ms(500);
        }
        else
        {
            /* turn on LED */
            LATHbits.LATH2 = 1;
        }
    }
}
