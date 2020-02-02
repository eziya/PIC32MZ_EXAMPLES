#include "main.h"
#include "common.h"
#include "uart.h"

volatile bool exti1Flag = false;

void EXTI_Init(void);

void __ISR(_EXTERNAL_4_VECTOR, IPL7AUTO) EXTI4_ISR(void) {
    if (PORTAbits.RA15 == 0) {
        __delay_ms(50); //not optimized debounce 

        if (PORTAbits.RA15 == 0) {
            exti1Flag = true;
        }
    }

    IFS0bits.INT4IF = 0; //clear flag
}

void main(void) {

    sysInit();

    TRISHbits.TRISH2 = 0; //LED output        

    UART_Init();
    printf("%s\r\n", "### PIC32MZ External Interrupt Demo ###");

    EXTI_Init();

    while (1) {

        if (exti1Flag) {
            LATHbits.LATH2 = ~LATHbits.LATH2;
            printf("%s\r\n", "INT1 interrupt");
            exti1Flag = false;
        }
    }
}

void EXTI_Init(void) {
    __builtin_disable_interrupts();

    INT4R = 0b1101; //pps PA15    
    INTCONbits.INT4EP = 0; //falling edge
    IPC5bits.INT4IP = 7; //priority 7
    IPC5bits.INT4IS = 0; //sub-priority 0
    IFS0bits.INT4IF = 0; //clear flag
    IEC0bits.INT4IE = 1; //enable    

    __builtin_enable_interrupts();
}
