# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {E:/AOften/Computer Organization and Design/lab/vivado3/ROM/ROM.cache/wt} [current_project]
set_property parent.project_path {E:/AOften/Computer Organization and Design/lab/vivado3/ROM/ROM.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property vhdl_version vhdl_2k [current_fileset]
add_files {{E:/AOften/Computer Organization and Design/lab/vivado3/prgmip16.coe}}
add_files -quiet {{E:/AOften/Computer Organization and Design/lab/vivado3/ROM/ROM.runs/Ins_Rom_synth_1/Ins_Rom.dcp}}
set_property used_in_implementation false [get_files {{E:/AOften/Computer Organization and Design/lab/vivado3/ROM/ROM.runs/Ins_Rom_synth_1/Ins_Rom.dcp}}]
read_verilog -library xil_defaultlib {
  {E:/AOften/Computer Organization and Design/lab/vivado3/ROM/ROM.srcs/sources_1/new/display.v}
  {E:/AOften/Computer Organization and Design/lab/vivado3/ROM/ROM.srcs/sources_1/new/rom_top.v}
}
read_xdc {{E:/AOften/Computer Organization and Design/lab/vivado3/ROM/ROM.srcs/constrs_1/new/rom.xdc}}
set_property used_in_implementation false [get_files {{E:/AOften/Computer Organization and Design/lab/vivado3/ROM/ROM.srcs/constrs_1/new/rom.xdc}}]

synth_design -top rom_top -part xc7a35tcpg236-1
write_checkpoint -noxdef rom_top.dcp
catch { report_utilization -file rom_top_utilization_synth.rpt -pb rom_top_utilization_synth.pb }
