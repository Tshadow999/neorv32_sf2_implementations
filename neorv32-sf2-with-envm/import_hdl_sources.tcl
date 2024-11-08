# Import TOP
import_files -library work -hdl_source ./custom_rtl/neorv32_ProcessorTop_Minimal.vhd
import_files -library work -hdl_source ./custom_rtl/xbus2ahblite_bridge.vhd
import_files -library work -hdl_source ./custom_rtl/top.vhd

import_files -library neorv32 -hdl_source ./custom_rtl/neorv32_package.vhd
#import_files -library neorv32 -hdl_source ./neorv32_application_image.vhd
import_files -library neorv32 -hdl_source ${neorv_rtl_dir}/core/neorv32_bootloader_image.vhd
import_files -library neorv32 -hdl_source ${neorv_rtl_dir}/core/neorv32_dmem.entity.vhd
import_files -library neorv32 -hdl_source ${neorv_rtl_dir}/core/neorv32_imem.entity.vhd

foreach file [glob ${neorv_rtl_dir}/core/*.vhd] {
    if {[file tail $file] != "neorv32_package.vhd" && [file tail $file] != "neorv32_application_image.vhd" && [file tail $file] != "neorv32_bootloader_image.vhd" && [file tail $file] != "neorv32_imem.entity.vhd" && [file tail $file] != "neorv32_dmem.entity.vhd"} {
        import_files -library neorv32 -hdl_source $file 
        #check_hdl -file ${prj_dir_name}/hdl/[file tail $file]
    }
}
build_design_hierarchy
foreach file [glob ${neorv_rtl_dir}/core/mem/*.default.vhd] {
    import_files -library neorv32 -hdl_source $file
}
build_design_hierarchy

