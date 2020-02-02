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
#include <stdio.h>

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
static const char *msg = "PIC32MZ Harmony External Interrupt Demo!!!";

// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************

/* TODO:  Add any necessary callback functions.
*/

// *****************************************************************************
// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************
// *****************************************************************************


/* TODO:  Add any necessary local functions.
*/
/* using UART for stdout */
void _mon_putc (char c)
{
    while (DRV_USART_TransferStatus(hUart4) & DRV_USART_TRANSFER_STATUS_TRANSMIT_FULL); // wait transmit buffer empty
    DRV_USART_WriteByte(hUart4, c); //send data
}

/* UART Init */
void UART_Init(void)
{
    hUart4 = DRV_USART_Open(DRV_USART_INDEX_0, DRV_IO_INTENT_READWRITE); //open rw    
    printf("%s\r\n", msg); //transmit message
}

/* delay ms */
void __delay_ms(uint32_t delay) {
    register uint32_t startCntms = _CP0_GET_COUNT();
    register uint32_t waitCntms = delay * (SYS_CLK_SystemFrequencyGet() / 1000 / 2); //core timer runs at half of system clock
    while (_CP0_GET_COUNT() - startCntms < waitCntms);
}

/* delay us */
void __delay_us(uint32_t delay) {
    register uint32_t startCnt = _CP0_GET_COUNT();
    register uint32_t waitCnt = delay * (SYS_CLK_SystemFrequencyGet() / 1000000 / 2); //core timer runs at half of system clock
    while (_CP0_GET_COUNT() - startCnt < waitCnt);
}

/* handle external interrupt */
void EXTI_Task(void)
{
    if(appData.exti0Flag)
    {
        LED1Toggle();
        printf("External Interrupt0!!!\r\n");
        appData.exti0Flag = false;
    }
    
    if(appData.exti1Flag)
    {
        LED2Toggle();
        printf("External Interrupt1!!!\r\n");
        appData.exti1Flag = false;
    }
    
    if(appData.exti2Flag)
    {
        LED3Toggle();
        printf("External Interrupt2!!!\r\n");
        appData.exti2Flag = false;
    }
    
    if(appData.exti3Flag)
    {
        LED4Toggle();
        printf("External Interrupt3!!!\r\n");
        appData.exti3Flag = false;
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
    UART_Init(); //initialze uart
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
                appData.state = APP_STATE_SERVICE_TASKS;
            }
            break;
        }

        case APP_STATE_SERVICE_TASKS:
        {
            EXTI_Task(); //handle external interrupt        
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
