/***********************************************************************************************************************
 * DISCLAIMER
 * This software is supplied by Renesas Electronics Corporation and is only intended for use with Renesas products. No
 * other uses are authorized. This software is owned by Renesas Electronics Corporation and is protected under all
 * applicable laws, including copyright laws.
 * THIS SOFTWARE IS PROVIDED "AS IS" AND RENESAS MAKES NO WARRANTIES REGARDING
 * THIS SOFTWARE, WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. ALL SUCH WARRANTIES ARE EXPRESSLY DISCLAIMED. TO THE MAXIMUM
 * EXTENT PERMITTED NOT PROHIBITED BY LAW, NEITHER RENESAS ELECTRONICS CORPORATION NOR ANY OF ITS AFFILIATED COMPANIES
 * SHALL BE LIABLE FOR ANY DIRECT, INDIRECT, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES FOR ANY REASON RELATED TO THIS
 * SOFTWARE, EVEN IF RENESAS OR ITS AFFILIATES HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
 * Renesas reserves the right, without notice, to make changes to this software and to discontinue the availability of
 * this software. By using this software, you agree to the additional terms and conditions found by accessing the
 * following link:
 * http://www.renesas.com/disclaimer
 *
 * Copyright (C) 2014(2017) Renesas Electronics Corporation. All rights reserved.
 ***********************************************************************************************************************/
/***********************************************************************************************************************
 * File Name    : r_usb_plibusbip.c
 * Description  : USB IP Peripheral library.
 ***********************************************************************************************************************/
/**********************************************************************************************************************
 * History : DD.MM.YYYY Version Description
 *         : 08.01.2014 1.00 First Release
 *         : 26.12.2014 1.10 RX71M is added
 *         : 30.09.2015 1.11 RX63N/RX631 is added.
 *         : 30.09.2016 1.20 RX65N/RX651 is added.
 *         : 26.01.2017 1.21 Support DMAC Technical Update for RX71M/RX64M USBA.
 *         : 30.09.2017 1.22 Rename "usb_pstd_buf2fifo"->"usb_pstd_buf_to_fifo" and Function move for"r_usb_pdriver.c"
 ***********************************************************************************************************************/

/******************************************************************************
 Includes   <System Includes> , "Project Includes"
 ******************************************************************************/

#include "r_usb_basic_if.h"
#include "r_usb_typedef.h"
#include "r_usb_extern.h"
#include "r_usb_bitdefine.h"
#include "r_usb_reg_access.h"

#if ((USB_CFG_DTC == USB_CFG_ENABLE) || (USB_CFG_DMA == USB_CFG_ENABLE))
#include "r_usb_dmac.h"
#endif  /* ((USB_CFG_DTC == USB_CFG_ENABLE) || (USB_CFG_DMA == USB_CFG_ENABLE)) */

#if ( (USB_CFG_MODE & USB_CFG_PERI) == USB_CFG_PERI )
/******************************************************************************
 Renesas Abstracted Host Lib IP functions
 ******************************************************************************/

/******************************************************************************
 Function Name   : usb_pstd_epadr2pipe
 Description     : Get the associated pipe no. of the specified endpoint.
 Arguments       : uint16_t dir_ep : Direction + endpoint number.
 Return value    : uint16_t        : OK    : Pipe number.
                 :                 : ERROR : Error.
 ******************************************************************************/
uint16_t usb_pstd_epadr2pipe(uint16_t dir_ep)
{
    uint16_t i;
    uint16_t direp;
    uint16_t tmp;
    uint16_t * ptable;

    /* Peripheral */
    /* Get PIPE Number from Endpoint address */
    ptable = g_usb_pstd_driver.p_pipetbl;
    direp = (uint16_t)(((dir_ep & 0x80) >> 3) | (dir_ep & 0x0F));

    /* EP table loop */
    for (i = 0; USB_PDTBLEND != ptable[i]; i += USB_EPL)
    {
        tmp = (uint16_t)(ptable[i + 1] & (USB_DIRFIELD | USB_EPNUMFIELD));

        /* EP table endpoint dir check */
        if (direp == tmp)
        {
            return ptable[i];
        }
    }

    return USB_ERROR;
}
/******************************************************************************
 End of function usb_pstd_epadr2pipe
 ******************************************************************************/

