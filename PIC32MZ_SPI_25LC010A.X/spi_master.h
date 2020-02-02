/* 
 * File:   spi_master.h
 * Author: KIKI
 *
 * Created on 2019년 12월 30일 (월), 오후 9:11
 */

#ifndef SPI_MATER_H
#define	SPI_MATERH

#include "main.h"
#include "common.h"

void SPI_Init(void);
uint8_t SPI_Rx(void);
void SPI_Tx(uint8_t data);
uint8_t SPI_TxRx(uint8_t data);
void SPI_RxBuffer(uint8_t *buffer, uint8_t length);
void SPI_TxBuffer(uint8_t *buffer, uint8_t length);
void SPI_Select(void);
void SPI_Deselect(void);

#endif	/* SPI_MATERH */

