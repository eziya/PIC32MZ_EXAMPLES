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
void UART_putch(uint8_t ch);
void UART_puts(char *str);
uint8_t UART_getch(void);
void UART_gets(char *str, uint16_t len);
void UART_error(void);


#ifdef	__cplusplus
}
#endif

#endif	/* UART_H */

