set prog_name "Neorv_minimalBoot_with_BRAM_as_iMEM"
set prj_dir_name "./prj_dir"

# Open the project
open_project -file ${prj_dir_name}/${prog_name}.prjx

# Program the device
#program_device -adapter {FlashPro} -cable {1} -device {1}

run_tool -name {PROGRAMDEVICE} 