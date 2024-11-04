# Exporting Component Description of top_sb to TCL
# Family: IGLOO2
# Part Number: M2GL010-VF400

set sysbld_name {top_sb}

# Creating the System Builder component
create_and_configure_core -core_vlnv {Actel:SystemBuilder:SystemBuilder:1.0} -component_name ${sysbld_name} -params {}

# Opening the System Builder component to configure
open_sb_component -component_name ${sysbld_name}

# Configuring the Device Features page of System Builder component
sb_configure_page -component_name ${sysbld_name} -page_name {DEVICEFEATURES} \
-params {USE_ENVM:1} \
-params {USE_ESRAM:0} \
-params {USE_FABRIC_DDR:0} \
-params {USE_HPDMA:0} \
-params {USE_MEMORY_ACCESS:0} \
-params {USE_MSS_DDR_SDR:1} \
-params {USE_MSS_EXTMEM:0} \
-params {USE_PDMA:0} \
-params {USE_PDMAMem:0} \
-params {USE_RTC:0} \
-params {USE_SERDESIF0:0} \
-params {USE_SERDESIF0_PCIE:0} \
-params {USE_SERDESIF1:0} \
-params {USE_SERDESIF1_PCIE:0} \
-params {USE_SERDESIF2:0} \
-params {USE_SERDESIF2_PCIE:0} \
-params {USE_SERDESIF3:0} \
-params {USE_SERDESIF3_PCIE:0} \
-params {USE_SPI:0} \
-params {USE_SYSTEM_SERVICES:0} \
-params {USE_WATCHDOG:0} 

sb_disable_peripheral -component_name ${sysbld_name} -peripheral_name {MSS_SPI_0}

# Configuring ENVM in the Memories page of System Builder component
sb_configure_envm -component_name ${sysbld_name} -cfg_file "${current_path}ENVM.cfg"

# Configuring the Direct Connection Mode in the System Builder component
sb_set_fic_direct_mode -component_name ${sysbld_name} -mode {false}

# Configuring different Subsystems in the Peripherals page of System Builder component
sb_configure_core -component_name ${sysbld_name} -core_name {HPMS_FIC_0_USER_MASTER} \
-params {AMBA_INTERFACE_TYPE:AHBLITE} 

# Configuring the Clocks page of System Builder component
sb_configure_page -component_name ${sysbld_name} -page_name {CLOCK} \
-params {APB0CLK_RATIO:1} \
-params {APB1CLK_RATIO:1} \
-params {FDDR_CLK_DIVISOR:1} \
-params {FDDR_CLK_FREQUENCY:100} \
-params {FIC0CLK_RATIO:8} \
-params {FIC0_AHBL_BYPASS:0} \
-params {FIC1CLK_RATIO:1} \
-params {FIC1_AHBL_BYPASS:0} \
-params {FIC64CLK_RATIO:1} \
-params {GL0_IS_USED:1} \
-params {GL0_OUT_0_FREQ:10} \
-params {GL1_IS_USED:0} \
-params {GL1_OUT_0_FREQ:} \
-params {GL2_IS_USED:0} \
-params {GL2_OUT_0_FREQ:} \
-params {GL3_IS_USED:0} \
-params {GL3_OUT_0_FREQ:} \
-params {M3CLK_FREQUENCY:80} \
-params {MDDRCLK_RATIO:1} \
-params {PLL_LOCK_USED:1} \
-params {RCOSC_1MHZ_DRIVES_CCC:0} \
-params {RCOSC_1MHZ_DRIVES_FAB:0} \
-params {RCOSC_1MHZ_IS_USED:0} \
-params {RCOSC_25_50MHZ_DRIVES_CCC:0} \
-params {RCOSC_25_50MHZ_DRIVES_FAB:0} \
-params {RCOSC_25_50MHZ_IS_USED:0} \
-params {SYSCLK_FREQUENCY:50.0} \
-params {SYSCLK_SOURCE:OSC_50MHZ} \
-params {XTLOSC_DRIVES_CCC:0} \
-params {XTLOSC_DRIVES_FAB:0} \
-params {XTLOSC_FREQ:0.0} \
-params {XTLOSC_IS_USED:0} \
-params {XTLOSC_SRC:CRYSTAL} 

