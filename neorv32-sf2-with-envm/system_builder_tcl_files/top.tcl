# Creating SmartDesign top
set sd_name {top}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0


# Add top_sb_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {top_sb} -instance_name {top_sb_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {top_sb_0:HPMS_FIC_0_USER_MASTER_HRESP_M0} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {top_sb_0:HPMS_FIC_0_USER_MASTER_HRESP_M0} -pin_slices {[1:1]}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {top_sb_0:HPMS_FIC_0_USER_MASTER} -pin_names {top_sb_0:HPMS_FIC_0_USER_MASTER_HADDR_M0}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {top_sb_0:HPMS_FIC_0_USER_MASTER} -pin_names {top_sb_0:HPMS_FIC_0_USER_MASTER_HTRANS_M0}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {top_sb_0:HPMS_FIC_0_USER_MASTER} -pin_names {top_sb_0:HPMS_FIC_0_USER_MASTER_HWRITE_M0}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {top_sb_0:HPMS_FIC_0_USER_MASTER} -pin_names {top_sb_0:HPMS_FIC_0_USER_MASTER_HSIZE_M0}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {top_sb_0:HPMS_FIC_0_USER_MASTER} -pin_names {top_sb_0:HPMS_FIC_0_USER_MASTER_HBURST_M0}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {top_sb_0:HPMS_FIC_0_USER_MASTER} -pin_names {top_sb_0:HPMS_FIC_0_USER_MASTER_HPROT_M0}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {top_sb_0:HPMS_FIC_0_USER_MASTER} -pin_names {top_sb_0:HPMS_FIC_0_USER_MASTER_HWDATA_M0}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {top_sb_0:HPMS_FIC_0_USER_MASTER} -pin_names {top_sb_0:HPMS_FIC_0_USER_MASTER_HMASTLOCK_M0}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {top_sb_0:HPMS_FIC_0_USER_MASTER} -pin_names {top_sb_0:HPMS_FIC_0_USER_MASTER_HRDATA_M0}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {top_sb_0:HPMS_FIC_0_USER_MASTER} -pin_names {top_sb_0:HPMS_FIC_0_USER_MASTER_HREADY_M0}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {top_sb_0:HPMS_FIC_0_USER_MASTER} -pin_names {top_sb_0:HPMS_FIC_0_USER_MASTER_HRESP_M0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {top_sb_0:POWER_ON_RESET_N}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {top_sb_0:FIC_0_LOCK}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {top_sb_0:HPMS_READY}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {top_sb_0:COMM_BLK_INT}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {top_sb_0:HPMS_FIC_0_USER_MASTER_HPROT_M0} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {top_sb_0:HPMS_INT_M2F}

# Add neorv32_ProcessorTop_Minimal_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {neorv32_ProcessorTop_Minimal} -hdl_file {hdl\neorv32_ProcessorTop_Minimal.vhd} -instance_name {neorv32_ProcessorTop_Minimal_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {neorv32_ProcessorTop_Minimal_0:gpio_o} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {neorv32_ProcessorTop_Minimal_0:gpio_o} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {neorv32_ProcessorTop_Minimal_0:gpio_o} -pin_slices {[2:2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {neorv32_ProcessorTop_Minimal_0:gpio_o} -pin_slices {[3:3]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {neorv32_ProcessorTop_Minimal_0:gpio_o} -pin_slices {[4:4]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {neorv32_ProcessorTop_Minimal_0:gpio_o} -pin_slices {[5:5]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {neorv32_ProcessorTop_Minimal_0:gpio_o} -pin_slices {[6:6]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {neorv32_ProcessorTop_Minimal_0:gpio_o} -pin_slices {[7:7]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {neorv32_ProcessorTop_Minimal_0:wb_tag_o}


# Add WB2AHBL_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {WB2AHBL} -hdl_file {hdl\WB2AHBL.vhd} -instance_name {WB2AHBL_0}

# Add OR2_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {OR2} -instance_name {OR2_0}


# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {DEVRST_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {UART_RX} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {led0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {led1} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {led2} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {led3} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {led4} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {led5} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {led6} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {led7} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {UART_TX} -port_direction {OUT}

