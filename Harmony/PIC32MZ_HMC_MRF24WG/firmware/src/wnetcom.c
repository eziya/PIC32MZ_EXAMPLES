/*******************************************************************************
  MPLAB Harmony Application Source File
  
  Company:
    Microchip Technology Inc.
  
  File Name:
    wnetcom.c

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

#include "wnetcom.h"

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

WNETCOM_DATA wnetcomData;
static char wnetcomMsgToClient[] = "Hello Client!\n\r";
static uint8_t wnetcomMsgFromClient[80];

static TCPIP_NET_HANDLE wnetcom_netH;
static SYS_STATUS wnetcom_tcpipStat;
static int wnetcom_nNets;

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

/******************************************************************************
  Function:
    static void TCP_Server_TXRX_Task (void)
    
   Remarks:
    Feeds the USB write function. 
 */
static void TCP_Server_TXRX_Task(void)
{
    static IPV4_ADDR dwLastIP[2] = {
        {-1},
        {-1}
    };
    static IPV4_ADDR ipAddr;
    int i;

    switch (wnetcomData.txrxTaskState)
    {
    case WNETCOM_TCPIP_WAIT_FOR_IP:
    {        
        // Check if the IP address of an interface has changed
        wnetcom_nNets = TCPIP_STACK_NumberOfNetworksGet();
        for (i = 0; i < wnetcom_nNets; i++)
        {
            wnetcom_netH = TCPIP_STACK_IndexToNet(i);
            ipAddr.Val = TCPIP_STACK_NetAddress(wnetcom_netH);
            if (dwLastIP[i].Val != ipAddr.Val)
            {
                dwLastIP[i].Val = ipAddr.Val;
                SYS_CONSOLE_PRINT("TCP_TXRX[%d]: IP Address: ", wnetcomData.txrxTaskState);
                SYS_CONSOLE_PRINT("%d.%d.%d.%d \r\n", ipAddr.v[0], ipAddr.v[1],
                                  ipAddr.v[2], ipAddr.v[3]);
                if (ipAddr.v[0] != 0 && ipAddr.v[0] != 169) // Wait for a Valid IP
                {
                    wnetcomData. txrxTaskState = WNETCOM_TCPIP_OPENING_SERVER;
                }
            }
        }
    }
        break;
    case WNETCOM_TCPIP_OPENING_SERVER:
    {
        wnetcomData.socket = TCPIP_TCP_ServerOpen(IP_ADDRESS_TYPE_IPV4, wnetcomData.port, 0);
        if (wnetcomData.socket == INVALID_SOCKET)
        {
            SYS_CONSOLE_PRINT("TCP_TXRX[%d]: Couldn't open server socket\r\n", wnetcomData.txrxTaskState);
            break;
        }
        SYS_CONSOLE_PRINT("TCP_TXRX[%d]: Waiting for Client Connection on port: %d\r\n",
                          wnetcomData.txrxTaskState, wnetcomData.port);
        wnetcomData.txrxTaskState = WNETCOM_TCPIP_WAIT_FOR_CONNECTION;
        ;
    }
        break;

    case WNETCOM_TCPIP_WAIT_FOR_CONNECTION:
    {
        if (!TCPIP_TCP_IsConnected(wnetcomData.socket))
        {
            break;
        }
        else
        {
            // We got a connection
            TCPIP_TCP_ArrayPut(wnetcomData.socket, wnetcomMsgToClient, sizeof (wnetcomMsgToClient));
            SYS_CONSOLE_MESSAGE("WNETCOM: Received a connection\r\n");
            wnetcomData.txrxTaskState = WNETCOM_TCPIP_WAIT_FOR_RESPONSE;
        }
    }
        break;

    case WNETCOM_TCPIP_WAIT_FOR_RESPONSE:
    {
        int i;
        
        if (!TCPIP_TCP_IsConnected(wnetcomData.socket))
        {
            SYS_CONSOLE_PRINT("TCP_TXRX[%d]: Connection closed/lost\r\n", wnetcomData.txrxTaskState);
            SYS_CONSOLE_PRINT("TCP_TXRX[%d]: Waiting for Client Connection on port: %d\r\n",
                              wnetcomData.txrxTaskState, wnetcomData.port);
            wnetcomData.txrxTaskState = WNETCOM_TCPIP_WAIT_FOR_CONNECTION;
            break;
        }
        if (TCPIP_TCP_GetIsReady(wnetcomData.socket))
        {
            TCPIP_TCP_ArrayGet(wnetcomData.socket, wnetcomMsgFromClient, sizeof (wnetcomMsgFromClient) - 1);
            SYS_CONSOLE_PRINT("TCP_TXRX[%d]: Client sent: %s\r\n",
                              wnetcomData.txrxTaskState, wnetcomMsgFromClient);
            
            for(i = 0; wnetcomMsgFromClient[i]; i++)
            {
                wnetcomMsgFromClient[i] = tolower(wnetcomMsgFromClient[i]);
            }
            
            if (strncmp((char*) wnetcomMsgFromClient, (const char *) "toggle d", 8) == 0)
            {
                if (wnetcomMsgFromClient[8] == '1')
                {
                    LED1Toggle();                    
                }
                else if (wnetcomMsgFromClient[8] == '2')
                {
                    LED2Toggle();                    
                }
                else if (wnetcomMsgFromClient[8] == '3')
                {
                    LED3Toggle();                    
                }                
                else
                {
                    LED4Toggle();                    
                }                
                
                SYS_CONSOLE_PRINT("TCP_TXRX[%d]: LED D%c is toggled\r\n",
                                      wnetcomData.txrxTaskState, wnetcomMsgFromClient[8]);
            }
        }
    }
        break;

        /* The default state should never be executed. */
    default:
    {
        /* TODO: Handle error in application's state machine. */
        break;
    }
    }
}

