set_device -family {IGLOO2} -die {M2GL010} -speed {STD}
read_adl {/home/tycho/git/NEORV32-SRAM/neorv32-sf2-with-sram/prj_dir/designer/top_sd/top_sd.adl}
read_afl {/home/tycho/git/NEORV32-SRAM/neorv32-sf2-with-sram/prj_dir/designer/top_sd/top_sd.afl}
map_netlist
read_sdc {/home/tycho/git/NEORV32-SRAM/neorv32-sf2-with-sram/prj_dir/constraint/top_sd_derived_constraints.sdc}
check_constraints {/home/tycho/git/NEORV32-SRAM/neorv32-sf2-with-sram/prj_dir/constraint/placer_sdc_errors.log}
write_sdc -mode layout {/home/tycho/git/NEORV32-SRAM/neorv32-sf2-with-sram/prj_dir/designer/top_sd/place_route.sdc}
