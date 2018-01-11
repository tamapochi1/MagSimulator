/***********************************************************************/
/*                                                                     */
/*  FILE        : Main.c                                   */
/*  DATE        :Tue, Oct 31, 2006                                     */
/*  DESCRIPTION :Main Program                                          */
/*  CPU TYPE    :                                                      */
/*                                                                     */
/*  NOTE:THIS IS A TYPICAL EXAMPLE.                                    */
/*                                                                     */
/***********************************************************************/
//#include "typedefine.h"
#include "r_usb_basic_if.h"
#include "r_usb_pcdc_if.h"
#include "r_usb_pcdc_descriptor.h"

#define DATA_LEN                (64)

void main(void);
static void     usb_pin_setting (void);

static uint8_t  g_buf[DATA_LEN];

const static usb_descriptor_t usb_descriptor =
{
    g_apl_device,
    g_apl_configuration,
    g_apl_hs_configuration,
    g_apl_qualifier_descriptor,
    g_apl_string_table
};

void main(void)
{
    usb_ctrl_t  ctrl;
    usb_cfg_t   cfg;

    usb_pin_setting();

    ctrl.module     = USB_IP1;
    ctrl.type       = USB_PCDC;
    cfg.usb_speed   = USB_HS;
    cfg.usb_mode    = USB_PERI;
    cfg.p_usb_reg   = (usb_descriptor_t *)&usb_descriptor;
    R_USB_Open(&ctrl, &cfg);

    /* Loop back between PC(TerminalSoft) and USB MCU */
    while (1)
    {
        switch (R_USB_GetEvent(&ctrl))
        {
            case USB_STS_CONFIGURED :
            case USB_STS_WRITE_COMPLETE :
                ctrl.type = USB_PCDC;
                R_USB_Read(&ctrl, g_buf, DATA_LEN);
            break;

            case USB_STS_READ_COMPLETE :
                R_USB_Write(&ctrl, g_buf, ctrl.size);
            break;

            default :
            break;
        }
    }
}

static void usb_pin_setting (void)
{
    R_BSP_RegisterProtectDisable(BSP_REG_PROTECT_LPC_CGC_SWR);
    R_BSP_RegisterProtectDisable(BSP_REG_PROTECT_MPC);

    PORT1.PMR.BIT.B1        = 0u;
    MPC.P11PFS.BYTE         = 0x14; /* USBA_VBUS */
    PORT1.PMR.BIT.B1        = 1u;

    R_BSP_RegisterProtectEnable(BSP_REG_PROTECT_MPC);
    R_BSP_RegisterProtectEnable(BSP_REG_PROTECT_LPC_CGC_SWR);
}
