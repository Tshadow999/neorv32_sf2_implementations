set_component top_sb_CCC_0_FCCC
# Microsemi Corp.
# Date: 2024-Oct-18 08:59:03
#

create_clock -period 10 [ get_pins { CCC_INST/CLK0_PAD } ]
create_generated_clock -multiply_by 4 -divide_by 16 -source [ get_pins { CCC_INST/CLK0_PAD } ] -phase 0 [ get_pins { CCC_INST/GL0 } ]
create_generated_clock -multiply_by 4 -divide_by 4 -source [ get_pins { CCC_INST/CLK0_PAD } ] -phase 0 [ get_pins { CCC_INST/GL2 } ]
