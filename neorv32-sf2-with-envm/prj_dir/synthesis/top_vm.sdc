# Written by Synplify Pro version map202209actsp2, Build 067R. Synopsys Run ID: sid1727963561 
# Top Level Design Parameters 

# Clocks 
create_clock -period 20.000 -waveform {0.000 10.000} -name {top_sb_0/FABOSC_0/I_RCOSC_25_50MHZ/CLKOUT} [get_pins {top_sb_0/FABOSC_0/I_RCOSC_25_50MHZ/CLKOUT}] 

# Virtual Clocks 

# Generated Clocks 
create_generated_clock -name {top_sb_0/CCC_0/GL0} -multiply_by {2} -divide_by {10} -source [get_pins {top_sb_0/CCC_0/CCC_INST/RCOSC_25_50MHZ}]  [get_pins {top_sb_0/CCC_0/CCC_INST/GL0}] 

# Paths Between Clocks 

# Multicycle Constraints 

# Point-to-point Delay Constraints 

# False Path Constraints 
set_false_path -through [get_pins {top_sb_0/SYSRESET_POR/POWER_ON_RESET_N}] 
set_false_path -through [get_pins {top_sb_0/CORERESETP_0/release_sdif3_core/Q top_sb_0/CORERESETP_0/release_sdif2_core/Q top_sb_0/CORERESETP_0/release_sdif1_core/Q top_sb_0/CORERESETP_0/release_sdif0_core/Q top_sb_0/CORERESETP_0/ddr_settled/Q}] 
set_false_path -from [get_cells {top_sb_0/CORERESETP_0/MSS_HPMS_READY_int_rep top_sb_0/CORERESETP_0/MSS_HPMS_READY_int}] -to [get_cells {top_sb_0/CORERESETP_0/sm0_areset_n_rcosc_q1 top_sb_0/CORERESETP_0/sm0_areset_n_rcosc}] 
set_false_path -from [get_cells {top_sb_0/CORERESETP_0/MSS_HPMS_READY_int_rep top_sb_0/CORERESETP_0/MSS_HPMS_READY_int}] -to [get_cells {top_sb_0/CORERESETP_0/sdif0_areset_n_rcosc_q1 top_sb_0/CORERESETP_0/sdif0_areset_n_rcosc}] 

# Output Load Constraints 

# Driving Cell Constraints 

# Input Delay Constraints 

# Output Delay Constraints 

# Wire Loads 

# Other Constraints 

# syn_hier Attributes 

# set_case Attributes 

# Clock Delay Constraints 

# syn_mode Attributes 

# Cells 

# Port DRC Rules 

# Input Transition Constraints 

# Unused constraints (intentionally commented out) 
# set_false_path -through [get_nets { top_sb_0.CORERESETP_0.CONFIG1_DONE top_sb_0.CORERESETP_0.CONFIG2_DONE top_sb_0.CORERESETP_0.SDIF*_PERST_N top_sb_0.CORERESETP_0.SDIF*_PSEL top_sb_0.CORERESETP_0.SDIF*_PWRITE top_sb_0.CORERESETP_0.SDIF*_PRDATA[*] top_sb_0.CORERESETP_0.SOFT_EXT_RESET_OUT top_sb_0.CORERESETP_0.SOFT_RESET_F2M top_sb_0.CORERESETP_0.SOFT_M3_RESET top_sb_0.CORERESETP_0.SOFT_MDDR_DDR_AXI_S_CORE_RESET top_sb_0.CORERESETP_0.SOFT_FDDR_CORE_RESET top_sb_0.CORERESETP_0.SOFT_SDIF*_PHY_RESET top_sb_0.CORERESETP_0.SOFT_SDIF*_CORE_RESET top_sb_0.CORERESETP_0.SOFT_SDIF0_0_CORE_RESET top_sb_0.CORERESETP_0.SOFT_SDIF0_1_CORE_RESET }]
# set_false_path -through [get_pins { top_sb_0.top_sb_HPMS_0.MSS_ADLIB_INST.CONFIG_PRESET_N }]


# Non-forward-annotatable constraints (intentionally commented out) 

# Block Path constraints 

