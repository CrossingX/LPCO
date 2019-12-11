-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
-- Date        : Wed Dec 11 16:20:04 2019
-- Host        : LAPTOP-4B4E4EPI running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub {e:/AOften/Computer Organization and
--               Design/lab/vivado6/Pipelining/Pipelining.srcs/sources_1/ip/InstructionROM/InstructionROM_stub.vhdl}
-- Design      : InstructionROM
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity InstructionROM is
  Port ( 
    clka : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end InstructionROM;

architecture stub of InstructionROM is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,addra[9:0],douta[31:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_3_1,Vivado 2015.4";
begin
end;