# Configuring the AHB Bus Matrix page of System Builder component
sb_configure_page -component_name ${sysbld_name} -page_name {SWITCH} \
-params {CORTEXM3_REMAP:ENVM} \
-params {ENVM_REMAP_BASE_ADDRESS:0x00000000} \
-params {ENVM_REMAP_FABRIC_BASE_ADDRESS:0x00000000} \
-params {ENVM_REMAP_FABRIC_IS_USED:false} \
-params {ENVM_REMAP_REGION_SIZE:256} \
-params {ESRAM_MAX_LAT_SW_MAX_LATENCY_ESRAM0:8} \
-params {ESRAM_MAX_LAT_SW_MAX_LATENCY_ESRAM1:8} \
-params {SW_WEIGHT_FAB_0:1} \
-params {SW_WEIGHT_FAB_1:1} \
-params {SW_WEIGHT_G:1} \
-params {SW_WEIGHT_GIGE:1} \
-params {SW_WEIGHT_HPDMA:1} \
-params {SW_WEIGHT_IC:1} \
-params {SW_WEIGHT_PDMA:1} \
-params {SW_WEIGHT_S:1} \
-params {SW_WEIGHT_USB:1} 

# Configuring the DDRB page of System Builder component
sb_configure_page -component_name ${sysbld_name} -page_name {DDRB} \
-params {DDRB_BUF_SZ:32B} \
-params {DDRB_DS_REN:true} \
-params {DDRB_DS_WEN:true} \
-params {DDRB_HPD_REN:true} \
-params {DDRB_HPD_WEN:true} \
-params {DDRB_IDC_REN:true} \
-params {DDRB_NB_ADDR:0xA000} \
-params {DDRB_NB_SZ:64KB} \
-params {DDRB_SW_REN:true} \
-params {DDRB_SW_WEN:true} \
-params {DDRB_TIMER:0x3FF} 

# Configuring the SECDED page of System Builder component
sb_configure_page -component_name ${sysbld_name} -page_name {EDAC} \
-params {EDAC_ENABLE_CAN_EDAC_EN:false} \
-params {EDAC_ENABLE_CC_EDAC_EN:false} \
-params {EDAC_ENABLE_ESRAM0_EDAC_EN:false} \
-params {EDAC_ENABLE_ESRAM1_EDAC_EN:false} \
-params {EDAC_ENABLE_MAC_EDACRX_EN:false} \
-params {EDAC_ENABLE_MAC_EDACTX_EN:false} \
-params {EDAC_ENABLE_USB_EDAC_EN:false} \
-params {EDAC_INT_ENABLE_CAN:DISABLE_ALL} \
-params {EDAC_INT_ENABLE_CC:DISABLE_ALL} \
-params {EDAC_INT_ENABLE_ESRAM0:DISABLE_ALL} \
-params {EDAC_INT_ENABLE_ESRAM1:DISABLE_ALL} \
-params {EDAC_INT_ENABLE_MAC_EDACRX:DISABLE_ALL} \
-params {EDAC_INT_ENABLE_MAC_EDACTX:DISABLE_ALL} \
-params {EDAC_INT_ENABLE_MDDR_ECC_INT_EN:true} \
-params {EDAC_INT_ENABLE_USB:DISABLE_ALL} \
-params {EXPOSE_EDAC_ERROR:false} 

