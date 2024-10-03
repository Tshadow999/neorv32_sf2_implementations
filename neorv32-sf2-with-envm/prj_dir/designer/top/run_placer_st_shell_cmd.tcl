read_sdc -scenario "place_and_route" -netlist "optimized" -pin_separator "/" -ignore_errors {/home/tycho/git/NEORV32-SRAM/neorv32-sf2-with-envm/prj_dir/designer/top/place_route.sdc}
set_options -tdpr_scenario "place_and_route" 
save
set_options -analysis_scenario "place_and_route"
report -type combinational_loops -format xml {/home/tycho/git/NEORV32-SRAM/neorv32-sf2-with-envm/prj_dir/designer/top/top_layout_combinational_loops.xml}
report -type slack {/home/tycho/git/NEORV32-SRAM/neorv32-sf2-with-envm/prj_dir/designer/top/pinslacks.txt}
set coverage [report \
    -type     constraints_coverage \
    -format   xml \
    -slacks   no \
    {/home/tycho/git/NEORV32-SRAM/neorv32-sf2-with-envm/prj_dir/designer/top/top_place_and_route_constraint_coverage.xml}]
set reportfile {/home/tycho/git/NEORV32-SRAM/neorv32-sf2-with-envm/prj_dir/designer/top/coverage_placeandroute}
set fp [open $reportfile w]
puts $fp $coverage
close $fp