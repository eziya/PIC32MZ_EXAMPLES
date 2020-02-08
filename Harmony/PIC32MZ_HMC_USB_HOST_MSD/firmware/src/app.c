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

static char *msg = 
    "MPLAB Harmony provides system service libraries to support common functionality and manage resources that are shared by multiple drivers, libraries, and other modules.\r\n"
    "A system service encapsulates code that manages a shared resource or implements a common capability in a single location so that it does not"
    "need to be replicated by individual drivers and libraries.\r\n";

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

USB_HOST_EVENT_RESPONSE USB_HostEventHandler (USB_HOST_EVENT event, void * eventData, uintptr_t context)
{
    SYS_CONSOLE_PRINT("USB_HostEventHandler called.\r\n");
    
    switch (event)
    {
        case USB_HOST_EVENT_DEVICE_UNSUPPORTED:            
        case USB_HOST_EVENT_DEVICE_REJECTED_INSUFFICIENT_POWER:
        case USB_HOST_EVENT_HUB_TIER_LEVEL_EXCEEDED:    
        case USB_HOST_EVENT_PORT_OVERCURRENT_DETECTED:            
            break;
        default:                   
            break;                    
    }
    
    return(USB_HOST_EVENT_RESPONSE_NONE);
}

void SYS_FSEventHandler(SYS_FS_EVENT event, void * eventData, uintptr_t context)
{        
    switch(event)
    {
        case SYS_FS_EVENT_MOUNT:
            SYS_CONSOLE_PRINT("SYS_FS_EVENT_MOUNT.\r\n");
            appData.usbConnected = true;
            
            break;
            
        case SYS_FS_EVENT_UNMOUNT:
            SYS_CONSOLE_PRINT("SYS_FS_EVENT_UNMOUNT.\r\n");
            appData.usbConnected = false;
            LED1Off();
            break;
            
        default:
            break;
    }
}


/* TODO:  Add any necessary local functions.
*/
bool USB_OpenFile(void)
{
    appData.hFile = SYS_FS_FileOpen("/mnt/usbdrive/pic32.txt", SYS_FS_FILE_OPEN_WRITE_PLUS);    
    if (appData.hFile == SYS_FS_HANDLE_INVALID) {
        SYS_CONSOLE_PRINT("SYS_FS_FileOpen failed.\r\n");
        return false;
    }

    return true;
}

bool USB_CloseFile(void)
{
    if (SYS_FS_FileClose(appData.hFile) != SYS_FS_RES_SUCCESS) {
        SYS_CONSOLE_PRINT("SYS_FS_FileClose failed.\r\n");
        return false;
    }

    return true;
}

int32_t USB_ReadFile(uint8_t *buff, uint16_t len)
{
    int32_t readBytes;
    readBytes = SYS_FS_FileRead(appData.hFile, buff, len);

    if (readBytes == -1) {
        SYS_CONSOLE_PRINT("SYS_FS_FileRead failed.\r\n");
    }

    return readBytes;
}

int32_t USB_WriteFile(uint8_t *buff, uint16_t len)
{
    int32_t writtenBytes;
    writtenBytes = SYS_FS_FileWrite(appData.hFile, buff, len);

    if (writtenBytes == -1) {
        SYS_CONSOLE_PRINT("SYS_FS_FileWrite failed.\r\n");
    }

    return writtenBytes;
}

int32_t USB_SeekFile(uint16_t offset, SYS_FS_FILE_SEEK_CONTROL whence)
{
    int32_t currentPosition;

    currentPosition = SYS_FS_FileSeek(appData.hFile, offset, whence);

    if (currentPosition == -1) {
        SYS_CONSOLE_PRINT("SYS_FS_FileSeek failed.\r\n");
    }

    return currentPosition;
}

