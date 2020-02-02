#include "main.h"
#include "common.h"
#include "uart.h"

/* refer to DS60001344E example 22-1 & DS60001320F 28.1 active sequence */
volatile uint32_t adcVal[2];
volatile bool scanDone = false;
volatile uint32_t startTick, endTick, elapsed;

void initADC(void);

void __ISR(_ADC_DATA38_VECTOR, IPL1AUTO) ADC_DATA38_ISR(void) {
    if (ADCDSTAT2bits.ARDY38) {
        adcVal[0] = ADCDATA38;
    }
    IFS3bits.ADCD38IF = 0; //clear flag
}

void __ISR(_ADC_DATA39_VECTOR, IPL1AUTO) ADC_DATA39_ISR(void) {
    if (ADCDSTAT2bits.ARDY39) {
        adcVal[1] = ADCDATA39;
        scanDone = true;
    }
    IFS3bits.ADCD39IF = 0; //clear flag
}

void main(void) {
    sysInit();
    UART_Init();
    initADC();

    printf("%s\r\n", "### PIC32MZ ADC Multi Demo ###");

    startTick = getSysTick();

    while (1) {

        endTick = getSysTick();
        if (endTick >= startTick) {
            elapsed = endTick - startTick;
        } else {
            elapsed = (endTick + UINT32_MAX) - startTick;
        }

        if (elapsed >= 1000) //toggle every 50ms
        {
            startTick = endTick;
            /* trigger a conversion */
            ADCCON3bits.GSWTRG = 1;
        }

        if (scanDone) {
            printf("ADC[0]=%04lu, ADC[1]=%04lu\r\n", adcVal[0], adcVal[1]);
            scanDone = false;
        }
    };
}

void initADC(void) {

    /* enable analog input */
    ANSELHbits.ANSH0 = 1; //RH0, AN38
    ANSELHbits.ANSH1 = 1; //RH1, AN39

    /* ADC calibration registers */
    ADC0CFG = DEVADC0;
    ADC1CFG = DEVADC1;
    ADC2CFG = DEVADC2;
    ADC3CFG = DEVADC3;
    ADC4CFG = DEVADC4;
    ADC7CFG = DEVADC7;

    /* ADCCON1 control register */
    ADCCON1bits.ON = 0; //disable ADC
    ADCCON1bits.SELRES = 3; //shared resolution 12 bits
    ADCCON1bits.STRGSRC = 1; //software edge trigger
    ADCCON1bits.FSSCLKEN = 1; //use fast system clock
    ADCCON1bits.AICPMPEN = 0; //when vdd >= 2.5V, clear   
    CFGCONbits.IOANCPEN = 0; //when vdd >= 2.5V, clear

    /* ADCCON2 control register */
    ADCCON2 = 0;
    ADCCON2bits.SAMC = 1000; //shared ADC7 sampling time = 1000 * Tad = 20us
    ADCCON2bits.ADCDIV = 1; //shared ADC7 divider2, Tq / 2 = Tad = 50MHz = 0.02us

    /* ADCANCON: warm-up control register */
    ADCANCON = 0;
    ADCANCONbits.WKUPCLKCNT = 10; // 2^10 clocks

    /* ADCCON3: control register */
    ADCCON3 = 0;
    ADCCON3bits.ADCSEL = 1; //system clock, 200MHz = 0.005us
    ADCCON3bits.CONCLKDIV = 1; //divider2, Tq = 100MHz = 0.01us
    ADCCON3bits.VREFSEL = 0; // select AVdd and AVss as reference source

    /* ADCIMCON3 */
    ADCIMCON3bits.SIGN38 = 0; //unsigned format
    ADCIMCON3bits.DIFF38 = 0; //single ended
    ADCIMCON3bits.SIGN39 = 0; //unsigned format
    ADCIMCON3bits.DIFF39 = 0; //single ended

    /* ADCGIRQENx */
    ADCGIRQEN1 = 0;
    ADCGIRQEN2 = 0;
    ADCGIRQEN2bits.AGIEN38 = 1; //enable interrupt
    ADCGIRQEN2bits.AGIEN39 = 1; //enable interrupt

    /* interrupt related registers */
    IPC24bits.ADCD38IP = 1; //priority 1
    IPC24bits.ADCD38IS = 0; //sub-priority 0
    IPC24bits.ADCD39IP = 1; //priority 1
    IPC24bits.ADCD39IS = 0; //sub-priority 0
    IFS3bits.ADCD38IF = 0; //clear flag
    IFS3bits.ADCD39IF = 0; //clear flag
    IEC3bits.ADCD38IE = 1; //enable interrupt
    IEC3bits.ADCD39IE = 1; //enable interrupt

    /* ADCCSSx */
    ADCCSS1 = 0;
    ADCCSS2 = 0;
    ADCCSS2bits.CSS38 = 1; //AN38 scan
    ADCCSS2bits.CSS39 = 1; //AN39 scan

    /* early interrupt */
    ADCEIEN1 = 0; // no early interrupt
    ADCEIEN2 = 0;

    /* Turn the ADC on */
    ADCCON1bits.ON = 1;

    /* wait for voltage reference to be stable */
    while (!ADCCON2bits.BGVRRDY); //wait Vref ready
    while (ADCCON2bits.REFFLT); //wait Vref fault

    /* enable clock to analog circuit */
    ADCANCONbits.ANEN7 = 1; //enable the clock to analog bias

    /* wait for ADC to be ready */
    while (!ADCANCONbits.WKRDY7); //wait until ADC7 is ready

    /* enable the ADC module */
    ADCCON3bits.DIGEN7 = 1; //enable ADC7    
}
