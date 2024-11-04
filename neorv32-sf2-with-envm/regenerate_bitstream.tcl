# Open project

open_project -file {./prj_dir/Neorv_minimal_with_eNVM_as_iMEM.prjx} -do_backup_on_convert 1 -backup_file {./neorv32-sf2-with-envm/prj_dir.zip} 

puts "-------------------------------------------------------------------------"
puts "------------------PLACEROUTE & GENERATE BITSTREAM-----------------------"
puts "-------------------------------------------------------------------------"
run_tool -name {GENERATEPROGRAMMINGFILE} 