/******************************************************************************
 Function Name   : usb_pstd_pipe2fport
 Description     : Get port No. from the specified pipe No. by argument
 Arguments       : uint16_t pipe  : Pipe number.
 Return value    : uint16_t       : FIFO port selector.
 ******************************************************************************/
uint16_t usb_pstd_pipe2fport(uint16_t pipe)
{
    uint16_t fifo_mode = USB_CUSE;

#if ((USB_CFG_DTC == USB_CFG_ENABLE) || (USB_CFG_DMA == USB_CFG_ENABLE))

    if (USB_PIPE1 == pipe)
    {
        fifo_mode = USB_D0DMA;
    }
    if (USB_PIPE2 == pipe)
    {
        fifo_mode = USB_D1DMA;
    }

#endif  /* ((USB_CFG_DTC == USB_CFG_ENABLE) || (USB_CFG_DMA == USB_CFG_ENABLE)) */

    return fifo_mode;
}
/******************************************************************************
 End of function usb_pstd_pipe2fport
 ******************************************************************************/

/******************************************************************************
 Function Name   : usb_pstd_hi_speed_enable
 Description     : Check if set to Hi-speed.
 Arguments       : none
 Return value    : uint16_t       : YES; Hi-Speed enabled.
                 :                : NO; Hi-Speed disabled.
 ******************************************************************************/
uint16_t usb_pstd_hi_speed_enable(void)
{
    uint16_t buf;

    buf = hw_usb_read_syscfg(USB_NULL, USB_NULL);

    if ((buf & USB_HSE) == USB_HSE)
    {
        /* Hi-Speed Enable */
        return USB_TRUE;
    }
    else
    {
        /* Hi-Speed Disable */
        return USB_FALSE;
    }
}
/******************************************************************************
 End of function usb_pstd_hi_speed_enable
 ******************************************************************************/

/******************************************************************************
 Function Name   : usb_pstd_send_start
 Description     : Start data transmission using CPU/DMA transfer to USB host.
 Arguments       : uint16_t pipe  : Pipe no.
 Return value    : none
 ******************************************************************************/
void usb_pstd_send_start(uint16_t pipe)
{
    usb_utr_t *pp;
    uint32_t length;
    uint16_t useport;
#if ((USB_CFG_DTC == USB_CFG_ENABLE) || (USB_CFG_DMA == USB_CFG_ENABLE))
    uint16_t ip;
    uint16_t ch;
#endif  /* ((USB_CFG_DTC == USB_CFG_ENABLE) || (USB_CFG_DMA == USB_CFG_ENABLE)) */

    /* Evacuation pointer */
    pp = g_p_usb_pstd_pipe[pipe];
    length = pp->tranlen;

    /* Select NAK */
    usb_cstd_select_nak(USB_NULL, pipe);

    /* Set data count */
    g_usb_pstd_data_cnt[pipe] = length;

    /* Set data pointer */
    g_p_usb_pstd_data[pipe] = (uint8_t*)pp->p_tranadr;

    /* BEMP Status Clear */
    hw_usb_clear_status_bemp(USB_NULL,pipe);

    /* BRDY Status Clear */
    hw_usb_clear_sts_brdy(USB_NULL,pipe);

    /* Pipe number to FIFO port select */
    useport = usb_pstd_pipe2fport(pipe);

    /* Check use FIFO access */
    switch (useport)
    {
        /* CFIFO use */
        case USB_CUSE:

            /* Buffer to FIFO data write */
            usb_pstd_buf_to_fifo(pipe, useport);

            /* Set BUF */
            usb_cstd_set_buf(USB_NULL, pipe);
        break;

#if ((USB_CFG_DTC == USB_CFG_ENABLE) || (USB_CFG_DMA == USB_CFG_ENABLE))
        /* D0FIFO DMA */
        case USB_D0DMA:
        /* D1FIFO DMA */
        case USB_D1DMA:
    #if USB_CFG_USE_USBIP == USB_CFG_IP0
            ip = USB_IP0;
            ch = USB_CFG_USB0_DMA_TX;

    #else   /* USB_CFG_USE_USBIP == USB_CFG_IP0 */
            ip = USB_IP1;
            ch = USB_CFG_USB1_DMA_TX;

    #endif  /* USB_CFG_USE_USBIP == USB_CFG_IP0 */

            usb_dma_set_ch_no(ip, useport, ch);

            /* Setting for use PIPE number */
            g_usb_cstd_dma_pipe[ip][ch] = pipe;

            /* Buffer size */
            g_usb_cstd_dma_fifo[ip][ch] = usb_cstd_get_buf_size(USB_NULL, pipe);

            /* Check data count */
            if (g_usb_pstd_data_cnt[pipe] < g_usb_cstd_dma_fifo[ip][ch])
            {
                /* Transfer data size */
                g_usb_cstd_dma_size[ip][ch] = g_usb_pstd_data_cnt[pipe];
            }
            else
            {
                /* Transfer data size */
                g_usb_cstd_dma_size[ip][ch] = g_usb_pstd_data_cnt[pipe]
                - (g_usb_pstd_data_cnt[pipe] % g_usb_cstd_dma_fifo[ip][ch]);
            }

            usb_cstd_buf2dxfifo_start_dma(USB_NULL, pipe, useport);

            /* Set BUF */
            usb_cstd_set_buf(USB_NULL, pipe);
        break;
#endif  /* ((USB_CFG_DTC == USB_CFG_ENABLE) || (USB_CFG_DMA == USB_CFG_ENABLE)) */

        default:

            /* Access is NG */
            USB_PRINTF0("### USB-FW is not support\n");
            usb_pstd_forced_termination(pipe, (uint16_t)USB_DATA_ERR);
        break;
    }
}
/******************************************************************************
 End of function usb_pstd_send_start
 ******************************************************************************/

