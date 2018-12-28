--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : lab4_seven_segment_display.vhf
-- /___/   /\     Timestamp : 09/23/2018 18:20:52
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family artix7 -flat -suppress -vhdl /home/clab/Desktop/lab4_seven_segment_display/lab4_seven_segment_display.vhf -w /home/clab/Desktop/lab4_seven_segment_display/lab4_seven_segment_display.sch
--Design Name: lab4_seven_segment_display
--Device: artix7
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity new_mux_MUSER_lab4_seven_segment_display is
   port ( en_able : in    std_logic; 
          w       : in    std_logic; 
          x       : in    std_logic; 
          y       : in    std_logic; 
          z       : in    std_logic; 
          w0      : out   std_logic; 
          x0      : out   std_logic; 
          y0      : out   std_logic; 
          z0      : out   std_logic);
end new_mux_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of new_mux_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   component AND2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
   
begin
   XLXI_9 : AND2B1
      port map (I0=>en_able,
                I1=>w,
                O=>w0);
   
   XLXI_10 : AND2B1
      port map (I0=>en_able,
                I1=>x,
                O=>x0);
   
   XLXI_11 : AND2B1
      port map (I0=>en_able,
                I1=>y,
                O=>y0);
   
   XLXI_12 : AND2B1
      port map (I0=>en_able,
                I1=>z,
                O=>z0);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity new_hex_bin_MUSER_lab4_seven_segment_display is
   port ( bu_s  : in    std_logic_vector (15 downto 0); 
          nable : in    std_logic_vector (3 downto 0); 
          h0    : out   std_logic; 
          h1    : out   std_logic; 
          h2    : out   std_logic; 
          h3    : out   std_logic);
end new_hex_bin_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of new_hex_bin_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_24 : std_logic;
   signal XLXN_25 : std_logic;
   signal XLXN_26 : std_logic;
   signal XLXN_27 : std_logic;
   signal XLXN_28 : std_logic;
   signal XLXN_29 : std_logic;
   signal XLXN_30 : std_logic;
   signal XLXN_31 : std_logic;
   signal XLXN_32 : std_logic;
   signal XLXN_33 : std_logic;
   signal XLXN_34 : std_logic;
   signal XLXN_35 : std_logic;
   signal XLXN_36 : std_logic;
   signal XLXN_37 : std_logic;
   signal XLXN_38 : std_logic;
   signal XLXN_39 : std_logic;
   component OR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
   
   component new_mux_MUSER_lab4_seven_segment_display
      port ( w       : in    std_logic; 
             x       : in    std_logic; 
             y       : in    std_logic; 
             z       : in    std_logic; 
             en_able : in    std_logic; 
             w0      : out   std_logic; 
             x0      : out   std_logic; 
             y0      : out   std_logic; 
             z0      : out   std_logic);
   end component;
   
begin
   XLXI_4 : OR4
      port map (I0=>XLXN_27,
                I1=>XLXN_26,
                I2=>XLXN_25,
                I3=>XLXN_24,
                O=>h0);
   
   XLXI_5 : OR4
      port map (I0=>XLXN_31,
                I1=>XLXN_30,
                I2=>XLXN_29,
                I3=>XLXN_28,
                O=>h1);
   
   XLXI_6 : OR4
      port map (I0=>XLXN_35,
                I1=>XLXN_34,
                I2=>XLXN_33,
                I3=>XLXN_32,
                O=>h2);
   
   XLXI_8 : OR4
      port map (I0=>XLXN_36,
                I1=>XLXN_37,
                I2=>XLXN_38,
                I3=>XLXN_39,
                O=>h3);
   
   XLXI_13 : new_mux_MUSER_lab4_seven_segment_display
      port map (en_able=>nable(0),
                w=>bu_s(0),
                x=>bu_s(1),
                y=>bu_s(2),
                z=>bu_s(3),
                w0=>XLXN_24,
                x0=>XLXN_28,
                y0=>XLXN_32,
                z0=>XLXN_39);
   
   XLXI_14 : new_mux_MUSER_lab4_seven_segment_display
      port map (en_able=>nable(1),
                w=>bu_s(4),
                x=>bu_s(5),
                y=>bu_s(6),
                z=>bu_s(7),
                w0=>XLXN_25,
                x0=>XLXN_29,
                y0=>XLXN_33,
                z0=>XLXN_38);
   
   XLXI_15 : new_mux_MUSER_lab4_seven_segment_display
      port map (en_able=>nable(2),
                w=>bu_s(8),
                x=>bu_s(9),
                y=>bu_s(10),
                z=>bu_s(11),
                w0=>XLXN_26,
                x0=>XLXN_30,
                y0=>XLXN_34,
                z0=>XLXN_37);
   
   XLXI_16 : new_mux_MUSER_lab4_seven_segment_display
      port map (en_able=>nable(3),
                w=>bu_s(12),
                x=>bu_s(13),
                y=>bu_s(14),
                z=>bu_s(15),
                w0=>XLXN_27,
                x0=>XLXN_31,
                y0=>XLXN_35,
                z0=>XLXN_36);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity new_g_MUSER_lab4_seven_segment_display is
   port ( y0 : in    std_logic; 
          y1 : in    std_logic; 
          y2 : in    std_logic; 
          y3 : in    std_logic; 
          g  : out   std_logic);
