/***********************************************************************************************************************
* DISCLAIMER
* This software is supplied by Renesas Electronics Corporation and is only intended for use with Renesas products.
* No other uses are authorized. This software is owned by Renesas Electronics Corporation and is protected under all
* applicable laws, including copyright laws. 
* THIS SOFTWARE IS PROVIDED "AS IS" AND RENESAS MAKES NO WARRANTIESREGARDING THIS SOFTWARE, WHETHER EXPRESS, IMPLIED
* OR STATUTORY, INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
* NON-INFRINGEMENT.  ALL SUCH WARRANTIES ARE EXPRESSLY DISCLAIMED.TO THE MAXIMUM EXTENT PERMITTED NOT PROHIBITED BY
* LAW, NEITHER RENESAS ELECTRONICS CORPORATION NOR ANY OF ITS AFFILIATED COMPANIES SHALL BE LIABLE FOR ANY DIRECT,
* INDIRECT, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES FOR ANY REASON RELATED TO THIS SOFTWARE, EVEN IF RENESAS OR
* ITS AFFILIATES HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
* Renesas reserves the right, without notice, to make changes to this software and to discontinue the availability 
* of this software. By using this software, you agree to the additional terms and conditions found by accessing the 
* following link:
* http://www.renesas.com/disclaimer
*
* Copyright (C) 2015, 2017 Renesas Electronics Corporation. All rights reserved.
***********************************************************************************************************************/

/***********************************************************************************************************************
* File Name    : r_cg_bsc.c
* Version      : Code Generator for RX71M V1.01.00.05 [26 May 2017]
* Device(s)    : R5F571MLDxBG
* Tool-Chain   : CCRX
* Description  : This file implements device driver for BSC module.
* Creation Date: 2017/12/31
***********************************************************************************************************************/

/***********************************************************************************************************************
Pragma directive
***********************************************************************************************************************/
/* Start user code for pragma. Do not edit comment generated here */
/* End user code. Do not edit comment generated here */

/***********************************************************************************************************************
Includes
***********************************************************************************************************************/
#include "r_cg_macrodriver.h"
#include "r_cg_bsc.h"
/* Start user code for include. Do not edit comment generated here */
/* End user code. Do not edit comment generated here */
#include "r_cg_userdefine.h"

/***********************************************************************************************************************
Global variables and functions
***********************************************************************************************************************/
/* Start user code for global. Do not edit comment generated here */
/* End user code. Do not edit comment generated here */

