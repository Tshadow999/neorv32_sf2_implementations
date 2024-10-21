# Creating SmartDesign top
set sd_name {top_sd}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

sd_instantiate_hdl_module -sd_name  ${sd_name} -hdl_module_name {neorv32_ProcessorTop_MinimalBoot} -hdl_file {hdl/neorv32_ProcessorTop_MinimalBoot.vhd} -instance_name {} 
create_and_configure_core -core_vlnv {Actel:SgCore:OSC:2.0.101} -component_name {OSC_C0} -params {"RCOSC_1MHZ_DRIVES_CCC:false" "RCOSC_1MHZ_DRIVES_FAB:false" "RCOSC_1MHZ_IS_USED:false" "RCOSC_25_50MHZ_DRIVES_CCC:1" "RCOSC_25_50MHZ_DRIVES_FAB:false" "RCOSC_25_50MHZ_IS_USED:1" "VOLTAGE_IS_1_2:true" "XTLOSC_DRIVES_CCC:false" "XTLOSC_DRIVES_FAB:false" "XTLOSC_FREQ:20.00" "XTLOSC_IS_USED:false" "XTLOSC_SRC:CRYSTAL"} 
sd_instantiate_component -sd_name  ${sd_name} -component_name {OSC_C0} -instance_name {} 
create_and_configure_core -core_vlnv {Actel:SgCore:FCCC:2.0.201} -component_name {FCCC_C0} -params {"ADVANCED_TAB_CHANGED:false" "CLK0_IS_USED:false" "CLK0_PAD_IS_USED:false" "CLK1_IS_USED:false" "CLK1_PAD_IS_USED:false" "CLK2_IS_USED:false" "CLK2_PAD_IS_USED:false" "CLK3_IS_USED:false" "CLK3_PAD_IS_USED:false" "DYN_CONF_IS_USED:false" "GL0_BP_IN_0_FREQ:100" "GL0_BP_IN_0_SRC:IO_HARDWIRED_0" "GL0_BP_IN_1_FREQ:100" "GL0_BP_IN_1_SRC:IO_HARDWIRED_0" "GL0_FREQUENCY_LOCKED:false" "GL0_IN_0_SRC:PLL" "GL0_IN_1_SRC:UNUSED" "GL0_IS_INVERTED:false" "GL0_IS_USED:true" "GL0_OUT_0_FREQ:10" "GL0_OUT_1_FREQ:50" "GL0_OUT_IS_GATED:false" "GL0_PLL_IN_0_PHASE:0" "GL0_PLL_IN_1_PHASE:0" "GL1_BP_IN_0_FREQ:100" "GL1_BP_IN_0_SRC:IO_HARDWIRED_0" "GL1_BP_IN_1_FREQ:100" "GL1_BP_IN_1_SRC:IO_HARDWIRED_0" "GL1_FREQUENCY_LOCKED:false" "GL1_IN_0_SRC:PLL" "GL1_IN_1_SRC:UNUSED" "GL1_IS_INVERTED:false" "GL1_IS_USED:false" "GL1_OUT_0_FREQ:100" "GL1_OUT_1_FREQ:50" "GL1_OUT_IS_GATED:false" "GL1_PLL_IN_0_PHASE:0" "GL1_PLL_IN_1_PHASE:0" "GL2_BP_IN_0_FREQ:100" "GL2_BP_IN_0_SRC:IO_HARDWIRED_0" "GL2_BP_IN_1_FREQ:100" "GL2_BP_IN_1_SRC:IO_HARDWIRED_0" "GL2_FREQUENCY_LOCKED:false" "GL2_IN_0_SRC:PLL" "GL2_IN_1_SRC:UNUSED" "GL2_IS_INVERTED:false" "GL2_IS_USED:false" "GL2_OUT_0_FREQ:100" "GL2_OUT_1_FREQ:50" "GL2_OUT_IS_GATED:false" "GL2_PLL_IN_0_PHASE:0" "GL2_PLL_IN_1_PHASE:0" "GL3_BP_IN_0_FREQ:100" "GL3_BP_IN_0_SRC:IO_HARDWIRED_0" "GL3_BP_IN_1_FREQ:100" "GL3_BP_IN_1_SRC:IO_HARDWIRED_0" "GL3_FREQUENCY_LOCKED:false" "GL3_IN_0_SRC:PLL" "GL3_IN_1_SRC:UNUSED" "GL3_IS_INVERTED:false" "GL3_IS_USED:false" "GL3_OUT_0_FREQ:100" "GL3_OUT_1_FREQ:50" "GL3_OUT_IS_GATED:false" "GL3_PLL_IN_0_PHASE:0" "GL3_PLL_IN_1_PHASE:0" "GPD0_IS_USED:true" "GPD0_NOPIPE_RSTSYNC:true" "GPD0_SYNC_STYLE:G3STYLE_AND_LOCK_RSTSYNC" "GPD1_IS_USED:false" "GPD1_NOPIPE_RSTSYNC:true" "GPD1_SYNC_STYLE:G3STYLE_AND_NO_LOCK_RSTSYNC" "GPD2_IS_USED:false" "GPD2_NOPIPE_RSTSYNC:true" "GPD2_SYNC_STYLE:G3STYLE_AND_NO_LOCK_RSTSYNC" "GPD3_IS_USED:false" "GPD3_NOPIPE_RSTSYNC:true" "GPD3_SYNC_STYLE:G3STYLE_AND_NO_LOCK_RSTSYNC" "GPD_EXPOSE_RESETS:false" "GPD_SYNC_STYLE:G3STYLE_AND_LOCK_RSTSYNC" "INIT:0000007FA8000045574000718C6318C2318C1DEC0404040800104" "IO_HARDWIRED_0_IS_DIFF:false" "IO_HARDWIRED_1_IS_DIFF:false" "IO_HARDWIRED_2_IS_DIFF:false" "IO_HARDWIRED_3_IS_DIFF:false" "MODE_10V:false" "NGMUX0_HOLD_IS_USED:false" "NGMUX0_IS_USED:false" "NGMUX1_HOLD_IS_USED:false" "NGMUX1_IS_USED:false" "NGMUX2_HOLD_IS_USED:false" "NGMUX2_IS_USED:false" "NGMUX3_HOLD_IS_USED:false" "NGMUX3_IS_USED:false" "NGMUX_EXPOSE_HOLD:false" "PLL_DELAY:0" "PLL_EXPOSE_BYPASS:false" "PLL_EXPOSE_RESETS:false" "PLL_EXT_FB_GL:EXT_FB_GL0" "PLL_FB_SRC:CCC_INTERNAL" "PLL_IN_FREQ:50.000" "PLL_IN_SRC:OSC_50MHZ" "PLL_IS_USED:true" "PLL_LOCK_IND:1024" "PLL_LOCK_WND:32000" "PLL_SSM_DEPTH:0.5" "PLL_SSM_ENABLE:false" "PLL_SSM_FREQ:40" "PLL_SUPPLY_VOLTAGE:25_V" "PLL_VCO_TARGET:700" "RCOSC_1MHZ_IS_USED:false" "RCOSC_25_50MHZ_IS_USED:true" "VCOFREQUENCY:640.000" "XTLOSC_IS_USED:false" "Y0_IS_USED:false" "Y1_IS_USED:false" "Y2_IS_USED:false" "Y3_IS_USED:false"} 
sd_instantiate_component -sd_name  ${sd_name} -component_name {FCCC_C0} -instance_name {} 
sd_instantiate_macro -sd_name  ${sd_name} -macro_name {AND2} -instance_name {} 
sd_instantiate_macro -sd_name  ${sd_name} -macro_name {SYSRESET} -instance_name {} 

