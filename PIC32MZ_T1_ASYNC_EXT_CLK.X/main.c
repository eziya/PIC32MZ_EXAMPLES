#include "main.h"
#include "common.h"
#include "uart.h"

void T1_InitExtClk(void);

void __ISR(_TIMER_1_VECTOR, IPL7AUTO) T1_ISR(void) {    
    IFS0bits.T1IF = 0; //clear flag
}

void main(void) {

    sysInit();
        
    TRISHbits.TRISH2 = 0; //LED output        
    TRISBbits.TRISB12 = 1; //button input
        
    UART_Init();
    printf("%s\r\n", "### PIC32MZ T1 Async External Clock Demo ###");
        
    while (1) 
    {
        if(PORTBbits.RB12 == 0)
        {
            /* Sleep mode */
            T1_InitExtClk();
            __asm volatile ("wait"); //sleep            
        }
        else
        {            
            T1CONbits.ON = 0; //timer is disabled
            TMR1 = 0;
        }
        
         LATHbits.LATH2 = ~LATHbits.LATH2;
         __delay_ms(500);
    }
}


void T1_InitExtClk(void)
{
    T1CONbits.ON = 0; //timer is disabled
    T1CONbits.TCS = 1; //external source
    T1CONbits.TSYNC = 0; //async
    T1CONbits.TCKPS = 0; //1:1 prescaler    
    TMR1 = 0; //clear timer1    
    PR1 = _EXT_CLK_FREQ * 5  - 1; //PR1 = 4999, 5sec
    IPC1bits.T1IP = 7; //priority 7
    IPC1bits.T1IS = 3; //sub-priority 3
    IFS0bits.T1IF = 0; //clear flag
    IEC0bits.T1IE = 1; //enable interrupt        
    T1CONbits.ON = 1; //timer is enabled
}