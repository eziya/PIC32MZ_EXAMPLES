#include "main.h"
#include "common.h"
#include "uart.h"

volatile uint32_t startTick, endTick, elapsed;

void main(void) {

    sysInit();
        
    TRISHbits.TRISH2 = 0; //LED output        
    TRISAbits.TRISA15 = 0; // output to measure frequency

    UART_Init();
    printf("%s\r\n", "### PIC32MZ T1 SysTick Demo ###");
    
    startTick = getSysTick();
    
    while (1) {        
               
        endTick = getSysTick();
        if(endTick >= startTick)
        {
            elapsed = endTick - startTick;            
        }
        else
        {
            elapsed = (endTick + UINT32_MAX) - startTick;
        } 
        
        if(elapsed >= 50) //toggle every 50ms
        {
            startTick = endTick;
            LATHbits.LATH2 = ~LATHbits.LATH2;
            LATAbits.LATA15 = ~LATAbits.LATA15; 
        }
    }
}
