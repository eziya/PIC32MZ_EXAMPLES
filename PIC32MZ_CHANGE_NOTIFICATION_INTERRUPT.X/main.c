#include "main.h"
#include "common.h"
#include "uart.h"

volatile bool CNAIFlag = false;
volatile bool CNBIFlag = false;

void CNAI_Init(void);
void CNBI_Init(void);

//edge style ISR
void __ISR(_CHANGE_NOTICE_A_VECTOR, IPL7AUTO) CNAI_ISR(void) {
    CNAIFlag = true;    
    CNFAbits.CNFA15 = 0; //clear flag
    IFS3bits.CNAIF = 0; //clear flag    
}
//mismatch style ISR
void __ISR(_CHANGE_NOTICE_B_VECTOR, IPL6AUTO) CNBI_ISR(void) {
    PORTB; //read to clear interrupt     
    CNBIFlag = true;      
    IFS3bits.CNBIF = 0; //clear flag    
}

void main(void) {

    sysInit();

    TRISHbits.TRISH2 = 0; //LED output        

    UART_Init();
    printf("%s\r\n", "### PIC32MZ Change Notification Interrupt Demo ###");

    CNAI_Init();
    CNBI_Init();

    while (1) {

        if (CNAIFlag) {
            LATHbits.LATH2 = ~LATHbits.LATH2;
            printf("%s\r\n", "CNAI interrupt");
            CNAIFlag = false;
        }
        
        if (CNBIFlag) {
            LATHbits.LATH2 = ~LATHbits.LATH2;
            printf("%s\r\n", "CNBI interrupt");
            CNBIFlag = false;
        }
    }
}

void CNAI_Init(void) { //edge style
    //releated registers: CNPUx, CNPDx, CNCONx, CNENx, CNNEx, CNSTATx, CNFx
    
    __builtin_disable_interrupts(); //1.disable CPU interrupts
            
    TRISAbits.TRISA15 = 1; //2.set the desired CN I/O pin as an input    
    CNCONAbits.ON = 1; //3.enable CN module
    CNPUAbits.CNPUA15 = 1; //4.enable pull-up    
    IPC29bits.CNAIP = 7; //6.configure priority
    IPC29bits.CNAIS = 0; //6.configure sub-priority    
    CNFAbits.CNFA15 = 0; //7.clear flag
    IFS3bits.CNAIF = 0; //7.clear flag
    CNCONAbits.EDGEDETECT = 1; //8. configure edge style
    CNNEAbits.CNNEA15 = 1; //8. pa15, falling edge
    IEC3bits.CNAIE = 1; //9.enable CNAI
           
    __builtin_enable_interrupts(); //10.enable CPU interrupts
}

void CNBI_Init(void) { //mismatch style
    //releated registers: CNPUx, CNPDx, CNCONx, CNENx, CNNEx, CNSTATx, CNFx
    
    __builtin_disable_interrupts(); //1.
            
    TRISBbits.TRISB13 = 1; //2.set the desired CN I/O pin as an input    
    CNCONBbits.ON = 1; //3.enable CN module
    CNPUBbits.CNPUB13 = 1; //4.enable pull-up    
    PORTB; //5.
    IPC29bits.CNBIP = 6; //6.configure priority
    IPC29bits.CNBIS = 0; //6.configure sub-priority   
    CNFBbits.CNFB13 = 0; //7.clear flag
    IFS3bits.CNBIF = 0; //7.clear flag
    CNCONBbits.EDGEDETECT = 0; //8. configure edge style
    CNENBbits.CNIEB13 = 1; //8. pa15, falling edge
    IEC3bits.CNBIE = 1; //9.enable CNAI
    
    __builtin_enable_interrupts(); //10.enable CPU interrupts
}