/******************************************************************************
 Function Name   : usb_pstd_write_data
 Description     : Switch PIPE, request the USB FIFO to write data, and manage
                 : the size of written data.
 Arguments       : uint16_t pipe         : Pipe no.
                 : uint16_t pipemode     : CUSE/D0DMA/D1DMA
 Return value    : uint16_t end_flag
 ******************************************************************************/
uint16_t usb_pstd_write_data(uint16_t pipe, uint16_t pipemode)
{
    uint16_t size;
    uint16_t count;
    uint16_t buffer;
    uint16_t mxps;
    uint16_t end_flag;

    /* Changes FIFO port by the pipe. */
    if ((USB_CUSE == pipemode) && (USB_PIPE0 == pipe))
    {
        buffer = usb_cstd_is_set_frdy(USB_NULL, pipe, (uint16_t)USB_CUSE, (uint16_t)USB_ISEL);
    }
    else
    {
        buffer = usb_cstd_is_set_frdy(USB_NULL, pipe, (uint16_t)pipemode, USB_FALSE);
    }

    /* Check error */
    if (USB_FIFOERROR == buffer)
    {
        /* FIFO access error */
        return (USB_FIFOERROR);
    }

    /* Data buffer size */
    size = usb_cstd_get_buf_size(USB_NULL, pipe);

    /* Max Packet Size */
    mxps = usb_cstd_get_maxpacket_size(USB_NULL, pipe);

    /* Data size check */
    if (g_usb_pstd_data_cnt[pipe] <= (uint32_t)size)
    {
        count = (uint16_t)g_usb_pstd_data_cnt[pipe];

        /* Data count check */
        if (0 == count)
        {
            /* Null Packet is end of write */
            end_flag = USB_WRITESHRT;
        }
        else if ((count % mxps) != 0)
        {
            /* Short Packet is end of write */
            end_flag = USB_WRITESHRT;
        }
        else
        {
            if (USB_PIPE0 == pipe)
            {
                /* Just Send Size */
                end_flag = USB_WRITING;
            }
            else
            {
                /* Write continues */
                end_flag = USB_WRITEEND;
            }
        }
    }
    else
    {
        /* Write continues */
        end_flag = USB_WRITING;
        count = size;
    }

    g_p_usb_pstd_data[pipe] = usb_pstd_write_fifo(count, pipemode, g_p_usb_pstd_data[pipe]);

    /* Check data count to remain */
    if (g_usb_pstd_data_cnt[pipe] < (uint32_t)size)
    {
        /* Clear data count */
        g_usb_pstd_data_cnt[pipe] = (uint32_t)0u;

        /* Read CFIFOCTR */
        buffer = hw_usb_read_fifoctr(USB_NULL,pipemode);

        /* Check BVAL */
        if ((buffer & USB_BVAL) == 0u)
        {
            /* Short Packet */
            hw_usb_set_bval(USB_NULL,pipemode);
        }
    }
    else
    {
        /* Total data count - count */
        g_usb_pstd_data_cnt[pipe] -= count;
    }

    /* End or Err or Continue */
    return end_flag;
}
/******************************************************************************
 End of function usb_pstd_write_data
 ******************************************************************************/