end new_g_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of new_g_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_17 : std_logic;
   signal XLXN_18 : std_logic;
   signal XLXN_19 : std_logic;
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
   
   component AND3B3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B3 : component is "BLACK_BOX";
   
   component OR3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR3 : component is "BLACK_BOX";
   
begin
   XLXI_1 : AND4B2
      port map (I0=>y0,
                I1=>y1,
                I2=>y2,
                I3=>y3,
                O=>XLXN_19);
   
   XLXI_2 : AND4B1
      port map (I0=>y3,
                I1=>y0,
                I2=>y1,
                I3=>y2,
                O=>XLXN_17);
   
   XLXI_3 : AND3B3
      port map (I0=>y3,
                I1=>y2,
                I2=>y1,
                O=>XLXN_18);
   
   XLXI_4 : OR3
      port map (I0=>XLXN_18,
                I1=>XLXN_17,
                I2=>XLXN_19,
                O=>g);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity new_f_MUSER_lab4_seven_segment_display is
   port ( y0 : in    std_logic; 
          y1 : in    std_logic; 
          y2 : in    std_logic; 
          y3 : in    std_logic; 
          f  : out   std_logic);
end new_f_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of new_f_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_18 : std_logic;
   signal XLXN_19 : std_logic;
   signal XLXN_20 : std_logic;
   signal XLXN_21 : std_logic;
   component AND4B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B1 : component is "BLACK_BOX";
   
   component AND3B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B2 : component is "BLACK_BOX";
   
   component AND3B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B1 : component is "BLACK_BOX";
   
   component OR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
   
begin
   XLXI_1 : AND4B1
      port map (I0=>y1,
                I1=>y0,
                I2=>y2,
                I3=>y3,
                O=>XLXN_19);
   
   XLXI_2 : AND3B2
      port map (I0=>y2,
                I1=>y3,
                I2=>y0,
                O=>XLXN_18);
   
   XLXI_3 : AND3B2
      port map (I0=>y2,
                I1=>y3,
                I2=>y1,
                O=>XLXN_20);
   
   XLXI_4 : AND3B1
      port map (I0=>y3,
                I1=>y0,
                I2=>y1,
                O=>XLXN_21);
   
   XLXI_5 : OR4
      port map (I0=>XLXN_21,
                I1=>XLXN_20,
                I2=>XLXN_18,
                I3=>XLXN_19,
                O=>f);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity new_e_MUSER_lab4_seven_segment_display is
   port ( y0 : in    std_logic; 
          y1 : in    std_logic; 
          y2 : in    std_logic; 
          y3 : in    std_logic; 
          e  : out   std_logic);
end new_e_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of new_e_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_10 : std_logic;
   signal XLXN_11 : std_logic;
   signal XLXN_12 : std_logic;
   component OR3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR3 : component is "BLACK_BOX";
   
   component AND2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
   
   component AND3B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B2 : component is "BLACK_BOX";
   
