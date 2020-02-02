/*******************************************************************************
 System Interrupt Source File

  File Name:
    sys_interrupt_a.S

  Summary:
    Raw ISR definitions.

  Description:
    This file contains a definitions of the raw ISRs required to support the 
    interrupt sub-system.
*******************************************************************************/

// DOM-IGNORE-BEGIN
/*******************************************************************************
Copyright (c) 2011-2014 released Microchip Technology Inc.  All rights reserved.

Microchip licenses to you the right to use, modify, copy and distribute
Software only when embedded on a Microchip microcontroller or digital signal
controller that is integrated into your product or third party product
(pursuant to the sublicense terms in the accompanying license agreement).

You should refer to the license agreement accompanying this Software for
additional information regarding your rights and obligations.

SOFTWARE AND DOCUMENTATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY KIND,
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
/*
*********************************************************************************************************
*                                           INCLUDES
*********************************************************************************************************
*/
#include <xc.h>



#include "ISR_Support.h"


/* External Interrupt Instance 0 Interrupt */
   .extern  IntHandlerExternalInterruptInstance0

   .section	.vector_3,code, keep
   .equ     __vector_dispatch_3, IntVectorExternalInterruptInstance0
   .global  __vector_dispatch_3
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  IntVectorExternalInterruptInstance0

IntVectorExternalInterruptInstance0:
    portSAVE_CONTEXT
    la    s6,  IntHandlerExternalInterruptInstance0
    jalr  s6
    nop
    portRESTORE_CONTEXT
    .end	IntVectorExternalInterruptInstance0


 

/* TMR Instance 0 Interrupt */
   .extern  IntHandlerDrvTmrInstance0

   .section	.vector_9,code, keep
   .equ     __vector_dispatch_9, IntVectorDrvTmrInstance0
   .global  __vector_dispatch_9
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  IntVectorDrvTmrInstance0

IntVectorDrvTmrInstance0:
    portSAVE_CONTEXT
    la    s6,  IntHandlerDrvTmrInstance0
    jalr  s6
    nop
    portRESTORE_CONTEXT
    .end	IntVectorDrvTmrInstance0




/* USART Instance 0 Interrupt */

   .extern  IntHandlerDrvUsartReceiveInstance0

   .section	.vector_171,code, keep
   .equ     __vector_dispatch_171, IntVectorDrvUsartReceiveInstance0
   .global  __vector_dispatch_171
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  IntVectorDrvUsartReceiveInstance0

IntVectorDrvUsartReceiveInstance0:
    portSAVE_CONTEXT
    la    s6,  IntHandlerDrvUsartReceiveInstance0
    jalr  s6
    nop
    portRESTORE_CONTEXT
    .end	IntVectorDrvUsartReceiveInstance0


   .extern  IntHandlerDrvUsartTransmitInstance0

   .section	.vector_172,code, keep
   .equ     __vector_dispatch_172, IntVectorDrvUsartTransmitInstance0
   .global  __vector_dispatch_172
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  IntVectorDrvUsartTransmitInstance0

IntVectorDrvUsartTransmitInstance0:
    portSAVE_CONTEXT
    la    s6,  IntHandlerDrvUsartTransmitInstance0
    jalr  s6
    nop
    portRESTORE_CONTEXT
    .end	IntVectorDrvUsartTransmitInstance0


   .extern  IntHandlerDrvUsartErrorInstance0

   .section	.vector_170,code, keep
   .equ     __vector_dispatch_170, IntVectorDrvUsartErrorInstance0
   .global  __vector_dispatch_170
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  IntVectorDrvUsartErrorInstance0

IntVectorDrvUsartErrorInstance0:
    portSAVE_CONTEXT
    la    s6,  IntHandlerDrvUsartErrorInstance0
    jalr  s6
    nop
    portRESTORE_CONTEXT
    .end	IntVectorDrvUsartErrorInstance0



/* SPI Instance 0 Interrupt */
   .extern  IntHandlerSPIRxInstance0

   .section	.vector_155,code, keep
   .equ     __vector_dispatch_155, IntVectorSPIRxInstance0
   .global  __vector_dispatch_155
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  IntVectorSPIRxInstance0

