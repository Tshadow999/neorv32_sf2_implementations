open_project -project {/home/s2556154/Libero/ThesisProject/NEORV32-SRAM/neorv32-sf2-with-envm/prj_dir/designer/top/top_fp/top.pro}\
         -connect_programmers {FALSE}
load_programming_data \
    -name {M2GL010} \
    -fpga {/home/s2556154/Libero/ThesisProject/NEORV32-SRAM/neorv32-sf2-with-envm/prj_dir/designer/top/top.map} \
    -header {/home/s2556154/Libero/ThesisProject/NEORV32-SRAM/neorv32-sf2-with-envm/prj_dir/designer/top/top.hdr} \
    -envm {/home/s2556154/Libero/ThesisProject/NEORV32-SRAM/neorv32-sf2-with-envm/prj_dir/designer/top/top.efc} \
    -spm {/home/s2556154/Libero/ThesisProject/NEORV32-SRAM/neorv32-sf2-with-envm/prj_dir/designer/top/top.spm} \
    -dca {/home/s2556154/Libero/ThesisProject/NEORV32-SRAM/neorv32-sf2-with-envm/prj_dir/designer/top/top.dca}
export_single_ppd \
    -name {M2GL010} \
    -file {/home/s2556154/Libero/ThesisProject/NEORV32-SRAM/neorv32-sf2-with-envm/prj_dir/designer/top/top.ppd}

save_project
close_project
