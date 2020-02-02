#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/PIC32MZ_SPI_U8G2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/PIC32MZ_SPI_U8G2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=u8g2/u8g2_bitmap.c u8g2/u8g2_box.c u8g2/u8g2_buffer.c u8g2/u8g2_circle.c u8g2/u8g2_cleardisplay.c u8g2/u8g2_d_memory.c u8g2/u8g2_d_setup.c u8g2/u8g2_font.c u8g2/u8g2_fonts.c u8g2/u8g2_hvline.c u8g2/u8g2_input_value.c u8g2/u8g2_intersection.c u8g2/u8g2_kerning.c u8g2/u8g2_line.c u8g2/u8g2_ll_hvline.c u8g2/u8g2_message.c u8g2/u8g2_polygon.c u8g2/u8g2_selection_list.c u8g2/u8g2_setup.c u8g2/u8log.c u8g2/u8log_u8g2.c u8g2/u8log_u8x8.c u8g2/u8x8_8x8.c u8g2/u8x8_byte.c u8g2/u8x8_cad.c u8g2/u8x8_debounce.c u8g2/u8x8_display.c u8g2/u8x8_d_a2printer.c u8g2/u8x8_d_il3820_296x128.c u8g2/u8x8_d_ist3020.c u8g2/u8x8_d_ks0108.c u8g2/u8x8_d_lc7981.c u8g2/u8x8_d_ld7032_60x32.c u8g2/u8x8_d_ls013b7dh03.c u8g2/u8x8_d_max7219.c u8g2/u8x8_d_pcd8544_84x48.c u8g2/u8x8_d_pcf8812.c u8g2/u8x8_d_pcf8814_hx1230.c u8g2/u8x8_d_sbn1661.c u8g2/u8x8_d_sed1330.c u8g2/u8x8_d_sh1106_64x32.c u8g2/u8x8_d_sh1106_72x40.c u8g2/u8x8_d_sh1107.c u8g2/u8x8_d_sh1108.c u8g2/u8x8_d_sh1122.c u8g2/u8x8_d_ssd1305.c u8g2/u8x8_d_ssd1306_128x32.c u8g2/u8x8_d_ssd1306_128x64_noname.c u8g2/u8x8_d_ssd1306_48x64.c u8g2/u8x8_d_ssd1306_64x32.c u8g2/u8x8_d_ssd1306_64x48.c u8g2/u8x8_d_ssd1306_96x16.c u8g2/u8x8_d_ssd1309.c u8g2/u8x8_d_ssd1317.c u8g2/u8x8_d_ssd1318.c u8g2/u8x8_d_ssd1322.c u8g2/u8x8_d_ssd1325.c u8g2/u8x8_d_ssd1326.c u8g2/u8x8_d_ssd1327.c u8g2/u8x8_d_ssd1329.c u8g2/u8x8_d_ssd1606_172x72.c u8g2/u8x8_d_ssd1607_200x200.c u8g2/u8x8_d_st75256.c u8g2/u8x8_d_st7565.c u8g2/u8x8_d_st7567.c u8g2/u8x8_d_st7586s_erc240160.c u8g2/u8x8_d_st7586s_s028hn118a.c u8g2/u8x8_d_st7588.c u8g2/u8x8_d_st7920.c u8g2/u8x8_d_stdio.c u8g2/u8x8_d_t6963.c u8g2/u8x8_d_uc1601.c u8g2/u8x8_d_uc1604.c u8g2/u8x8_d_uc1608.c u8g2/u8x8_d_uc1610.c u8g2/u8x8_d_uc1611.c u8g2/u8x8_d_uc1617.c u8g2/u8x8_d_uc1638.c u8g2/u8x8_d_uc1701_dogs102.c u8g2/u8x8_d_uc1701_mini12864.c u8g2/u8x8_fonts.c u8g2/u8x8_gpio.c u8g2/u8x8_input_value.c u8g2/u8x8_message.c u8g2/u8x8_selection_list.c u8g2/u8x8_setup.c u8g2/u8x8_string.c u8g2/u8x8_u16toa.c u8g2/u8x8_u8toa.c common.c main.c uart.c spi_master.c u8g2_pic32mz.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/u8g2/u8g2_bitmap.o ${OBJECTDIR}/u8g2/u8g2_box.o ${OBJECTDIR}/u8g2/u8g2_buffer.o ${OBJECTDIR}/u8g2/u8g2_circle.o ${OBJECTDIR}/u8g2/u8g2_cleardisplay.o ${OBJECTDIR}/u8g2/u8g2_d_memory.o ${OBJECTDIR}/u8g2/u8g2_d_setup.o ${OBJECTDIR}/u8g2/u8g2_font.o ${OBJECTDIR}/u8g2/u8g2_fonts.o ${OBJECTDIR}/u8g2/u8g2_hvline.o ${OBJECTDIR}/u8g2/u8g2_input_value.o ${OBJECTDIR}/u8g2/u8g2_intersection.o ${OBJECTDIR}/u8g2/u8g2_kerning.o ${OBJECTDIR}/u8g2/u8g2_line.o ${OBJECTDIR}/u8g2/u8g2_ll_hvline.o ${OBJECTDIR}/u8g2/u8g2_message.o ${OBJECTDIR}/u8g2/u8g2_polygon.o ${OBJECTDIR}/u8g2/u8g2_selection_list.o ${OBJECTDIR}/u8g2/u8g2_setup.o ${OBJECTDIR}/u8g2/u8log.o ${OBJECTDIR}/u8g2/u8log_u8g2.o ${OBJECTDIR}/u8g2/u8log_u8x8.o ${OBJECTDIR}/u8g2/u8x8_8x8.o ${OBJECTDIR}/u8g2/u8x8_byte.o ${OBJECTDIR}/u8g2/u8x8_cad.o ${OBJECTDIR}/u8g2/u8x8_debounce.o ${OBJECTDIR}/u8g2/u8x8_display.o ${OBJECTDIR}/u8g2/u8x8_d_a2printer.o ${OBJECTDIR}/u8g2/u8x8_d_il3820_296x128.o ${OBJECTDIR}/u8g2/u8x8_d_ist3020.o ${OBJECTDIR}/u8g2/u8x8_d_ks0108.o ${OBJECTDIR}/u8g2/u8x8_d_lc7981.o ${OBJECTDIR}/u8g2/u8x8_d_ld7032_60x32.o ${OBJECTDIR}/u8g2/u8x8_d_ls013b7dh03.o ${OBJECTDIR}/u8g2/u8x8_d_max7219.o ${OBJECTDIR}/u8g2/u8x8_d_pcd8544_84x48.o ${OBJECTDIR}/u8g2/u8x8_d_pcf8812.o ${OBJECTDIR}/u8g2/u8x8_d_pcf8814_hx1230.o ${OBJECTDIR}/u8g2/u8x8_d_sbn1661.o ${OBJECTDIR}/u8g2/u8x8_d_sed1330.o ${OBJECTDIR}/u8g2/u8x8_d_sh1106_64x32.o ${OBJECTDIR}/u8g2/u8x8_d_sh1106_72x40.o ${OBJECTDIR}/u8g2/u8x8_d_sh1107.o ${OBJECTDIR}/u8g2/u8x8_d_sh1108.o ${OBJECTDIR}/u8g2/u8x8_d_sh1122.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1305.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x32.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_48x64.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_64x32.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_64x48.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_96x16.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1309.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1317.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1318.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1322.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1325.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1326.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1327.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1329.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1606_172x72.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1607_200x200.o ${OBJECTDIR}/u8g2/u8x8_d_st75256.o ${OBJECTDIR}/u8g2/u8x8_d_st7565.o ${OBJECTDIR}/u8g2/u8x8_d_st7567.o ${OBJECTDIR}/u8g2/u8x8_d_st7586s_erc240160.o ${OBJECTDIR}/u8g2/u8x8_d_st7586s_s028hn118a.o ${OBJECTDIR}/u8g2/u8x8_d_st7588.o ${OBJECTDIR}/u8g2/u8x8_d_st7920.o ${OBJECTDIR}/u8g2/u8x8_d_stdio.o ${OBJECTDIR}/u8g2/u8x8_d_t6963.o ${OBJECTDIR}/u8g2/u8x8_d_uc1601.o ${OBJECTDIR}/u8g2/u8x8_d_uc1604.o ${OBJECTDIR}/u8g2/u8x8_d_uc1608.o ${OBJECTDIR}/u8g2/u8x8_d_uc1610.o ${OBJECTDIR}/u8g2/u8x8_d_uc1611.o ${OBJECTDIR}/u8g2/u8x8_d_uc1617.o ${OBJECTDIR}/u8g2/u8x8_d_uc1638.o ${OBJECTDIR}/u8g2/u8x8_d_uc1701_dogs102.o ${OBJECTDIR}/u8g2/u8x8_d_uc1701_mini12864.o ${OBJECTDIR}/u8g2/u8x8_fonts.o ${OBJECTDIR}/u8g2/u8x8_gpio.o ${OBJECTDIR}/u8g2/u8x8_input_value.o ${OBJECTDIR}/u8g2/u8x8_message.o ${OBJECTDIR}/u8g2/u8x8_selection_list.o ${OBJECTDIR}/u8g2/u8x8_setup.o ${OBJECTDIR}/u8g2/u8x8_string.o ${OBJECTDIR}/u8g2/u8x8_u16toa.o ${OBJECTDIR}/u8g2/u8x8_u8toa.o ${OBJECTDIR}/common.o ${OBJECTDIR}/main.o ${OBJECTDIR}/uart.o ${OBJECTDIR}/spi_master.o ${OBJECTDIR}/u8g2_pic32mz.o
POSSIBLE_DEPFILES=${OBJECTDIR}/u8g2/u8g2_bitmap.o.d ${OBJECTDIR}/u8g2/u8g2_box.o.d ${OBJECTDIR}/u8g2/u8g2_buffer.o.d ${OBJECTDIR}/u8g2/u8g2_circle.o.d ${OBJECTDIR}/u8g2/u8g2_cleardisplay.o.d ${OBJECTDIR}/u8g2/u8g2_d_memory.o.d ${OBJECTDIR}/u8g2/u8g2_d_setup.o.d ${OBJECTDIR}/u8g2/u8g2_font.o.d ${OBJECTDIR}/u8g2/u8g2_fonts.o.d ${OBJECTDIR}/u8g2/u8g2_hvline.o.d ${OBJECTDIR}/u8g2/u8g2_input_value.o.d ${OBJECTDIR}/u8g2/u8g2_intersection.o.d ${OBJECTDIR}/u8g2/u8g2_kerning.o.d ${OBJECTDIR}/u8g2/u8g2_line.o.d ${OBJECTDIR}/u8g2/u8g2_ll_hvline.o.d ${OBJECTDIR}/u8g2/u8g2_message.o.d ${OBJECTDIR}/u8g2/u8g2_polygon.o.d ${OBJECTDIR}/u8g2/u8g2_selection_list.o.d ${OBJECTDIR}/u8g2/u8g2_setup.o.d ${OBJECTDIR}/u8g2/u8log.o.d ${OBJECTDIR}/u8g2/u8log_u8g2.o.d ${OBJECTDIR}/u8g2/u8log_u8x8.o.d ${OBJECTDIR}/u8g2/u8x8_8x8.o.d ${OBJECTDIR}/u8g2/u8x8_byte.o.d ${OBJECTDIR}/u8g2/u8x8_cad.o.d ${OBJECTDIR}/u8g2/u8x8_debounce.o.d ${OBJECTDIR}/u8g2/u8x8_display.o.d ${OBJECTDIR}/u8g2/u8x8_d_a2printer.o.d ${OBJECTDIR}/u8g2/u8x8_d_il3820_296x128.o.d ${OBJECTDIR}/u8g2/u8x8_d_ist3020.o.d ${OBJECTDIR}/u8g2/u8x8_d_ks0108.o.d ${OBJECTDIR}/u8g2/u8x8_d_lc7981.o.d ${OBJECTDIR}/u8g2/u8x8_d_ld7032_60x32.o.d ${OBJECTDIR}/u8g2/u8x8_d_ls013b7dh03.o.d ${OBJECTDIR}/u8g2/u8x8_d_max7219.o.d ${OBJECTDIR}/u8g2/u8x8_d_pcd8544_84x48.o.d ${OBJECTDIR}/u8g2/u8x8_d_pcf8812.o.d ${OBJECTDIR}/u8g2/u8x8_d_pcf8814_hx1230.o.d ${OBJECTDIR}/u8g2/u8x8_d_sbn1661.o.d ${OBJECTDIR}/u8g2/u8x8_d_sed1330.o.d ${OBJECTDIR}/u8g2/u8x8_d_sh1106_64x32.o.d ${OBJECTDIR}/u8g2/u8x8_d_sh1106_72x40.o.d ${OBJECTDIR}/u8g2/u8x8_d_sh1107.o.d ${OBJECTDIR}/u8g2/u8x8_d_sh1108.o.d ${OBJECTDIR}/u8g2/u8x8_d_sh1122.o.d ${OBJECTDIR}/u8g2/u8x8_d_ssd1305.o.d ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x32.o.d ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o.d ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_48x64.o.d ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_64x32.o.d ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_64x48.o.d ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_96x16.o.d ${OBJECTDIR}/u8g2/u8x8_d_ssd1309.o.d ${OBJECTDIR}/u8g2/u8x8_d_ssd1317.o.d ${OBJECTDIR}/u8g2/u8x8_d_ssd1318.o.d ${OBJECTDIR}/u8g2/u8x8_d_ssd1322.o.d ${OBJECTDIR}/u8g2/u8x8_d_ssd1325.o.d ${OBJECTDIR}/u8g2/u8x8_d_ssd1326.o.d ${OBJECTDIR}/u8g2/u8x8_d_ssd1327.o.d ${OBJECTDIR}/u8g2/u8x8_d_ssd1329.o.d ${OBJECTDIR}/u8g2/u8x8_d_ssd1606_172x72.o.d ${OBJECTDIR}/u8g2/u8x8_d_ssd1607_200x200.o.d ${OBJECTDIR}/u8g2/u8x8_d_st75256.o.d ${OBJECTDIR}/u8g2/u8x8_d_st7565.o.d ${OBJECTDIR}/u8g2/u8x8_d_st7567.o.d ${OBJECTDIR}/u8g2/u8x8_d_st7586s_erc240160.o.d ${OBJECTDIR}/u8g2/u8x8_d_st7586s_s028hn118a.o.d ${OBJECTDIR}/u8g2/u8x8_d_st7588.o.d ${OBJECTDIR}/u8g2/u8x8_d_st7920.o.d ${OBJECTDIR}/u8g2/u8x8_d_stdio.o.d ${OBJECTDIR}/u8g2/u8x8_d_t6963.o.d ${OBJECTDIR}/u8g2/u8x8_d_uc1601.o.d ${OBJECTDIR}/u8g2/u8x8_d_uc1604.o.d ${OBJECTDIR}/u8g2/u8x8_d_uc1608.o.d ${OBJECTDIR}/u8g2/u8x8_d_uc1610.o.d ${OBJECTDIR}/u8g2/u8x8_d_uc1611.o.d ${OBJECTDIR}/u8g2/u8x8_d_uc1617.o.d ${OBJECTDIR}/u8g2/u8x8_d_uc1638.o.d ${OBJECTDIR}/u8g2/u8x8_d_uc1701_dogs102.o.d ${OBJECTDIR}/u8g2/u8x8_d_uc1701_mini12864.o.d ${OBJECTDIR}/u8g2/u8x8_fonts.o.d ${OBJECTDIR}/u8g2/u8x8_gpio.o.d ${OBJECTDIR}/u8g2/u8x8_input_value.o.d ${OBJECTDIR}/u8g2/u8x8_message.o.d ${OBJECTDIR}/u8g2/u8x8_selection_list.o.d ${OBJECTDIR}/u8g2/u8x8_setup.o.d ${OBJECTDIR}/u8g2/u8x8_string.o.d ${OBJECTDIR}/u8g2/u8x8_u16toa.o.d ${OBJECTDIR}/u8g2/u8x8_u8toa.o.d ${OBJECTDIR}/common.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/uart.o.d ${OBJECTDIR}/spi_master.o.d ${OBJECTDIR}/u8g2_pic32mz.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/u8g2/u8g2_bitmap.o ${OBJECTDIR}/u8g2/u8g2_box.o ${OBJECTDIR}/u8g2/u8g2_buffer.o ${OBJECTDIR}/u8g2/u8g2_circle.o ${OBJECTDIR}/u8g2/u8g2_cleardisplay.o ${OBJECTDIR}/u8g2/u8g2_d_memory.o ${OBJECTDIR}/u8g2/u8g2_d_setup.o ${OBJECTDIR}/u8g2/u8g2_font.o ${OBJECTDIR}/u8g2/u8g2_fonts.o ${OBJECTDIR}/u8g2/u8g2_hvline.o ${OBJECTDIR}/u8g2/u8g2_input_value.o ${OBJECTDIR}/u8g2/u8g2_intersection.o ${OBJECTDIR}/u8g2/u8g2_kerning.o ${OBJECTDIR}/u8g2/u8g2_line.o ${OBJECTDIR}/u8g2/u8g2_ll_hvline.o ${OBJECTDIR}/u8g2/u8g2_message.o ${OBJECTDIR}/u8g2/u8g2_polygon.o ${OBJECTDIR}/u8g2/u8g2_selection_list.o ${OBJECTDIR}/u8g2/u8g2_setup.o ${OBJECTDIR}/u8g2/u8log.o ${OBJECTDIR}/u8g2/u8log_u8g2.o ${OBJECTDIR}/u8g2/u8log_u8x8.o ${OBJECTDIR}/u8g2/u8x8_8x8.o ${OBJECTDIR}/u8g2/u8x8_byte.o ${OBJECTDIR}/u8g2/u8x8_cad.o ${OBJECTDIR}/u8g2/u8x8_debounce.o ${OBJECTDIR}/u8g2/u8x8_display.o ${OBJECTDIR}/u8g2/u8x8_d_a2printer.o ${OBJECTDIR}/u8g2/u8x8_d_il3820_296x128.o ${OBJECTDIR}/u8g2/u8x8_d_ist3020.o ${OBJECTDIR}/u8g2/u8x8_d_ks0108.o ${OBJECTDIR}/u8g2/u8x8_d_lc7981.o ${OBJECTDIR}/u8g2/u8x8_d_ld7032_60x32.o ${OBJECTDIR}/u8g2/u8x8_d_ls013b7dh03.o ${OBJECTDIR}/u8g2/u8x8_d_max7219.o ${OBJECTDIR}/u8g2/u8x8_d_pcd8544_84x48.o ${OBJECTDIR}/u8g2/u8x8_d_pcf8812.o ${OBJECTDIR}/u8g2/u8x8_d_pcf8814_hx1230.o ${OBJECTDIR}/u8g2/u8x8_d_sbn1661.o ${OBJECTDIR}/u8g2/u8x8_d_sed1330.o ${OBJECTDIR}/u8g2/u8x8_d_sh1106_64x32.o ${OBJECTDIR}/u8g2/u8x8_d_sh1106_72x40.o ${OBJECTDIR}/u8g2/u8x8_d_sh1107.o ${OBJECTDIR}/u8g2/u8x8_d_sh1108.o ${OBJECTDIR}/u8g2/u8x8_d_sh1122.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1305.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x32.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_48x64.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_64x32.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_64x48.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_96x16.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1309.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1317.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1318.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1322.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1325.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1326.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1327.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1329.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1606_172x72.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1607_200x200.o ${OBJECTDIR}/u8g2/u8x8_d_st75256.o ${OBJECTDIR}/u8g2/u8x8_d_st7565.o ${OBJECTDIR}/u8g2/u8x8_d_st7567.o ${OBJECTDIR}/u8g2/u8x8_d_st7586s_erc240160.o ${OBJECTDIR}/u8g2/u8x8_d_st7586s_s028hn118a.o ${OBJECTDIR}/u8g2/u8x8_d_st7588.o ${OBJECTDIR}/u8g2/u8x8_d_st7920.o ${OBJECTDIR}/u8g2/u8x8_d_stdio.o ${OBJECTDIR}/u8g2/u8x8_d_t6963.o ${OBJECTDIR}/u8g2/u8x8_d_uc1601.o ${OBJECTDIR}/u8g2/u8x8_d_uc1604.o ${OBJECTDIR}/u8g2/u8x8_d_uc1608.o ${OBJECTDIR}/u8g2/u8x8_d_uc1610.o ${OBJECTDIR}/u8g2/u8x8_d_uc1611.o ${OBJECTDIR}/u8g2/u8x8_d_uc1617.o ${OBJECTDIR}/u8g2/u8x8_d_uc1638.o ${OBJECTDIR}/u8g2/u8x8_d_uc1701_dogs102.o ${OBJECTDIR}/u8g2/u8x8_d_uc1701_mini12864.o ${OBJECTDIR}/u8g2/u8x8_fonts.o ${OBJECTDIR}/u8g2/u8x8_gpio.o ${OBJECTDIR}/u8g2/u8x8_input_value.o ${OBJECTDIR}/u8g2/u8x8_message.o ${OBJECTDIR}/u8g2/u8x8_selection_list.o ${OBJECTDIR}/u8g2/u8x8_setup.o ${OBJECTDIR}/u8g2/u8x8_string.o ${OBJECTDIR}/u8g2/u8x8_u16toa.o ${OBJECTDIR}/u8g2/u8x8_u8toa.o ${OBJECTDIR}/common.o ${OBJECTDIR}/main.o ${OBJECTDIR}/uart.o ${OBJECTDIR}/spi_master.o ${OBJECTDIR}/u8g2_pic32mz.o