/******************************************************************************
 Function Name   : usb_pstd_receive_start
 Description     : Start data reception using CPU/DMA transfer to USB Host.
 Arguments       : uint16_t pipe  : Pipe no.
 Return value    : none
 ******************************************************************************/
void usb_pstd_receive_start(uint16_t pipe)
{
    usb_utr_t *pp;
    uint32_t length;
    uint16_t mxps;
    uint16_t useport;
#if ((USB_CFG_DTC == USB_CFG_ENABLE) || (USB_CFG_DMA == USB_CFG_ENABLE))
    uint16_t ip;
    uint16_t ch;
#endif  /* ((USB_CFG_DTC == USB_CFG_ENABLE) || (USB_CFG_DMA == USB_CFG_ENABLE)) */

    /* Evacuation pointer */
    pp = g_p_usb_pstd_pipe[pipe];
    length = pp->tranlen;

    /* Select NAK */
    usb_cstd_select_nak(USB_NULL, pipe);

    /* Set data count */
    g_usb_pstd_data_cnt[pipe] = length;

    /* Set data pointer */
    g_p_usb_pstd_data[pipe] = (uint8_t*)pp->p_tranadr;

    /* Pipe number to FIFO port select */
    useport = usb_pstd_pipe2fport(pipe);

    /* Check use FIFO access */
    switch (useport)
    {
        /* CFIFO use */
        case USB_CUSE:

        /* Changes the FIFO port by the pipe. */
        usb_cstd_chg_curpipe(USB_NULL, pipe, useport, USB_FALSE);

        /* Max Packet Size */
        mxps = usb_cstd_get_maxpacket_size(USB_NULL, pipe);
        if ((uint32_t)0u != length)
        {
            /* Data length check */
            if ((length % mxps) == (uint32_t)0u)
            {
                /* Set Transaction counter */
                usb_cstd_set_transaction_counter(USB_NULL, pipe, (uint16_t)(length / mxps));
            }
            else
            {
                /* Set Transaction counter */
                usb_cstd_set_transaction_counter(USB_NULL, pipe, (uint16_t)((length / mxps) + (uint32_t)1u));
            }
        }

        /* Set BUF */
        usb_cstd_set_buf(USB_NULL, pipe);

        /* Enable Ready Interrupt */
        hw_usb_set_brdyenb(USB_NULL,pipe);

        /* Enable Not Ready Interrupt */
        usb_cstd_nrdy_enable(USB_NULL, pipe);
        break;

#if ((USB_CFG_DTC == USB_CFG_ENABLE) || (USB_CFG_DMA == USB_CFG_ENABLE))
        /* D0FIFO DMA */
        case USB_D0DMA:
        /* D1FIFOB DMA */
        case USB_D1DMA:
#if USB_CFG_USE_USBIP == USB_CFG_IP0
        ip = USB_IP0;
        ch = USB_CFG_USB0_DMA_RX;

#else   /* USB_CFG_USE_USBIP == USB_CFG_IP0 */
        ip = USB_IP1;
        ch = USB_CFG_USB1_DMA_RX;

#endif  /* USB_CFG_USE_USBIP == USB_CFG_IP0 */

        usb_dma_set_ch_no(ip, useport, ch);

        /* Setting for use PIPE number */
        g_usb_cstd_dma_pipe[ip][ch] = pipe;

        /* Buffer size */
        g_usb_cstd_dma_fifo[ip][ch] = usb_cstd_get_buf_size(USB_NULL, pipe);

        /* Transfer data size */
        g_usb_cstd_dma_size[ip][ch]
        = g_usb_pstd_data_cnt[pipe];
        usb_cstd_dxfifo2buf_start_dma(USB_NULL, pipe, useport, length);
        break;

#endif  /* ((USB_CFG_DTC == USB_CFG_ENABLE) || (USB_CFG_DMA == USB_CFG_ENABLE)) */

        default:
        USB_PRINTF0("### USB-FW is not support\n");
        usb_pstd_forced_termination(pipe, (uint16_t)USB_DATA_ERR);
        break;
    }
}
/******************************************************************************
 End of function usb_pstd_receive_start
 ******************************************************************************/

