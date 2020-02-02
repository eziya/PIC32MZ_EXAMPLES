#include "main.h"
#include "common.h"
#include "uart.h"
#include "spi_master.h"
#include "u8g2/u8g2.h"

#define bitmap_width 64
#define bitmap_height 16

extern uint8_t u8x8_pic32_gpio_and_delay(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, void *arg_ptr);
extern uint8_t u8x8_byte_pic32_hw_spi(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, void *arg_ptr);

static u8g2_t u8g2;

static uint16_t x;
static uint16_t offset;
static uint16_t width;
static char strWidth[4];
const char *text = "PIC32 u8g2 Demo!!!";

void main(void) {

    SS_TRIS = 0;
    DC_TRIS = 0;
    RST_TRIS = 0;

    sysInit();
    UART_Init();
    SPI_Init();

    u8g2_Setup_ssd1306_128x64_noname_f(&u8g2, U8G2_R0, u8x8_byte_pic32_hw_spi, u8x8_pic32_gpio_and_delay);
    u8g2_InitDisplay(&u8g2);
    u8g2_SetPowerSave(&u8g2, 0);
        
    printf("%s\r\n", "### PIC32MZ SPI u8g2 Demo ###");
    
    u8g2_SetFont(&u8g2, u8g2_font_helvR12_tf);
    width = u8g2_GetUTF8Width(&u8g2, text);
    sprintf(strWidth, "%d", width);
    u8g2_SetFontMode(&u8g2, 0);

    while (1) {
                        
        u8g2_FirstPage(&u8g2);
        do {            
            u8g2_SetFont(&u8g2, u8g2_font_helvR12_tf);
            u8g2_DrawUTF8(&u8g2, offset, 30, text);                        
            u8g2_SetFont(&u8g2, u8g2_font_inr16_mf);
            u8g2_DrawUTF8(&u8g2, 0, 58, strWidth);
        } while (u8g2_NextPage(&u8g2));
        
        offset -= 1;
        if(offset < -width) offset = 0;
        
        __delay_ms(10);
    };
}
