/*******************************************************************************
  MPLAB Harmony Application Source File
  
  Company:
    Microchip Technology Inc.
  
  File Name:
    sensor.c

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

SENSOR_DATA sensorData;

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

bool BME280_I2C_Init(void)
{
    SYS_STATUS status;

    sensorData.hI2C4 = DRV_I2C_Open(DRV_I2C_INDEX_0, DRV_IO_INTENT_READWRITE); //open driver

    if (DRV_HANDLE_INVALID == sensorData.hI2C4)
    {
        return false;
    }

    status = DRV_I2C_Status(sysObj.drvI2C0);
    if (status != SYS_STATUS_READY)
    {
        return false;
    }
    
    return true;
}

int8_t BME280_i2c_read(uint8_t id, uint8_t reg_addr, uint8_t *data, uint16_t len)
{
    DRV_I2C_BUFFER_HANDLE hI2C4Buf; //buffer handle
    DRV_I2C_BUFFER_EVENT eventStatus; //event status
    
    hI2C4Buf = DRV_I2C_Transmit(sensorData.hI2C4, id << 1, &reg_addr, 1, NULL); //transmit register address

    if (hI2C4Buf == NULL)
    {        
        return -1;
    }

    do
    {
        eventStatus = DRV_I2C_TransferStatusGet(sensorData.hI2C4, hI2C4Buf);
    }
    while (eventStatus != DRV_I2C_BUFFER_EVENT_COMPLETE && eventStatus != DRV_I2C_BUFFER_EVENT_ERROR);

    if (eventStatus == DRV_I2C_BUFFER_EVENT_ERROR)
    {
        return -1; //error        
    }

    hI2C4Buf = DRV_I2C_Receive(sensorData.hI2C4, id << 1, data, len, NULL); //read data

    if (hI2C4Buf == NULL)
    {        
        return -1;
    }

    do
    {
        eventStatus = DRV_I2C_TransferStatusGet(sensorData.hI2C4, hI2C4Buf);
    }
    while (eventStatus != DRV_I2C_BUFFER_EVENT_COMPLETE && eventStatus != DRV_I2C_BUFFER_EVENT_ERROR);

    if (eventStatus == DRV_I2C_BUFFER_EVENT_ERROR)
    {
        return -1; //error        
    }

    return 0;
}

int8_t BME280_i2c_write(uint8_t id, uint8_t reg_addr, uint8_t *data, uint16_t len)
{
    DRV_I2C_BUFFER_HANDLE hI2C4Buf; //buffer handle
    DRV_I2C_BUFFER_EVENT eventStatus; //event status
    int i = 0;

    uint8_t *buf = malloc(len + 1);

    buf[0] = reg_addr;
    for (i = 0; i < len; i++)
    {
        buf[i + 1] = data[i]; //register address + data
    }

    hI2C4Buf = DRV_I2C_Transmit(sensorData.hI2C4, id << 1, &buf[0], sizeof (buf), NULL); //transmit register address + data

    if (hI2C4Buf == NULL)
    {        
        free(buf);
        return -1;
    }

    do
    {
        eventStatus = DRV_I2C_TransferStatusGet(sensorData.hI2C4, hI2C4Buf);
    }
    while (eventStatus != DRV_I2C_BUFFER_EVENT_COMPLETE && eventStatus != DRV_I2C_BUFFER_EVENT_ERROR);

    if (eventStatus == DRV_I2C_BUFFER_EVENT_ERROR)
    {
        free(buf);
        return -1; //error        
    }

    free(buf);
    return 0;
}

void BME280_delay_ms(uint32_t period)
{
    vTaskDelay(period / portTICK_PERIOD_MS);
}

bool BME280_Init(void)
{    
    int8_t rslt; //result
    
    /* configure device */
    sensorData.dev.dev_id = BME280_I2C_ADDR_PRIM;
    sensorData.dev.intf = BME280_I2C_INTF;
    sensorData.dev.read = BME280_i2c_read;
    sensorData.dev.write = BME280_i2c_write;
    sensorData.dev.delay_ms = BME280_delay_ms;

    rslt = bme280_init(&sensorData.dev);
    if (rslt != BME280_OK) return false;

    /* configure settings */
    sensorData.dev.settings.osr_h = BME280_OVERSAMPLING_1X;
    sensorData.dev.settings.osr_p = BME280_OVERSAMPLING_16X;
    sensorData.dev.settings.osr_t = BME280_OVERSAMPLING_2X;
    sensorData.dev.settings.filter = BME280_FILTER_COEFF_16;
    rslt = bme280_set_sensor_settings(BME280_OSR_PRESS_SEL | BME280_OSR_TEMP_SEL | BME280_OSR_HUM_SEL | BME280_FILTER_SEL, &sensorData.dev);
    if (rslt != BME280_OK) return false;
    
    return true;
}

void BME280_Task(void)
{
    struct bme280_data comp_data; //measured data
    int8_t rslt; //result
    
    /* set FORCED mode, turn into SLEEP mode after measurement */
    rslt = bme280_set_sensor_mode(BME280_FORCED_MODE, &sensorData.dev);
    if (rslt != BME280_OK) return;
    
    sensorData.dev.delay_ms(40);
    
    /* get measured data */
    rslt = bme280_get_sensor_data(BME280_ALL, &comp_data, &sensorData.dev);
    if (rslt == BME280_OK)
    {
        sensorData.temperature = comp_data.temperature / 100.0; /* degree */
        sensorData.humidity = comp_data.humidity / 1024.0; /* percentage */
        sensorData.pressure = comp_data.pressure / 10000.0; /* hPa */
        
        SYS_CONSOLE_PRINT("Temp: %03.1fC, Humid: %03.1f%%, Pressure: %04.1fhPa\n", sensorData.temperature, sensorData.humidity, sensorData.pressure);
    }
    
    vTaskDelay(1000 / portTICK_PERIOD_MS);
}

// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void SENSOR_Initialize ( void )

  Remarks:
    See prototype in sensor.h.
 */

void SENSOR_Initialize(void)
{
    /* Place the App state machine in its initial state. */
    sensorData.state = SENSOR_STATE_INIT;


    /* TODO: Initialize your application's state machine and other
     * parameters.
     */
}

/******************************************************************************
  Function:
    void SENSOR_Tasks ( void )

  Remarks:
    See prototype in sensor.h.
 */

void SENSOR_Tasks(void)
{
    /* Check the application's current state. */
    switch (sensorData.state)
    {
    
    /* Application's initial state. */
    case SENSOR_STATE_INIT:
    {
        bool appInitialized = false;

        if(!BME280_I2C_Init()) break;
        if(!BME280_Init()) break;

        appInitialized = true;

        if (appInitialized)
        {
            sensorData.state = SENSOR_STATE_SERVICE_TASKS;
        }        
    }
    break;

    case SENSOR_STATE_SERVICE_TASKS:
    {
        BME280_Task();               
    }
    break;

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