begin
   XLXI_1 : OR3
      port map (I0=>XLXN_10,
                I1=>XLXN_11,
                I2=>XLXN_12,
                O=>e);
   
   XLXI_2 : AND2B1
      port map (I0=>y3,
                I1=>y0,
                O=>XLXN_12);
   
   XLXI_3 : AND3B2
      port map (I0=>y2,
                I1=>y1,
                I2=>y0,
                O=>XLXN_11);
   
   XLXI_4 : AND3B2
      port map (I0=>y1,
                I1=>y3,
                I2=>y2,
                O=>XLXN_10);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity new_d_MUSER_lab4_seven_segment_display is
   port ( y0 : in    std_logic; 
          y1 : in    std_logic; 
          y2 : in    std_logic; 
          y3 : in    std_logic; 
          d  : out   std_logic);
end new_d_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of new_d_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_19 : std_logic;
   signal XLXN_20 : std_logic;
   signal XLXN_21 : std_logic;
   signal XLXN_22 : std_logic;
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
   
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
   component OR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
   
begin
   XLXI_1 : AND4B3
      port map (I0=>y0,
                I1=>y1,
                I2=>y3,
                I3=>y2,
                O=>XLXN_19);
   
   XLXI_2 : AND4B3
      port map (I0=>y3,
                I1=>y2,
                I2=>y1,
                I3=>y0,
                O=>XLXN_20);
   
   XLXI_3 : AND4B2
      port map (I0=>y0,
                I1=>y2,
                I2=>y1,
                I3=>y3,
                O=>XLXN_21);
   
   XLXI_4 : AND3
      port map (I0=>y2,
                I1=>y0,
                I2=>y1,
                O=>XLXN_22);
   
   XLXI_5 : OR4
      port map (I0=>XLXN_22,
                I1=>XLXN_21,
                I2=>XLXN_20,
                I3=>XLXN_19,
                O=>d);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity new_c_MUSER_lab4_seven_segment_display is
   port ( y0 : in    std_logic; 
          y1 : in    std_logic; 
          y2 : in    std_logic; 
          y3 : in    std_logic; 
          c  : out   std_logic);
end new_c_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of new_c_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_15 : std_logic;
   signal XLXN_16 : std_logic;
   signal XLXN_17 : std_logic;
   component AND4B3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B3 : component is "BLACK_BOX";
   
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
   component AND3B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B1 : component is "BLACK_BOX";
   
   component OR3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR3 : component is "BLACK_BOX";
   
begin
   XLXI_1 : AND4B3
      port map (I0=>y0,
                I1=>y2,
                I2=>y3,
                I3=>y1,
                O=>XLXN_17);
   
   XLXI_2 : AND3
      port map (I0=>y2,
                I1=>y1,
                I2=>y3,
                O=>XLXN_15);
   
   XLXI_3 : AND3B1
      port map (I0=>y0,
                I1=>y2,
                I2=>y3,
                O=>XLXN_16);
   
   XLXI_4 : OR3
      port map (I0=>XLXN_16,
                I1=>XLXN_15,
                I2=>XLXN_17,
                O=>c);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity new_b_MUSER_lab4_seven_segment_display is
   port ( y0 : in    std_logic; 
          y1 : in    std_logic; 
          y2 : in    std_logic; 
          y3 : in    std_logic; 
          b  : out   std_logic);
end new_b_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of new_b_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_17 : std_logic;
   signal XLXN_18 : std_logic;
   signal XLXN_19 : std_logic;
   signal XLXN_20 : std_logic;
   component AND4B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B2 : component is "BLACK_BOX";
   
   component AND3B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B1 : component is "BLACK_BOX";
   
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
   component OR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
   
begin
   XLXI_1 : AND4B2
      port map (I0=>y1,
                I1=>y3,
                I2=>y0,
                I3=>y2,
                O=>XLXN_17);
   
   XLXI_2 : AND3B1
      port map (I0=>y0,
                I1=>y2,
                I2=>y1,
                O=>XLXN_18);
   
   XLXI_3 : AND3B1
      port map (I0=>y0,
                I1=>y2,
                I2=>y3,
                O=>XLXN_19);
   
   XLXI_4 : AND3
      port map (I0=>y0,
                I1=>y3,
                I2=>y1,
                O=>XLXN_20);
   
   XLXI_5 : OR4
      port map (I0=>XLXN_20,
                I1=>XLXN_19,
                I2=>XLXN_18,
                I3=>XLXN_17,
                O=>b);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity new_hexa_tobin_a_MUSER_lab4_seven_segment_display is
   port ( y0 : in    std_logic; 
          y1 : in    std_logic; 
          y2 : in    std_logic; 
          y3 : in    std_logic; 
          a  : out   std_logic);
