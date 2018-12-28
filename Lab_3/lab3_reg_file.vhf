--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : lab3_reg_file.vhf
-- /___/   /\     Timestamp : 09/07/2018 11:26:54
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family artix7 -flat -suppress -vhdl /home/clab/Pictures/regfiletod/lab3_reg_file.vhf -w /home/clab/Pictures/regfiletod/lab3_reg_file.sch
--Design Name: lab3_reg_file
--Device: artix7
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL OR8_HXILINX_lab3_reg_file -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity OR8_HXILINX_lab3_reg_file is
  
port(
    O  : out std_logic;

    I0  : in std_logic;
    I1  : in std_logic;
    I2  : in std_logic;
    I3  : in std_logic;
    I4  : in std_logic;
    I5  : in std_logic;
    I6  : in std_logic;
    I7  : in std_logic
  );
end OR8_HXILINX_lab3_reg_file;

architecture OR8_HXILINX_lab3_reg_file_V of OR8_HXILINX_lab3_reg_file is
begin
  O <= (I0 or I1 or I2 or I3 or I4 or I5 or I6 or I7);
end OR8_HXILINX_lab3_reg_file_V;

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity lab3mux_front_MUSER_lab3_reg_file is
   port ( mode               : in    std_logic; 
          rd_data1_xor_data2 : in    std_logic_vector (3 downto 0); 
          wr_data            : in    std_logic_vector (3 downto 0); 
          outo               : out   std_logic_vector (3 downto 0));
end lab3mux_front_MUSER_lab3_reg_file;

architecture BEHAVIORAL of lab3mux_front_MUSER_lab3_reg_file is
   attribute BOX_TYPE   : string ;
   signal XLXN_12            : std_logic;
   signal XLXN_13            : std_logic;
   signal XLXN_14            : std_logic;
   signal XLXN_15            : std_logic;
   signal XLXN_28            : std_logic;
   signal XLXN_29            : std_logic;
   signal XLXN_30            : std_logic;
   signal XLXN_31            : std_logic;
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component AND2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
begin
   XLXI_1 : AND2
      port map (I0=>rd_data1_xor_data2(0),
                I1=>mode,
                O=>XLXN_28);
   
   XLXI_2 : AND2
      port map (I0=>rd_data1_xor_data2(1),
                I1=>mode,
                O=>XLXN_12);
   
   XLXI_3 : AND2
      port map (I0=>rd_data1_xor_data2(2),
                I1=>mode,
                O=>XLXN_13);
   
   XLXI_4 : AND2
      port map (I0=>rd_data1_xor_data2(3),
                I1=>mode,
                O=>XLXN_14);
   
   XLXI_5 : AND2B1
      port map (I0=>mode,
                I1=>wr_data(0),
                O=>XLXN_29);
   
   XLXI_6 : AND2B1
      port map (I0=>mode,
                I1=>wr_data(1),
                O=>XLXN_30);
   
   XLXI_7 : AND2B1
      port map (I0=>mode,
                I1=>wr_data(2),
                O=>XLXN_15);
   
   XLXI_8 : AND2B1
      port map (I0=>mode,
                I1=>wr_data(3),
                O=>XLXN_31);
   
   XLXI_9 : OR2
      port map (I0=>XLXN_29,
                I1=>XLXN_28,
                O=>outo(0));
   
   XLXI_10 : OR2
      port map (I0=>XLXN_30,
                I1=>XLXN_12,
                O=>outo(1));
   
   XLXI_11 : OR2
      port map (I0=>XLXN_15,
                I1=>XLXN_13,
                O=>outo(2));
   
   XLXI_12 : OR2
      port map (I0=>XLXN_31,
                I1=>XLXN_14,
                O=>outo(3));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity lab3_xor_MUSER_lab3_reg_file is
   port ( rd_da1             : in    std_logic_vector (3 downto 0); 
          rd_da2             : in    std_logic_vector (3 downto 0); 
          rd_data1_xor_data2 : out   std_logic_vector (3 downto 0));
