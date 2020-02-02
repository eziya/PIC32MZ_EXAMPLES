/* 
 * File:   main.h
 * Author: KIKI
 *
 * Created on 2019년 10월 30일 (수), 오후 10:03
 */

#ifndef _MAIN_H_
#define	_MAIN_H_

#include <xc.h>
#include <p32xxxx.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/attribs.h>
#include <sys/kmem.h>

#define _XTAL_FREQ 200000000UL

#define SS_TRIS     TRISBbits.TRISB1
#define SS_PIN      LATBbits.LATB1
#define DC_TRIS     TRISBbits.TRISB3
#define DC_PIN      LATBbits.LATB3
#define RST_TRIS    TRISBbits.TRISB4
#define RST_PIN     LATBbits.LATB4

#endif	/* __MAIN_H */

