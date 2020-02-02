#include "main.h"
#include "common.h"
#include "uart.h"

uint8_t ch;

void main(void) {
    
    configPerformance();
    
    ANSELA = 0;
    ANSELB = 0;
    ANSELC = 0;
    ANSELD = 0;
    ANSELE = 0;
    ANSELF = 0;
    ANSELG = 0;
    ANSELH = 0;    
    ANSELJ = 0;       
    
    TRISHbits.TRISH2 = 0; //LED output        
    
    UART_config();
    printf("%s\r\n","### PIC32MZ UART Demo ###");
    
    while (1) {
        ch = UART_getch();
        printf("%c",ch);        
        LATHbits.LATH2 = ~LATHbits.LATH2;        
    }
}

void _mon_putc (char c)
{
    UART_putch(c);
}