end lab3_xor_MUSER_lab3_reg_file;

architecture BEHAVIORAL of lab3_xor_MUSER_lab3_reg_file is
   attribute BOX_TYPE   : string ;
   component XOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR2 : component is "BLACK_BOX";
   
begin
   XLXI_1 : XOR2
      port map (I0=>rd_da2(0),
                I1=>rd_da1(0),
                O=>rd_data1_xor_data2(0));
   
   XLXI_2 : XOR2
      port map (I0=>rd_da2(1),
                I1=>rd_da1(1),
                O=>rd_data1_xor_data2(1));
   
   XLXI_3 : XOR2
      port map (I0=>rd_da2(2),
                I1=>rd_da1(2),
                O=>rd_data1_xor_data2(2));
   
   XLXI_5 : XOR2
      port map (I0=>rd_da2(3),
                I1=>rd_da1(3),
                O=>rd_data1_xor_data2(3));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity multiplexer81_MUSER_lab3_reg_file is
   port ( s0 : in    std_logic; 
          s1 : in    std_logic; 
          s2 : in    std_logic; 
          x0 : in    std_logic; 
          x1 : in    std_logic; 
          x2 : in    std_logic; 
          x3 : in    std_logic; 
          x4 : in    std_logic; 
          x5 : in    std_logic; 
          x6 : in    std_logic; 
          x7 : in    std_logic; 
          b  : out   std_logic);
end multiplexer81_MUSER_lab3_reg_file;

architecture BEHAVIORAL of multiplexer81_MUSER_lab3_reg_file is
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   signal XLXN_26 : std_logic;
   signal XLXN_27 : std_logic;
   signal XLXN_28 : std_logic;
   signal XLXN_29 : std_logic;
   signal XLXN_30 : std_logic;
   signal XLXN_31 : std_logic;
   signal XLXN_32 : std_logic;
   signal XLXN_33 : std_logic;
   component AND4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
   
   component AND4B3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B3 : component is "BLACK_BOX";
   
   component AND4B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B2 : component is "BLACK_BOX";
   
   component AND4B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B1 : component is "BLACK_BOX";
   
   component OR8_HXILINX_lab3_reg_file
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             I5 : in    std_logic; 
             I6 : in    std_logic; 
             I7 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   attribute HU_SET of XLXI_9 : label is "XLXI_9_0";
begin
   XLXI_1 : AND4
      port map (I0=>s0,
                I1=>s1,
                I2=>s2,
                I3=>x7,
                O=>XLXN_26);
   
   XLXI_2 : AND4B3
      port map (I0=>s0,
                I1=>s1,
                I2=>s2,
                I3=>x0,
                O=>XLXN_27);
   
   XLXI_3 : AND4B2
      port map (I0=>s0,
                I1=>s1,
                I2=>s2,
                I3=>x4,
                O=>XLXN_28);
   
   XLXI_4 : AND4B2
      port map (I0=>s0,
                I1=>s2,
                I2=>s1,
                I3=>x2,
                O=>XLXN_29);
   
   XLXI_5 : AND4B2
      port map (I0=>s2,
                I1=>s1,
                I2=>s0,
                I3=>x1,
                O=>XLXN_30);
   
   XLXI_6 : AND4B1
      port map (I0=>s2,
                I1=>s1,
                I2=>s0,
                I3=>x3,
                O=>XLXN_31);
   
   XLXI_7 : AND4B1
      port map (I0=>s1,
                I1=>s0,
                I2=>s2,
                I3=>x5,
                O=>XLXN_32);
   
   XLXI_8 : AND4B1
      port map (I0=>s0,
                I1=>s1,
                I2=>s2,
                I3=>x6,
                O=>XLXN_33);
   
   XLXI_9 : OR8_HXILINX_lab3_reg_file
      port map (I0=>XLXN_33,
                I1=>XLXN_32,
                I2=>XLXN_31,
                I3=>XLXN_30,
                I4=>XLXN_29,
                I5=>XLXN_28,
                I6=>XLXN_27,
                I7=>XLXN_26,
                O=>b);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity regfiletod_MUSER_lab3_reg_file is
   port ( b0       : in    std_logic_vector (3 downto 0); 
          b1       : in    std_logic_vector (3 downto 0); 
          b2       : in    std_logic_vector (3 downto 0); 
          b3       : in    std_logic_vector (3 downto 0); 
          b4       : in    std_logic_vector (3 downto 0); 
          b5       : in    std_logic_vector (3 downto 0); 
          b6       : in    std_logic_vector (3 downto 0); 
          b7       : in    std_logic_vector (3 downto 0); 
          rd_ad_dr : in    std_logic_vector (2 downto 0); 
          rd_data1 : out   std_logic_vector (3 downto 0));