/* TODO:  Add any necessary local functions.
 */


// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void WNETCOM_Initialize ( void )

  Remarks:
    See prototype in wnetcom.h.
 */

void WNETCOM_Initialize(void)
{
    /* Place the App state machine in its initial state. */
    wnetcomData.state = WNETCOM_STATE_INIT;

	wnetcomData.port = 22;

    /* TODO: Initialize your application's state machine and other
     * parameters.
     */
}

/******************************************************************************
  Function:
    void WNETCOM_Tasks ( void )

  Remarks:
    See prototype in wnetcom.h.
 */

void WNETCOM_Tasks(void)
{
    int i;

    /* Check the application's current state. */
    switch (wnetcomData.state)
    {
        /* Application's initial state. */
    case WNETCOM_STATE_INIT:
    {
        bool appInitialized = false;

        wnetcom_tcpipStat = TCPIP_STACK_Status(sysObj.tcpip);
        if (wnetcom_tcpipStat < 0)
        { // some error occurred
            SYS_CONSOLE_PRINT("WNETCOM[%d]: TCP/IP stack initialization failed!\r\n", wnetcomData.state);
            wnetcomData.state = WNETCOM_STATE_ERROR;
            appInitialized = false;
        }
        else if (wnetcom_tcpipStat == SYS_STATUS_READY)
        {
            // now that the stack is ready we can check the
            // available interfaces
            wnetcom_nNets = TCPIP_STACK_NumberOfNetworksGet();
            for (i = 0; i < wnetcom_nNets; i++)
            {
                wnetcom_netH = TCPIP_STACK_IndexToNet(i);
            }
            appInitialized = true;
            SYS_CONSOLE_PRINT("WNETCOM[%d]: TCP/IP stack initialized!\r\n", wnetcomData.state);
            wnetcomData.txrxTaskState = WNETCOM_TCPIP_WAIT_FOR_IP;
        }

        if (appInitialized)
        {
            SYS_CONSOLE_PRINT("WNETCOM[%d]: Application initialized!\r\n", wnetcomData.state);
            wnetcomData.state = WNETCOM_STATE_SERVICE_TASKS;
        }
        break;
    }

    case WNETCOM_STATE_SERVICE_TASKS:
    {
        TCP_Server_TXRX_Task();

        break;
    }

        /* TODO: implement your application state machine.*/

    case WNETCOM_STATE_ERROR:
    {
        break;
    }

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