/******************************************************************************
 Function Name   : usb_pstd_read_data
 Description     : Request to read data from USB FIFO, and manage the size of
                 : the data read.
 Arguments       : uint16_t pipe         : Pipe no.
                 : uint16_t pipemode     : FIFO select(USB_CUSE,USB_DMA0,....)
 Return value    : uint16_t end_flag
 ******************************************************************************/
uint16_t usb_pstd_read_data(uint16_t pipe, uint16_t pipemode)
{
    uint16_t count;
    uint16_t buffer;
    uint16_t mxps;
    uint16_t dtln;
    uint16_t end_flag;

    /* Changes FIFO port by the pipe. */
    buffer = usb_cstd_is_set_frdy(USB_NULL, pipe, (uint16_t)pipemode, USB_FALSE);
    if (USB_FIFOERROR == buffer)
    {
        /* FIFO access error */
        return (USB_FIFOERROR);
    }
    dtln = (uint16_t)(buffer & USB_DTLN);

    /* Max Packet Size */
    mxps = usb_cstd_get_maxpacket_size(USB_NULL, pipe);

    if (g_usb_pstd_data_cnt[pipe] < dtln)
    {
        /* Buffer Over ? */
        end_flag = USB_READOVER;

        /* Set NAK */
        usb_cstd_set_nak(USB_NULL, pipe);
        count = (uint16_t)g_usb_pstd_data_cnt[pipe];
        g_usb_pstd_data_cnt[pipe] = dtln;
    }
    else if (g_usb_pstd_data_cnt[pipe] == dtln)
    {
        /* Just Receive Size */
        count = dtln;
        if ((USB_PIPE0 == pipe) && ((dtln % mxps) == 0))
        {
            /* Just Receive Size */
            /* Peripheral Function */
            end_flag = USB_READING;
        }
        else
        {
            end_flag = USB_READEND;

            /* Set NAK */
            usb_cstd_select_nak(USB_NULL, pipe);
        }
    }
    else
    {
        /* Continus Receive data */
        count = dtln;
        end_flag = USB_READING;
        if (0 == count)
        {
            /* Null Packet receive */
            end_flag = USB_READSHRT;

            /* Select NAK */
            usb_cstd_select_nak(USB_NULL, pipe);
        }
        if ((count % mxps) != 0)
        {
            /* Null Packet receive */
            end_flag = USB_READSHRT;

            /* Select NAK */
            usb_cstd_select_nak(USB_NULL, pipe);
        }
    }

    if (0 == dtln)
    {
        /* 0 length packet */
        /* Clear BVAL */
        hw_usb_set_bclr(USB_NULL,pipemode);
    }
    else
    {
        g_p_usb_pstd_data[pipe] = usb_pstd_read_fifo(count, pipemode, g_p_usb_pstd_data[pipe]);
    }
    g_usb_pstd_data_cnt[pipe] -= count;

    /* End or Err or Continue */
    return (end_flag);
}
/******************************************************************************
 End of function usb_pstd_read_data
 ******************************************************************************/

/******************************************************************************
 Function Name   : usb_pstd_data_end
 Description     : Set USB registers as appropriate after data transmission/re-
                 : ception, and call the callback function as transmission/recep-
                 : tion is complete.
 Arguments       : uint16_t pipe     : Pipe no.
                 : uint16_t status   : Transfer status type.
 Return value    : none
 ******************************************************************************/
