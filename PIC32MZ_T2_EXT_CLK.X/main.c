#include "main.h"
#include "common.h"
#include "uart.h"

#define _EXT_CLK_FREQ 1000

volatile uint32_t startTick, endTick, elapsed;
volatile bool t2flag = false;
void T2_InitExtClk(void);

void __ISR(_TIMER_2_VECTOR, IPL1AUTO) T2_ISR(void) {
    t2flag = true;
    IFS0bits.T2IF = 0; //clear flag
}

void main(void) 
{
    sysInit();

    TRISHbits.TRISH2 = 0; //LED output        
    
    UART_Init();
    printf("%s\r\n", "### PIC32MZ T2 External Clock Demo ###");
    
    T2_InitExtClk(); //32-bit timer23 initialization
    startTick = getSysTick();

    while (1) 
    {        
        if (t2flag) 
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

            t2flag = false;
        }
    }
}

void T2_InitExtClk(void) {
    T2CONbits.ON = 0; //timer2 is disabled       
    
    T2CONbits.TCS = 1; //external clock source
    T2CONbits.TCKPS = 0; //1:1 prescaler  
    
    T2CKR = 0b1101; //external clock pin PA14
    
    TMR2 = 0; //clear timer2    
    PR2 = (_EXT_CLK_FREQ / 1 / 1) - 1; //PR2 = 999, 1Hz Timer     
    IPC2bits.T2IP = 1; //priority 1
    IPC2bits.T2IS = 0; //sub-priority 0
    IFS0bits.T2IF = 0; //clear flag
    IEC0bits.T2IE = 1; //enable interrupt    
    T2CONbits.ON = 1; //timer is enabled
}