# Source Files
SOURCEFILES=u8g2/u8g2_bitmap.c u8g2/u8g2_box.c u8g2/u8g2_buffer.c u8g2/u8g2_circle.c u8g2/u8g2_cleardisplay.c u8g2/u8g2_d_memory.c u8g2/u8g2_d_setup.c u8g2/u8g2_font.c u8g2/u8g2_fonts.c u8g2/u8g2_hvline.c u8g2/u8g2_input_value.c u8g2/u8g2_intersection.c u8g2/u8g2_kerning.c u8g2/u8g2_line.c u8g2/u8g2_ll_hvline.c u8g2/u8g2_message.c u8g2/u8g2_polygon.c u8g2/u8g2_selection_list.c u8g2/u8g2_setup.c u8g2/u8log.c u8g2/u8log_u8g2.c u8g2/u8log_u8x8.c u8g2/u8x8_8x8.c u8g2/u8x8_byte.c u8g2/u8x8_cad.c u8g2/u8x8_debounce.c u8g2/u8x8_display.c u8g2/u8x8_d_a2printer.c u8g2/u8x8_d_il3820_296x128.c u8g2/u8x8_d_ist3020.c u8g2/u8x8_d_ks0108.c u8g2/u8x8_d_lc7981.c u8g2/u8x8_d_ld7032_60x32.c u8g2/u8x8_d_ls013b7dh03.c u8g2/u8x8_d_max7219.c u8g2/u8x8_d_pcd8544_84x48.c u8g2/u8x8_d_pcf8812.c u8g2/u8x8_d_pcf8814_hx1230.c u8g2/u8x8_d_sbn1661.c u8g2/u8x8_d_sed1330.c u8g2/u8x8_d_sh1106_64x32.c u8g2/u8x8_d_sh1106_72x40.c u8g2/u8x8_d_sh1107.c u8g2/u8x8_d_sh1108.c u8g2/u8x8_d_sh1122.c u8g2/u8x8_d_ssd1305.c u8g2/u8x8_d_ssd1306_128x32.c u8g2/u8x8_d_ssd1306_128x64_noname.c u8g2/u8x8_d_ssd1306_48x64.c u8g2/u8x8_d_ssd1306_64x32.c u8g2/u8x8_d_ssd1306_64x48.c u8g2/u8x8_d_ssd1306_96x16.c u8g2/u8x8_d_ssd1309.c u8g2/u8x8_d_ssd1317.c u8g2/u8x8_d_ssd1318.c u8g2/u8x8_d_ssd1322.c u8g2/u8x8_d_ssd1325.c u8g2/u8x8_d_ssd1326.c u8g2/u8x8_d_ssd1327.c u8g2/u8x8_d_ssd1329.c u8g2/u8x8_d_ssd1606_172x72.c u8g2/u8x8_d_ssd1607_200x200.c u8g2/u8x8_d_st75256.c u8g2/u8x8_d_st7565.c u8g2/u8x8_d_st7567.c u8g2/u8x8_d_st7586s_erc240160.c u8g2/u8x8_d_st7586s_s028hn118a.c u8g2/u8x8_d_st7588.c u8g2/u8x8_d_st7920.c u8g2/u8x8_d_stdio.c u8g2/u8x8_d_t6963.c u8g2/u8x8_d_uc1601.c u8g2/u8x8_d_uc1604.c u8g2/u8x8_d_uc1608.c u8g2/u8x8_d_uc1610.c u8g2/u8x8_d_uc1611.c u8g2/u8x8_d_uc1617.c u8g2/u8x8_d_uc1638.c u8g2/u8x8_d_uc1701_dogs102.c u8g2/u8x8_d_uc1701_mini12864.c u8g2/u8x8_fonts.c u8g2/u8x8_gpio.c u8g2/u8x8_input_value.c u8g2/u8x8_message.c u8g2/u8x8_selection_list.c u8g2/u8x8_setup.c u8g2/u8x8_string.c u8g2/u8x8_u16toa.c u8g2/u8x8_u8toa.c common.c main.c uart.c spi_master.c u8g2_pic32mz.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/PIC32MZ_SPI_U8G2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MZ2048EFM144
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/u8g2/u8g2_bitmap.o: u8g2/u8g2_bitmap.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_bitmap.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_bitmap.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_bitmap.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_bitmap.o.d" -o ${OBJECTDIR}/u8g2/u8g2_bitmap.o u8g2/u8g2_bitmap.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8g2_box.o: u8g2/u8g2_box.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_box.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_box.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_box.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_box.o.d" -o ${OBJECTDIR}/u8g2/u8g2_box.o u8g2/u8g2_box.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8g2_buffer.o: u8g2/u8g2_buffer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_buffer.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_buffer.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_buffer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_buffer.o.d" -o ${OBJECTDIR}/u8g2/u8g2_buffer.o u8g2/u8g2_buffer.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8g2_circle.o: u8g2/u8g2_circle.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_circle.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_circle.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_circle.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_circle.o.d" -o ${OBJECTDIR}/u8g2/u8g2_circle.o u8g2/u8g2_circle.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8g2_cleardisplay.o: u8g2/u8g2_cleardisplay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_cleardisplay.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_cleardisplay.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_cleardisplay.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_cleardisplay.o.d" -o ${OBJECTDIR}/u8g2/u8g2_cleardisplay.o u8g2/u8g2_cleardisplay.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8g2_d_memory.o: u8g2/u8g2_d_memory.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_d_memory.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_d_memory.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_d_memory.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_d_memory.o.d" -o ${OBJECTDIR}/u8g2/u8g2_d_memory.o u8g2/u8g2_d_memory.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8g2_d_setup.o: u8g2/u8g2_d_setup.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_d_setup.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_d_setup.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_d_setup.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_d_setup.o.d" -o ${OBJECTDIR}/u8g2/u8g2_d_setup.o u8g2/u8g2_d_setup.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8g2_font.o: u8g2/u8g2_font.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_font.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_font.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_font.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_font.o.d" -o ${OBJECTDIR}/u8g2/u8g2_font.o u8g2/u8g2_font.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8g2_fonts.o: u8g2/u8g2_fonts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_fonts.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_fonts.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_fonts.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_fonts.o.d" -o ${OBJECTDIR}/u8g2/u8g2_fonts.o u8g2/u8g2_fonts.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8g2_hvline.o: u8g2/u8g2_hvline.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_hvline.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_hvline.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_hvline.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_hvline.o.d" -o ${OBJECTDIR}/u8g2/u8g2_hvline.o u8g2/u8g2_hvline.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8g2_input_value.o: u8g2/u8g2_input_value.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_input_value.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_input_value.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_input_value.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_input_value.o.d" -o ${OBJECTDIR}/u8g2/u8g2_input_value.o u8g2/u8g2_input_value.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8g2_intersection.o: u8g2/u8g2_intersection.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_intersection.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_intersection.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_intersection.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_intersection.o.d" -o ${OBJECTDIR}/u8g2/u8g2_intersection.o u8g2/u8g2_intersection.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8g2_kerning.o: u8g2/u8g2_kerning.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_kerning.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_kerning.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_kerning.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_kerning.o.d" -o ${OBJECTDIR}/u8g2/u8g2_kerning.o u8g2/u8g2_kerning.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8g2_line.o: u8g2/u8g2_line.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_line.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_line.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_line.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_line.o.d" -o ${OBJECTDIR}/u8g2/u8g2_line.o u8g2/u8g2_line.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8g2_ll_hvline.o: u8g2/u8g2_ll_hvline.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_ll_hvline.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_ll_hvline.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_ll_hvline.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_ll_hvline.o.d" -o ${OBJECTDIR}/u8g2/u8g2_ll_hvline.o u8g2/u8g2_ll_hvline.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8g2_message.o: u8g2/u8g2_message.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_message.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_message.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_message.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_message.o.d" -o ${OBJECTDIR}/u8g2/u8g2_message.o u8g2/u8g2_message.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8g2_polygon.o: u8g2/u8g2_polygon.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_polygon.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_polygon.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_polygon.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_polygon.o.d" -o ${OBJECTDIR}/u8g2/u8g2_polygon.o u8g2/u8g2_polygon.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8g2_selection_list.o: u8g2/u8g2_selection_list.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_selection_list.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_selection_list.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_selection_list.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_selection_list.o.d" -o ${OBJECTDIR}/u8g2/u8g2_selection_list.o u8g2/u8g2_selection_list.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8g2_setup.o: u8g2/u8g2_setup.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_setup.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_setup.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_setup.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_setup.o.d" -o ${OBJECTDIR}/u8g2/u8g2_setup.o u8g2/u8g2_setup.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8log.o: u8g2/u8log.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8log.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8log.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8log.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8log.o.d" -o ${OBJECTDIR}/u8g2/u8log.o u8g2/u8log.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8log_u8g2.o: u8g2/u8log_u8g2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8log_u8g2.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8log_u8g2.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8log_u8g2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8log_u8g2.o.d" -o ${OBJECTDIR}/u8g2/u8log_u8g2.o u8g2/u8log_u8g2.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8log_u8x8.o: u8g2/u8log_u8x8.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8log_u8x8.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8log_u8x8.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8log_u8x8.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8log_u8x8.o.d" -o ${OBJECTDIR}/u8g2/u8log_u8x8.o u8g2/u8log_u8x8.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_8x8.o: u8g2/u8x8_8x8.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_8x8.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_8x8.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_8x8.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_8x8.o.d" -o ${OBJECTDIR}/u8g2/u8x8_8x8.o u8g2/u8x8_8x8.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_byte.o: u8g2/u8x8_byte.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_byte.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_byte.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_byte.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_byte.o.d" -o ${OBJECTDIR}/u8g2/u8x8_byte.o u8g2/u8x8_byte.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_cad.o: u8g2/u8x8_cad.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_cad.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_cad.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_cad.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_cad.o.d" -o ${OBJECTDIR}/u8g2/u8x8_cad.o u8g2/u8x8_cad.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_debounce.o: u8g2/u8x8_debounce.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_debounce.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_debounce.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_debounce.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_debounce.o.d" -o ${OBJECTDIR}/u8g2/u8x8_debounce.o u8g2/u8x8_debounce.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_display.o: u8g2/u8x8_display.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_display.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_display.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_display.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_display.o.d" -o ${OBJECTDIR}/u8g2/u8x8_display.o u8g2/u8x8_display.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_a2printer.o: u8g2/u8x8_d_a2printer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_a2printer.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_a2printer.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_a2printer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_a2printer.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_a2printer.o u8g2/u8x8_d_a2printer.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_il3820_296x128.o: u8g2/u8x8_d_il3820_296x128.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_il3820_296x128.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_il3820_296x128.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_il3820_296x128.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_il3820_296x128.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_il3820_296x128.o u8g2/u8x8_d_il3820_296x128.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ist3020.o: u8g2/u8x8_d_ist3020.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ist3020.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ist3020.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ist3020.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ist3020.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ist3020.o u8g2/u8x8_d_ist3020.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ks0108.o: u8g2/u8x8_d_ks0108.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ks0108.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ks0108.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ks0108.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ks0108.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ks0108.o u8g2/u8x8_d_ks0108.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_lc7981.o: u8g2/u8x8_d_lc7981.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_lc7981.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_lc7981.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_lc7981.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_lc7981.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_lc7981.o u8g2/u8x8_d_lc7981.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ld7032_60x32.o: u8g2/u8x8_d_ld7032_60x32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ld7032_60x32.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ld7032_60x32.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ld7032_60x32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ld7032_60x32.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ld7032_60x32.o u8g2/u8x8_d_ld7032_60x32.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ls013b7dh03.o: u8g2/u8x8_d_ls013b7dh03.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ls013b7dh03.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ls013b7dh03.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ls013b7dh03.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ls013b7dh03.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ls013b7dh03.o u8g2/u8x8_d_ls013b7dh03.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_max7219.o: u8g2/u8x8_d_max7219.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_max7219.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_max7219.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_max7219.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_max7219.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_max7219.o u8g2/u8x8_d_max7219.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_pcd8544_84x48.o: u8g2/u8x8_d_pcd8544_84x48.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_pcd8544_84x48.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_pcd8544_84x48.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_pcd8544_84x48.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_pcd8544_84x48.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_pcd8544_84x48.o u8g2/u8x8_d_pcd8544_84x48.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_pcf8812.o: u8g2/u8x8_d_pcf8812.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_pcf8812.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_pcf8812.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_pcf8812.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_pcf8812.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_pcf8812.o u8g2/u8x8_d_pcf8812.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_pcf8814_hx1230.o: u8g2/u8x8_d_pcf8814_hx1230.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_pcf8814_hx1230.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_pcf8814_hx1230.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_pcf8814_hx1230.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_pcf8814_hx1230.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_pcf8814_hx1230.o u8g2/u8x8_d_pcf8814_hx1230.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_sbn1661.o: u8g2/u8x8_d_sbn1661.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_sbn1661.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_sbn1661.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_sbn1661.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_sbn1661.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_sbn1661.o u8g2/u8x8_d_sbn1661.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_sed1330.o: u8g2/u8x8_d_sed1330.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_sed1330.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_sed1330.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_sed1330.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_sed1330.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_sed1330.o u8g2/u8x8_d_sed1330.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_sh1106_64x32.o: u8g2/u8x8_d_sh1106_64x32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_sh1106_64x32.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_sh1106_64x32.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_sh1106_64x32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_sh1106_64x32.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_sh1106_64x32.o u8g2/u8x8_d_sh1106_64x32.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_sh1106_72x40.o: u8g2/u8x8_d_sh1106_72x40.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_sh1106_72x40.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_sh1106_72x40.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_sh1106_72x40.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_sh1106_72x40.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_sh1106_72x40.o u8g2/u8x8_d_sh1106_72x40.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_sh1107.o: u8g2/u8x8_d_sh1107.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_sh1107.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_sh1107.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_sh1107.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_sh1107.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_sh1107.o u8g2/u8x8_d_sh1107.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_sh1108.o: u8g2/u8x8_d_sh1108.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_sh1108.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_sh1108.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_sh1108.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_sh1108.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_sh1108.o u8g2/u8x8_d_sh1108.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_sh1122.o: u8g2/u8x8_d_sh1122.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_sh1122.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_sh1122.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_sh1122.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_sh1122.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_sh1122.o u8g2/u8x8_d_sh1122.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1305.o: u8g2/u8x8_d_ssd1305.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1305.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1305.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ssd1305.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1305.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1305.o u8g2/u8x8_d_ssd1305.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x32.o: u8g2/u8x8_d_ssd1306_128x32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x32.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x32.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x32.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x32.o u8g2/u8x8_d_ssd1306_128x32.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o: u8g2/u8x8_d_ssd1306_128x64_noname.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o u8g2/u8x8_d_ssd1306_128x64_noname.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1306_48x64.o: u8g2/u8x8_d_ssd1306_48x64.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_48x64.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_48x64.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ssd1306_48x64.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1306_48x64.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_48x64.o u8g2/u8x8_d_ssd1306_48x64.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1306_64x32.o: u8g2/u8x8_d_ssd1306_64x32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_64x32.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_64x32.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ssd1306_64x32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1306_64x32.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_64x32.o u8g2/u8x8_d_ssd1306_64x32.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1306_64x48.o: u8g2/u8x8_d_ssd1306_64x48.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_64x48.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_64x48.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ssd1306_64x48.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1306_64x48.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_64x48.o u8g2/u8x8_d_ssd1306_64x48.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1306_96x16.o: u8g2/u8x8_d_ssd1306_96x16.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_96x16.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_96x16.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ssd1306_96x16.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1306_96x16.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_96x16.o u8g2/u8x8_d_ssd1306_96x16.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1309.o: u8g2/u8x8_d_ssd1309.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1309.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1309.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ssd1309.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1309.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1309.o u8g2/u8x8_d_ssd1309.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1317.o: u8g2/u8x8_d_ssd1317.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1317.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1317.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ssd1317.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1317.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1317.o u8g2/u8x8_d_ssd1317.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1318.o: u8g2/u8x8_d_ssd1318.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1318.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1318.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ssd1318.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1318.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1318.o u8g2/u8x8_d_ssd1318.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1322.o: u8g2/u8x8_d_ssd1322.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1322.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1322.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ssd1322.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1322.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1322.o u8g2/u8x8_d_ssd1322.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1325.o: u8g2/u8x8_d_ssd1325.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1325.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1325.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ssd1325.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1325.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1325.o u8g2/u8x8_d_ssd1325.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1326.o: u8g2/u8x8_d_ssd1326.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1326.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1326.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ssd1326.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1326.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1326.o u8g2/u8x8_d_ssd1326.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1327.o: u8g2/u8x8_d_ssd1327.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1327.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1327.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ssd1327.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1327.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1327.o u8g2/u8x8_d_ssd1327.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1329.o: u8g2/u8x8_d_ssd1329.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1329.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1329.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ssd1329.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1329.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1329.o u8g2/u8x8_d_ssd1329.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1606_172x72.o: u8g2/u8x8_d_ssd1606_172x72.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1606_172x72.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1606_172x72.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ssd1606_172x72.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1606_172x72.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1606_172x72.o u8g2/u8x8_d_ssd1606_172x72.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1607_200x200.o: u8g2/u8x8_d_ssd1607_200x200.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1607_200x200.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1607_200x200.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ssd1607_200x200.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1607_200x200.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1607_200x200.o u8g2/u8x8_d_ssd1607_200x200.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_st75256.o: u8g2/u8x8_d_st75256.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_st75256.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_st75256.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_st75256.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_st75256.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_st75256.o u8g2/u8x8_d_st75256.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_st7565.o: u8g2/u8x8_d_st7565.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_st7565.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_st7565.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_st7565.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_st7565.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_st7565.o u8g2/u8x8_d_st7565.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_st7567.o: u8g2/u8x8_d_st7567.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_st7567.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_st7567.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_st7567.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_st7567.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_st7567.o u8g2/u8x8_d_st7567.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_st7586s_erc240160.o: u8g2/u8x8_d_st7586s_erc240160.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_st7586s_erc240160.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_st7586s_erc240160.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_st7586s_erc240160.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_st7586s_erc240160.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_st7586s_erc240160.o u8g2/u8x8_d_st7586s_erc240160.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_st7586s_s028hn118a.o: u8g2/u8x8_d_st7586s_s028hn118a.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_st7586s_s028hn118a.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_st7586s_s028hn118a.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_st7586s_s028hn118a.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_st7586s_s028hn118a.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_st7586s_s028hn118a.o u8g2/u8x8_d_st7586s_s028hn118a.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_st7588.o: u8g2/u8x8_d_st7588.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_st7588.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_st7588.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_st7588.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_st7588.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_st7588.o u8g2/u8x8_d_st7588.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_st7920.o: u8g2/u8x8_d_st7920.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_st7920.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_st7920.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_st7920.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_st7920.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_st7920.o u8g2/u8x8_d_st7920.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_stdio.o: u8g2/u8x8_d_stdio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_stdio.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_stdio.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_stdio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_stdio.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_stdio.o u8g2/u8x8_d_stdio.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_t6963.o: u8g2/u8x8_d_t6963.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_t6963.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_t6963.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_t6963.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_t6963.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_t6963.o u8g2/u8x8_d_t6963.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_uc1601.o: u8g2/u8x8_d_uc1601.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_uc1601.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_uc1601.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_uc1601.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_uc1601.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_uc1601.o u8g2/u8x8_d_uc1601.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_uc1604.o: u8g2/u8x8_d_uc1604.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_uc1604.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_uc1604.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_uc1604.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_uc1604.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_uc1604.o u8g2/u8x8_d_uc1604.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_uc1608.o: u8g2/u8x8_d_uc1608.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_uc1608.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_uc1608.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_uc1608.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_uc1608.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_uc1608.o u8g2/u8x8_d_uc1608.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_uc1610.o: u8g2/u8x8_d_uc1610.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_uc1610.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_uc1610.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_uc1610.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_uc1610.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_uc1610.o u8g2/u8x8_d_uc1610.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_uc1611.o: u8g2/u8x8_d_uc1611.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_uc1611.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_uc1611.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_uc1611.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_uc1611.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_uc1611.o u8g2/u8x8_d_uc1611.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_uc1617.o: u8g2/u8x8_d_uc1617.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_uc1617.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_uc1617.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_uc1617.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_uc1617.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_uc1617.o u8g2/u8x8_d_uc1617.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_uc1638.o: u8g2/u8x8_d_uc1638.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_uc1638.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_uc1638.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_uc1638.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_uc1638.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_uc1638.o u8g2/u8x8_d_uc1638.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_uc1701_dogs102.o: u8g2/u8x8_d_uc1701_dogs102.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_uc1701_dogs102.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_uc1701_dogs102.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_uc1701_dogs102.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_uc1701_dogs102.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_uc1701_dogs102.o u8g2/u8x8_d_uc1701_dogs102.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_uc1701_mini12864.o: u8g2/u8x8_d_uc1701_mini12864.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_uc1701_mini12864.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_uc1701_mini12864.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_uc1701_mini12864.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_uc1701_mini12864.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_uc1701_mini12864.o u8g2/u8x8_d_uc1701_mini12864.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_fonts.o: u8g2/u8x8_fonts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_fonts.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_fonts.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_fonts.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_fonts.o.d" -o ${OBJECTDIR}/u8g2/u8x8_fonts.o u8g2/u8x8_fonts.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_gpio.o: u8g2/u8x8_gpio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_gpio.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_gpio.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_gpio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_gpio.o.d" -o ${OBJECTDIR}/u8g2/u8x8_gpio.o u8g2/u8x8_gpio.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_input_value.o: u8g2/u8x8_input_value.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_input_value.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_input_value.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_input_value.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_input_value.o.d" -o ${OBJECTDIR}/u8g2/u8x8_input_value.o u8g2/u8x8_input_value.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_message.o: u8g2/u8x8_message.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_message.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_message.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_message.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_message.o.d" -o ${OBJECTDIR}/u8g2/u8x8_message.o u8g2/u8x8_message.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_selection_list.o: u8g2/u8x8_selection_list.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_selection_list.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_selection_list.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_selection_list.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_selection_list.o.d" -o ${OBJECTDIR}/u8g2/u8x8_selection_list.o u8g2/u8x8_selection_list.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_setup.o: u8g2/u8x8_setup.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_setup.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_setup.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_setup.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_setup.o.d" -o ${OBJECTDIR}/u8g2/u8x8_setup.o u8g2/u8x8_setup.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_string.o: u8g2/u8x8_string.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_string.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_string.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_string.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_string.o.d" -o ${OBJECTDIR}/u8g2/u8x8_string.o u8g2/u8x8_string.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_u16toa.o: u8g2/u8x8_u16toa.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_u16toa.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_u16toa.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_u16toa.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_u16toa.o.d" -o ${OBJECTDIR}/u8g2/u8x8_u16toa.o u8g2/u8x8_u16toa.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_u8toa.o: u8g2/u8x8_u8toa.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_u8toa.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_u8toa.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_u8toa.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_u8toa.o.d" -o ${OBJECTDIR}/u8g2/u8x8_u8toa.o u8g2/u8x8_u8toa.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/common.o: common.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/common.o.d 
	@${RM} ${OBJECTDIR}/common.o 
	@${FIXDEPS} "${OBJECTDIR}/common.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/common.o.d" -o ${OBJECTDIR}/common.o common.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/uart.o: uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/uart.o.d 
	@${RM} ${OBJECTDIR}/uart.o 
	@${FIXDEPS} "${OBJECTDIR}/uart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/uart.o.d" -o ${OBJECTDIR}/uart.o uart.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/spi_master.o: spi_master.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/spi_master.o.d 
	@${RM} ${OBJECTDIR}/spi_master.o 
	@${FIXDEPS} "${OBJECTDIR}/spi_master.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/spi_master.o.d" -o ${OBJECTDIR}/spi_master.o spi_master.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2_pic32mz.o: u8g2_pic32mz.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/u8g2_pic32mz.o.d 
	@${RM} ${OBJECTDIR}/u8g2_pic32mz.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2_pic32mz.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2_pic32mz.o.d" -o ${OBJECTDIR}/u8g2_pic32mz.o u8g2_pic32mz.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
