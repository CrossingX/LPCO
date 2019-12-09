@echo off
set xv_path=E:\\xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xelab  -wto 1a5a5b459b174110b46dbb3cf4199362 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot addsub8_sim_behav xil_defaultlib.addsub8_sim xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
