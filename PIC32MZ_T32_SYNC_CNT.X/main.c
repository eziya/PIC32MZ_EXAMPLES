#include "main.h"
#include "common.h"
#include "uart.h"

volatile uint32_t startTick, endTick, elapsed;
volatile bool t32flag = false;
void T32_Init(void);

void __ISR(_TIMER_3_VECTOR, IPL1AUTO) T32_ISR(void) {
    t32flag = true;
    IFS0bits.T3IF = 0; //clear flag
}

void main(void) {

    sysInit();

    TRISHbits.TRISH2 = 0; //LED output        
    
    UART_Init();
    printf("%s\r\n", "### PIC32MZ T32 SysTick Demo ###");
    
    T32_Init(); //32-bit timer32 initialization
    startTick = getSysTick();

    while (1) 
    {        
        if (t32flag) 
        {
            endTick = getSysTick();
            
            if (endTick >= startTick) 
            {
                elapsed = endTick - startTick;
            } 
            else 
            {
                elapsed = (endTick + UINT32_MAX) - startTick;
            }
            startTick = endTick;

            LATHbits.LATH2 = ~LATHbits.LATH2;
            printf("elapsed: %u ms\r\n", elapsed);

            t32flag = false;
        }
    }
}

void T32_Init(void) {
    T2CONbits.ON = 0; //timer2 is disabled
    T3CONbits.ON = 0; //timer3 is disabled

    T2CONbits.TCS = 0; //internal PBCLK source
    T2CONbits.TCKPS = 0; //1:1 prescaler    
    T2CONbits.T32 = 1; //32-bit mode

    TMR2 = 0; //clear timer2    
    PR2 = (_XTAL_FREQ / 2 / 1 / 1) - 1; //PR2 = 49999999, 1Hz Timer     
    IPC3bits.T3IP = 1; //priority 1
    IPC3bits.T3IS = 0; //sub-priority 0
    IFS0bits.T3IF = 0; //clear flag
    IEC0bits.T3IE = 1; //enable interrupt    
    T2CONbits.ON = 1; //timer is enabled
}