else
${OBJECTDIR}/u8g2/u8g2_bitmap.o: u8g2/u8g2_bitmap.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_bitmap.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_bitmap.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_bitmap.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_bitmap.o.d" -o ${OBJECTDIR}/u8g2/u8g2_bitmap.o u8g2/u8g2_bitmap.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8g2_box.o: u8g2/u8g2_box.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_box.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_box.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_box.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_box.o.d" -o ${OBJECTDIR}/u8g2/u8g2_box.o u8g2/u8g2_box.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8g2_buffer.o: u8g2/u8g2_buffer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_buffer.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_buffer.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_buffer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_buffer.o.d" -o ${OBJECTDIR}/u8g2/u8g2_buffer.o u8g2/u8g2_buffer.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8g2_circle.o: u8g2/u8g2_circle.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_circle.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_circle.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_circle.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_circle.o.d" -o ${OBJECTDIR}/u8g2/u8g2_circle.o u8g2/u8g2_circle.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8g2_cleardisplay.o: u8g2/u8g2_cleardisplay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_cleardisplay.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_cleardisplay.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_cleardisplay.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_cleardisplay.o.d" -o ${OBJECTDIR}/u8g2/u8g2_cleardisplay.o u8g2/u8g2_cleardisplay.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8g2_d_memory.o: u8g2/u8g2_d_memory.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_d_memory.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_d_memory.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_d_memory.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_d_memory.o.d" -o ${OBJECTDIR}/u8g2/u8g2_d_memory.o u8g2/u8g2_d_memory.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8g2_d_setup.o: u8g2/u8g2_d_setup.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_d_setup.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_d_setup.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_d_setup.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_d_setup.o.d" -o ${OBJECTDIR}/u8g2/u8g2_d_setup.o u8g2/u8g2_d_setup.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8g2_font.o: u8g2/u8g2_font.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_font.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_font.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_font.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_font.o.d" -o ${OBJECTDIR}/u8g2/u8g2_font.o u8g2/u8g2_font.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8g2_fonts.o: u8g2/u8g2_fonts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_fonts.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_fonts.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_fonts.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_fonts.o.d" -o ${OBJECTDIR}/u8g2/u8g2_fonts.o u8g2/u8g2_fonts.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8g2_hvline.o: u8g2/u8g2_hvline.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_hvline.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_hvline.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_hvline.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_hvline.o.d" -o ${OBJECTDIR}/u8g2/u8g2_hvline.o u8g2/u8g2_hvline.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8g2_input_value.o: u8g2/u8g2_input_value.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_input_value.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_input_value.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_input_value.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_input_value.o.d" -o ${OBJECTDIR}/u8g2/u8g2_input_value.o u8g2/u8g2_input_value.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8g2_intersection.o: u8g2/u8g2_intersection.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_intersection.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_intersection.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_intersection.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_intersection.o.d" -o ${OBJECTDIR}/u8g2/u8g2_intersection.o u8g2/u8g2_intersection.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8g2_kerning.o: u8g2/u8g2_kerning.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_kerning.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_kerning.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_kerning.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_kerning.o.d" -o ${OBJECTDIR}/u8g2/u8g2_kerning.o u8g2/u8g2_kerning.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8g2_line.o: u8g2/u8g2_line.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_line.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_line.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_line.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_line.o.d" -o ${OBJECTDIR}/u8g2/u8g2_line.o u8g2/u8g2_line.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8g2_ll_hvline.o: u8g2/u8g2_ll_hvline.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_ll_hvline.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_ll_hvline.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_ll_hvline.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_ll_hvline.o.d" -o ${OBJECTDIR}/u8g2/u8g2_ll_hvline.o u8g2/u8g2_ll_hvline.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8g2_message.o: u8g2/u8g2_message.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_message.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_message.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_message.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_message.o.d" -o ${OBJECTDIR}/u8g2/u8g2_message.o u8g2/u8g2_message.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8g2_polygon.o: u8g2/u8g2_polygon.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_polygon.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_polygon.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_polygon.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_polygon.o.d" -o ${OBJECTDIR}/u8g2/u8g2_polygon.o u8g2/u8g2_polygon.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8g2_selection_list.o: u8g2/u8g2_selection_list.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_selection_list.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_selection_list.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_selection_list.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_selection_list.o.d" -o ${OBJECTDIR}/u8g2/u8g2_selection_list.o u8g2/u8g2_selection_list.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8g2_setup.o: u8g2/u8g2_setup.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_setup.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_setup.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8g2_setup.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8g2_setup.o.d" -o ${OBJECTDIR}/u8g2/u8g2_setup.o u8g2/u8g2_setup.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8log.o: u8g2/u8log.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8log.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8log.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8log.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8log.o.d" -o ${OBJECTDIR}/u8g2/u8log.o u8g2/u8log.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8log_u8g2.o: u8g2/u8log_u8g2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8log_u8g2.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8log_u8g2.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8log_u8g2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8log_u8g2.o.d" -o ${OBJECTDIR}/u8g2/u8log_u8g2.o u8g2/u8log_u8g2.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8log_u8x8.o: u8g2/u8log_u8x8.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8log_u8x8.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8log_u8x8.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8log_u8x8.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8log_u8x8.o.d" -o ${OBJECTDIR}/u8g2/u8log_u8x8.o u8g2/u8log_u8x8.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_8x8.o: u8g2/u8x8_8x8.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_8x8.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_8x8.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_8x8.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_8x8.o.d" -o ${OBJECTDIR}/u8g2/u8x8_8x8.o u8g2/u8x8_8x8.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_byte.o: u8g2/u8x8_byte.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_byte.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_byte.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_byte.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_byte.o.d" -o ${OBJECTDIR}/u8g2/u8x8_byte.o u8g2/u8x8_byte.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_cad.o: u8g2/u8x8_cad.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_cad.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_cad.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_cad.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_cad.o.d" -o ${OBJECTDIR}/u8g2/u8x8_cad.o u8g2/u8x8_cad.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_debounce.o: u8g2/u8x8_debounce.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_debounce.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_debounce.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_debounce.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_debounce.o.d" -o ${OBJECTDIR}/u8g2/u8x8_debounce.o u8g2/u8x8_debounce.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_display.o: u8g2/u8x8_display.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_display.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_display.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_display.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_display.o.d" -o ${OBJECTDIR}/u8g2/u8x8_display.o u8g2/u8x8_display.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_a2printer.o: u8g2/u8x8_d_a2printer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_a2printer.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_a2printer.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_a2printer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_a2printer.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_a2printer.o u8g2/u8x8_d_a2printer.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_il3820_296x128.o: u8g2/u8x8_d_il3820_296x128.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_il3820_296x128.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_il3820_296x128.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_il3820_296x128.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_il3820_296x128.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_il3820_296x128.o u8g2/u8x8_d_il3820_296x128.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ist3020.o: u8g2/u8x8_d_ist3020.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ist3020.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ist3020.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ist3020.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ist3020.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ist3020.o u8g2/u8x8_d_ist3020.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ks0108.o: u8g2/u8x8_d_ks0108.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ks0108.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ks0108.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ks0108.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ks0108.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ks0108.o u8g2/u8x8_d_ks0108.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_lc7981.o: u8g2/u8x8_d_lc7981.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_lc7981.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_lc7981.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_lc7981.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_lc7981.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_lc7981.o u8g2/u8x8_d_lc7981.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ld7032_60x32.o: u8g2/u8x8_d_ld7032_60x32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ld7032_60x32.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ld7032_60x32.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ld7032_60x32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ld7032_60x32.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ld7032_60x32.o u8g2/u8x8_d_ld7032_60x32.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ls013b7dh03.o: u8g2/u8x8_d_ls013b7dh03.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ls013b7dh03.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ls013b7dh03.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ls013b7dh03.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ls013b7dh03.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ls013b7dh03.o u8g2/u8x8_d_ls013b7dh03.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_max7219.o: u8g2/u8x8_d_max7219.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_max7219.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_max7219.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_max7219.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_max7219.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_max7219.o u8g2/u8x8_d_max7219.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_pcd8544_84x48.o: u8g2/u8x8_d_pcd8544_84x48.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_pcd8544_84x48.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_pcd8544_84x48.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_pcd8544_84x48.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_pcd8544_84x48.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_pcd8544_84x48.o u8g2/u8x8_d_pcd8544_84x48.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_pcf8812.o: u8g2/u8x8_d_pcf8812.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_pcf8812.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_pcf8812.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_pcf8812.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_pcf8812.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_pcf8812.o u8g2/u8x8_d_pcf8812.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_pcf8814_hx1230.o: u8g2/u8x8_d_pcf8814_hx1230.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_pcf8814_hx1230.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_pcf8814_hx1230.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_pcf8814_hx1230.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_pcf8814_hx1230.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_pcf8814_hx1230.o u8g2/u8x8_d_pcf8814_hx1230.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_sbn1661.o: u8g2/u8x8_d_sbn1661.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_sbn1661.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_sbn1661.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_sbn1661.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_sbn1661.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_sbn1661.o u8g2/u8x8_d_sbn1661.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_sed1330.o: u8g2/u8x8_d_sed1330.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_sed1330.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_sed1330.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_sed1330.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_sed1330.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_sed1330.o u8g2/u8x8_d_sed1330.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_sh1106_64x32.o: u8g2/u8x8_d_sh1106_64x32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_sh1106_64x32.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_sh1106_64x32.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_sh1106_64x32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_sh1106_64x32.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_sh1106_64x32.o u8g2/u8x8_d_sh1106_64x32.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_sh1106_72x40.o: u8g2/u8x8_d_sh1106_72x40.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_sh1106_72x40.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_sh1106_72x40.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_sh1106_72x40.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_sh1106_72x40.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_sh1106_72x40.o u8g2/u8x8_d_sh1106_72x40.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_sh1107.o: u8g2/u8x8_d_sh1107.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_sh1107.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_sh1107.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_sh1107.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_sh1107.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_sh1107.o u8g2/u8x8_d_sh1107.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_sh1108.o: u8g2/u8x8_d_sh1108.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_sh1108.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_sh1108.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_sh1108.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_sh1108.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_sh1108.o u8g2/u8x8_d_sh1108.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_sh1122.o: u8g2/u8x8_d_sh1122.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_sh1122.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_sh1122.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_sh1122.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_sh1122.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_sh1122.o u8g2/u8x8_d_sh1122.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1305.o: u8g2/u8x8_d_ssd1305.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1305.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1305.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ssd1305.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1305.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1305.o u8g2/u8x8_d_ssd1305.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x32.o: u8g2/u8x8_d_ssd1306_128x32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x32.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x32.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x32.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x32.o u8g2/u8x8_d_ssd1306_128x32.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o: u8g2/u8x8_d_ssd1306_128x64_noname.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o u8g2/u8x8_d_ssd1306_128x64_noname.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1306_48x64.o: u8g2/u8x8_d_ssd1306_48x64.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_48x64.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_48x64.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ssd1306_48x64.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1306_48x64.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_48x64.o u8g2/u8x8_d_ssd1306_48x64.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1306_64x32.o: u8g2/u8x8_d_ssd1306_64x32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_64x32.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_64x32.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ssd1306_64x32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1306_64x32.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_64x32.o u8g2/u8x8_d_ssd1306_64x32.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1306_64x48.o: u8g2/u8x8_d_ssd1306_64x48.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_64x48.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_64x48.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ssd1306_64x48.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1306_64x48.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_64x48.o u8g2/u8x8_d_ssd1306_64x48.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1306_96x16.o: u8g2/u8x8_d_ssd1306_96x16.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_96x16.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_96x16.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ssd1306_96x16.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1306_96x16.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_96x16.o u8g2/u8x8_d_ssd1306_96x16.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1309.o: u8g2/u8x8_d_ssd1309.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1309.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1309.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ssd1309.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1309.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1309.o u8g2/u8x8_d_ssd1309.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1317.o: u8g2/u8x8_d_ssd1317.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1317.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1317.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ssd1317.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1317.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1317.o u8g2/u8x8_d_ssd1317.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1318.o: u8g2/u8x8_d_ssd1318.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1318.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1318.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ssd1318.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1318.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1318.o u8g2/u8x8_d_ssd1318.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1322.o: u8g2/u8x8_d_ssd1322.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1322.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1322.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ssd1322.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1322.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1322.o u8g2/u8x8_d_ssd1322.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1325.o: u8g2/u8x8_d_ssd1325.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1325.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1325.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ssd1325.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1325.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1325.o u8g2/u8x8_d_ssd1325.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1326.o: u8g2/u8x8_d_ssd1326.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1326.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1326.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ssd1326.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1326.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1326.o u8g2/u8x8_d_ssd1326.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1327.o: u8g2/u8x8_d_ssd1327.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1327.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1327.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ssd1327.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1327.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1327.o u8g2/u8x8_d_ssd1327.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1329.o: u8g2/u8x8_d_ssd1329.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1329.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1329.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ssd1329.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1329.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1329.o u8g2/u8x8_d_ssd1329.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1606_172x72.o: u8g2/u8x8_d_ssd1606_172x72.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1606_172x72.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1606_172x72.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ssd1606_172x72.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1606_172x72.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1606_172x72.o u8g2/u8x8_d_ssd1606_172x72.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1607_200x200.o: u8g2/u8x8_d_ssd1607_200x200.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1607_200x200.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1607_200x200.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_ssd1607_200x200.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1607_200x200.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1607_200x200.o u8g2/u8x8_d_ssd1607_200x200.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_st75256.o: u8g2/u8x8_d_st75256.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_st75256.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_st75256.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_st75256.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_st75256.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_st75256.o u8g2/u8x8_d_st75256.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_st7565.o: u8g2/u8x8_d_st7565.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_st7565.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_st7565.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_st7565.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_st7565.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_st7565.o u8g2/u8x8_d_st7565.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_st7567.o: u8g2/u8x8_d_st7567.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_st7567.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_st7567.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_st7567.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_st7567.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_st7567.o u8g2/u8x8_d_st7567.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_st7586s_erc240160.o: u8g2/u8x8_d_st7586s_erc240160.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_st7586s_erc240160.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_st7586s_erc240160.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_st7586s_erc240160.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_st7586s_erc240160.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_st7586s_erc240160.o u8g2/u8x8_d_st7586s_erc240160.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_st7586s_s028hn118a.o: u8g2/u8x8_d_st7586s_s028hn118a.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_st7586s_s028hn118a.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_st7586s_s028hn118a.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_st7586s_s028hn118a.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_st7586s_s028hn118a.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_st7586s_s028hn118a.o u8g2/u8x8_d_st7586s_s028hn118a.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_st7588.o: u8g2/u8x8_d_st7588.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_st7588.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_st7588.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_st7588.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_st7588.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_st7588.o u8g2/u8x8_d_st7588.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_st7920.o: u8g2/u8x8_d_st7920.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_st7920.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_st7920.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_st7920.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_st7920.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_st7920.o u8g2/u8x8_d_st7920.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_stdio.o: u8g2/u8x8_d_stdio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_stdio.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_stdio.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_stdio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_stdio.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_stdio.o u8g2/u8x8_d_stdio.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_t6963.o: u8g2/u8x8_d_t6963.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_t6963.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_t6963.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_t6963.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_t6963.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_t6963.o u8g2/u8x8_d_t6963.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_uc1601.o: u8g2/u8x8_d_uc1601.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_uc1601.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_uc1601.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_uc1601.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_uc1601.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_uc1601.o u8g2/u8x8_d_uc1601.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_uc1604.o: u8g2/u8x8_d_uc1604.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_uc1604.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_uc1604.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_uc1604.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_uc1604.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_uc1604.o u8g2/u8x8_d_uc1604.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_uc1608.o: u8g2/u8x8_d_uc1608.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_uc1608.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_uc1608.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_uc1608.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_uc1608.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_uc1608.o u8g2/u8x8_d_uc1608.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_uc1610.o: u8g2/u8x8_d_uc1610.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_uc1610.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_uc1610.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_uc1610.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_uc1610.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_uc1610.o u8g2/u8x8_d_uc1610.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_uc1611.o: u8g2/u8x8_d_uc1611.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_uc1611.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_uc1611.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_uc1611.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_uc1611.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_uc1611.o u8g2/u8x8_d_uc1611.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_uc1617.o: u8g2/u8x8_d_uc1617.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_uc1617.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_uc1617.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_uc1617.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_uc1617.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_uc1617.o u8g2/u8x8_d_uc1617.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_uc1638.o: u8g2/u8x8_d_uc1638.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_uc1638.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_uc1638.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_uc1638.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_uc1638.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_uc1638.o u8g2/u8x8_d_uc1638.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_uc1701_dogs102.o: u8g2/u8x8_d_uc1701_dogs102.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_uc1701_dogs102.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_uc1701_dogs102.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_uc1701_dogs102.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_uc1701_dogs102.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_uc1701_dogs102.o u8g2/u8x8_d_uc1701_dogs102.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_d_uc1701_mini12864.o: u8g2/u8x8_d_uc1701_mini12864.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_uc1701_mini12864.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_uc1701_mini12864.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_d_uc1701_mini12864.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_uc1701_mini12864.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_uc1701_mini12864.o u8g2/u8x8_d_uc1701_mini12864.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_fonts.o: u8g2/u8x8_fonts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_fonts.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_fonts.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_fonts.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_fonts.o.d" -o ${OBJECTDIR}/u8g2/u8x8_fonts.o u8g2/u8x8_fonts.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_gpio.o: u8g2/u8x8_gpio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_gpio.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_gpio.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_gpio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_gpio.o.d" -o ${OBJECTDIR}/u8g2/u8x8_gpio.o u8g2/u8x8_gpio.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_input_value.o: u8g2/u8x8_input_value.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_input_value.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_input_value.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_input_value.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_input_value.o.d" -o ${OBJECTDIR}/u8g2/u8x8_input_value.o u8g2/u8x8_input_value.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_message.o: u8g2/u8x8_message.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_message.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_message.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_message.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_message.o.d" -o ${OBJECTDIR}/u8g2/u8x8_message.o u8g2/u8x8_message.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_selection_list.o: u8g2/u8x8_selection_list.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_selection_list.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_selection_list.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_selection_list.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_selection_list.o.d" -o ${OBJECTDIR}/u8g2/u8x8_selection_list.o u8g2/u8x8_selection_list.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_setup.o: u8g2/u8x8_setup.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_setup.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_setup.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_setup.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_setup.o.d" -o ${OBJECTDIR}/u8g2/u8x8_setup.o u8g2/u8x8_setup.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_string.o: u8g2/u8x8_string.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_string.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_string.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_string.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_string.o.d" -o ${OBJECTDIR}/u8g2/u8x8_string.o u8g2/u8x8_string.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_u16toa.o: u8g2/u8x8_u16toa.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_u16toa.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_u16toa.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_u16toa.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_u16toa.o.d" -o ${OBJECTDIR}/u8g2/u8x8_u16toa.o u8g2/u8x8_u16toa.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2/u8x8_u8toa.o: u8g2/u8x8_u8toa.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_u8toa.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_u8toa.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2/u8x8_u8toa.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2/u8x8_u8toa.o.d" -o ${OBJECTDIR}/u8g2/u8x8_u8toa.o u8g2/u8x8_u8toa.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/common.o: common.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/common.o.d 
	@${RM} ${OBJECTDIR}/common.o 
	@${FIXDEPS} "${OBJECTDIR}/common.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/common.o.d" -o ${OBJECTDIR}/common.o common.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/uart.o: uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/uart.o.d 
	@${RM} ${OBJECTDIR}/uart.o 
	@${FIXDEPS} "${OBJECTDIR}/uart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/uart.o.d" -o ${OBJECTDIR}/uart.o uart.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/spi_master.o: spi_master.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/spi_master.o.d 
	@${RM} ${OBJECTDIR}/spi_master.o 
	@${FIXDEPS} "${OBJECTDIR}/spi_master.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/spi_master.o.d" -o ${OBJECTDIR}/spi_master.o spi_master.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
${OBJECTDIR}/u8g2_pic32mz.o: u8g2_pic32mz.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/u8g2_pic32mz.o.d 
	@${RM} ${OBJECTDIR}/u8g2_pic32mz.o 
	@${FIXDEPS} "${OBJECTDIR}/u8g2_pic32mz.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/Program Files (x86)/Microchip/xc32/v2.30/pic32mx/include" -MMD -MF "${OBJECTDIR}/u8g2_pic32mz.o.d" -o ${OBJECTDIR}/u8g2_pic32mz.o u8g2_pic32mz.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/PIC32MZ_SPI_U8G2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_ICD4=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/PIC32MZ_SPI_U8G2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  -std=gnu99 $(COMPARISON_BUILD)   -mreserve=data@0x0:0x37F   -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_ICD4=1,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/PIC32MZ_SPI_U8G2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/PIC32MZ_SPI_U8G2.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  -std=gnu99 $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/PIC32MZ_SPI_U8G2.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
