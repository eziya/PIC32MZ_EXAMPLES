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
#include "driver/tmr/drv_tmr_mapping.h"

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

SYS_MODULE_OBJ mTMR1; //16bit timer
SYS_MODULE_OBJ mTMR32; //32bit timer
volatile uint32_t tmr1Counter;
volatile uint32_t tmr32Counter;
volatile bool tmr1Flag; //timer flag
volatile bool tmr32Flag;
volatile bool tmr1Run; //timer run flag
volatile bool tmr32Run;

// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************

/* TODO:  Add any necessary callback functions.
*/

static void APP_TMR1Callback( uintptr_t context, uint32_t currTick ) //TIM1 callback (1kHz)
{
    tmr1Counter++;
    if(tmr1Counter >= 100) // 0.1 sec
    {
        tmr1Counter = 0;
        tmr1Flag = true;        
    }
}

static void APP_TMR32Callback( uintptr_t context, uint32_t currTick ) //TIM32 callback (10Hz)
{
    tmr32Counter++;
    if(tmr32Counter >= 10) // 1 sec
    {
        tmr32Counter = 0;
        tmr32Flag = true;        
    }    
}

// *****************************************************************************
// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************
// *****************************************************************************


/* TODO:  Add any necessary local functions.
*/

static void APP_TimerInit(void)
{
    mTMR1 = DRV_TMR_Open(DRV_TMR_INDEX_0, DRV_IO_INTENT_EXCLUSIVE); //open driver
    mTMR32 = DRV_TMR_Open(DRV_TMR_INDEX_1, DRV_IO_INTENT_EXCLUSIVE);
    
    volatile uint32_t desiredFreq = 1000; //1kHz
    volatile uint32_t actualFreq = DRV_TMR_CounterFrequencyGet(mTMR1);
    volatile uint32_t divider = actualFreq / desiredFreq;
    
    DRV_TMR_AlarmRegister(mTMR1, divider, true, 0, APP_TMR1Callback);
    
    desiredFreq = 10; //10Hz
    actualFreq = DRV_TMR_CounterFrequencyGet(mTMR32);
    divider = actualFreq / desiredFreq;
    
    DRV_TMR_AlarmRegister(mTMR32, divider, true, 0, APP_TMR32Callback);    
}

static void APP_TimerTask(void)
{
    if(tmr1Flag)
    {
        LED1Toggle(); //toggle led
        tmr1Flag = false;
    }
    
    if(tmr32Flag)
    {
        LED2Toggle(); //toggle led
        tmr32Flag = false;
    }
}

static void APP_BtnTask(void)
{
    if(BTN1StateGet() == 1) //button pressed
    {
        if(tmr1Run) 
        {
            DRV_TMR_Stop(mTMR1); //stop timer1
            tmr1Run = false;
        }
    }
    else
    {
        if(!tmr1Run)
        {
            DRV_TMR_Start(mTMR1); //start timer1
            tmr1Run = true;
        }
    }
        
    if(BTN2StateGet() == 1)
    {
        if(tmr32Run)
        {
            DRV_TMR_Stop(mTMR32); //stop timer32
            tmr32Run = false;
        }
    }
    else
    {
        if(!tmr32Run)
        {
            DRV_TMR_Start(mTMR32); //start timer32
            tmr32Run = true;
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
                APP_TimerInit();
                appData.state = APP_STATE_SERVICE_TASKS;
            }
            break;
        }

        case APP_STATE_SERVICE_TASKS:
        {
            APP_TimerTask();
            APP_BtnTask();                    
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
