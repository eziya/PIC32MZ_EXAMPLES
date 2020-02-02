/*******************************************************************************
  MPLAB Harmony Application Source File
  
  Company:
    Microchip Technology Inc.
  
  File Name:
    app.c

  Summary:
    This file contains the source code for the MPLAB Harmony application.

  Description:
    This file contains the source code for the MPLAB Harmony application.  It 
    implements the logic of the application's state machine and it may call 
    API routines of other MPLAB Harmony modules in the system, such as drivers,
    system services, and middleware.  However, it does not call any of the
    system interfaces (such as the "Initialize" and "Tasks" functions) of any of
    the modules in the system or make any assumptions about when those functions
    are called.  That is the responsibility of the configuration-specific system
    files.
 *******************************************************************************/

// DOM-IGNORE-BEGIN
/*******************************************************************************
Copyright (c) 2013-2014 released Microchip Technology Inc.  All rights reserved.

Microchip licenses to you the right to use, modify, copy and distribute
Software only when embedded on a Microchip microcontroller or digital signal
controller that is integrated into your product or third party product
(pursuant to the sublicense terms in the accompanying license agreement).

You should refer to the license agreement accompanying this Software for
additional information regarding your rights and obligations.

SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION, ANY WARRANTY OF
MERCHANTABILITY, TITLE, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR PURPOSE.
IN NO EVENT SHALL MICROCHIP OR ITS LICENSORS BE LIABLE OR OBLIGATED UNDER
CONTRACT, NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR
OTHER LEGAL EQUITABLE THEORY ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES
INCLUDING BUT NOT LIMITED TO ANY INCIDENTAL, SPECIAL, INDIRECT, PUNITIVE OR
CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, COST OF PROCUREMENT OF
SUBSTITUTE GOODS, TECHNOLOGY, SERVICES, OR ANY CLAIMS BY THIRD PARTIES
(INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF), OR OTHER SIMILAR COSTS.
 *******************************************************************************/
// DOM-IGNORE-END


// *****************************************************************************
// *****************************************************************************
// Section: Included Files 
// *****************************************************************************
// *****************************************************************************

#include "app.h"

// *****************************************************************************
// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
// *****************************************************************************

// *****************************************************************************
/* Application Data

  Summary:
    Holds application data

  Description:
    This structure holds the application's data.

  Remarks:
    This structure should be initialized by the APP_Initialize function.
    
    Application strings and buffers are be defined outside this structure.
*/
APP_DATA appData;

DRV_HANDLE hUart4; //uart4 handle
SYS_MODULE_OBJ mTMR32; //32bit timer
volatile bool tmr32Flag; //timer flag
volatile bool adcFlag; //adc flag
uint32_t adcVal; //adc value

// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************

/* TODO:  Add any necessary callback functions.
*/
static void APP_TMR32Callback( uintptr_t context, uint32_t currTick ) //TIM32 callback
{
    tmr32Flag = true;    
}

// *****************************************************************************
// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************
// *****************************************************************************


/* TODO:  Add any necessary local functions.
*/

/* UART Init */
void APP_UARTInit(void)
{
    hUart4 = DRV_USART_Open(DRV_USART_INDEX_0, DRV_IO_INTENT_READWRITE); //open rw    
    printf("PIC32MZ ADC Demo!!!\n");
}

/* using UART for stdout */
void _mon_putc (char c) 
{
    while (DRV_USART_TransferStatus(hUart4) & DRV_USART_TRANSFER_STATUS_TRANSMIT_FULL); // wait transmit buffer empty
    DRV_USART_WriteByte(hUart4, c); //send data
}

/* Timer Init */
static void APP_TimerInit(void)
{    
    mTMR32 = DRV_TMR_Open(DRV_TMR_INDEX_0, DRV_IO_INTENT_EXCLUSIVE); //oepn timer driver
            
    uint32_t desiredFreq = 2; //2Hz
    uint32_t actualFreq = DRV_TMR_CounterFrequencyGet(mTMR32);
    uint32_t divider = actualFreq / desiredFreq; //calculate divider
    
    DRV_TMR_AlarmRegister(mTMR32, divider, true, 0, APP_TMR32Callback); //register callback
    DRV_TMR_Start(mTMR32); //start timer
}

/* ADC Init */
static void APP_ADCInit(void)
{
    DRV_ADC0_Open(); //open driver
}

/* ADC Task */
static void APP_ADCTask(void)
{
    if(adcFlag)
    {        
        printf("ADC: %04u\n", adcVal); //print measured adc value
        
        adcVal = adcVal >> 10;           
        if(adcVal == 0b00) //display led based on measured value
        {
            LED1On();
            LED2Off();
            LED3Off();
            LED4Off();
        }
        else if(adcVal == 0b01)
        {
            LED1On();
            LED2On();
            LED3Off();
            LED4Off();
        }
        else if(adcVal == 0b10)
        {
            LED1On();
            LED2On();
            LED3On();
            LED4Off();
        }
        else
        {
            LED1On();
            LED2On();
            LED3On();
            LED4On();
        }
        
        adcFlag = false;
    }    
}

static void APP_TMR32Task(void)
{
    if(tmr32Flag)
    {        
        tmr32Flag = false;
        /* do something here */
    }
}

// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void APP_Initialize ( void )

  Remarks:
    See prototype in app.h.
 */

void APP_Initialize ( void )
{
    /* Place the App state machine in its initial state. */
    appData.state = APP_STATE_INIT;

    
    /* TODO: Initialize your application's state machine and other
     * parameters.
     */
}


/******************************************************************************
  Function:
    void APP_Tasks ( void )

  Remarks:
    See prototype in app.h.
 */

void APP_Tasks ( void )
{

    /* Check the application's current state. */
    switch ( appData.state )
    {
        /* Application's initial state. */
        case APP_STATE_INIT:
        {
            bool appInitialized = true;
       
        
            if (appInitialized)
            {
                APP_UARTInit();
                APP_ADCInit();
                APP_TimerInit();
            
                appData.state = APP_STATE_SERVICE_TASKS;
            }
            break;
        }

        case APP_STATE_SERVICE_TASKS:
        {            
            APP_ADCTask();
            APP_TMR32Task();
            
            break;
        }

        /* TODO: implement your application state machine.*/
        

        /* The default state should never be executed. */
        default:
        {
            /* TODO: Handle error in application's state machine. */
            break;
        }
    }
}

 

/*******************************************************************************
 End of File
 */