sd_create_pin_slices -sd_name  ${sd_name} -pin_name {neorv32_ProcessorTop_MinimalBoot_0:gpio_o} -pin_slices {"[7:7]"} 
sd_create_pin_slices -sd_name  ${sd_name} -pin_name {neorv32_ProcessorTop_MinimalBoot_0:gpio_o} -pin_slices {"[6:6]"} 
sd_create_pin_slices -sd_name  ${sd_name} -pin_name {neorv32_ProcessorTop_MinimalBoot_0:gpio_o} -pin_slices {"[5:5]"} 
sd_create_pin_slices -sd_name  ${sd_name} -pin_name {neorv32_ProcessorTop_MinimalBoot_0:gpio_o} -pin_slices {"[4:4]"} 
sd_create_pin_slices -sd_name  ${sd_name} -pin_name {neorv32_ProcessorTop_MinimalBoot_0:gpio_o} -pin_slices {"[3:3]"} 
sd_create_pin_slices -sd_name  ${sd_name} -pin_name {neorv32_ProcessorTop_MinimalBoot_0:gpio_o} -pin_slices {"[2:2]"} 
sd_create_pin_slices -sd_name  ${sd_name} -pin_name {neorv32_ProcessorTop_MinimalBoot_0:gpio_o} -pin_slices {"[1:1]"} 
sd_create_pin_slices -sd_name  ${sd_name} -pin_name {neorv32_ProcessorTop_MinimalBoot_0:gpio_o} -pin_slices {"[0:0]"} 