IntVectorSPIRxInstance0:
    portSAVE_CONTEXT
    la    s6,  IntHandlerSPIRxInstance0
    jalr  s6
    nop
    portRESTORE_CONTEXT
    .end	IntVectorSPIRxInstance0


   .extern  IntHandlerSPITxInstance0

   .section	.vector_156,code, keep
   .equ     __vector_dispatch_156, IntVectorSPITxInstance0
   .global  __vector_dispatch_156
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  IntVectorSPITxInstance0

IntVectorSPITxInstance0:
    portSAVE_CONTEXT
    la    s6,  IntHandlerSPITxInstance0
    jalr  s6
    nop
    portRESTORE_CONTEXT
    .end	IntVectorSPITxInstance0


   .extern  IntHandlerSPIFaultInstance0

   .section	.vector_154,code, keep
   .equ     __vector_dispatch_154, IntVectorSPIFaultInstance0
   .global  __vector_dispatch_154
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  IntVectorSPIFaultInstance0

IntVectorSPIFaultInstance0:
    portSAVE_CONTEXT
    la    s6,  IntHandlerSPIFaultInstance0
    jalr  s6
    nop
    portRESTORE_CONTEXT
    .end	IntVectorSPIFaultInstance0


/* SPI Instance 1 Interrupt */
   .extern  IntHandlerSPIRxInstance1

   .section	.vector_164,code, keep
   .equ     __vector_dispatch_164, IntVectorSPIRxInstance1
   .global  __vector_dispatch_164
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  IntVectorSPIRxInstance1

IntVectorSPIRxInstance1:
    portSAVE_CONTEXT
    la    s6,  IntHandlerSPIRxInstance1
    jalr  s6
    nop
    portRESTORE_CONTEXT
    .end	IntVectorSPIRxInstance1


   .extern  IntHandlerSPITxInstance1

   .section	.vector_165,code, keep
   .equ     __vector_dispatch_165, IntVectorSPITxInstance1
   .global  __vector_dispatch_165
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  IntVectorSPITxInstance1

IntVectorSPITxInstance1:
    portSAVE_CONTEXT
    la    s6,  IntHandlerSPITxInstance1
    jalr  s6
    nop
    portRESTORE_CONTEXT
    .end	IntVectorSPITxInstance1


   .extern  IntHandlerSPIFaultInstance1

   .section	.vector_163,code, keep
   .equ     __vector_dispatch_163, IntVectorSPIFaultInstance1
   .global  __vector_dispatch_163
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  IntVectorSPIFaultInstance1

IntVectorSPIFaultInstance1:
    portSAVE_CONTEXT
    la    s6,  IntHandlerSPIFaultInstance1
    jalr  s6
    nop
    portRESTORE_CONTEXT
    .end	IntVectorSPIFaultInstance1



/* I2C Instance 0 Interrupt */

   .extern  IntHandlerDrvI2CMasterInstance0

   .section	.vector_175,code, keep
   .equ     __vector_dispatch_175, IntVectorDrvI2CMasterInstance0
   .global  __vector_dispatch_175
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  IntVectorDrvI2CMasterInstance0

IntVectorDrvI2CMasterInstance0:
    portSAVE_CONTEXT
    la    s6,  IntHandlerDrvI2CMasterInstance0
    jalr  s6
    nop
    portRESTORE_CONTEXT
    .end	IntVectorDrvI2CMasterInstance0


   .extern  IntHandlerDrvI2CErrorInstance0

   .section	.vector_173,code, keep
   .equ     __vector_dispatch_173, IntVectorDrvI2CErrorInstance0
   .global  __vector_dispatch_173
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  IntVectorDrvI2CErrorInstance0

IntVectorDrvI2CErrorInstance0:
    portSAVE_CONTEXT
    la    s6,  IntHandlerDrvI2CErrorInstance0
    jalr  s6
    nop
    portRESTORE_CONTEXT
    .end	IntVectorDrvI2CErrorInstance0



/*******************************************************************************
 End of File
 */

