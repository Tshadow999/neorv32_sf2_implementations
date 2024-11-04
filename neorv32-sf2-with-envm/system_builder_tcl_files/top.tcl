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

# Add top_wrapper_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {top_wrapper} -hdl_file {hdl\top.vhd} -instance_name {top_wrapper_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {top_wrapper_0:gpio_o} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {top_wrapper_0:gpio_o} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {top_wrapper_0:gpio_o} -pin_slices {[2:2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {top_wrapper_0:gpio_o} -pin_slices {[3:3]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {top_wrapper_0:gpio_o} -pin_slices {[4:4]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {top_wrapper_0:gpio_o} -pin_slices {[5:5]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {top_wrapper_0:gpio_o} -pin_slices {[6:6]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {top_wrapper_0:gpio_o} -pin_slices {[7:7]}

# Create top level Scalar Ports
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

# Connect the components:
sd_connect_pins -sd_name ${sd_name} -pin_names {"DEVRST_N" "top_sb_0:DEVRST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"top_sb_0:HPMS_FIC_0_USER_MASTER_HMASTLOCK_M0" "top_wrapper_0:clk_i" "top_sb_0:FIC_0_CLK"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"top_wrapper_0:rstn_i" "top_sb_0:INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"UART_RX" "top_wrapper_0:uart0_rxd_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"UART_TX" "top_wrapper_0:uart0_txd_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"led0" "top_wrapper_0:gpio_o[0:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"led1" "top_wrapper_0:gpio_o[1:1]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"led2" "top_wrapper_0:gpio_o[2:2]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"led3" "top_wrapper_0:gpio_o[3:3]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"led4" "top_wrapper_0:gpio_o[4:4]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"led5" "top_wrapper_0:gpio_o[5:5]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"led6" "top_wrapper_0:gpio_o[6:6]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"led7" "top_wrapper_0:gpio_o[7:7]" }

sd_connect_pins -sd_name ${sd_name} -pin_names {"top_wrapper_0:ahb_haddr_o" "top_sb_0:HPMS_FIC_0_USER_MASTER_HADDR_M0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"top_wrapper_0:ahb_hwdata_o" "top_sb_0:HPMS_FIC_0_USER_MASTER_HWDATA_M0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"top_wrapper_0:ahb_hwrite_o" "top_sb_0:HPMS_FIC_0_USER_MASTER_HWRITE_M0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"top_wrapper_0:ahb_hsize_o" "top_sb_0:HPMS_FIC_0_USER_MASTER_HSIZE_M0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"top_wrapper_0:ahb_hburst_o" "top_sb_0:HPMS_FIC_0_USER_MASTER_HBURST_M0" }
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {top_wrapper_0:ahb_hprot_o}
sd_connect_pins -sd_name ${sd_name} -pin_names {"top_wrapper_0:ahb_htrans_o" "top_sb_0:HPMS_FIC_0_USER_MASTER_HTRANS_M0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"top_wrapper_0:ahb_hready_i" "top_sb_0:HPMS_FIC_0_USER_MASTER_HREADY_M0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"top_wrapper_0:ahb_hresp_i_1" "top_sb_0:HPMS_FIC_0_USER_MASTER_HRESP_M0[1:1]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"top_wrapper_0:ahb_hresp_i_2" "top_sb_0:HPMS_FIC_0_USER_MASTER_HRESP_M0[0:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"top_wrapper_0:ahb_hrdata_i" "top_sb_0:HPMS_FIC_0_USER_MASTER_HRDATA_M0" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign top
generate_component -component_name ${sd_name}
