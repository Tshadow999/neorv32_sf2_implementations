new_project \
         -name {top} \
         -location {/home/s2556154/Libero/ThesisProject/NEORV32-SRAM/neorv32-sf2-with-envm/prj_dir/designer/top/top_fp} \
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