sd_create_scalar_port -sd_name ${sd_name} -port_name {DEVRST_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {UART_RX} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {UART_TX} -port_direction {OUT}

sd_create_scalar_port -sd_name ${sd_name} -port_name {led0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {led1} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {led2} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {led3} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {led4} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {led5} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {led6} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {led7} -port_direction {OUT}

sd_connect_pins -sd_name  ${sd_name} -pin_names {"DEVRST_N" "SYSRESET_0:DEVRST_N" }
sd_connect_pins -sd_name  ${sd_name} -pin_names {"FCCC_C0_0:RCOSC_25_50MHZ_CCC_IN" "OSC_C0_0:RCOSC_25_50MHZ_CCC_OUT"} 
sd_connect_pins -sd_name  ${sd_name} -pin_names {"FCCC_C0_0:GL0" "neorv32_ProcessorTop_MinimalBoot_0:clk_i"} 
sd_connect_pins -sd_name  ${sd_name} -pin_names {"AND2_0:B" "FCCC_C0_0:LOCK"} 
sd_connect_pins -sd_name  ${sd_name} -pin_names {"AND2_0:A" "SYSRESET_0:POWER_ON_RESET_N"} 
sd_connect_pins -sd_name  ${sd_name} -pin_names {"AND2_0:Y" "neorv32_ProcessorTop_MinimalBoot_0:rstn_i"} 
sd_connect_pins -sd_name ${sd_name} -pin_names {"UART_RX" "neorv32_ProcessorTop_MinimalBoot_0:uart0_rxd_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"UART_TX" "neorv32_ProcessorTop_MinimalBoot_0:uart0_txd_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"led0" "neorv32_ProcessorTop_MinimalBoot_0:gpio_o[0:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"led1" "neorv32_ProcessorTop_MinimalBoot_0:gpio_o[1:1]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"led2" "neorv32_ProcessorTop_MinimalBoot_0:gpio_o[2:2]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"led3" "neorv32_ProcessorTop_MinimalBoot_0:gpio_o[3:3]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"led4" "neorv32_ProcessorTop_MinimalBoot_0:gpio_o[4:4]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"led5" "neorv32_ProcessorTop_MinimalBoot_0:gpio_o[5:5]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"led6" "neorv32_ProcessorTop_MinimalBoot_0:gpio_o[6:6]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"led7" "neorv32_ProcessorTop_MinimalBoot_0:gpio_o[7:7]" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign top
generate_component -component_name ${sd_name}
