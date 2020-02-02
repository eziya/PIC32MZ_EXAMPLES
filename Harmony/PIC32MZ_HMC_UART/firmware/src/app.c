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
#include "ringbuffer.h"

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
ring_buffer_t ringBuffer; //ring buffer
volatile bool rcvFlag; //CRLF flag

static const char *msg = "PIC32MZ Harmony UART Demo!!!";

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

/* UART receive event handler */
void APP_USARTReceiveEventHandler(const SYS_MODULE_INDEX index)
{
    static uint8_t rxByte;
    if (index != DRV_USART_INDEX_0) return; //return invalid module
    
    while (!DRV_USART_ReceiverBufferIsEmpty(hUart4)) {
        rxByte = DRV_USART_ReadByte(hUart4); //read data

        ring_buffer_queue(&ringBuffer, rxByte); //queue data
        
        if (rxByte == '\r' || rxByte == '\n') {
            rcvFlag = true; //if received data is CRLF, set flag
            break;
        }
    }
    
    LED1Toggle();
}

/* UART error event handler */
void APP_USARTErrorEventHandler(const SYS_MODULE_INDEX index)
{
    /* notify USART error */
    LED4On();
}

/* UART Init */
void UART_Init(void)
{
    hUart4 = DRV_USART_Open(DRV_USART_INDEX_0, DRV_IO_INTENT_READWRITE); //open rw
    DRV_USART_ByteReceiveCallbackSet(DRV_USART_INDEX_0, APP_USARTReceiveEventHandler); //register rx callback    
    DRV_USART_ByteErrorCallbackSet (DRV_USART_INDEX_0, APP_USARTErrorEventHandler); //register err callback
    printf("%s\r\n", msg); //transmit message
}

/* UART task */
void UART_Task(void)
{
    static uint8_t txByte;
    
    if (rcvFlag) {
        rcvFlag = false; //clear flag   
                
        while (ring_buffer_dequeue(&ringBuffer, (char*) &txByte) > 0) {
            while (DRV_USART_TransferStatus(hUart4) & DRV_USART_TRANSFER_STATUS_TRANSMIT_FULL); // wait transmit buffer empty
            DRV_USART_WriteByte(hUart4, txByte); //send data
        }
    }
}

/* using UART for stdout */
void _mon_putc (char c)
{
    while (DRV_USART_TransferStatus(hUart4) & DRV_USART_TRANSFER_STATUS_TRANSMIT_FULL); // wait transmit buffer empty
    DRV_USART_WriteByte(hUart4, c); //send data
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

void APP_Initialize(void)
{
    /* Place the App state machine in its initial state. */
    appData.state = APP_STATE_INIT;


    /* TODO: Initialize your application's state machine and other
     * parameters.
     */  
    UART_Init(); //initialize UART driver
}

/******************************************************************************
  Function:
    void APP_Tasks ( void )

  Remarks:
    See prototype in app.h.
 */

void APP_Tasks(void)
{

    /* Check the application's current state. */
    switch (appData.state) {
        /* Application's initial state. */
    case APP_STATE_INIT:
    {
        bool appInitialized = true;

        if (appInitialized) {
            appData.state = APP_STATE_SERVICE_TASKS;
        }
        break;
    }

    case APP_STATE_SERVICE_TASKS:
    {
        UART_Task();
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
