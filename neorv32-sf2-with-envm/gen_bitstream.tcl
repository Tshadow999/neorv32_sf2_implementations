set proj_name "Neorv_minimal_with_eNVM_as_iMEM"

set current_path [lindex $argv 0]/
set prj_dir_name "${current_path}prj_dir/"
set neorv_rtl_dir "${current_path}neorv32/rtl/"

puts "-------------------------------------------------------------------------"
puts "-----------------------CREATING NEW PROJECT------------------------------"
puts "-------------------------------------------------------------------------"

if {[file exists ${prj_dir_name}]} {
    file delete -force ${prj_dir_name}
}

new_project -location ${prj_dir_name} -name ${proj_name} -project_description {} -block_mode 0 -standalone_peripheral_initialization 0 -instantiate_in_smartdesign 1 -ondemand_build_dh 1 -use_relative_path 0 -linked_files_root_dir_env {} -hdl {VHDL} -family {IGLOO2} -die {M2GL010} -package {400 VF} -speed {STD} -die_voltage {1.2} -part_range {COM} -adv_options {DSW_VCCA_VOLTAGE_RAMP_RATE:100_MS} -adv_options {IO_DEFT_STD:LVCMOS 3.3V} -adv_options {PLL_SUPPLY:PLL_SUPPLY_33} -adv_options {RESTRICTPROBEPINS:1} -adv_options {RESTRICTSPIPINS:0} -adv_options {SYSTEM_CONTROLLER_SUSPEND_MODE:0} -adv_options {TEMPR:COM} -adv_options {VCCI_1.2_VOLTR:COM} -adv_options {VCCI_1.5_VOLTR:COM} -adv_options {VCCI_1.8_VOLTR:COM} -adv_options {VCCI_2.5_VOLTR:COM} -adv_options {VCCI_3.3_VOLTR:COM} -adv_options {VOLTR:COM} 

puts "-------------------------------------------------------------------------"
puts "------------------------IMPORTING HDL FILES------------------------------"
puts "-------------------------------------------------------------------------"

source ./import_hdl_sources.tcl

puts "-------------------------------------------------------------------------"
puts "------------------IMPORTING DESIGN CONSTRAINT FILE(s)--------------------"
puts "-------------------------------------------------------------------------"
import_files -io_pdc {./contraint_files/SF2_SFM20000_io.pdc} 

source ./system_builder_tcl_files/systembuilder.tcl
source ./system_builder_tcl_files/top.tcl
build_design_hierarchy
# Set top entity
set_root -module {top::work} 

run_tool -name {CONSTRAINT_MANAGEMENT} 
organize_tool_files -tool {PLACEROUTE} -file ${prj_dir_name}/constraint/io/SF2_SFM20000_io.pdc -module {top::work} -input_type {constraint} 
set_device_simple -family {IGLOO2} -die {M2GL010} -package {400 VF} -speed {STD} -die_voltage {1.2} -part_range {COM} -adv_options {DSW_VCCA_VOLTAGE_RAMP_RATE:100_MS} -adv_options {IO_DEFT_STD:LVCMOS 3.3V} -adv_options {PLL_SUPPLY:PLL_SUPPLY_33} -adv_options {RESERVEMIGRATIONPINS:1} -adv_options {RESTRICTPROBEPINS:1} -adv_options {RESTRICTSPIPINS:0} -adv_options {SYSTEM_CONTROLLER_SUSPEND_MODE:0} -adv_options {TEMPR:COM} -adv_options {VCCI_1.2_VOLTR:COM} -adv_options {VCCI_1.5_VOLTR:COM} -adv_options {VCCI_1.8_VOLTR:COM} -adv_options {VCCI_2.5_VOLTR:COM} -adv_options {VCCI_3.3_VOLTR:COM} -adv_options {VOLTR:COM} 
derive_constraints_sdc 

puts "-------------------------------------------------------------------------"
puts "------------------PLACEROUTE & GENERATE BITSTREAM-----------------------"
puts "-------------------------------------------------------------------------"
run_tool -name {GENERATEPROGRAMMINGFILE} 

