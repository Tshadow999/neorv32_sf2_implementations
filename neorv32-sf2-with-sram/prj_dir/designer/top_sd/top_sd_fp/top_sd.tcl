open_project -project {/home/tycho/git/NEORV32-SRAM/neorv32-sf2-with-sram/prj_dir/designer/top_sd/top_sd_fp/top_sd.pro}
enable_device -name {M2GL010} -enable 1
set_programming_file -name {M2GL010} -file {/home/tycho/git/NEORV32-SRAM/neorv32-sf2-with-sram/prj_dir/designer/top_sd/top_sd.ppd}
set_programming_action -action {PROGRAM} -name {M2GL010} 
run_selected_actions
save_project
close_project