end regfiletod_MUSER_lab3_reg_file;

architecture BEHAVIORAL of regfiletod_MUSER_lab3_reg_file is
   component multiplexer81_MUSER_lab3_reg_file
      port ( b  : out   std_logic; 
             s0 : in    std_logic; 
             s1 : in    std_logic; 
             s2 : in    std_logic; 
             x0 : in    std_logic; 
             x1 : in    std_logic; 
             x2 : in    std_logic; 
             x3 : in    std_logic; 
             x4 : in    std_logic; 
             x5 : in    std_logic; 
             x6 : in    std_logic; 
             x7 : in    std_logic);
   end component;
   
begin
   XLXI_35 : multiplexer81_MUSER_lab3_reg_file
      port map (s0=>rd_ad_dr(0),
                s1=>rd_ad_dr(1),
                s2=>rd_ad_dr(2),
                x0=>b0(1),
                x1=>b1(1),
                x2=>b2(1),
                x3=>b3(1),
                x4=>b4(1),
                x5=>b5(1),
                x6=>b6(1),
                x7=>b7(1),
                b=>rd_data1(1));
   
   XLXI_36 : multiplexer81_MUSER_lab3_reg_file
      port map (s0=>rd_ad_dr(0),
                s1=>rd_ad_dr(1),
                s2=>rd_ad_dr(2),
                x0=>b0(2),
                x1=>b1(2),
                x2=>b2(2),
                x3=>b3(2),
                x4=>b4(2),
                x5=>b5(2),
                x6=>b6(2),
                x7=>b7(2),
                b=>rd_data1(2));
   
   XLXI_37 : multiplexer81_MUSER_lab3_reg_file
      port map (s0=>rd_ad_dr(0),
                s1=>rd_ad_dr(1),
                s2=>rd_ad_dr(2),
                x0=>b0(0),
                x1=>b1(0),
                x2=>b2(0),
                x3=>b3(0),
                x4=>b4(0),
                x5=>b5(0),
                x6=>b6(0),
                x7=>b7(0),
                b=>rd_data1(0));
   
   XLXI_38 : multiplexer81_MUSER_lab3_reg_file
      port map (s0=>rd_ad_dr(0),
                s1=>rd_ad_dr(1),
                s2=>rd_ad_dr(2),
                x0=>b0(3),
                x1=>b1(3),
                x2=>b2(3),
                x3=>b3(3),
                x4=>b4(3),
                x5=>b5(3),
                x6=>b6(3),
                x7=>b7(3),
                b=>rd_data1(3));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity Registerselfmade_MUSER_lab3_reg_file is
   port ( CLOCK : in    std_logic; 
          IN0   : in    std_logic; 
          IN1   : in    std_logic; 
          IN2   : in    std_logic; 
          IN3   : in    std_logic; 
          OUT0  : out   std_logic; 
          OUT1  : out   std_logic; 
          OUT2  : out   std_logic; 
          OUT3  : out   std_logic);