end new_hexa_tobin_a_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of new_hexa_tobin_a_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_17 : std_logic;
   signal XLXN_18 : std_logic;
   signal XLXN_19 : std_logic;
   signal XLXN_20 : std_logic;
   component AND4B3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B3 : component is "BLACK_BOX";
   
   component AND4B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B1 : component is "BLACK_BOX";
   
   component OR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
   
begin
   XLXI_1 : AND4B3
      port map (I0=>y3,
                I1=>y2,
                I2=>y1,
                I3=>y0,
                O=>XLXN_20);
   
   XLXI_2 : AND4B3
      port map (I0=>y0,
                I1=>y1,
                I2=>y3,
                I3=>y2,
                O=>XLXN_19);
   
   XLXI_3 : AND4B1
      port map (I0=>y1,
                I1=>y0,
                I2=>y2,
                I3=>y3,
                O=>XLXN_18);
   
   XLXI_4 : AND4B1
      port map (I0=>y2,
                I1=>y0,
                I2=>y1,
                I3=>y3,
                O=>XLXN_17);
   
   XLXI_5 : OR4
      port map (I0=>XLXN_17,
                I1=>XLXN_18,
                I2=>XLXN_19,
                I3=>XLXN_20,
                O=>a);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity new_file_MUSER_lab4_seven_segment_display is
   port ( y0 : in    std_logic; 
          y1 : in    std_logic; 
          y2 : in    std_logic; 
          y3 : in    std_logic; 
          aa : out   std_logic; 
          bb : out   std_logic; 
          cc : out   std_logic; 
          dd : out   std_logic; 
          ee : out   std_logic; 
          ff : out   std_logic; 
          gg : out   std_logic);
end new_file_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of new_file_MUSER_lab4_seven_segment_display is
   component new_hexa_tobin_a_MUSER_lab4_seven_segment_display
      port ( y3 : in    std_logic; 
             y2 : in    std_logic; 
             y1 : in    std_logic; 
             y0 : in    std_logic; 
             a  : out   std_logic);
   end component;
   
   component new_b_MUSER_lab4_seven_segment_display
      port ( y3 : in    std_logic; 
             y2 : in    std_logic; 
             y1 : in    std_logic; 
             y0 : in    std_logic; 
             b  : out   std_logic);
   end component;
   
   component new_c_MUSER_lab4_seven_segment_display
      port ( y3 : in    std_logic; 
             y2 : in    std_logic; 
             y1 : in    std_logic; 
             y0 : in    std_logic; 
             c  : out   std_logic);
   end component;
   
   component new_d_MUSER_lab4_seven_segment_display
      port ( y3 : in    std_logic; 
             y2 : in    std_logic; 
             y1 : in    std_logic; 
             y0 : in    std_logic; 
             d  : out   std_logic);
   end component;
   
   component new_e_MUSER_lab4_seven_segment_display
      port ( y3 : in    std_logic; 
             y2 : in    std_logic; 
             y1 : in    std_logic; 
             y0 : in    std_logic; 
             e  : out   std_logic);
   end component;
   
   component new_f_MUSER_lab4_seven_segment_display
      port ( y3 : in    std_logic; 
             y2 : in    std_logic; 
             y1 : in    std_logic; 
             y0 : in    std_logic; 
             f  : out   std_logic);
   end component;
   
   component new_g_MUSER_lab4_seven_segment_display
      port ( y3 : in    std_logic; 
             y2 : in    std_logic; 
             y1 : in    std_logic; 
             y0 : in    std_logic; 
             g  : out   std_logic);
   end component;
   
