create_project -quiet vivado_project ./vivado_project -part xc7z020clg484-1
add_files -norecurse {./source/aes_decryptor.vhd ./source/addroundkey.vhd ./source/inv_round.vhd ./source/kexp128.vhd ./source/kexp256.vhd ./source/inv_shift_rows.vhd ./source/util_package.vhd ./source/inv_round10.vhd ./source/kexp192.vhd ./source/inv_mixclumn.vhd ./source/inv_subbytes.vhd}
update_compile_order -fileset sources_1
set_property SOURCE_SET sources_1 [get_filesets sim_1]
set_property -name {xsim.simulate.runtime} -value {60us} -objects [get_filesets sim_1]
add_files -fileset sim_1 -norecurse {./testbench/aes_decryptor_tb.vhd ./testbench/input.txt}
update_compile_order -fileset sim_1
launch_simulation
close_sim
exit