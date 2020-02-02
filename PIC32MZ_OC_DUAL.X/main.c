#include "main.h"
#include "common.h"
#include "uart.h"

#define T32_PR          99999UL //1000Hz, _XTAL_FREQ(200,000,000) / 2 / 1 / 1000 - 1
#define PWM_HIGH_START  ((T32_PR + 1) / 10 * 1)
#define PWM_HIGH_END    ((T32_PR + 1) / 10 * 4)

void OC1_Init(void);

void __ISR(_OUTPUT_COMPARE_1_VECTOR, IPL1AUTO) OC1_ISR(void) 
{   
    IFS0bits.OC1IF = 0;
}

void main(void) 
{
    sysInit();
    UART_Init();
    OC1_Init(); //output compare init
    printf("%s\r\n", "### PIC32MZ OC1 Dual Compare Demo ###");
    
    while (1);
}

void OC1_Init(void) {
    T2CONbits.ON = 0; //timer2 is disabled       
    T2CONbits.T32 = 1; //32-bit mode
    T2CONbits.TCKPS = 0; //1:1 prescaler
        
    OC1CONbits.ON = 0; //oc1 is disabled
    OC1CONbits.OC32 = 1; //32-bit timer
    OC1CONbits.OCTSEL = 0; //timer2 is clock source
    OC1CONbits.OCM = 5; //dual compare continous output
    
    RPG9R = 0b1100; //RG9, OC1
    
    TMR2 = 0; //clear time
    OC1R = PWM_HIGH_START; //set low to high count
    OC1RS = PWM_HIGH_END; //set high to low count
    PR2 = T32_PR; //set freq.
    
    IPC1bits.OC1IP = 1; //set priority
    IPC1bits.OC1IS = 0; //set sub-priority
    IFS0bits.OC1IF = 0; //clear flag
    IEC0bits.OC1IE = 1; //enable interrupt
    
    T2CONbits.ON = 1; //timer on
    OC1CONbits.ON = 1; //output compare on
}
