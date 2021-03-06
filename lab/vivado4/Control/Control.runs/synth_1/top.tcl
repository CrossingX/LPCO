# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {E:/AOften/Computer Organization and Design/lab/vivado4/Control/Control.cache/wt} [current_project]
set_property parent.project_path {E:/AOften/Computer Organization and Design/lab/vivado4/Control/Control.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property vhdl_version vhdl_2k [current_fileset]
read_verilog -library xil_defaultlib {
  {E:/AOften/Computer Organization and Design/lab/vivado4/Control/Control.srcs/sources_1/new/ctr.v}
  {E:/AOften/Computer Organization and Design/lab/vivado4/Control/Control.srcs/sources_1/new/aluctr.v}
  {E:/AOften/Computer Organization and Design/lab/vivado4/Control/Control.srcs/sources_1/new/regFile.v}
  {E:/AOften/Computer Organization and Design/lab/vivado4/Control/Control.srcs/sources_1/new/top.v}
}
synth_design -top top -part xc7a35tcpg236-1
write_checkpoint -noxdef top.dcp
catch { report_utilization -file top_utilization_synth.rpt -pb top_utilization_synth.pb }
