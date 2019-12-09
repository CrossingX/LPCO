@echo off
set xv_path=E:\\xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xelab  -wto bb6fafef962846f3995edcf3e7b3b666 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot simadder_behav xil_defaultlib.simadder xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
