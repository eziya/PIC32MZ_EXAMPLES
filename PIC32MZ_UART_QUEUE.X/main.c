#include "main.h"
#include "common.h"
#include "uart.h"
#include "ringbuffer.h"

extern ring_buffer_t ring_buffer; //ring buffer 
extern volatile uint8_t uart2Flag;

void main(void) {

    sysInit();
    
    ANSELA = 0; //disable analog input
    ANSELB = 0;
    ANSELC = 0;
    ANSELD = 0;
    ANSELE = 0;
    ANSELF = 0;
    ANSELG = 0;
    ANSELH = 0;
    ANSELJ = 0;

    TRISHbits.TRISH2 = 0; //LED output
                
    UART_Init();
    UART_EnableInterrupt();

    printf("%s\r\n", "### PIC32MZ UART Demo ###");

    while (1) {
        if (uart2Flag) {
            uart2Flag = 0; //clear flag
            static uint8_t data;
            while (ring_buffer_dequeue(&ring_buffer, (char*) &data) > 0) {
                UART_Putc(data); //dequeue data and transmit                
            }            
        }
    }
}

void _mon_putc(char c) {
    UART_Putc(c);
}
