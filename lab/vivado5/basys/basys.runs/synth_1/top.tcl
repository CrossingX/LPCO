# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {E:/AOften/Computer Organization and Design/lab/vivado5/basys/basys.cache/wt} [current_project]
set_property parent.project_path {E:/AOften/Computer Organization and Design/lab/vivado5/basys/basys.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property vhdl_version vhdl_2k [current_fileset]
add_files {{E:/AOften/Computer Organization and Design/lab/vivado5/1.coe}}
add_files -quiet {{E:/AOften/Computer Organization and Design/lab/vivado5/basys/basys.runs/irom_synth_1/irom.dcp}}
set_property used_in_implementation false [get_files {{E:/AOften/Computer Organization and Design/lab/vivado5/basys/basys.runs/irom_synth_1/irom.dcp}}]
read_verilog -library xil_defaultlib {
  {E:/AOften/Computer Organization and Design/lab/vivado5/basys/basys.srcs/sources_1/new/regFile.v}
  {E:/AOften/Computer Organization and Design/lab/vivado5/basys/basys.srcs/sources_1/new/smg_ip_model.v}
  {E:/AOften/Computer Organization and Design/lab/vivado5/basys/basys.srcs/sources_1/new/sighext.v}
  {E:/AOften/Computer Organization and Design/lab/vivado5/basys/basys.srcs/sources_1/new/mux2.v}
  {E:/AOften/Computer Organization and Design/lab/vivado5/basys/basys.srcs/sources_1/new/dram.v}
  {E:/AOften/Computer Organization and Design/lab/vivado5/basys/basys.srcs/sources_1/new/ctr.v}
  {E:/AOften/Computer Organization and Design/lab/vivado5/basys/basys.srcs/sources_1/new/choose4.v}
  {E:/AOften/Computer Organization and Design/lab/vivado5/basys/basys.srcs/sources_1/new/aluctr.v}
  {E:/AOften/Computer Organization and Design/lab/vivado5/basys/basys.srcs/sources_1/new/alu.v}
  {E:/AOften/Computer Organization and Design/lab/vivado5/basys/basys.srcs/sources_1/new/top.v}
}
read_xdc {{E:/AOften/Computer Organization and Design/lab/vivado5/basys/basys.srcs/constrs_1/new/1.xdc}}
set_property used_in_implementation false [get_files {{E:/AOften/Computer Organization and Design/lab/vivado5/basys/basys.srcs/constrs_1/new/1.xdc}}]

synth_design -top top -part xc7a35tcpg236-1
write_checkpoint -noxdef top.dcp
catch { report_utilization -file top_utilization_synth.rpt -pb top_utilization_synth.pb }
