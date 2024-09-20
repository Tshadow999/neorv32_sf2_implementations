# Microsemi Corp.
# Date: 2024-Sep-20 09:45:59
# This file was generated based on the following SDC source files:
#   /home/s2556154/Libero/ThesisProject/NEORV32-SRAM/neorv32-sf2-with-envm/prj_dir/constraint/top_derived_constraints.sdc
#

create_clock -name {top_sb_0/FABOSC_0/I_RCOSC_25_50MHZ/CLKOUT} -period 20 [ get_pins { top_sb_0/FABOSC_0/I_RCOSC_25_50MHZ/CLKOUT } ]
create_generated_clock -name {top_sb_0/CCC_0/GL0} -multiply_by 2 -divide_by 10 -source [ get_pins { top_sb_0/CCC_0/CCC_INST/INST_CCC_IP/RCOSC_25_50MHZ } ] -phase 0 [ get_pins { top_sb_0/CCC_0/CCC_INST/INST_CCC_IP/GL0 } ]
set_false_path -through [ get_nets { top_sb_0/CORERESETP_0/ddr_settled top_sb_0/CORERESETP_0/release_sdif*_core } ]
set_false_path -from [ get_cells { top_sb_0/CORERESETP_0/MSS_HPMS_READY_int } ] -to [ get_cells { top_sb_0/CORERESETP_0/sm0_areset_n_rcosc top_sb_0/CORERESETP_0/sm0_areset_n_rcosc_q1 } ]
set_false_path -from [ get_cells { top_sb_0/CORERESETP_0/MSS_HPMS_READY_int } ] -to [ get_cells { top_sb_0/CORERESETP_0/sdif*_areset_n_rcosc* } ]
set_false_path -through [ get_pins { top_sb_0/top_sb_HPMS_0/MSS_ADLIB_INST/INST_MSS_010_IP/CONFIG_PRESET_N } ]
set_false_path -through [ get_pins { top_sb_0/SYSRESET_POR/INST_SYSRESET_FF_IP/POWER_ON_RESET_N } ]