void usb_pstd_data_end(uint16_t pipe, uint16_t status)
{
    uint16_t useport;
#if ((USB_CFG_DTC == USB_CFG_ENABLE) || (USB_CFG_DMA == USB_CFG_ENABLE))
    uint16_t ip;

#if USB_CFG_USE_USBIP == USB_CFG_IP0
    ip = USB_IP0;
#else   /* USB_CFG_USE_USBIP == USB_CFG_IP0 */
    ip = USB_IP1;
#endif  /* USB_CFG_USE_USBIP == USB_CFG_IP0 */
#endif  /* ((USB_CFG_DTC == USB_CFG_ENABLE) || (USB_CFG_DMA == USB_CFG_ENABLE)) */

    /* PID = NAK */
    /* Set NAK */
    usb_cstd_select_nak(USB_NULL, pipe);

    /* Pipe number to FIFO port select */
    useport = usb_pstd_pipe2fport(pipe);

    /* Disable Interrupt */
    /* Disable Ready Interrupt */
    hw_usb_clear_brdyenb(USB_NULL,pipe);

    /* Disable Not Ready Interrupt */
    hw_usb_clear_nrdyenb(USB_NULL,pipe);

    /* Disable Empty Interrupt */
    hw_usb_clear_bempenb(USB_NULL,pipe);

    /* Disable Transaction count */
    usb_cstd_clr_transaction_counter(USB_NULL, pipe);

    /* Check use FIFO */
    switch (useport)
    {
        /* CFIFO use */
        case USB_CUSE:
        break;

#if ((USB_CFG_DTC == USB_CFG_ENABLE) || (USB_CFG_DMA == USB_CFG_ENABLE))
        /* D0FIFO DMA */
        case USB_D0DMA:

            /* DMA buffer clear mode clear */
            hw_usb_clear_dclrm(USB_NULL, useport);
            if (USB_USBIP_0 == ip)
            {
                hw_usb_set_mbw( USB_NULL, USB_D0DMA, USB0_D0FIFO_MBW );
            }
            else if (USB_USBIP_1 == ip)
            {
                hw_usb_set_mbw( USB_NULL, USB_D0DMA, USB1_D0FIFO_MBW );
            }
            else
            {
                /* IP error */
            }
        break;

        /* D1FIFO DMA */
        case USB_D1DMA:

            /* DMA buffer clear mode clear */
            hw_usb_clear_dclrm(USB_NULL, useport);
            if (USB_USBIP_0 == ip)
            {
                hw_usb_set_mbw( USB_NULL, USB_D1DMA, USB0_D1FIFO_MBW );
            }
            else if (USB_USBIP_1 == ip)
            {
                hw_usb_set_mbw( USB_NULL, USB_D1DMA, USB1_D1FIFO_MBW );
            }
            else
            {
                /* IP error */
            }
        break;

#endif  /* ((USB_CFG_DTC == USB_CFG_ENABLE) || (USB_CFG_DMA == USB_CFG_ENABLE)) */

        default:
        break;
    }

    /* Call Back */
    if (USB_NULL != g_p_usb_pstd_pipe[pipe])
    {
        /* Check PIPE TYPE */
        if (usb_cstd_get_pipe_type(USB_NULL, pipe) != USB_ISO)
        {
            /* Transfer information set */
            g_p_usb_pstd_pipe[pipe]->tranlen = g_usb_pstd_data_cnt[pipe];
            g_p_usb_pstd_pipe[pipe]->status = status;
            g_p_usb_pstd_pipe[pipe]->pipectr = hw_usb_read_pipectr(USB_NULL,pipe);
            g_p_usb_pstd_pipe[pipe]->keyword = pipe;
            if (USB_NULL == g_p_usb_pstd_pipe[pipe]->complete)   /* Chack Callback function */
            {
                while(1)
                {
                    /* Error Stop */
                }
            }
            ((usb_cb_t)g_p_usb_pstd_pipe[pipe]->complete)(g_p_usb_pstd_pipe[pipe], USB_NULL, USB_NULL);
            g_p_usb_pstd_pipe[pipe] = (usb_utr_t*)USB_NULL;
        }
        else
        {
            /* Transfer information set */
            g_p_usb_pstd_pipe[pipe]->tranlen = g_usb_pstd_data_cnt[pipe];
            g_p_usb_pstd_pipe[pipe]->pipectr = hw_usb_read_pipectr(USB_NULL,pipe);

            /* Data Transfer (restart) */
            if (usb_cstd_get_pipe_dir(USB_NULL, pipe) == USB_BUF2FIFO)
            {
                /* OUT Transfer */
                g_p_usb_pstd_pipe[pipe]->status = USB_DATA_WRITING;
                if (USB_NULL == g_p_usb_pstd_pipe[pipe]->complete)   /* Chack Callback function */
                {
                    while(1)
                    {
                        /* Error Stop */
                    }
                }
                ((usb_cb_t)g_p_usb_pstd_pipe[pipe]->complete)(g_p_usb_pstd_pipe[pipe], USB_NULL, USB_NULL);
            }
            else
            {
                /* IN Transfer */
                g_p_usb_pstd_pipe[pipe]->status = USB_DATA_READING;
                if (USB_NULL == g_p_usb_pstd_pipe[pipe]->complete)   /* Chack Callback function */
                {
                    while(1)
                    {
                        /* Error Stop */
                    }
                }
                ((usb_cb_t)g_p_usb_pstd_pipe[pipe]->complete)(g_p_usb_pstd_pipe[pipe], USB_NULL, USB_NULL);
            }
        }
    }
}
/******************************************************************************
 End of function usb_pstd_data_end
 ******************************************************************************/

