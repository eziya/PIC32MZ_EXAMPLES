/* 
 * File:   uart.h
 * Author: KIKI
 *
 * Created on 2019년 11월 19일 (화), 오후 10:33
 */

#ifndef _UART_H_
#define	_UART_H_

#ifdef	__cplusplus
extern "C" {
#endif

#include "main.h"
    
#define BAUDRATE    115200UL

void UART_Init(void);
void UART_EnableInterrupt(void);
void UART_Putc(uint8_t ch);
void UART_Puts(char *str);
uint8_t UART_Getc(void);
void UART_Gets(char *str, uint16_t len);
void UART_Error(void);


#ifdef	__cplusplus
}
#endif

#endif	/* UART_H */

