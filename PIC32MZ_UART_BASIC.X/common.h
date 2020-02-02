/* 
 * File:   common.h
 * Author: KIKI
 *
 * Created on 2019년 11월 19일 (화), 오후 10:44
 */

#ifndef _COMMON_H_
#define	_COMMON_H_

#ifdef	__cplusplus
extern "C" {
#endif
    
#include "main.h"
    
void __delay_ms(uint32_t delay);
void __delay_us(uint32_t delay);
void configPerformance(void);

#ifdef	__cplusplus
}
#endif

#endif	/* COMMON_H */

