#include "main.h"
#include "common.h"
#include "uart.h"
#include "spi_master.h"
#include "25LC010A.h"
#include <string.h>

volatile uint8_t data = 0;
char *sndBuffer = "HELLO WORLD!HELLO WORLD!\r\n";
char rcvBuffer[30];

void main(void) {

    sysInit();
    UART_Init();
    SPI_Init();

    printf("%s\r\n", "### PIC32MZ SPI 25LC010A Demo ###");
    
    EEPROM_Write(0x00, 'A'); //write 'A' at 0x00
    data = EEPROM_Read(0x00); //read data

    if (data != 'A') printf("EEPROM_Write 'A' Failed.\r\n");
    else printf("EEPROM_Write 'A' OK.\r\n");

    EEPROM_Write(0x01, 'B'); //write 'B' at 0x01
    data = EEPROM_Read(0x01); //read data

    if (data != 'B') printf("EEPROM_Write 'B' Failed.\r\n");
    else printf("EEPROM_Write 'B' OK.\r\n");

    EEPROM_WriteBuffer(0x02, (uint8_t*) sndBuffer, strlen(sndBuffer)); //write string
    EEPROM_ReadBuffer(0x02, (uint8_t*) rcvBuffer, strlen(sndBuffer)); //read string
    printf(rcvBuffer);

    EEPROM_EraseAll(); //erase all
    data = EEPROM_Read(0x00); //read data at 0x00

    if (data != 0) printf("EEPROM_EraseAll Failed.\r\n");
    else printf("EEPROM_EraseAll OK.\r\n");

    while (1) {
    };
}