end Registerselfmade_MUSER_lab3_reg_file;

architecture BEHAVIORAL of Registerselfmade_MUSER_lab3_reg_file is
   attribute BOX_TYPE   : string ;
   component FD
      generic( INIT : bit :=  '0');
      port ( C : in    std_logic; 
             D : in    std_logic; 
             Q : out   std_logic);
   end component;
   attribute BOX_TYPE of FD : component is "BLACK_BOX";
   
begin
   XLXI_1 : FD
      port map (C=>CLOCK,
                D=>IN0,
                Q=>OUT0);
   
   XLXI_2 : FD
      port map (C=>CLOCK,
                D=>IN1,
                Q=>OUT1);
   
   XLXI_3 : FD
      port map (C=>CLOCK,
                D=>IN2,
                Q=>OUT2);
   
   XLXI_4 : FD
      port map (C=>CLOCK,
                D=>IN3,
                Q=>OUT3);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity registerfiletod_MUSER_lab3_reg_file is
   port ( a  : in    std_logic_vector (3 downto 0); 
          c0 : in    std_logic; 
          c1 : in    std_logic; 
          c2 : in    std_logic; 
          c3 : in    std_logic; 
          c4 : in    std_logic; 
          c5 : in    std_logic; 
          c6 : in    std_logic; 
          c7 : in    std_logic; 
          b0 : out   std_logic_vector (3 downto 0); 
          b1 : out   std_logic_vector (3 downto 0); 
          b2 : out   std_logic_vector (3 downto 0); 
          b3 : out   std_logic_vector (3 downto 0); 
          b4 : out   std_logic_vector (3 downto 0); 
          b5 : out   std_logic_vector (3 downto 0); 
          b6 : out   std_logic_vector (3 downto 0); 
          b7 : out   std_logic_vector (3 downto 0));
end registerfiletod_MUSER_lab3_reg_file;

architecture BEHAVIORAL of registerfiletod_MUSER_lab3_reg_file is
   component Registerselfmade_MUSER_lab3_reg_file
      port ( CLOCK : in    std_logic; 
             IN0   : in    std_logic; 
             IN1   : in    std_logic; 
             IN2   : in    std_logic; 
             IN3   : in    std_logic; 
             OUT0  : out   std_logic; 
             OUT1  : out   std_logic; 
             OUT2  : out   std_logic; 
             OUT3  : out   std_logic);
   end component;
   
