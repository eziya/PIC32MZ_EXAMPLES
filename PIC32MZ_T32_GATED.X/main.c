#include "main.h"
#include "common.h"
#include "uart.h"

volatile uint32_t startTick, endTick, elapsed;
volatile bool t32flag = false;
void T32_InitGated(void);

void __ISR(_TIMER_3_VECTOR, IPL1AUTO) T32_ISR(void) {
    t32flag = true;
    IFS0bits.T3IF = 0; //clear flag
}

void main(void) 
{
    sysInit();

    TRISHbits.TRISH2 = 0; //LED output        
    
    UART_Init();
    printf("%s\r\n", "### PIC32MZ TMR2 External Clock Demo ###");
    
    T32_InitGated(); //32-bit timer32 initialization
    startTick = getSysTick();

    while (1) 
    {   
        endTick = getSysTick();
        
        if (endTick < startTick) 
        {
            if (endTick + UINT32_MAX - startTick >= 1000) 
            {
                startTick = endTick;
                LATHbits.LATH2 = ~LATHbits.LATH2;
                printf("TMR2: %u\r\n", TMR2);
            }            
        }
        else 
        {
            if (endTick - startTick >= 1000) 
            {
                startTick = endTick;
                LATHbits.LATH2 = ~LATHbits.LATH2;
                printf("TMR2: %u\r\n", TMR2);
            }
        }
        
        if (t32flag) 
        {            
            printf("falling edge detected\r\n");
            TMR2 = 0;
            t32flag = false;            
        }
    }
}

void T32_InitGated(void) {
    T2CONbits.ON = 0; //timer2 is disabled       
    T3CONbits.ON = 0; //timer3 is disabled
    
    T2CONbits.TCS = 0; //PBCLK clock source        
    T2CONbits.TCKPS = 7; //1:256 prescaler      
    T2CONbits.T32 = 1; //32-bit mode
    T2CONbits.TGATE = 1; //enable gated timer mode    
    
    T2CKR = 0b1101; //external clock pin PA14
    CNPDAbits.CNPDA14 = 1; //internal pull-down
    
    TMR2 = 0; //clear timer2    
    PR2 = 0xFFFFFFFF; //max value
    IPC3bits.T3IP = 1; //priority 1
    IPC3bits.T3IS = 0; //sub-priority 0
    IFS0bits.T3IF = 0; //clear flag
    IEC0bits.T3IE = 1; //enable interrupt   
    T2CONbits.ON = 1; //timer is enabled
}