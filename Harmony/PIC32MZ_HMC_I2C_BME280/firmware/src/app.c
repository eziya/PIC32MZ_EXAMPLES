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
#include "./BME280/bme280.h"

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

DRV_HANDLE hI2C4; //i2c handle
DRV_I2C_BUFFER_HANDLE hI2C4Buf; //buffer handle
DRV_I2C_BUFFER_EVENT eventStatus; //event status
DRV_HANDLE hUart4; //uart4 handle

float temperature; //temp
float humidity; //humid
float pressure; //pressure

struct bme280_dev dev; //device configuration
struct bme280_data comp_data; //measured data
int8_t rslt; //result

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

void __delay_ms(uint32_t delay)
{
    register uint32_t startCntms = _CP0_GET_COUNT();
    register uint32_t waitCntms = delay * (SYS_CLK_SystemFrequencyGet() / 1000 / 2); //core timer runs at half of system clock

    while (_CP0_GET_COUNT() - startCntms < waitCntms);
}

void __delay_us(uint32_t delay)
{
    register uint32_t startCnt = _CP0_GET_COUNT();
    register uint32_t waitCnt = delay * (SYS_CLK_SystemFrequencyGet() / 1000000 / 2); //core timer runs at half of system clock

    while (_CP0_GET_COUNT() - startCnt < waitCnt);
}

/* UART Init */
void APP_UART_Init(void)
{
    hUart4 = DRV_USART_Open(DRV_USART_INDEX_0, DRV_IO_INTENT_READWRITE); //open rw    
    printf("PIC32MZ I2C BME280 Demo!!!\n");
}

/* using UART for stdout */
void _mon_putc(char c)
{
    while (DRV_USART_TransferStatus(hUart4) & DRV_USART_TRANSFER_STATUS_TRANSMIT_FULL); // wait transmit buffer empty
    DRV_USART_WriteByte(hUart4, c); //send data
}

void APP_I2C_Init(void)
{
    SYS_STATUS status;
    
    hI2C4 = DRV_I2C_Open(DRV_I2C_INDEX_0, DRV_IO_INTENT_READWRITE); //open driver
    
    if (DRV_HANDLE_INVALID == hI2C4) {
        printf("DRV_I2C_Open failed.\n");
        while (true);
    }
            
    status = DRV_I2C_Status(sysObj.drvI2C0);
    if(status != SYS_STATUS_READY)
    {
        while(true)
        {
            LED1On(); //error
        }
    }
}

int8_t user_i2c_read(uint8_t id, uint8_t reg_addr, uint8_t *data, uint16_t len)
{
    hI2C4Buf = DRV_I2C_Transmit(hI2C4, id << 1, &reg_addr, 1, NULL); //transmit register address

    if (hI2C4Buf == NULL) {
        LED1On(); //error
        printf("DRV_I2C_Transmit buffer handle is NULL.\n");
        return -1;
    }
    
    do {
        eventStatus = DRV_I2C_TransferStatusGet(hI2C4, hI2C4Buf);        
    } while(eventStatus != DRV_I2C_BUFFER_EVENT_COMPLETE && eventStatus != DRV_I2C_BUFFER_EVENT_ERROR);
        
    if(eventStatus == DRV_I2C_BUFFER_EVENT_ERROR) {
        LED1On();
        return -1; //error        
    }
    
    hI2C4Buf = DRV_I2C_Receive(hI2C4, id << 1, data, len, NULL); //read data

    if (hI2C4Buf == NULL) {
        LED1On(); //error
        printf("DRV_I2C_Receive buffer handle is NULL.\n");
        return -1;
    }
    
    do {
        eventStatus = DRV_I2C_TransferStatusGet(hI2C4, hI2C4Buf);        
    } while(eventStatus != DRV_I2C_BUFFER_EVENT_COMPLETE && eventStatus != DRV_I2C_BUFFER_EVENT_ERROR);
        
    if(eventStatus == DRV_I2C_BUFFER_EVENT_ERROR) {
        LED1On();
        return -1; //error        
    }

    return 0;
}

int8_t user_i2c_write(uint8_t id, uint8_t reg_addr, uint8_t *data, uint16_t len)
{
    int i = 0;

    uint8_t *buf = malloc(len + 1);

    buf[0] = reg_addr;
    for (i = 0; i < len; i++) {
        buf[i + 1] = data[i]; //register address + data
    }

    hI2C4Buf = DRV_I2C_Transmit(hI2C4, id << 1, &buf[0], sizeof (buf), NULL); //transmit register address + data

    if (hI2C4Buf == NULL) {
        printf("DRV_I2C_Transmit buffer handle is NULL.\n");
        free(buf);
        LED1On();
        return -1;
    }
    
    do {
        eventStatus = DRV_I2C_TransferStatusGet(hI2C4, hI2C4Buf);        
    } while(eventStatus != DRV_I2C_BUFFER_EVENT_COMPLETE && eventStatus != DRV_I2C_BUFFER_EVENT_ERROR);
        
    if(eventStatus == DRV_I2C_BUFFER_EVENT_ERROR) {
        free(buf);
        LED1On();
        return -1; //error        
    }    

    free(buf);
    return 0;
}

void user_delay_ms(uint32_t period)
{
    __delay_ms(period);
}

void BME280_Init(void)
{
    /* configure device */
    dev.dev_id = BME280_I2C_ADDR_PRIM;
    dev.intf = BME280_I2C_INTF;
    dev.read = user_i2c_read;
    dev.write = user_i2c_write;
    dev.delay_ms = user_delay_ms;

    rslt = bme280_init(&dev);
    if (rslt != BME280_OK) printf("BME280_Init failed.\n");

    /* configure settings */
    dev.settings.osr_h = BME280_OVERSAMPLING_1X;
    dev.settings.osr_p = BME280_OVERSAMPLING_16X;
    dev.settings.osr_t = BME280_OVERSAMPLING_2X;
    dev.settings.filter = BME280_FILTER_COEFF_16;
    rslt = bme280_set_sensor_settings(BME280_OSR_PRESS_SEL | BME280_OSR_TEMP_SEL | BME280_OSR_HUM_SEL | BME280_FILTER_SEL, &dev);
    if (rslt != BME280_OK) printf("BME280_Init failed.\n");
}

void BME280_Task(void)
{
    /* set FORCED mode, turn into SLEEP mode after measurement */
    rslt = bme280_set_sensor_mode(BME280_FORCED_MODE, &dev);
    if (rslt != BME280_OK) printf("BME280_Task failed.\n");
    dev.delay_ms(40);
    /* get measured data */
    rslt = bme280_get_sensor_data(BME280_ALL, &comp_data, &dev);
    if (rslt == BME280_OK) {
        temperature = comp_data.temperature / 100.0; /* degree */
        humidity = comp_data.humidity / 1024.0; /* percentage */
        pressure = comp_data.pressure / 10000.0; /* hPa */

        printf("Temp: %03.1fC, Humid: %03.1f%%, Pressure: %04.1fhPa\n", temperature, humidity, pressure);
        LED1Toggle();
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
                APP_UART_Init();
                APP_I2C_Init();
                BME280_Init();

                appData.state = APP_STATE_SERVICE_TASKS;
            }
            break;
        }

        case APP_STATE_SERVICE_TASKS:
        {
            BME280_Task();
            __delay_ms(1000);
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