/***********************************************************************************************************************
* Function Name: R_BSC_Create
* Description  : This function initializes the Bus module.
* Arguments    : None
* Return Value : None
***********************************************************************************************************************/
void R_BSC_Create(void)
{
    /* Disable BUSERR interrupt */
    IEN(BSC,BUSERR) = 0U;

    /* Set BSC control registers */
    BSC.CSRECEN.WORD = _0002_BSC_RCVEN1_ENABLED | _0004_BSC_RCVEN2_ENABLED | _0008_BSC_RCVEN3_ENABLED | 
                       _0010_BSC_RCVEN4_ENABLED | _0020_BSC_RCVEN5_ENABLED | _0200_BSC_RCVENM1_ENABLED | 
                       _0400_BSC_RCVENM2_ENABLED | _0800_BSC_RCVENM3_ENABLED | _1000_BSC_RCVENM4_ENABLED | 
                       _2000_BSC_RCVENM5_ENABLED;
    BSC.BUSPRI.WORD = _0000_BSC_BPRA_FIX | _0000_BSC_BPRO_FIX | _0000_BSC_BPIB_FIX | _0000_BSC_BPGB_FIX | 
                      _0000_BSC_BPHB_FIX | _0000_BSC_BPFB_FIX | _0000_BSC_BPEB_FIX;
    BSC.BEREN.BYTE = _01_BSC_IGAEN_ENABLE | _02_BSC_TOEN_ENABLE;

    /* Set CS1 control registers */
    BSC.CS1MOD.WORD = _0000_BSC_WRMOD_BYTE | _0000_BSC_EWENB_DISABLED | _0000_BSC_PWENB_DISABLED;
    BSC.CS1WCR1.LONG = _00020000_BSC_CSWWAIT_2 | _00000000_BSC_CSRWAIT_0;
    BSC.CS1WCR2.LONG = _00000000_BSC_CSROFF_0 | _00000000_BSC_CSWOFF_0 | _00000000_BSC_WDOFF_0 | 
                       _00000000_BSC_RDON_0 | _00100000_BSC_WRON_1 | _01000000_BSC_WDON_1 | _00000000_BSC_CSON_0;
    BSC.CS1CR.WORD = _0001_BSC_EXENB_ENABLED | _0010_BSC_BSIZE_32 | _0000_BSC_EMODE_SAME | _0000_BSC_MPXEN_SEPARATE;
    BSC.CS1REC.WORD = _0000_BSC_RRCV_0 | _0000_BSC_WRCV_0;

    /* Set BUSERR interrupt priority level */
    IPR(BSC,BUSERR) = _0F_BSC_PRIORITY_LEVEL15;

    /* Set high-drive output */
    PORT5.DSCR.BYTE = _01_P50_HIGHDRIVE_ENABLE | _02_P51_HIGHDRIVE_ENABLE | _04_P52_HIGHDRIVE_ENABLE | 
                      _08_P53_HIGHDRIVE_ENABLE;
    PORT9.DSCR.BYTE = _FF_PORT9_HIGHDRIVE_ENABLE;
    PORTA.DSCR.BYTE = _FF_PORTA_HIGHDRIVE_ENABLE;
    PORTB.DSCR.BYTE = _01_PB0_HIGHDRIVE_ENABLE | _02_PB1_HIGHDRIVE_ENABLE;
    PORTD.DSCR.BYTE = _FF_PORTD_HIGHDRIVE_ENABLE;
    PORTE.DSCR.BYTE = _FF_PORTE_HIGHDRIVE_ENABLE;
    PORTG.DSCR.BYTE = _FF_PORTG_HIGHDRIVE_ENABLE;

    /* Set CSn# output enable */
    MPC.PFCSE.BYTE = _02_BSC_CS1E_ENABLED;

    /* Set output pin select registers */
    MPC.PFCSS0.BYTE = _00_BSC_CS1S_P61;
    /* Set CS1# pin */
    PORT6.PMR.BYTE &= 0xFDU;

    /* Set address output enable registers */
    MPC.PFAOE0.BYTE = _01_BSC_A8E_ENABLED | _02_BSC_A9E_ENABLED;

    /* Set external bus control registers */
    MPC.PFBCR0.BYTE |= _01_BSC_ADRLE_ENABLED | _10_BSC_DHE_ENABLED | _20_BSC_DH32E_ENABLED | _40_BSC_WR1BC1E_ENABLED | 
                       _80_BSC_WR32BC32E_ENABLED;
    MPC.PFBCR1.BYTE |= _00_BSC_ALEOE_DISABLED;
    /* Set BC0# pin */
    PORTA.PMR.BYTE &= 0xFEU;
    /* Set WR0# pin */
    PORT5.PMR.BYTE &= 0xFEU;
    /* Set BC1#/WR1# pin */
    PORT5.PMR.BYTE &= 0xFDU;
    /* Set BC2#/WR2# pin */
    PORT1.PMR.BYTE &= 0xF7U;
    /* Set BC3#/WR3# pin */
    PORT1.PMR.BYTE &= 0xFBU;  
    /* Set RD# pin */
    PORT5.PMR.BYTE &= 0xFBU;
    /* Set DQM2 pin */
    PORTA.PMR.BYTE &= 0xFEU;
    /* Set DQM3 pin */
    PORTA.PMR.BYTE &= 0xFDU;

    /* Set external bus and on-chip rom settings */
    SYSTEM.SCKCR.BIT.PSTOP1 = 1U;
    SYSTEM.SYSCR0.WORD = _5A01_BSC_ROME_ENABLED | _5A02_BSC_EXBE_ENABLED;
    SYSTEM.SCKCR.BIT.PSTOP1 = 0U;
}
/***********************************************************************************************************************
* Function Name: R_BSC_Error_Monitoring_Start
* Description  : This function enables illegal address access error or timeout detection.
* Arguments    : None
* Return Value : None
***********************************************************************************************************************/
void R_BSC_Error_Monitoring_Start(void)
{
    /* Enable BUSERR interrupt in ICU */
    IEN(BSC,BUSERR) = 1U;
}
/***********************************************************************************************************************
* Function Name: R_BSC_Error_Monitoring_Stop
* Description  : This function disables illegal address access error or timeout detection.
* Arguments    : None
* Return Value : None
***********************************************************************************************************************/
void R_BSC_Error_Monitoring_Stop(void)
{
    /* Disable BUSERR interrupt in ICU */
    IEN(BSC,BUSERR) = 0U;
}

/* Start user code for adding. Do not edit comment generated here */
/* End user code. Do not edit comment generated here */
