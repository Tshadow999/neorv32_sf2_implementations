set_device -family {IGLOO2} -die {M2GL010T} -speed {STD}
read_vhdl -mode vhdl_2008 {/home/tycho/git/NEORV32-SRAM/neorv32-sf2-with-sram/component/work/FCCC_C0/FCCC_C0_0/FCCC_C0_FCCC_C0_0_FCCC.vhd}
read_vhdl -mode vhdl_2008 {/home/tycho/git/NEORV32-SRAM/neorv32-sf2-with-sram/component/work/FCCC_C0/FCCC_C0.vhd}
read_vhdl -mode vhdl_2008 {/home/tycho/git/NEORV32-SRAM/neorv32-sf2-with-sram/component/work/OSC_C0/OSC_C0_0/OSC_C0_OSC_C0_0_OSC.vhd}
read_vhdl -mode vhdl_2008 {/home/tycho/git/NEORV32-SRAM/neorv32-sf2-with-sram/component/work/OSC_C0/OSC_C0.vhd}
read_vhdl -mode vhdl_2008 {/home/tycho/git/NEORV32-SRAM/neorv32-sf2-with-sram/hdl/neorv32_ProcessorTop_Minimal.vhd}
read_vhdl -mode vhdl_2008 {/home/tycho/git/NEORV32-SRAM/neorv32-sf2-with-sram/component/work/top/top.vhd}
set_top_level {top}
map_netlist
check_constraints {/home/tycho/git/NEORV32-SRAM/neorv32-sf2-with-sram/constraint/synthesis_sdc_errors.log}
write_fdc {/home/tycho/git/NEORV32-SRAM/neorv32-sf2-with-sram/designer/top/synthesis.fdc}
