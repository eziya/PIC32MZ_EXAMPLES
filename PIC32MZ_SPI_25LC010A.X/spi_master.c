#include "spi_master.h"

void SPI_Init()
{
    /* pps, SCK4(RD10), SDI4(RD3), SDO4(RD11) */
    SDI4R = 0;
    RPD11R = 8;
        
    SPI4CON = 0; //disable SPI module
    SPI4BUF; //clear buffer        
    SPI4BRG = 9; //set baudrate, 100MHz/(2*5MHz) - 1
    SPI4STATbits.SPIROV = 0; //clear overflow
    SPI4CONbits.MSTEN = 1; //master mode
    SPI4CONbits.MCLKSEL = 0; //PBCLK
    SPI4CONbits.SMP = 0; //sampled at the middle
    SPI4CONbits.CKE = 1; //edge
    SPI4CONbits.CKP = 0; //polarity
    SPI4CONbits.ON = 1; //enable SPI
}

uint8_t SPI_Rx() {
    SPI4BUF = 0x00; //dummy tx
    while (!SPI4STATbits.SPIRBF);
    return SPI4BUF; //read  buffer
}

void SPI_Tx(uint8_t data) {
    uint8_t dummy;
    SPI4BUF = data; //write to buffer
    while (!SPI4STATbits.SPIRBF);
    dummy = SPI4BUF; //discard dummy
}

uint8_t SPI_TxRx(uint8_t data) {
    SPI4BUF = data; //write to buffer
    while (!SPI4STATbits.SPIRBF);
    return SPI4BUF; //read buffer
}

void SPI_RxBuffer(uint8_t *buffer, uint8_t length) {     
    for (uint8_t i = 0; i < length; i++) {
        buffer[i] = SPI_Rx();
    }
}

void SPI_TxBuffer(uint8_t *buffer, uint8_t length) {    
    for (uint8_t i = 0; i < length; i++) {
        SPI_Tx(buffer[i]);
    }
}
