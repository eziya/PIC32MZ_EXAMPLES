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

#define BUFF_LEN    512

APP_DATA appData;

DRV_HANDLE hUart4; //uart4 handle
bool mountFlag = false;  //mount flag
SYS_FS_HANDLE hFile; //file handle
uint8_t buffer[BUFF_LEN]; //message buffer

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

/* UART Init */
void APP_UARTInit(void)
{
    hUart4 = DRV_USART_Open(DRV_USART_INDEX_0, DRV_IO_INTENT_READWRITE); //open rw    
    printf("PIC32MZ SD Card Demo!!!\n");
}

/* using UART for stdout */
void _mon_putc(char c)
{
    while (DRV_USART_TransferStatus(hUart4) & DRV_USART_TRANSFER_STATUS_TRANSMIT_FULL); // wait transmit buffer empty
    DRV_USART_WriteByte(hUart4, c); //send data
}

/* file system wrapper functions */
bool SD_Mount(void)
{
    if (SYS_FS_Mount("/dev/mmcblka1", "/mnt/sdcard", FAT, 0, NULL) != SYS_FS_RES_SUCCESS) {
        printf("SYS_FS_Mount failed.\n");
        return false;
    }

    return true;
}

bool SD_Unmount(void)
{
    if (SYS_FS_Unmount("/mnt/sdcard") != SYS_FS_RES_SUCCESS) {
        printf("SYS_FS_Unmount failed.\n");
        return false;
    }

    return true;
}

bool SD_OpenFile(void)
{
    hFile = SYS_FS_FileOpen("/mnt/sdcard/first.txt", SYS_FS_FILE_OPEN_WRITE_PLUS);
    if (hFile == SYS_FS_HANDLE_INVALID) {
        printf("SYS_FS_FileOpen failed.\n");
        return false;
    }

    return true;
}

bool SD_CloseFile(void)
{
    if (SYS_FS_FileClose(hFile) != SYS_FS_RES_SUCCESS) {
        printf("SD_CloseFile failed.\n");
        return false;
    }

    return true;
}

int32_t SD_ReadFile(uint8_t *buff, uint16_t len)
{
    int32_t readBytes;
    readBytes = SYS_FS_FileRead(hFile, buff, len);

    if (readBytes == -1) {
        printf("SYS_FS_FileRead failed.\n");
    }

    return readBytes;
}

int32_t SD_WriteFile(uint8_t *buff, uint16_t len)
{
    int32_t writtenBytes;
    writtenBytes = SYS_FS_FileWrite(hFile, buff, len);

    if (writtenBytes == -1) {
        printf("SYS_FS_FileWrite failed.\n");
    }

    return writtenBytes;
}

int32_t SD_SeekFile(uint16_t offset, SYS_FS_FILE_SEEK_CONTROL whence)
{
    int32_t currentPosition;

    currentPosition = SYS_FS_FileSeek(hFile, offset, whence);

    if (currentPosition == -1) {
        printf("SYS_FS_FileSeek failed.\n");
    }

    return currentPosition;
}

bool SD_TruncateFile(void)
{
    if (!SD_OpenFile()) goto error;
    if (SD_SeekFile(0, SYS_FS_SEEK_SET) == -1) goto error;
    if (SYS_FS_FileTruncate(hFile) != SYS_FS_RES_SUCCESS) {
        goto error;
    }
    if (!SD_CloseFile()) goto error;

    return true;

error:
    printf("SD_TruncateFile failed.\n");
    return false;
}

void FileTask(void)
{
    int32_t bytes;
    static char *msg = 
    "MPLAB Harmony provides system service libraries to support common functionality and manage resources that are shared by multiple drivers, libraries, and other modules.\r\n"
    "A system service encapsulates code that manages a shared resource or implements a common capability in a single location so that it does not"
    "need to be replicated by individual drivers and libraries.\r\n";

    SD_TruncateFile(); //truncate file
    SD_OpenFile(); //open file to write

    bytes = SD_WriteFile(msg, strlen(msg)); //write messages
    printf("%ld bytes written.\n", bytes); //check written bytes

    SD_CloseFile(); //close file

    SD_OpenFile(); //open file to read
    memset(buffer, 0, BUFF_LEN);
    bytes = SD_ReadFile(buffer, BUFF_LEN); //read file
    printf("%ld bytes read\r\n", bytes); //check read bytes
    SD_CloseFile(); //close file

    printf("%s\n", buffer); //display messages
    
    if(bytes == -1)
    {
        SD_Unmount(); //if there's an error, unmount SD card
        mountFlag = false;
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

void APP_Initialize(void)
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

void APP_Tasks(void)
{

    /* Check the application's current state. */
    switch (appData.state) {
        /* Application's initial state. */
    case APP_STATE_INIT:
    {
        bool appInitialized = true;

        if (appInitialized) {
            APP_UARTInit(); //initialize uart
            appData.state = APP_STATE_SERVICE_TASKS;
        }
        break;
    }

    case APP_STATE_SERVICE_TASKS:
    {
        if (BTN1StateGet() != 0) { //when button pressed

            if (!mountFlag) {
                SD_Mount(); //mount sdcard
                mountFlag = true;
            }

            FileTask(); //file system task
            LED1Toggle(); //toggle led
        }

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
