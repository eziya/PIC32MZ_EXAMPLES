#include "uart.h"
#include "ringbuffer.h"

ring_buffer_t ring_buffer; //ring buffer 
volatile uint8_t uart2Flag;

//uart2 rx isr
void __ISR(_UART2_RX_VECTOR, IPL1SRS) UART2_RX_ISR(void)
{
    //enque received bytes
    while (U2STAbits.URXDA)
    {
        volatile uint8_t ch = U2RXREG;
        ring_buffer_queue(&ring_buffer, ch); //queue received uint8_t
        if (ch == '\r' || ch == '\n') 
        {
            uart2Flag = 1; //if received uint8_t is CRLF, set flag
            break;
        }
    }
    
    IFS4bits.U2RXIF = 0; //clear flag    
}

void UART_Init(void) {
            
    /* PPS remap tx, rx pins */
    U2RXR = 0x0C; //rx pin PC3
    RPC2R = 0x02; //tx pin PC2    
                
    U2BRG = (_XTAL_FREQ / 2 / 4 / BAUDRATE) - 1; // UxBRG(HIGH SPEED) = Fpb / 4 / Baudrate - 1
    
    U2MODEbits.BRGH = 1; //high speed mode
    U2MODEbits.PDSEL = 0; //8bit no parity
    U2MODEbits.STSEL = 0; //1 stop bit       
        
    U2STAbits.URXEN = 1; //enable receiver
    U2STAbits.UTXEN = 1; //enable transmitter           
        
    U2MODEbits.ON = 1; //enable
}

void UART_EnableInterrupt(void)
{
    ring_buffer_init(&ring_buffer); //initialize ring buffer
    
    /* enable uart2 rx interrupt*/    
    __builtin_disable_interrupts();        
    U2STAbits.URXISEL = 0; //interrupt when rx buffer is not empty
    IPC36bits.U2RXIP = 1; //priority 1 (1~7)
    IPC36bits.U2RXIS = 0; //sub-priority 0 (0~3)
    IFS4bits.U2RXIF = 0; //clear flag
    IEC4bits.U2RXIE =1; //enable uart2 rx interrupt    
    __builtin_enable_interrupts();
}

void UART_Putc(uint8_t ch) {
    while (U2STAbits.UTXBF); //wait buffer empty
    U2TXREG = ch; //transmit
}

void UART_Puts(char *str) {
    while (*str) {
        UART_Putc(*str);
        str++;
    }
}

uint8_t UART_Getc(void) {
    while (!U2STAbits.URXDA); //wait rx data available
    
    if(U2STAbits.OERR)
    {
        U2STAbits.OERR = 0; //clear overrun error manually
    }
    
    return U2RXREG;
}

void UART_Gets(char *str, uint16_t len) {
    int i;
    
    for (i = 0; i < len; i++) {
        str[i] = UART_Getc();
    }
}