/******************************************************************************
 Function Name   : usb_pstd_brdy_pipe_process
 Description     : Search for the PIPE No. that BRDY interrupt occurred, and
                 : request data transmission/reception from the PIPE
 Arguments       : uint16_t bitsts       ; BRDYSTS Register & BRDYENB Register
 Return value    : none
 ******************************************************************************/
void usb_pstd_brdy_pipe_process(uint16_t bitsts)
{
    uint16_t useport;
    uint16_t i;
#if ((USB_CFG_DTC == USB_CFG_ENABLE) || (USB_CFG_DMA == USB_CFG_ENABLE))
    uint16_t buffer;
    uint16_t maxps;
    uint16_t set_dtc_brock_cnt;
    uint16_t trans_dtc_block_cnt;
    uint16_t dma_ch;
    uint16_t status;

#endif  /* ((USB_CFG_DTC == USB_CFG_ENABLE) || (USB_CFG_DMA == USB_CFG_ENABLE)) */

    for (i = USB_PIPE1; i <= USB_MAX_PIPE_NO; i++)
    {
        if ((bitsts & USB_BITSET(i)) != 0u)
        {
            /* Interrupt check */
            hw_usb_clear_status_bemp(USB_NULL, i);

            if (USB_NULL != g_p_usb_pstd_pipe[i])
            {
                /* Pipe number to FIFO port select */
                useport = usb_pstd_pipe2fport(i);

#if ((USB_CFG_DTC == USB_CFG_ENABLE) || (USB_CFG_DMA == USB_CFG_ENABLE))
                if ((USB_D0DMA == useport) || (USB_D1DMA == useport))
                {
                    dma_ch = usb_dma_ref_ch_no(USB_CFG_USE_USBIP, useport);

                    maxps = g_usb_cstd_dma_fifo[USB_CFG_USE_USBIP][dma_ch];

                    /* DMA Transfer request disable */
                    hw_usb_clear_dreqe( USB_NULL, useport );

                    /* DMA stop */
                    usb_dma_stop_dxfifo(USB_CFG_USE_USBIP, useport);

                    /* Changes FIFO port by the pipe. */
                    buffer = usb_cstd_is_set_frdy(USB_NULL, i, useport, USB_FALSE);

                    set_dtc_brock_cnt = (uint16_t)((g_usb_pstd_data_cnt[g_usb_cstd_dma_pipe[USB_CFG_USE_USBIP][dma_ch]] -1)
                            / g_usb_cstd_dma_fifo[USB_CFG_USE_USBIP][dma_ch]) +1;

                    trans_dtc_block_cnt = usb_dma_get_crtb(dma_ch);

                    /* Get D0fifo Receive Data Length */
                    g_usb_cstd_dma_size[USB_CFG_USE_USBIP][dma_ch]
                    = (uint32_t)(buffer & USB_DTLN) + ((set_dtc_brock_cnt - (trans_dtc_block_cnt + 1)) * maxps);

                    /* Check data count */
                    if (g_usb_cstd_dma_size[USB_CFG_USE_USBIP][dma_ch] == g_usb_pstd_data_cnt[i])
                    {
                        status = USB_DATA_OK;
                    }
                    else if (g_usb_cstd_dma_size[USB_CFG_USE_USBIP][dma_ch] > g_usb_pstd_data_cnt[i])
                    {
                        status = USB_DATA_OVR;
                    }
                    else
                    {
                        status = USB_DATA_SHT;
                    }

                    /* D0FIFO access DMA stop */
                    usb_cstd_dxfifo_stop(USB_NULL, useport);

                    /* End of data transfer */
                    usb_pstd_data_end(i, status);

                    /* Set BCLR */
                    hw_usb_set_bclr(USB_NULL, useport );
                }

#endif  /* ((USB_CFG_DTC == USB_CFG_ENABLE) || (USB_CFG_DMA == USB_CFG_ENABLE)) */

                if (USB_CUSE == useport)
                {
                    if (USB_BUF2FIFO == usb_cstd_get_pipe_dir(USB_NULL, i))
                    {
                        /* Buffer to FIFO data write */
                        usb_pstd_buf_to_fifo(i, useport);
                    }
                    else
                    {
                        /* FIFO to Buffer data read */
                        usb_pstd_fifo_to_buf(i, useport);
                    }
                }
            }
        }
    }
}/* End of function usb_pstd_brdy_pipe_process() */

