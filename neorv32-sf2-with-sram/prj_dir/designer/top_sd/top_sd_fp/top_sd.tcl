open_project -project {/home/tycho/git/NEORV32-SRAM/neorv32-sf2-with-sram/prj_dir/designer/top_sd/top_sd_fp/top_sd.pro}\
         -connect_programmers {FALSE}
load_programming_data \
    -name {M2GL010} \
    -fpga {/home/tycho/git/NEORV32-SRAM/neorv32-sf2-with-sram/prj_dir/designer/top_sd/top_sd.map} \
    -header {/home/tycho/git/NEORV32-SRAM/neorv32-sf2-with-sram/prj_dir/designer/top_sd/top_sd.hdr} \
    -spm {/home/tycho/git/NEORV32-SRAM/neorv32-sf2-with-sram/prj_dir/designer/top_sd/top_sd.spm} \
    -dca {/home/tycho/git/NEORV32-SRAM/neorv32-sf2-with-sram/prj_dir/designer/top_sd/top_sd.dca}
export_single_ppd \
    -name {M2GL010} \
    -file {/home/tycho/git/NEORV32-SRAM/neorv32-sf2-with-sram/prj_dir/designer/top_sd/top_sd.ppd}

save_project
close_project