begin
   XLXI_4 : Registerselfmade_MUSER_lab3_reg_file
      port map (CLOCK=>c3,
                IN0=>a(0),
                IN1=>a(1),
                IN2=>a(2),
                IN3=>a(3),
                OUT0=>b3(0),
                OUT1=>b3(1),
                OUT2=>b3(2),
                OUT3=>b3(3));
   
   XLXI_5 : Registerselfmade_MUSER_lab3_reg_file
      port map (CLOCK=>c4,
                IN0=>a(0),
                IN1=>a(1),
                IN2=>a(2),
                IN3=>a(3),
                OUT0=>b4(0),
                OUT1=>b4(1),
                OUT2=>b4(2),
                OUT3=>b4(3));
   
   XLXI_6 : Registerselfmade_MUSER_lab3_reg_file
      port map (CLOCK=>c5,
                IN0=>a(0),
                IN1=>a(1),
                IN2=>a(2),
                IN3=>a(3),
                OUT0=>b5(0),
                OUT1=>b5(1),
                OUT2=>b5(2),
                OUT3=>b5(3));
   
   XLXI_7 : Registerselfmade_MUSER_lab3_reg_file
      port map (CLOCK=>c6,
                IN0=>a(0),
                IN1=>a(1),
                IN2=>a(2),
                IN3=>a(3),
                OUT0=>b6(0),
                OUT1=>b6(1),
                OUT2=>b6(2),
                OUT3=>b6(3));
   
   XLXI_8 : Registerselfmade_MUSER_lab3_reg_file
      port map (CLOCK=>c7,
                IN0=>a(0),
                IN1=>a(1),
                IN2=>a(2),
                IN3=>a(3),
                OUT0=>b7(0),
                OUT1=>b7(1),
                OUT2=>b7(2),
                OUT3=>b7(3));
   
   XLXI_13 : Registerselfmade_MUSER_lab3_reg_file
      port map (CLOCK=>c0,
                IN0=>a(0),
                IN1=>a(1),
                IN2=>a(2),
                IN3=>a(3),
                OUT0=>b0(0),
                OUT1=>b0(1),
                OUT2=>b0(2),
                OUT3=>b0(3));
   
   XLXI_15 : Registerselfmade_MUSER_lab3_reg_file
      port map (CLOCK=>c2,
                IN0=>a(0),
                IN1=>a(1),
                IN2=>a(2),
                IN3=>a(3),
                OUT0=>b2(0),
                OUT1=>b2(1),
                OUT2=>b2(2),
                OUT3=>b2(3));
   
   XLXI_16 : Registerselfmade_MUSER_lab3_reg_file
      port map (CLOCK=>c1,
                IN0=>a(0),
                IN1=>a(1),
                IN2=>a(2),
                IN3=>a(3),
                OUT0=>b1(0),
                OUT1=>b1(1),
                OUT2=>b1(2),
                OUT3=>b1(3));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity lab3_demux_MUSER_lab3_reg_file is
   port ( clo_ck        : in    std_logic; 
          write_enab_le : in    std_logic; 
          wr_ad_dr      : in    std_logic_vector (2 downto 0); 
          CC0           : out   std_logic; 
          CC1           : out   std_logic; 
          CC2           : out   std_logic; 
          CC3           : out   std_logic; 
          CC4           : out   std_logic; 
          CC5           : out   std_logic; 
          CC6           : out   std_logic; 
          CC7           : out   std_logic);
end lab3_demux_MUSER_lab3_reg_file;

architecture BEHAVIORAL of lab3_demux_MUSER_lab3_reg_file is
   attribute BOX_TYPE   : string ;
   component AND5B3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND5B3 : component is "BLACK_BOX";
   
   component AND5B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND5B2 : component is "BLACK_BOX";
   
   component AND5B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND5B1 : component is "BLACK_BOX";
   
   component AND5
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND5 : component is "BLACK_BOX";
   
begin
   XLXI_1 : AND5B3
      port map (I0=>wr_ad_dr(2),
                I1=>wr_ad_dr(1),
                I2=>wr_ad_dr(0),
                I3=>write_enab_le,
                I4=>clo_ck,
                O=>CC0);
   
   XLXI_2 : AND5B2
      port map (I0=>wr_ad_dr(2),
                I1=>wr_ad_dr(1),
                I2=>wr_ad_dr(0),
                I3=>write_enab_le,
                I4=>clo_ck,
                O=>CC1);
   
   XLXI_9 : AND5B2
      port map (I0=>wr_ad_dr(2),
                I1=>wr_ad_dr(0),
                I2=>wr_ad_dr(1),
                I3=>write_enab_le,
                I4=>clo_ck,
                O=>CC2);
   
   XLXI_10 : AND5B2
      port map (I0=>wr_ad_dr(1),
                I1=>wr_ad_dr(0),
                I2=>wr_ad_dr(2),
                I3=>write_enab_le,
                I4=>clo_ck,
                O=>CC4);
   
   XLXI_11 : AND5B1
      port map (I0=>wr_ad_dr(2),
                I1=>wr_ad_dr(1),
                I2=>wr_ad_dr(0),
                I3=>write_enab_le,
                I4=>clo_ck,
                O=>CC3);
   
   XLXI_15 : AND5B1
      port map (I0=>wr_ad_dr(1),
                I1=>wr_ad_dr(2),
                I2=>wr_ad_dr(0),
                I3=>write_enab_le,
                I4=>clo_ck,
                O=>CC5);
   
   XLXI_16 : AND5B1
      port map (I0=>wr_ad_dr(0),
                I1=>wr_ad_dr(1),
                I2=>wr_ad_dr(2),
                I3=>write_enab_le,
                I4=>clo_ck,
                O=>CC6);
   
   XLXI_17 : AND5
      port map (I0=>wr_ad_dr(1),
                I1=>wr_ad_dr(2),
                I2=>wr_ad_dr(0),
                I3=>write_enab_le,
                I4=>clo_ck,
                O=>CC7);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity registermuxcomb_MUSER_lab3_reg_file is
   port ( clk       : in    std_logic; 
          rd_ad_dr1 : in    std_logic_vector (2 downto 0); 
          rd_ad_dr2 : in    std_logic_vector (2 downto 0); 
          wr_ad_dr  : in    std_logic_vector (2 downto 0); 
          wr_da_ta  : in    std_logic_vector (3 downto 0); 
          wr_en     : in    std_logic; 
          rd_da_ta1 : out   std_logic_vector (3 downto 0); 
          rd_da_ta2 : out   std_logic_vector (3 downto 0));
