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

SYS_TMR_HANDLE hTimerClient1; //timer client
SYS_TMR_HANDLE hTimerClient2;
volatile bool tClient1Flag; //timer flag
volatile bool tClient2Flag;
volatile bool tClient1Run; //timer run flag
volatile bool tClient2Run;

// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************

/* TODO:  Add any necessary callback functions.
*/

static void APP_TimerClient1Callback( uintptr_t context, uint32_t currTick )
{
    tClient1Flag = true; //set flag    
}

static void APP_TimerClient2Callback( uintptr_t context, uint32_t currTick )
{
    tClient2Flag = true; //set flag    
}


// *****************************************************************************
// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************
// *****************************************************************************

/* TODO:  Add any necessary local functions.
*/

static void APP_TimerTask(void)
{
    if(tClient1Flag)
    {
        LED1Toggle(); //toggle led
        tClient1Flag = false;
    }
    
    if(tClient2Flag)
    {
        LED2Toggle(); //toggle led
        tClient2Flag = false;
    }
}

static void APP_TimerInit(void)
{
    hTimerClient1 = SYS_TMR_CallbackPeriodic(100, 0, APP_TimerClient1Callback); //set period
    tClient1Run = true;
    hTimerClient2 = SYS_TMR_CallbackPeriodic(500, 0, APP_TimerClient2Callback); //set period
    tClient2Run = true;    
}

static void APP_BtnTask(void)
{
    if(BTN1StateGet() == 1) //button pressed
    {
        if(tClient1Run) 
        {
            SYS_TMR_CallbackStop(hTimerClient1); //stop timer client1
            tClient1Run = false;
        }
    }
    else
    {
        if(!tClient1Run)
        {
            hTimerClient1 = SYS_TMR_CallbackPeriodic(100, 0, APP_TimerClient1Callback); //start timer client1
            tClient1Run = true;
        }
    }
        
    if(BTN2StateGet() == 1)
    {
        if(tClient2Run)
        {
            SYS_TMR_CallbackStop(hTimerClient2); //stop timer client2
            tClient2Run = false;
        }
    }
    else
    {
        if(!tClient2Run)
        {
            hTimerClient2 = SYS_TMR_CallbackPeriodic(500, 0, APP_TimerClient2Callback); //start timer client2
            tClient2Run = true;
        }
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
                APP_TimerInit(); //init periodic timer
                appData.state = APP_STATE_SERVICE_TASKS;
            }            
            
            break;
        }

        case APP_STATE_SERVICE_TASKS:
        {
            APP_TimerTask(); //handle timer task
            APP_BtnTask(); //handle button task
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
