@echo off
set xv_path=E:\\xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xelab  -wto 6f25b7bab77c4143b97a3f8f36843c3f -m64 --debug typical --relax --mt 2 -L blk_mem_gen_v8_3_1 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot rom_tb_behav xil_defaultlib.rom_tb xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