bool USB_TruncateFile(void)
{
    if (!USB_OpenFile()) goto error;
    if (USB_SeekFile(0, SYS_FS_SEEK_SET) == -1) goto error;
    if (SYS_FS_FileTruncate(appData.hFile) != SYS_FS_RES_SUCCESS) {
        goto error;
    }
    if (!USB_CloseFile()) goto error;

    return true;

error:
    SYS_CONSOLE_PRINT("USB_TruncateFile failed.\n");
    return false;
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
    appData.state = APP_STATE_BUS_ENABLE;
    appData.usbConnected = false;
    
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

void APP_Tasks(void)
{

    /* Check the application's current state. */
    switch (appData.state)
    {
        case APP_STATE_BUS_ENABLE:                        
            USB_ENOn(); //turn on tps2051b switch, active high
            
            SYS_FS_EventHandlerSet(SYS_FSEventHandler, (uintptr_t)NULL); //register file system event handler
            USB_HOST_EventHandlerSet(USB_HostEventHandler, (uintptr_t)NULL); //register usb host event handler
                        
            USB_HOST_BusEnable(0); //enable first usb bus
            SYS_CONSOLE_PRINT("USB_HOST_BusEnable.\r\n");                
            
            appData.state = APP_STATE_WAIT_FOR_BUS_ENABLE_COMPLETE;
            break;
            
        case APP_STATE_WAIT_FOR_BUS_ENABLE_COMPLETE:
            if(USB_HOST_BusIsEnabled(0)) //check bus status 
            {
                SYS_CONSOLE_PRINT("USB_HOST_BusIsEnabled.\r\n");   
                appData.state = APP_STATE_WAIT_FOR_DEVICE_ATTACH;
            }
            break;
            
        case APP_STATE_WAIT_FOR_DEVICE_ATTACH:
            if(appData.usbConnected) appData.state = APP_STATE_DEVICE_CONNECTED;
            break;
            
        case APP_STATE_DEVICE_CONNECTED:            
            appData.state = APP_STATE_OPEN_FILE;
            break;
            
        case APP_STATE_OPEN_FILE:
            if(!USB_TruncateFile()) //truncate file
            {
                SYS_CONSOLE_PRINT("USB_TruncateFile failed.\r\n");   
                appData.state = APP_STATE_ERROR;
                break;
            }
            
            if(!USB_OpenFile()) //open file to write
            {
                SYS_CONSOLE_PRINT("USB_OpenFile failed.\r\n");   
                appData.state = APP_STATE_ERROR;
                break;
            }
            
            appData.state = APP_STATE_WRITE_TO_FILE;
            break;
            
        case APP_STATE_WRITE_TO_FILE:            
            appData.nBytesWritten = USB_WriteFile(msg, strlen(msg)); //write messages
            if(appData.nBytesWritten == -1)
            {
                SYS_CONSOLE_PRINT("USB_WriteFile failed.\r\n");   
                appData.state = APP_STATE_ERROR;
                break;
            }
            
            SYS_CONSOLE_PRINT("%ld bytes written.\n", appData.nBytesWritten); //check written bytes
            if(!USB_CloseFile())
            {
                SYS_CONSOLE_PRINT("USB_CloseFile failed.\r\n");   
                appData.state = APP_STATE_ERROR;
                break;
            }
            
            appData.state = APP_STATE_READ_FROM_FILE;            
            break;
            
        case APP_STATE_READ_FROM_FILE:
            
            if(!USB_OpenFile()) //open file to read
            {
                SYS_CONSOLE_PRINT("USB_CloseFile failed.\r\n");   
                appData.state = APP_STATE_ERROR;
                break;
            }
            
            memset(appData.buffer, 0, sizeof(appData.buffer));
            appData.nBytesRead = USB_ReadFile(appData.buffer, strlen(msg)); //read file
            if(appData.nBytesRead == -1)
            {
                SYS_CONSOLE_PRINT("USB_ReadFile failed.\r\n");   
                appData.state = APP_STATE_ERROR;
                break;
            }
            
            SYS_CONSOLE_PRINT("%ld bytes read\r\n", appData.nBytesRead); //check read bytes
            SYS_CONSOLE_PRINT("%s\r\n", appData.buffer);
            
            if(!USB_CloseFile()) //close file
            {
                SYS_CONSOLE_PRINT("USB_CloseFile failed.\r\n");   
                appData.state = APP_STATE_ERROR;
                break;
            }
            
            LED1On();
            
            appData.state = APP_STATE_IDLE;
            break;
            
        case APP_STATE_IDLE:
            if(!appData.usbConnected) appData.state = APP_STATE_WAIT_FOR_DEVICE_ATTACH;
            break;
            
        case APP_STATE_ERROR:
            if(SYS_FS_Unmount("/mnt/usbdrive") != 0)
            {
                appData.state = APP_STATE_ERROR;
            }
            else
            {
                appData.state =  APP_STATE_WAIT_FOR_DEVICE_ATTACH;
                appData.usbConnected = false;                 
            }
            break;
         
        default:                  
            break;        
    }
}

 

/*******************************************************************************
 End of File
 */
