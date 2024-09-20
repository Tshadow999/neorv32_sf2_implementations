set_device \
    -fam IGLOO2 \
    -die PA4MGL1000_N \
    -pkg vf400
set_input_cfg \
	-path {/home/s2556154/Libero/ThesisProject/NEORV32-SRAM/neorv32-sf2-with-envm/prj_dir/component/work/top_sb_HPMS/ENVM.cfg}
set_output_efc \
    -path {/home/s2556154/Libero/ThesisProject/NEORV32-SRAM/neorv32-sf2-with-envm/prj_dir/designer/top/top.efc}
set_proj_dir \
    -path {/home/s2556154/Libero/ThesisProject/NEORV32-SRAM/neorv32-sf2-with-envm/prj_dir}
set_is_relative_path \
    -value {FALSE}
set_root_path_dir \
    -path {}
gen_prg -use_init true
