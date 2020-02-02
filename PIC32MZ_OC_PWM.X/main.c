#include "main.h"
#include "common.h"
#include "uart.h"

#define T32_PR          99999UL //1000Hz, _XTAL_FREQ(200,000,000) / 2 / 1 / 1000 - 1
#define PWM_DUTY        50
#define PWM_OC1RS       ((T32_PR + 1) * PWM_DUTY / 100)

void OC1_PWM_Init(void);

void __ISR(_TIMER_3_VECTOR, IPL1AUTO) T32_ISR(void) 
{   
    IFS0bits.T3IF = 0; //clear flag
}

void main(void) 
{
    sysInit();
    UART_Init();
    OC1_PWM_Init(); //output compare PWM init
    printf("%s\r\n", "### PIC32MZ OC1 PWM Demo ###");
    
    while (1);
}

void OC1_PWM_Init(void) {
    T2CONbits.ON = 0; //timer2 is disabled       
    T2CONbits.T32 = 1; //32-bit mode
    T2CONbits.TCKPS = 0; //1:1 prescaler
        
    OC1CONbits.ON = 0; //oc1 is disabled
    OC1CONbits.OC32 = 1; //32-bit timer
    OC1CONbits.OCTSEL = 0; //timer2 is clock source
    OC1CONbits.OCM = 7; //pwm mode with fault pin enabled
    
    RPG9R = 0b1100; //RG9, OC1
    OCFAR = 0b0011; //RD0, OCFA fault detection pin
    CNPUDbits.CNPUD0 = 1; //RD0 pull-up
    
    TMR2 = 0; //clear time
    OC1R = PWM_OC1RS; //set duty
    OC1RS = PWM_OC1RS; //set duty
    PR2 = T32_PR; //set freq.
    
    IPC3bits.T3IP = 1; //priority 1
    IPC3bits.T3IS = 0; //sub-priority 0
    IFS0bits.T3IF = 0; //clear flag
    IEC0bits.T3IE = 1; //enable interrupt
            
    T2CONbits.ON = 1; //timer on
    OC1CONbits.ON = 1; //output compare on
}
