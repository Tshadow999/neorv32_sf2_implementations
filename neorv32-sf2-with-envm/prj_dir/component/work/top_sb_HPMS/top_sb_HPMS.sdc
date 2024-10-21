set_component top_sb_HPMS
# Microsemi Corp.
# Date: 2024-Oct-18 08:44:34
#

create_clock -period 50 [ get_pins { MSS_ADLIB_INST/CLK_CONFIG_APB } ]
set_false_path -ignore_errors -through [ get_pins { MSS_ADLIB_INST/CONFIG_PRESET_N } ]