# Configuring the Security page of System Builder component
sb_configure_page -component_name ${sysbld_name} -page_name {SECURITY} \
-params {CC_CACHEREGION_OVERRIDE:true} \
-params {CC_CONFIG_OVERRIDE:true} \
-params {CC_FLUSHINDX_OVERRIDE:true} \
-params {CC_LOCKBASEADDR_OVERRIDE:true} \
-params {DDRB_BUF_TIMER_OVERRIDE:true} \
-params {DDRB_CONFIG_OVERRIDE:true} \
-params {DDRB_NB_ADR_OVERRIDE:true} \
-params {DDRB_NB_SIZE_OVERRIDE:true} \
-params {DDR_CONFIG_OVERRIDE:true} \
-params {EDAC_ENABLE_OVERRIDE:true} \
-params {EDAC_INT_ENABLE_OVERRIDE:true} \
-params {ENVM_CONFIG_OVERRIDE:true} \
-params {ENVM_FAB_REMAP_OVERRIDE:true} \
-params {ENVM_REMAP_BASE_OVERRIDE:true} \
-params {ESRAM_CONFIG_OVERRIDE:true} \
-params {ESRAM_MAX_LAT_OVERRIDE:true} \
-params {ESRAM_PIPELINE_CONFIG_OVERRIDE:true} \
-params {FABRIC_MEMPROT_BASE_ADDRESS:0x00000000} \
-params {FABRIC_MEMPROT_IS_USED:false} \
-params {FABRIC_MEMPROT_REGION_SIZE:8MB} \
-params {FAB_IF_OVERRIDE:true} \
-params {GPIN_SRC_SEL_OVERRIDE:true} \
-params {GPIO_SYSRESET_SEL_OVERRIDE:true} \
-params {LOOPBACK_CTRL_OVERRIDE:true} \
-params {M3_CONFIG_OVERRIDE:true} \
-params {MAC_CONFIG_OVERRIDE:true} \
-params {MASTER_WEIGHT_CONFIG0_OVERRIDE:true} \
-params {MASTER_WEIGHT_CONFIG1_OVERRIDE:true} \
-params {MDDR_CONFIG_OVERRIDE:true} \
-params {MDDR_IO_CALIB_OVERRIDE:true} \
-params {MM0_1_2_MS0_ALLOWED_R:true} \
-params {MM0_1_2_MS0_ALLOWED_W:true} \
-params {MM0_1_2_MS1_ALLOWED_R:true} \
-params {MM0_1_2_MS1_ALLOWED_W:true} \
-params {MM0_1_2_MS2_ALLOWED_R:true} \
-params {MM0_1_2_MS2_ALLOWED_W:true} \
-params {MM0_1_2_MS3_ALLOWED_R:true} \
-params {MM0_1_2_MS3_ALLOWED_W:true} \
-params {MM0_1_2_MS6_ALLOWED_R:true} \
-params {MM0_1_2_MS6_ALLOWED_W:true} \
-params {MM3_6_7_8_MS0_ALLOWED_R:true} \
-params {MM3_6_7_8_MS0_ALLOWED_W:true} \
-params {MM3_6_7_8_MS1_ALLOWED_R:true} \
-params {MM3_6_7_8_MS1_ALLOWED_W:true} \
-params {MM3_6_7_8_MS2_ALLOWED_R:true} \
-params {MM3_6_7_8_MS2_ALLOWED_W:true} \
-params {MM3_6_7_8_MS3_ALLOWED_R:true} \
-params {MM3_6_7_8_MS3_ALLOWED_W:true} \
-params {MM3_6_7_8_MS6_ALLOWED_R:true} \
-params {MM3_6_7_8_MS6_ALLOWED_W:true} \
-params {MM4_5_FIC64_MS0_ALLOWED_R:true} \
-params {MM4_5_FIC64_MS0_ALLOWED_W:true} \
-params {MM4_5_FIC64_MS1_ALLOWED_R:true} \
-params {MM4_5_FIC64_MS1_ALLOWED_W:true} \
-params {MM4_5_FIC64_MS2_ALLOWED_R:true} \
-params {MM4_5_FIC64_MS2_ALLOWED_W:true} \
-params {MM4_5_FIC64_MS3_ALLOWED_R:true} \
-params {MM4_5_FIC64_MS3_ALLOWED_W:true} \
-params {MM4_5_FIC64_MS6_ALLOWED_R:true} \
-params {MM4_5_FIC64_MS6_ALLOWED_W:true} \
-params {MM9_MS0_ALLOWED_R:true} \
-params {MM9_MS0_ALLOWED_W:true} \
-params {MM9_MS1_ALLOWED_R:true} \
-params {MM9_MS1_ALLOWED_W:true} \
-params {MM9_MS2_ALLOWED_R:true} \
-params {MM9_MS2_ALLOWED_W:true} \
-params {MM9_MS3_ALLOWED_R:true} \
-params {MM9_MS3_ALLOWED_W:true} \
-params {MM9_MS6_ALLOWED_R:true} \
-params {MM9_MS6_ALLOWED_W:true} \
-params {MSSDDR_CLK_CALIB_CONFIG_OVERRIDE:true} \
-params {MSSDDR_FACC_CONFIG_1_OVERRIDE:true} \
-params {MSSDDR_FACC_CONFIG_2_OVERRIDE:true} \
-params {MSSDDR_PLL_STATUS_HIGH_OVERRIDE:true} \
-params {MSSDDR_PLL_STATUS_LOW_OVERRIDE:true} \
-params {MSS_INTERRUPT_ENABLE_OVERRIDE:true} \
-params {NVM0_LOWER_ALLOWED:true} \
-params {NVM0_LOWER_FABRIC_ACCESS:true} \
-params {NVM0_LOWER_M3ACCESS:true} \
-params {NVM0_LOWER_OTHERS_ACCESS:true} \
-params {NVM0_UPPER_ALLOWED:true} \
-params {NVM0_UPPER_FABRIC_ACCESS:true} \
-params {NVM0_UPPER_M3ACCESS:true} \
-params {NVM0_UPPER_OTHERS_ACCESS:true} \
-params {NVM1_LOWER_ALLOWED:true} \
-params {NVM1_LOWER_FABRIC_ACCESS:true} \
-params {NVM1_LOWER_M3ACCESS:true} \
-params {NVM1_LOWER_OTHERS_ACCESS:true} \
-params {NVM1_UPPER_ALLOWED:true} \
-params {NVM1_UPPER_FABRIC_ACCESS:true} \
-params {NVM1_UPPER_M3ACCESS:true} \
-params {NVM1_UPPER_OTHERS_ACCESS:true} \
-params {PERIPH_CLOCK_MUX_SEL_OVERRIDE:true} \
-params {PLL_LOCK_EN_OVERRIDE:true} \
-params {RTC_WAKEUP_CONFIG_OVERRIDE:true} \
-params {SOFTRESET_CAN_SOFTRESET_OVERRIDE:true} \
-params {SOFTRESET_COMBLK_SOFTRESET_OVERRIDE:true} \
-params {SOFTRESET_ENVM0_SOFTRESET_OVERRIDE:true} \
-params {SOFTRESET_ENVM1_SOFTRESET_OVERRIDE:true} \
-params {SOFTRESET_ESRAM0_SOFTRESET_OVERRIDE:true} \
-params {SOFTRESET_ESRAM1_SOFTRESET_OVERRIDE:true} \
-params {SOFTRESET_FIC32_0_SOFTRESET_OVERRIDE:true} \
-params {SOFTRESET_FIC32_1_SOFTRESET_OVERRIDE:true} \
-params {SOFTRESET_FPGA_SOFTRESET_OVERRIDE:true} \
-params {SOFTRESET_G4SPI0_SOFTRESET_OVERRIDE:true} \
-params {SOFTRESET_G4SPI1_SOFTRESET_OVERRIDE:true} \
-params {SOFTRESET_HPDMA_SOFTRESET_OVERRIDE:true} \
-params {SOFTRESET_I2C0_SOFTRESET_OVERRIDE:true} \
-params {SOFTRESET_I2C1_SOFTRESET_OVERRIDE:true} \
-params {SOFTRESET_MAC_SOFTRESET_OVERRIDE:true} \
-params {SOFTRESET_MDDR_CTLR_SOFTRESET_OVERRIDE:true} \
-params {SOFTRESET_MDDR_FIC64_SOFTRESET_OVERRIDE:true} \
-params {SOFTRESET_MMUART0_SOFTRESET_OVERRIDE:true} \
-params {SOFTRESET_MMUART1_SOFTRESET_OVERRIDE:true} \
-params {SOFTRESET_MSS_GPIO_SOFTRESET_OVERRIDE:true} \
-params {SOFTRESET_MSS_GPOUT_15_8_SOFT_RESET_OVERRIDE:true} \
-params {SOFTRESET_MSS_GPOUT_23_16_SOFT_RESET_OVERRIDE:true} \
-params {SOFTRESET_MSS_GPOUT_31_24_SOFT_RESET_OVERRIDE:true} \
-params {SOFTRESET_MSS_GPOUT_7_0_SOFT_RESET_OVERRIDE:true} \
-params {SOFTRESET_PDMA_SOFTRESET_OVERRIDE:true} \
-params {SOFTRESET_TIMER_SOFTRESET_OVERRIDE:true} \
-params {SOFTRESET_USB_SOFTRESET_OVERRIDE:true} \
-params {SOFT_INTERRUPT_OVERRIDE:true} \
-params {SPARE_OUT_OVERRIDE:true} \
-params {USB_CONFIG_OVERRIDE:true} \
-params {USB_IO_INPUT_SEL_OVERRIDE:true} \
-params {WDOGCONFIG_OVERRIDE:true} 

#Generating the System Builder component
generate_sb_component -component_name ${sysbld_name}

#Close the System Builder component
close_sb_component -component_name ${sysbld_name}

# Exporting Component Description of top_sb to TCL done
