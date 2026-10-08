--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: control_unit_synthesis.vhd
-- /___/   /\     Timestamp: Thu Oct  8 03:56:36 2026
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm control_unit -w -dir netgen/synthesis -ofmt vhdl -sim control_unit.ngc control_unit_synthesis.vhd 
-- Device	: xc7a100t-3-csg324
-- Input file	: control_unit.ngc
-- Output file	: /home/ise/CPU_8bit/netgen/synthesis/control_unit_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: control_unit
-- Xilinx	: /opt/Xilinx/14.7/ISE_DS/ISE/
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity control_unit is
  port (
    z_flag : in STD_LOGIC := 'X'; 
    acc_write : out STD_LOGIC; 
    pc_load : out STD_LOGIC; 
    opcode : in STD_LOGIC_VECTOR ( 3 downto 0 ); 
    alu_op : out STD_LOGIC_VECTOR ( 2 downto 0 ) 
  );
end control_unit;

architecture Structure of control_unit is
  signal opcode_3_IBUF_0 : STD_LOGIC; 
  signal opcode_2_IBUF_1 : STD_LOGIC; 
  signal opcode_1_IBUF_2 : STD_LOGIC; 
  signal opcode_0_IBUF_3 : STD_LOGIC; 
  signal z_flag_IBUF_4 : STD_LOGIC; 
  signal pc_load_OBUF_5 : STD_LOGIC; 
  signal alu_op_2_OBUF_6 : STD_LOGIC; 
  signal alu_op_1_OBUF_7 : STD_LOGIC; 
  signal alu_op_0_OBUF_8 : STD_LOGIC; 
  signal acc_write_OBUF_9 : STD_LOGIC; 
begin
  Mmux_pc_load11 : LUT5
    generic map(
      INIT => X"00000080"
    )
    port map (
      I0 => z_flag_IBUF_4,
      I1 => opcode_3_IBUF_0,
      I2 => opcode_2_IBUF_1,
      I3 => opcode_1_IBUF_2,
      I4 => opcode_0_IBUF_3,
      O => pc_load_OBUF_5
    );
  Mram_n002521 : LUT4
    generic map(
      INIT => X"0080"
    )
    port map (
      I0 => opcode_0_IBUF_3,
      I1 => opcode_1_IBUF_2,
      I2 => opcode_2_IBUF_1,
      I3 => opcode_3_IBUF_0,
      O => alu_op_2_OBUF_6
    );
  Mram_n0025111 : LUT4
    generic map(
      INIT => X"0110"
    )
    port map (
      I0 => opcode_0_IBUF_3,
      I1 => opcode_3_IBUF_0,
      I2 => opcode_1_IBUF_2,
      I3 => opcode_2_IBUF_1,
      O => alu_op_1_OBUF_7
    );
  alu_op_0_1 : LUT4
    generic map(
      INIT => X"0110"
    )
    port map (
      I0 => opcode_3_IBUF_0,
      I1 => opcode_1_IBUF_2,
      I2 => opcode_0_IBUF_3,
      I3 => opcode_2_IBUF_1,
      O => alu_op_0_OBUF_8
    );
  acc_write1 : LUT4
    generic map(
      INIT => X"4114"
    )
    port map (
      I0 => opcode_3_IBUF_0,
      I1 => opcode_1_IBUF_2,
      I2 => opcode_0_IBUF_3,
      I3 => opcode_2_IBUF_1,
      O => acc_write_OBUF_9
    );
  opcode_3_IBUF : IBUF
    port map (
      I => opcode(3),
      O => opcode_3_IBUF_0
    );
  opcode_2_IBUF : IBUF
    port map (
      I => opcode(2),
      O => opcode_2_IBUF_1
    );
  opcode_1_IBUF : IBUF
    port map (
      I => opcode(1),
      O => opcode_1_IBUF_2
    );
  opcode_0_IBUF : IBUF
    port map (
      I => opcode(0),
      O => opcode_0_IBUF_3
    );
  z_flag_IBUF : IBUF
    port map (
      I => z_flag,
      O => z_flag_IBUF_4
    );
  alu_op_2_OBUF : OBUF
    port map (
      I => alu_op_2_OBUF_6,
      O => alu_op(2)
    );
  alu_op_1_OBUF : OBUF
    port map (
      I => alu_op_1_OBUF_7,
      O => alu_op(1)
    );
  alu_op_0_OBUF : OBUF
    port map (
      I => alu_op_0_OBUF_8,
      O => alu_op(0)
    );
  acc_write_OBUF : OBUF
    port map (
      I => acc_write_OBUF_9,
      O => acc_write
    );
  pc_load_OBUF : OBUF
    port map (
      I => pc_load_OBUF_5,
      O => pc_load
    );

end Structure;