begin
   XLXI_1 : new_hexa_tobin_a_MUSER_lab4_seven_segment_display
      port map (y0=>y0,
                y1=>y1,
                y2=>y2,
                y3=>y3,
                a=>aa);
   
   XLXI_2 : new_b_MUSER_lab4_seven_segment_display
      port map (y0=>y0,
                y1=>y1,
                y2=>y2,
                y3=>y3,
                b=>bb);
   
   XLXI_3 : new_c_MUSER_lab4_seven_segment_display
      port map (y0=>y0,
                y1=>y1,
                y2=>y2,
                y3=>y3,
                c=>cc);
   
   XLXI_4 : new_d_MUSER_lab4_seven_segment_display
      port map (y0=>y0,
                y1=>y1,
                y2=>y2,
                y3=>y3,
                d=>dd);
   
   XLXI_5 : new_e_MUSER_lab4_seven_segment_display
      port map (y0=>y0,
                y1=>y1,
                y2=>y2,
                y3=>y3,
                e=>ee);
   
   XLXI_6 : new_f_MUSER_lab4_seven_segment_display
      port map (y0=>y0,
                y1=>y1,
                y2=>y2,
                y3=>y3,
                f=>ff);
   
   XLXI_7 : new_g_MUSER_lab4_seven_segment_display
      port map (y0=>y0,
                y1=>y1,
                y2=>y2,
                y3=>y3,
                g=>gg);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity new_final_plus_raj_MUSER_lab4_seven_segment_display is
   port ( bu_s  : in    std_logic_vector (15 downto 0); 
          nable : in    std_logic_vector (3 downto 0); 
          o_a   : out   std_logic; 
          o_bb  : out   std_logic; 
          o_cc  : out   std_logic; 
          o_dd  : out   std_logic; 
          o_ee  : out   std_logic; 
          o_ff  : out   std_logic; 
          o_gg  : out   std_logic);
end new_final_plus_raj_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of new_final_plus_raj_MUSER_lab4_seven_segment_display 
      is
   signal XLXN_23 : std_logic;
   signal XLXN_24 : std_logic;
   signal XLXN_25 : std_logic;
   signal XLXN_29 : std_logic;
   component new_file_MUSER_lab4_seven_segment_display
      port ( y3 : in    std_logic; 
             y2 : in    std_logic; 
             y1 : in    std_logic; 
             y0 : in    std_logic; 
             aa : out   std_logic; 
             bb : out   std_logic; 
             cc : out   std_logic; 
             dd : out   std_logic; 
             ee : out   std_logic; 
             ff : out   std_logic; 
             gg : out   std_logic);
   end component;
   
   component new_hex_bin_MUSER_lab4_seven_segment_display
      port ( bu_s  : in    std_logic_vector (15 downto 0); 
             nable : in    std_logic_vector (3 downto 0); 
             h0    : out   std_logic; 
             h1    : out   std_logic; 
             h2    : out   std_logic; 
             h3    : out   std_logic);
   end component;
   
begin
   XLXI_16 : new_file_MUSER_lab4_seven_segment_display
      port map (y0=>XLXN_23,
                y1=>XLXN_24,
                y2=>XLXN_25,
                y3=>XLXN_29,
                aa=>o_a,
                bb=>o_bb,
                cc=>o_cc,
                dd=>o_dd,
                ee=>o_ee,
                ff=>o_ff,
                gg=>o_gg);
   
   XLXI_17 : new_hex_bin_MUSER_lab4_seven_segment_display
      port map (bu_s(15 downto 0)=>bu_s(15 downto 0),
                nable(3 downto 0)=>nable(3 downto 0),
                h0=>XLXN_23,
                h1=>XLXN_24,
                h2=>XLXN_25,
                h3=>XLXN_29);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity ring_cntr_MUSER_lab4_seven_segment_display is
   port ( cl_ck : in    std_logic; 
          an1   : out   std_logic; 
          an2   : out   std_logic; 
          an3   : out   std_logic; 
          an4   : out   std_logic);
end ring_cntr_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of ring_cntr_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_2  : std_logic;
   signal XLXN_3  : std_logic;
   signal XLXN_6  : std_logic;
   signal XLXN_11 : std_logic;
   component FD
      generic( INIT : bit :=  '0');
      port ( C : in    std_logic; 
             D : in    std_logic; 
             Q : out   std_logic);
   end component;
   attribute BOX_TYPE of FD : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