end registermuxcomb_MUSER_lab3_reg_file;

architecture BEHAVIORAL of registermuxcomb_MUSER_lab3_reg_file is
   signal XLXN_9    : std_logic_vector (3 downto 0);
   signal XLXN_10   : std_logic_vector (3 downto 0);
   signal XLXN_11   : std_logic_vector (3 downto 0);
   signal XLXN_12   : std_logic_vector (3 downto 0);
   signal XLXN_14   : std_logic_vector (3 downto 0);
   signal XLXN_15   : std_logic_vector (3 downto 0);
   signal XLXN_16   : std_logic_vector (3 downto 0);
   signal XLXN_17   : std_logic_vector (3 downto 0);
   signal XLXN_25   : std_logic;
   signal XLXN_26   : std_logic;
   signal XLXN_27   : std_logic;
   signal XLXN_28   : std_logic;
   signal XLXN_29   : std_logic;
   signal XLXN_30   : std_logic;
   signal XLXN_31   : std_logic;
   signal XLXN_32   : std_logic;
   component lab3_demux_MUSER_lab3_reg_file
      port ( CC0           : out   std_logic; 
             CC1           : out   std_logic; 
             CC2           : out   std_logic; 
             CC3           : out   std_logic; 
             CC4           : out   std_logic; 
             CC5           : out   std_logic; 
             CC6           : out   std_logic; 
             CC7           : out   std_logic; 
             clo_ck        : in    std_logic; 
             write_enab_le : in    std_logic; 
             wr_ad_dr      : in    std_logic_vector (2 downto 0));
   end component;
   
   component registerfiletod_MUSER_lab3_reg_file
      port ( a  : in    std_logic_vector (3 downto 0); 
             b0 : out   std_logic_vector (3 downto 0); 
             b1 : out   std_logic_vector (3 downto 0); 
             b2 : out   std_logic_vector (3 downto 0); 
             b3 : out   std_logic_vector (3 downto 0); 
             b4 : out   std_logic_vector (3 downto 0); 
             b5 : out   std_logic_vector (3 downto 0); 
             b6 : out   std_logic_vector (3 downto 0); 
             b7 : out   std_logic_vector (3 downto 0); 
             c0 : in    std_logic; 
             c1 : in    std_logic; 
             c2 : in    std_logic; 
             c3 : in    std_logic; 
             c4 : in    std_logic; 
             c5 : in    std_logic; 
             c6 : in    std_logic; 
             c7 : in    std_logic);
   end component;
   
   component regfiletod_MUSER_lab3_reg_file
      port ( rd_ad_dr : in    std_logic_vector (2 downto 0); 
             b0       : in    std_logic_vector (3 downto 0); 
             b1       : in    std_logic_vector (3 downto 0); 
             b2       : in    std_logic_vector (3 downto 0); 
             b3       : in    std_logic_vector (3 downto 0); 
             b5       : in    std_logic_vector (3 downto 0); 
             b6       : in    std_logic_vector (3 downto 0); 
             b7       : in    std_logic_vector (3 downto 0); 
             b4       : in    std_logic_vector (3 downto 0); 
             rd_data1 : out   std_logic_vector (3 downto 0));
   end component;
   
