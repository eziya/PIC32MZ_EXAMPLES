#include "main.h"
#include "common.h"
#include "uart.h"

#define T2_PR           15624UL //100Hz, _XTAL_FREQ(200,000,000) / 2 / 64 / 100 - 1
#define PWM_DUTY        75 //pwm duty (%)
#define PWM_HIGH_OCR    ((T2_PR + 1) * PWM_DUTY / 100)
#define PWM_LOW_OCR     (T2_PR - PWM_HIGH_OCR)

void OC1_Init(void);

void __ISR(_OUTPUT_COMPARE_1_VECTOR, IPL1AUTO) OC1_ISR(void) 
{       
    OC1CONbits.OCM = 0; //disable
    
    if(OC1R == PWM_HIGH_OCR)
    {        
        OC1CONbits.OCM = 1; //low to high
        OC1R = PWM_LOW_OCR;
    }
    else
    {        
        OC1CONbits.OCM = 2; //high to low
        OC1R = PWM_HIGH_OCR;        
    }    
    
    TMR2 = 0;
    IFS0bits.OC1IF = 0;
}

void main(void) 
{
    sysInit();
    UART_Init();
    OC1_Init(); //output compare init
    printf("%s\r\n", "### PIC32MZ OC1 Single Compare Demo ###");
    
    while (1);
}

void OC1_Init(void) {
    T2CONbits.ON = 0; //timer2 is disabled       
    T2CONbits.TCKPS = 6; //1:64 prescaler
    
    OC1CONbits.ON = 0; //oc1 is disabled
    OC1CONbits.OC32 = 0; //16-bit timer
    OC1CONbits.OCTSEL = 0; //timer 2 is clock source
    OC1CONbits.OCM = 2; //high to low
    
    RPG9R = 0b1100; //RG9, OC1
    
    TMR2 = 0; //clear time
    OC1R = PWM_HIGH_OCR; //set duty
    PR2 = T2_PR; //set freq.
    
    IPC1bits.OC1IP = 1; //set priority
    IPC1bits.OC1IS = 0; //set sub-priority
    IFS0bits.OC1IF = 0; //clear flag
    IEC0bits.OC1IE = 1; //enable interrupt
    
    T2CONbits.ON = 1; //timer on
    OC1CONbits.ON = 1; //output compare on
}