begin
   XLXI_1 : FD
   generic map( INIT => '1')
      port map (C=>cl_ck,
                D=>XLXN_6,
                Q=>XLXN_11);
   
   XLXI_2 : FD
      port map (C=>cl_ck,
                D=>XLXN_11,
                Q=>XLXN_2);
   
   XLXI_3 : FD
      port map (C=>cl_ck,
                D=>XLXN_2,
                Q=>XLXN_3);
   
   XLXI_4 : FD
      port map (C=>cl_ck,
                D=>XLXN_3,
                Q=>XLXN_6);
   
   XLXI_5 : INV
      port map (I=>XLXN_11,
                O=>an1);
   
   XLXI_6 : INV
      port map (I=>XLXN_2,
                O=>an2);
   
   XLXI_7 : INV
      port map (I=>XLXN_3,
                O=>an3);
   
   XLXI_8 : INV
      port map (I=>XLXN_6,
                O=>an4);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity clock_ff_MUSER_lab4_seven_segment_display is
   port ( clock : in    std_logic; 
          clck  : out   std_logic);
end clock_ff_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of clock_ff_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_2  : std_logic;
   signal XLXN_3  : std_logic;
   signal XLXN_4  : std_logic;
   signal XLXN_5  : std_logic;
   signal XLXN_6  : std_logic;
   signal XLXN_7  : std_logic;
   signal XLXN_8  : std_logic;
   signal XLXN_9  : std_logic;
   signal XLXN_10 : std_logic;
   signal XLXN_11 : std_logic;
   signal XLXN_12 : std_logic;
   signal XLXN_13 : std_logic;
   signal XLXN_14 : std_logic;
   signal XLXN_15 : std_logic;
   signal XLXN_16 : std_logic;
   signal XLXN_18 : std_logic;
   signal XLXN_19 : std_logic;
   signal XLXN_21 : std_logic;
   signal XLXN_22 : std_logic;
   signal XLXN_23 : std_logic;
   signal XLXN_25 : std_logic;
   signal XLXN_26 : std_logic;
   signal XLXN_27 : std_logic;
   signal XLXN_29 : std_logic;
   signal XLXN_30 : std_logic;
   signal XLXN_31 : std_logic;
   signal XLXN_32 : std_logic;
   signal XLXN_33 : std_logic;
   signal XLXN_34 : std_logic;
   signal XLXN_35 : std_logic;
   signal XLXN_36 : std_logic;
   component FD
      generic( INIT : bit :=  '0');
      port ( C : in    std_logic; 
             D : in    std_logic; 
             Q : out   std_logic);
   end component;
   attribute BOX_TYPE of FD : component is "BLACK_BOX";
   
begin
   XLXN_18 <= '1';
   XLXN_19 <= '1';
   XLXN_21 <= '1';
   XLXN_22 <= '1';
   XLXN_23 <= '1';
   XLXN_25 <= '1';
   XLXN_26 <= '1';
   XLXN_27 <= '1';
   XLXN_29 <= '1';
   XLXN_30 <= '1';
   XLXN_31 <= '1';
   XLXN_32 <= '1';
   XLXN_33 <= '1';
   XLXN_34 <= '1';
   XLXN_35 <= '1';
   XLXN_36 <= '1';
   XLXI_3 : FD
      port map (C=>clock,
                D=>XLXN_34,
                Q=>XLXN_2);
   
   XLXI_4 : FD
      port map (C=>XLXN_2,
                D=>XLXN_18,
                Q=>XLXN_3);
   
   XLXI_5 : FD
      port map (C=>XLXN_3,
                D=>XLXN_19,
                Q=>XLXN_6);
   
   XLXI_6 : FD
      port map (C=>XLXN_6,
                D=>XLXN_21,
                Q=>XLXN_4);
   
   XLXI_7 : FD
      port map (C=>XLXN_4,
                D=>XLXN_22,
                Q=>XLXN_5);
   
   XLXI_8 : FD
      port map (C=>XLXN_5,
                D=>XLXN_23,
                Q=>XLXN_7);
   
   XLXI_9 : FD
      port map (C=>XLXN_7,
                D=>XLXN_33,
                Q=>XLXN_8);
   
   XLXI_10 : FD
      port map (C=>XLXN_8,
                D=>XLXN_35,
                Q=>XLXN_9);
   
   XLXI_11 : FD
      port map (C=>XLXN_9,
                D=>XLXN_25,
                Q=>XLXN_10);
   
   XLXI_12 : FD
      port map (C=>XLXN_10,
                D=>XLXN_26,
                Q=>XLXN_11);
   
   XLXI_13 : FD
      port map (C=>XLXN_11,
                D=>XLXN_27,
                Q=>XLXN_12);
   
   XLXI_14 : FD
      port map (C=>XLXN_12,
                D=>XLXN_32,
                Q=>XLXN_13);
   
   XLXI_15 : FD
      port map (C=>XLXN_13,
                D=>XLXN_36,
                Q=>XLXN_14);
   
   XLXI_16 : FD
      port map (C=>XLXN_14,
                D=>XLXN_29,
                Q=>XLXN_15);
   
   XLXI_17 : FD
      port map (C=>XLXN_15,
                D=>XLXN_30,
                Q=>XLXN_16);
   
   XLXI_18 : FD
      port map (C=>XLXN_16,
                D=>XLXN_31,
                Q=>clck);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity clooocking_MUSER_lab4_seven_segment_display is
   port ( cl_oock : in    std_logic; 
          pu_sh   : in    std_logic; 
          an_ode  : out   std_logic_vector (3 downto 0));