# Connect the components:
#puts "--------------------------got here---------------------------------"
sd_connect_pins -sd_name ${sd_name} -pin_names {"led0" "neorv32_ProcessorTop_Minimal_0:gpio_o[0:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"led1" "neorv32_ProcessorTop_Minimal_0:gpio_o[1:1]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"led2" "neorv32_ProcessorTop_Minimal_0:gpio_o[2:2]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"led3" "neorv32_ProcessorTop_Minimal_0:gpio_o[3:3]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"led4" "neorv32_ProcessorTop_Minimal_0:gpio_o[4:4]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"led5" "neorv32_ProcessorTop_Minimal_0:gpio_o[5:5]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"led6" "neorv32_ProcessorTop_Minimal_0:gpio_o[6:6]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"led7" "neorv32_ProcessorTop_Minimal_0:gpio_o[7:7]" }
#puts "--------------------------got here---------------------------------"
sd_connect_pins -sd_name ${sd_name} -pin_names {"UART_RX" "neorv32_ProcessorTop_Minimal_0:uart0_rxd_i" }
#puts "--------------------------got here---------------------------------"
sd_connect_pins -sd_name ${sd_name} -pin_names {"UART_TX" "neorv32_ProcessorTop_Minimal_0:uart0_txd_o" }
#puts "--------------------------got here---------------------------------"
sd_connect_pins -sd_name ${sd_name} -pin_names {"DEVRST_N" "top_sb_0:DEVRST_N" }

sd_connect_pins -sd_name ${sd_name} -pin_names {"OR2_0:A" "top_sb_0:HPMS_FIC_0_USER_MASTER_HRESP_M0[1:1]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"OR2_0:B" "top_sb_0:HPMS_FIC_0_USER_MASTER_HRESP_M0[0:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"OR2_0:Y" "WB2AHBL_0:hresp" }

#puts "--------------------------got here---------------------------------"
sd_connect_pins -sd_name ${sd_name} -pin_names {"WB2AHBL_0:ack_o" "neorv32_ProcessorTop_Minimal_0:wb_ack_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"WB2AHBL_0:cyc_i" "neorv32_ProcessorTop_Minimal_0:wb_cyc_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"WB2AHBL_0:err_o" "neorv32_ProcessorTop_Minimal_0:wb_err_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"WB2AHBL_0:hclk" "neorv32_ProcessorTop_Minimal_0:clk_i" "top_sb_0:FIC_0_CLK" "top_sb_0:HPMS_FIC_0_USER_MASTER_HMASTLOCK_M0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"WB2AHBL_0:hready" "top_sb_0:HPMS_FIC_0_USER_MASTER_HREADY_M0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"WB2AHBL_0:hresetn" "neorv32_ProcessorTop_Minimal_0:rstn_i" "top_sb_0:INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"WB2AHBL_0:hwrite" "top_sb_0:HPMS_FIC_0_USER_MASTER_HWRITE_M0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"WB2AHBL_0:stb_i" "neorv32_ProcessorTop_Minimal_0:wb_stb_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"WB2AHBL_0:we_i" "neorv32_ProcessorTop_Minimal_0:wb_we_o" }

sd_connect_pins -sd_name ${sd_name} -pin_names {"WB2AHBL_0:addr_i" "neorv32_ProcessorTop_Minimal_0:wb_adr_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"WB2AHBL_0:data_i" "neorv32_ProcessorTop_Minimal_0:wb_dat_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"WB2AHBL_0:data_o" "neorv32_ProcessorTop_Minimal_0:wb_dat_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"WB2AHBL_0:haddr" "top_sb_0:HPMS_FIC_0_USER_MASTER_HADDR_M0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"WB2AHBL_0:hburst" "top_sb_0:HPMS_FIC_0_USER_MASTER_HBURST_M0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"WB2AHBL_0:hrdata" "top_sb_0:HPMS_FIC_0_USER_MASTER_HRDATA_M0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"WB2AHBL_0:hsize" "top_sb_0:HPMS_FIC_0_USER_MASTER_HSIZE_M0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"WB2AHBL_0:htrans" "top_sb_0:HPMS_FIC_0_USER_MASTER_HTRANS_M0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"WB2AHBL_0:hwdata" "top_sb_0:HPMS_FIC_0_USER_MASTER_HWDATA_M0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"WB2AHBL_0:sel_i" "neorv32_ProcessorTop_Minimal_0:wb_sel_o" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign top
generate_component -component_name ${sd_name}