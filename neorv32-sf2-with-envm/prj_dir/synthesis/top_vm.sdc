# Written by Synplify Pro version map202109act, Build 055R. Synopsys Run ID: sid1726818337 
# Top Level Design Parameters 

# Clocks 
create_clock -period 20.000 -waveform {0.000 10.000} -name {top_sb_0/FABOSC_0/I_RCOSC_25_50MHZ/CLKOUT} [get_pins {top_sb_0/FABOSC_0/I_RCOSC_25_50MHZ/CLKOUT}] 
create_clock -period 10.000 -waveform {0.000 5.000} -name {top_sb_CCC_0_FCCC|GL0_net_inferred_clock} [get_pins {top_sb_0/CCC_0/CCC_INST/GL0}] 

# Virtual Clocks 

# Generated Clocks 

# Paths Between Clocks 

# Multicycle Constraints 

# Point-to-point Delay Constraints 

# False Path Constraints 
set_false_path -through [get_pins {top_sb_0/SYSRESET_POR/POWER_ON_RESET_N}] 

# Output Load Constraints 

# Driving Cell Constraints 

# Input Delay Constraints 

# Output Delay Constraints 

# Wire Loads 

# Other Constraints 

# syn_hier Attributes 

# set_case Attributes 

# Clock Delay Constraints 
set_clock_groups -asynchronous -group [get_clocks {top_sb_CCC_0_FCCC|GL0_net_inferred_clock}]

# syn_mode Attributes 

# Cells 

# Port DRC Rules 

# Input Transition Constraints 

# Unused constraints (intentionally commented out) 
# set_false_path -through [get_nets { top_sb_0.CORERESETP_0.ddr_settled top_sb_0.CORERESETP_0.count_ddr_enable top_sb_0.CORERESETP_0.release_sdif*_core top_sb_0.CORERESETP_0.count_sdif*_enable }]
# set_false_path -from [get_cells { top_sb_0.CORERESETP_0.MSS_HPMS_READY_int }] -to [get_cells { top_sb_0.CORERESETP_0.sm0_areset_n_rcosc top_sb_0.CORERESETP_0.sm0_areset_n_rcosc_q1 }]
# set_false_path -from [get_cells { top_sb_0.CORERESETP_0.MSS_HPMS_READY_int top_sb_0.CORERESETP_0.SDIF*_PERST_N_re }] -to [get_cells { top_sb_0.CORERESETP_0.sdif*_areset_n_rcosc* }]
# set_false_path -through [get_nets { top_sb_0.CORERESETP_0.CONFIG1_DONE top_sb_0.CORERESETP_0.CONFIG2_DONE top_sb_0.CORERESETP_0.SDIF*_PERST_N top_sb_0.CORERESETP_0.SDIF*_PSEL top_sb_0.CORERESETP_0.SDIF*_PWRITE top_sb_0.CORERESETP_0.SDIF*_PRDATA[*] top_sb_0.CORERESETP_0.SOFT_EXT_RESET_OUT top_sb_0.CORERESETP_0.SOFT_RESET_F2M top_sb_0.CORERESETP_0.SOFT_M3_RESET top_sb_0.CORERESETP_0.SOFT_MDDR_DDR_AXI_S_CORE_RESET top_sb_0.CORERESETP_0.SOFT_FDDR_CORE_RESET top_sb_0.CORERESETP_0.SOFT_SDIF*_PHY_RESET top_sb_0.CORERESETP_0.SOFT_SDIF*_CORE_RESET top_sb_0.CORERESETP_0.SOFT_SDIF0_0_CORE_RESET top_sb_0.CORERESETP_0.SOFT_SDIF0_1_CORE_RESET }]
# set_false_path -through [get_pins { top_sb_0.top_sb_HPMS_0.MSS_ADLIB_INST.CONFIG_PRESET_N }]


# Non-forward-annotatable constraints (intentionally commented out) 

# Block Path constraints 