/******************************************************************************
 Function Name   : usb_pstd_nrdy_pipe_process
 Description     : Search for PIPE No. that occurred NRDY interrupt, and execute
                 : the process for PIPE when NRDY interrupt occurred
 Arguments       : uint16_t bitsts       ; NRDYSTS Register & NRDYENB Register
 Return value    : none
 ******************************************************************************/
void usb_pstd_nrdy_pipe_process(uint16_t bitsts)
{
    uint16_t buffer;
    uint16_t i;

    for (i = USB_MIN_PIPE_NO; i <= USB_MAX_PIPE_NO; i++)
    {
        if ((bitsts & USB_BITSET(i)) != 0)
        {
            /* Interrupt check */
            if (USB_NULL != g_p_usb_pstd_pipe[i])
            {
                if (usb_cstd_get_pipe_type(USB_NULL, i) == USB_ISO)
                {
                    /* Wait for About 60ns */
                    buffer = hw_usb_read_frmnum(USB_NULL);
                    if ((buffer & USB_OVRN) == USB_OVRN)
                    {
                        /* @1 */
                        /* End of data transfer */
                        usb_pstd_forced_termination(i, (uint16_t)USB_DATA_OVR);
                        USB_PRINTF1("###ISO OVRN %d\n", g_usb_pstd_data_cnt[i]);
                    }
                    else
                    {
                        /* @2 */
                        /* End of data transfer */
                        usb_pstd_forced_termination(i, (uint16_t)USB_DATA_ERR);
                    }
                }
                else
                {
                    /* Non processing. */
                }
            }
        }
    }
}
/******************************************************************************
 End of function usb_pstd_nrdy_pipe_process
 ******************************************************************************/

/******************************************************************************
 Function Name   : usb_pstd_bemp_pipe_process
 Description     : Search for PIPE No. that BEMP interrupt occurred, 
                 : and complete data transmission for the PIPE
 Arguments       : uint16_t bitsts       ; BEMPSTS Register & BEMPENB Register
 Return value    : none
 ******************************************************************************/
void usb_pstd_bemp_pipe_process(uint16_t bitsts)
{
    uint16_t buffer;
    uint16_t i;

    for (i = USB_MIN_PIPE_NO; i <= USB_PIPE5; i++)
    {
        if ((bitsts & USB_BITSET(i)) != 0)
        {
            /* Interrupt check */
            if (USB_NULL != g_p_usb_pstd_pipe[i])
            {
                buffer = usb_cstd_get_pid(USB_NULL, i);

                /* MAX packet size error ? */
                if ((buffer & USB_PID_STALL) == USB_PID_STALL)
                {
                    USB_PRINTF1("### STALL Pipe %d\n", i);
                    usb_pstd_forced_termination(i, (uint16_t)USB_DATA_STALL);
                }
                else
                {
                    if ((hw_usb_read_pipectr(USB_NULL, i) & USB_INBUFM) != USB_INBUFM)
                    {
                        usb_pstd_data_end(i, (uint16_t)USB_DATA_NONE);
                    }
                    else
                    {
                        /* set BEMP enable */
                        hw_usb_set_bempenb(USB_NULL, i);
                    }
                }
            }
        }
    }
    for (i = USB_PIPE6; i <= USB_MAX_PIPE_NO; i++)
    {
        /* Interrupt check */
        if ((bitsts & USB_BITSET(i)) != 0)
        {
            if (USB_NULL != g_p_usb_pstd_pipe[i])
            {
                buffer = usb_cstd_get_pid(USB_NULL, i);

                /* MAX packet size error ? */
                if ((buffer & USB_PID_STALL) == USB_PID_STALL)
                {
                    USB_PRINTF1("### STALL Pipe %d\n", i);
                    usb_pstd_forced_termination(i, (uint16_t)USB_DATA_STALL);
                }
                else
                {
                    /* End of data transfer */
                    usb_pstd_data_end(i, (uint16_t)USB_DATA_NONE);
                }
            }
        }
    }
}
/******************************************************************************
 End of function usb_pstd_bemp_pipe_process
 ******************************************************************************/

#endif  /* (USB_CFG_MODE & USB_CFG_PERI) == USB_CFG_PERI */

/******************************************************************************
 End  Of File
 ******************************************************************************/