end clooocking_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of clooocking_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_13 : std_logic;
   signal XLXN_14 : std_logic;
   signal XLXN_15 : std_logic;
   signal XLXN_19 : std_logic;
   component clock_ff_MUSER_lab4_seven_segment_display
      port ( clock : in    std_logic; 
             clck  : out   std_logic);
   end component;
   
   component ring_cntr_MUSER_lab4_seven_segment_display
      port ( cl_ck : in    std_logic; 
             an1   : out   std_logic; 
             an2   : out   std_logic; 
             an3   : out   std_logic; 
             an4   : out   std_logic);
   end component;
   
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
   XLXI_1 : clock_ff_MUSER_lab4_seven_segment_display
      port map (clock=>cl_oock,
                clck=>XLXN_13);
   
   XLXI_2 : ring_cntr_MUSER_lab4_seven_segment_display
      port map (cl_ck=>XLXN_19,
                an1=>an_ode(0),
                an2=>an_ode(1),
                an3=>an_ode(2),
                an4=>an_ode(3));
   
   XLXI_8 : AND2
      port map (I0=>pu_sh,
                I1=>cl_oock,
                O=>XLXN_14);
   
   XLXI_9 : AND2B1
      port map (I0=>pu_sh,
                I1=>XLXN_13,
                O=>XLXN_15);
   
   XLXI_10 : OR2
      port map (I0=>XLXN_15,
                I1=>XLXN_14,
                O=>XLXN_19);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity lab4_seven_segment_display is
   port ( b          : in    std_logic_vector (15 downto 0); 
          clk        : in    std_logic; 
          pushbutton : in    std_logic; 
          anode      : out   std_logic_vector (3 downto 0); 
          cathode    : out   std_logic_vector (6 downto 0));
end lab4_seven_segment_display;

architecture BEHAVIORAL of lab4_seven_segment_display is
   signal anode_DUMMY : std_logic_vector (3 downto 0);
   component clooocking_MUSER_lab4_seven_segment_display
      port ( pu_sh   : in    std_logic; 
             cl_oock : in    std_logic; 
             an_ode  : out   std_logic_vector (3 downto 0));
   end component;
   
   component new_final_plus_raj_MUSER_lab4_seven_segment_display
      port ( bu_s  : in    std_logic_vector (15 downto 0); 
             nable : in    std_logic_vector (3 downto 0); 
             o_a   : out   std_logic; 
             o_bb  : out   std_logic; 
             o_cc  : out   std_logic; 
             o_dd  : out   std_logic; 
             o_ee  : out   std_logic; 
             o_ff  : out   std_logic; 
             o_gg  : out   std_logic);
   end component;
   
begin
   anode(3 downto 0) <= anode_DUMMY(3 downto 0);
   XLXI_7 : clooocking_MUSER_lab4_seven_segment_display
      port map (cl_oock=>clk,
                pu_sh=>pushbutton,
                an_ode(3 downto 0)=>anode_DUMMY(3 downto 0));
   
   XLXI_13 : new_final_plus_raj_MUSER_lab4_seven_segment_display
      port map (bu_s(15 downto 0)=>b(15 downto 0),
                nable(3 downto 0)=>anode_DUMMY(3 downto 0),
                o_a=>cathode(0),
                o_bb=>cathode(1),
                o_cc=>cathode(2),
                o_dd=>cathode(3),
                o_ee=>cathode(4),
                o_ff=>cathode(5),
                o_gg=>cathode(6));
   
end BEHAVIORAL;


