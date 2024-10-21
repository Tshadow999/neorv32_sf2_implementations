new_project \
         -name {top_sd} \
         -location {/home/tycho/git/NEORV32-SRAM/neorv32-sf2-with-sram/prj_dir/designer/top_sd/top_sd_fp} \
         -mode {chain} \
         -connect_programmers {FALSE}
add_actel_device \
         -device {M2GL010} \
         -name {M2GL010}
enable_device \
         -name {M2GL010} \
         -enable {TRUE}
save_project
close_project