begin
   XLXI_19 : lab3_demux_MUSER_lab3_reg_file
      port map (clo_ck=>clk,
                write_enab_le=>wr_en,
                wr_ad_dr(2 downto 0)=>wr_ad_dr(2 downto 0),
                CC0=>XLXN_32,
                CC1=>XLXN_31,
                CC2=>XLXN_30,
                CC3=>XLXN_29,
                CC4=>XLXN_28,
                CC5=>XLXN_27,
                CC6=>XLXN_26,
                CC7=>XLXN_25);
   
   XLXI_20 : registerfiletod_MUSER_lab3_reg_file
      port map (a(3 downto 0)=>wr_da_ta(3 downto 0),
                c0=>XLXN_32,
                c1=>XLXN_31,
                c2=>XLXN_30,
                c3=>XLXN_29,
                c4=>XLXN_28,
                c5=>XLXN_27,
                c6=>XLXN_26,
                c7=>XLXN_25,
                b0(3 downto 0)=>XLXN_9(3 downto 0),
                b1(3 downto 0)=>XLXN_10(3 downto 0),
                b2(3 downto 0)=>XLXN_11(3 downto 0),
                b3(3 downto 0)=>XLXN_12(3 downto 0),
                b4(3 downto 0)=>XLXN_17(3 downto 0),
                b5(3 downto 0)=>XLXN_16(3 downto 0),
                b6(3 downto 0)=>XLXN_15(3 downto 0),
                b7(3 downto 0)=>XLXN_14(3 downto 0));
   
   XLXI_23 : regfiletod_MUSER_lab3_reg_file
      port map (b0(3 downto 0)=>XLXN_9(3 downto 0),
                b1(3 downto 0)=>XLXN_10(3 downto 0),
                b2(3 downto 0)=>XLXN_11(3 downto 0),
                b3(3 downto 0)=>XLXN_12(3 downto 0),
                b4(3 downto 0)=>XLXN_17(3 downto 0),
                b5(3 downto 0)=>XLXN_16(3 downto 0),
                b6(3 downto 0)=>XLXN_15(3 downto 0),
                b7(3 downto 0)=>XLXN_14(3 downto 0),
                rd_ad_dr(2 downto 0)=>rd_ad_dr1(2 downto 0),
                rd_data1(3 downto 0)=>rd_da_ta1(3 downto 0));
   
   XLXI_24 : regfiletod_MUSER_lab3_reg_file
      port map (b0(3 downto 0)=>XLXN_9(3 downto 0),
                b1(3 downto 0)=>XLXN_10(3 downto 0),
                b2(3 downto 0)=>XLXN_11(3 downto 0),
                b3(3 downto 0)=>XLXN_12(3 downto 0),
                b4(3 downto 0)=>XLXN_17(3 downto 0),
                b5(3 downto 0)=>XLXN_16(3 downto 0),
                b6(3 downto 0)=>XLXN_15(3 downto 0),
                b7(3 downto 0)=>XLXN_14(3 downto 0),
                rd_ad_dr(2 downto 0)=>rd_ad_dr2(2 downto 0),
                rd_data1(3 downto 0)=>rd_da_ta2(3 downto 0));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity lab3_reg_file is
   port ( clock              : in    std_logic; 
          mode               : in    std_logic; 
          rd_addr1           : in    std_logic_vector (2 downto 0); 
          rd_addr2           : in    std_logic_vector (2 downto 0); 
          write_enable       : in    std_logic; 
          wr_addr            : in    std_logic_vector (2 downto 0); 
          wr_data            : in    std_logic_vector (3 downto 0); 
          rd_data1           : out   std_logic_vector (3 downto 0); 
          rd_data1_xor_data2 : out   std_logic_vector (3 downto 0); 
          rd_data2           : out   std_logic_vector (3 downto 0));
