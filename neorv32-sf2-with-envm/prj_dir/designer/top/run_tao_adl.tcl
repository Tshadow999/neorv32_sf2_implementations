set_device -family {IGLOO2} -die {M2GL010} -speed {STD}
read_adl {/home/tycho/git/NEORV32-SRAM/neorv32-sf2-with-envm/prj_dir/designer/top/top.adl}
read_afl {/home/tycho/git/NEORV32-SRAM/neorv32-sf2-with-envm/prj_dir/designer/top/top.afl}
map_netlist
read_sdc {/home/tycho/git/NEORV32-SRAM/neorv32-sf2-with-envm/prj_dir/constraint/top_derived_constraints.sdc}
check_constraints {/home/tycho/git/NEORV32-SRAM/neorv32-sf2-with-envm/prj_dir/constraint/placer_sdc_errors.log}
write_sdc -mode layout {/home/tycho/git/NEORV32-SRAM/neorv32-sf2-with-envm/prj_dir/designer/top/place_route.sdc}
