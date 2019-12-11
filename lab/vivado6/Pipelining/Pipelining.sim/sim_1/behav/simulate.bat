@echo off
set xv_path=E:\\xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xsim MipsPipelineCPUsim_behav -key {Behavioral:sim_1:Functional:MipsPipelineCPUsim} -tclbatch MipsPipelineCPUsim.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