end lab3_reg_file;

architecture BEHAVIORAL of lab3_reg_file is
   signal XLXN_4                   : std_logic_vector (3 downto 0);
   signal rd_data1_DUMMY           : std_logic_vector (3 downto 0);
   signal rd_data2_DUMMY           : std_logic_vector (3 downto 0);
   signal rd_data1_xor_data2_DUMMY : std_logic_vector (3 downto 0);
   component registermuxcomb_MUSER_lab3_reg_file
      port ( rd_ad_dr2 : in    std_logic_vector (2 downto 0); 
             rd_ad_dr1 : in    std_logic_vector (2 downto 0); 
             wr_da_ta  : in    std_logic_vector (3 downto 0); 
             clk       : in    std_logic; 
             wr_en     : in    std_logic; 
             wr_ad_dr  : in    std_logic_vector (2 downto 0); 
             rd_da_ta1 : out   std_logic_vector (3 downto 0); 
             rd_da_ta2 : out   std_logic_vector (3 downto 0));
   end component;
   
   component lab3_xor_MUSER_lab3_reg_file
      port ( rd_da1             : in    std_logic_vector (3 downto 0); 
             rd_da2             : in    std_logic_vector (3 downto 0); 
             rd_data1_xor_data2 : out   std_logic_vector (3 downto 0));
   end component;
   
   component lab3mux_front_MUSER_lab3_reg_file
      port ( mode               : in    std_logic; 
             wr_data            : in    std_logic_vector (3 downto 0); 
             rd_data1_xor_data2 : in    std_logic_vector (3 downto 0); 
             outo               : out   std_logic_vector (3 downto 0));
   end component;
   
begin
   rd_data1(3 downto 0) <= rd_data1_DUMMY(3 downto 0);
   rd_data1_xor_data2(3 downto 0) <= rd_data1_xor_data2_DUMMY(3 downto 0);
   rd_data2(3 downto 0) <= rd_data2_DUMMY(3 downto 0);
   XLXI_1 : registermuxcomb_MUSER_lab3_reg_file
      port map (clk=>clock,
                rd_ad_dr1(2 downto 0)=>rd_addr1(2 downto 0),
                rd_ad_dr2(2 downto 0)=>rd_addr2(2 downto 0),
                wr_ad_dr(2 downto 0)=>wr_addr(2 downto 0),
                wr_da_ta(3 downto 0)=>XLXN_4(3 downto 0),
                wr_en=>write_enable,
                rd_da_ta1(3 downto 0)=>rd_data1_DUMMY(3 downto 0),
                rd_da_ta2(3 downto 0)=>rd_data2_DUMMY(3 downto 0));
   
   XLXI_2 : lab3_xor_MUSER_lab3_reg_file
      port map (rd_da1(3 downto 0)=>rd_data1_DUMMY(3 downto 0),
                rd_da2(3 downto 0)=>rd_data2_DUMMY(3 downto 0),
                rd_data1_xor_data2(3 downto 0)=>rd_data1_xor_data2_DUMMY(3 
            downto 0));
   
   XLXI_3 : lab3mux_front_MUSER_lab3_reg_file
      port map (mode=>mode,
                rd_data1_xor_data2(3 downto 0)=>rd_data1_xor_data2_DUMMY(3 
            downto 0),
                wr_data(3 downto 0)=>wr_data(3 downto 0),
                outo(3 downto 0)=>XLXN_4(3 downto 0));
   
end BEHAVIORAL;


