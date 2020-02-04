/*******************************************************************************
  MPLAB Harmony Application Source File
  
  Company:
    Microchip Technology Inc.
  
  File Name:
    net.c

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

#include "net.h"
#include "sensor.h"

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
extern SENSOR_DATA sensorData;

NET_DATA netData;
static char netServerIP[] = "52.204.41.253";

static SYS_STATUS net_tcpipStat;
static TCPIP_NET_HANDLE net_netH;
static int net_nNets;

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
    static void TCP_Client_TX_Task (void)
    
   Remarks:
    Feeds the USB write function. 
 */
static void TCP_Client_TX_Task(void)
{
    static IPV4_ADDR dwLastIP[2] = {
        {-1},
        {-1}
    };

    static IPV4_ADDR ipAddr;
    int i;

    switch (netData.txTaskState)
    {
    case NET_TCPIP_WAIT_FOR_IP:
    {
        net_nNets = TCPIP_STACK_NumberOfNetworksGet();

        for (i = 0; i < net_nNets; i++)
        {
            net_netH = TCPIP_STACK_IndexToNet(i);
            ipAddr.Val = TCPIP_STACK_NetAddress(net_netH);

            if (dwLastIP[i].Val != ipAddr.Val)
            {
                dwLastIP[i].Val = ipAddr.Val;

                SYS_CONSOLE_PRINT("NET[%d]: IP Address: ", netData.txTaskState);
                SYS_CONSOLE_PRINT("%d.%d.%d.%d \r\n", ipAddr.v[0], ipAddr.v[1], ipAddr.v[2], ipAddr.v[3]);
            }

            if (TCPIP_STACK_NetIsReady(net_netH))
            {
                netData.txTaskState = NET_TCPIP_WAITING_FOR_COMMAND;
                SYS_CONSOLE_PRINT("NET[%d]: TCPIP_STACK_NetIsReady.\r\n", netData.txTaskState);
            }
        }
    }
        break;
    case NET_TCPIP_WAITING_FOR_COMMAND:
    {
        IPV4_ADDR addr;

        TCPIP_Helper_StringToIPAddress(netServerIP, &addr);
        netData.socket = TCPIP_TCP_ClientOpen(IP_ADDRESS_TYPE_IPV4, netData.port,
                                              (IP_MULTI_ADDRESS*) & addr);

        if (netData.socket == INVALID_SOCKET)
        {
            netData.txTaskState = NET_TCPIP_WAITING_FOR_COMMAND;
            SYS_CONSOLE_PRINT("NET[%d]: TCPIP_TCP_ClientOpen returns INVALID_SOCKET.\r\n", netData.txTaskState);
            break;
        }

        netData.txTaskState = NET_TCPIP_WAIT_FOR_CONNECTION;
    }
        break;
    case NET_TCPIP_WAIT_FOR_CONNECTION:
    {
        static char buffer[256];
        static uint16_t nWrite, nWritten;

        if (!TCPIP_TCP_IsConnected(netData.socket))
        {
            break;
        }

        if (TCPIP_TCP_PutIsReady(netData.socket) == 0)
        {
            break;
        }

        SYS_CONSOLE_PRINT("NET[%d]: TCPIP Client connected.\r\n", netData.txTaskState);

        sprintf(buffer, "GET /update?api_key=HFHWS8TT31XGVHTM&field1=%3.1f&field2=%3.1f&field3=%4.1f\r\n\r\n",
                sensorData.temperature, sensorData.humidity, sensorData.pressure);
        nWrite = strlen(buffer);
        SYS_CONSOLE_PRINT("NET[%d]:\r\n%s\r\n", netData.txTaskState, buffer);

        nWritten = TCPIP_TCP_ArrayPut(netData.socket, (uint8_t*) buffer, nWrite);
        if (nWritten != nWrite)
        {
            SYS_CONSOLE_PRINT("NET[%d]: TCPIP_TCP_ArrayPut failed.\r\n", netData.txTaskState);
        }

        netData.txTaskState = NET_TCPIP_TX_DONE;
    }
        break;
    case NET_TCPIP_TX_DONE:
    {
        netData.txTaskState = NET_TCPIP_WAITING_FOR_COMMAND;
        vTaskDelay(10000 / portTICK_PERIOD_MS);
    }
        break;

        /* The default state should never be executed. */
    default:
    {
        /* TODO: Handle error in application's state machine. */
    }
        break;
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
    void NET_Initialize ( void )

  Remarks:
    See prototype in net.h.
 */

void NET_Initialize(void)
{
    /* Place the App state machine in its initial state. */
    netData.state = NET_STATE_INIT;
    netData.port = 80;

    /* TODO: Initialize your application's state machine and other
     * parameters.
     */
}

/******************************************************************************
  Function:
    void NET_Tasks ( void )

  Remarks:
    See prototype in net.h.
 */

void NET_Tasks(void)
{
    int i;

    /* Check the application's current state. */
    switch (netData.state)
    {
        /* Application's initial state. */
    case NET_STATE_INIT:
    {
        bool appInitialized = false;

        net_tcpipStat = TCPIP_STACK_Status(sysObj.tcpip);
        if (net_tcpipStat < 0)
        { // some error occurred
            SYS_CONSOLE_PRINT("NET[%d]: TCP/IP stack initialization failed!\r\n", netData.state);
            netData.state = NET_STATE_ERROR;
            appInitialized = false;
        }
        else if (net_tcpipStat == SYS_STATUS_READY)
        {
            // now that the stack is ready we can check the
            // available interfaces
            net_nNets = TCPIP_STACK_NumberOfNetworksGet();
            for (i = 0; i < net_nNets; i++)
            {
                net_netH = TCPIP_STACK_IndexToNet(i);
            }

            appInitialized = true;
            SYS_CONSOLE_PRINT("NET[%d]: TCP/IP stack initialized!\r\n", netData.state);

            netData.txTaskState = NET_TCPIP_WAIT_FOR_IP;
        }

        if (appInitialized)
        {
            SYS_CONSOLE_PRINT("NET[%d]: Application initialized!\r\n", netData.state);
            netData.state = NET_STATE_SERVICE_TASKS;
        }
        break;
    }

    case NET_STATE_SERVICE_TASKS:
    {
        TCP_Client_TX_Task();

        break;
    }

        /* TODO: implement your application state machine.*/

    case NET_STATE_ERROR:
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
