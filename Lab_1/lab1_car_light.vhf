--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : labexp1.vhf
-- /___/   /\     Timestamp : 08/28/2018 14:45:03
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family artix7 -flat -suppress -vhdl /home/clab/lab-1/labexp1.vhf -w /home/clab/lab-1/labexp1.sch
--Design Name: labexp1
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

entity lab1_car_light is
   port ( D1      : in    std_logic; 
          D2      : in    std_logic; 
          D3      : in    std_logic; 
          D4      : in    std_logic; 
          SW_DOOR : in    std_logic; 
          SW_OFF  : in    std_logic; 
          SW_ON   : in    std_logic; 
          INVALID : out   std_logic; 
          LIGHT   : out   std_logic);
end lab1_car_light;

architecture BEHAVIORAL of lab1_car_light is
   attribute BOX_TYPE   : string ;
   signal XLXN_10       : std_logic;
   signal XLXN_16       : std_logic;
   signal XLXN_28       : std_logic;
   signal XLXN_42       : std_logic;
   signal XLXN_43       : std_logic;
   signal XLXN_44       : std_logic;
   signal XLXN_45       : std_logic;
   signal XLXN_46       : std_logic;
   signal INVALID_DUMMY : std_logic;
   component OR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component AND2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
   
   component AND3B3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B3 : component is "BLACK_BOX";
   
   component AND3B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B1 : component is "BLACK_BOX";
   
begin
   INVALID <= INVALID_DUMMY;
   XLXI_4 : OR4
      port map (I0=>D4,
                I1=>D3,
                I2=>D2,
                I3=>D1,
                O=>XLXN_10);
   
   XLXI_6 : AND2
      port map (I0=>XLXN_10,
                I1=>SW_DOOR,
                O=>XLXN_16);
   
   XLXI_9 : OR2
      port map (I0=>XLXN_28,
                I1=>SW_ON,
                O=>XLXN_46);
   
   XLXI_10 : AND2B1
      port map (I0=>SW_OFF,
                I1=>XLXN_16,
                O=>XLXN_28);
   
   XLXI_11 : AND3B3
      port map (I0=>SW_OFF,
                I1=>SW_DOOR,
                I2=>SW_ON,
                O=>XLXN_43);
   
   XLXI_12 : AND3B1
      port map (I0=>SW_ON,
                I1=>SW_OFF,
                I2=>SW_DOOR,
                O=>XLXN_44);
   
   XLXI_14 : AND3B1
      port map (I0=>SW_DOOR,
                I1=>SW_OFF,
                I2=>SW_ON,
                O=>XLXN_45);
   
   XLXI_15 : AND2
      port map (I0=>SW_DOOR,
                I1=>SW_ON,
                O=>XLXN_42);
   
   XLXI_16 : OR4
      port map (I0=>XLXN_45,
                I1=>XLXN_44,
                I2=>XLXN_43,
                I3=>XLXN_42,
                O=>INVALID_DUMMY);
   
   XLXI_17 : AND2B1
      port map (I0=>INVALID_DUMMY,
                I1=>XLXN_46,
                O=>LIGHT);
   
end BEHAVIORAL;



