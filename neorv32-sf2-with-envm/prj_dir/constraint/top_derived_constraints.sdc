# Microsemi Corp.
# Date: 2024-Sep-20 09:45:22
# This file was generated based on the following SDC source files:
#   /home/s2556154/Libero/ThesisProject/NEORV32-SRAM/neorv32-sf2-with-envm/prj_dir/component/work/top_sb/CCC_0/top_sb_CCC_0_FCCC.sdc
#   /remote/labware/packages/microsemi/libero/v2022.1/Libero/data/aPA4M/cores/constraints/coreresetp.sdc
#   /home/s2556154/Libero/ThesisProject/NEORV32-SRAM/neorv32-sf2-with-envm/prj_dir/component/work/top_sb/FABOSC_0/top_sb_FABOSC_0_OSC.sdc
#   /home/s2556154/Libero/ThesisProject/NEORV32-SRAM/neorv32-sf2-with-envm/prj_dir/component/work/top_sb_HPMS/top_sb_HPMS.sdc
#   /remote/labware/packages/microsemi/libero/v2022.1/Libero/data/aPA4M/cores/constraints/sysreset.sdc
#

create_clock -name {top_sb_0/FABOSC_0/I_RCOSC_25_50MHZ/CLKOUT} -period 20 [ get_pins { top_sb_0/FABOSC_0/I_RCOSC_25_50MHZ/CLKOUT } ]
create_generated_clock -name {top_sb_0/CCC_0/GL0} -multiply_by 2 -divide_by 10 -source [ get_pins { top_sb_0/CCC_0/CCC_INST/RCOSC_25_50MHZ } ] -phase 0 [ get_pins { top_sb_0/CCC_0/CCC_INST/GL0 } ]
set_false_path -ignore_errors -through [ get_nets { top_sb_0/CORERESETP_0/ddr_settled top_sb_0/CORERESETP_0/count_ddr_enable top_sb_0/CORERESETP_0/release_sdif*_core top_sb_0/CORERESETP_0/count_sdif*_enable } ]
set_false_path -ignore_errors -from [ get_cells { top_sb_0/CORERESETP_0/MSS_HPMS_READY_int } ] -to [ get_cells { top_sb_0/CORERESETP_0/sm0_areset_n_rcosc top_sb_0/CORERESETP_0/sm0_areset_n_rcosc_q1 } ]
set_false_path -ignore_errors -from [ get_cells { top_sb_0/CORERESETP_0/MSS_HPMS_READY_int top_sb_0/CORERESETP_0/SDIF*_PERST_N_re } ] -to [ get_cells { top_sb_0/CORERESETP_0/sdif*_areset_n_rcosc* } ]
set_false_path -ignore_errors -through [ get_nets { top_sb_0/CORERESETP_0/CONFIG1_DONE top_sb_0/CORERESETP_0/CONFIG2_DONE top_sb_0/CORERESETP_0/SDIF*_PERST_N top_sb_0/CORERESETP_0/SDIF*_PSEL top_sb_0/CORERESETP_0/SDIF*_PWRITE top_sb_0/CORERESETP_0/SDIF*_PRDATA[*] top_sb_0/CORERESETP_0/SOFT_EXT_RESET_OUT top_sb_0/CORERESETP_0/SOFT_RESET_F2M top_sb_0/CORERESETP_0/SOFT_M3_RESET top_sb_0/CORERESETP_0/SOFT_MDDR_DDR_AXI_S_CORE_RESET top_sb_0/CORERESETP_0/SOFT_FDDR_CORE_RESET top_sb_0/CORERESETP_0/SOFT_SDIF*_PHY_RESET top_sb_0/CORERESETP_0/SOFT_SDIF*_CORE_RESET top_sb_0/CORERESETP_0/SOFT_SDIF0_0_CORE_RESET top_sb_0/CORERESETP_0/SOFT_SDIF0_1_CORE_RESET } ]
set_false_path -ignore_errors -through [ get_pins { top_sb_0/top_sb_HPMS_0/MSS_ADLIB_INST/CONFIG_PRESET_N } ]
set_false_path -ignore_errors -through [ get_pins { top_sb_0/SYSRESET_POR/POWER_ON_RESET_N } ]
