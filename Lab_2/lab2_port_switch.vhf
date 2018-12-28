--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : lab2_port_switch.vhf
-- /___/   /\     Timestamp : 09/01/2018 10:06:47
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family artix7 -flat -suppress -vhdl /home/clab/lab2final/lab2_port_switch/lab2_port_switch.vhf -w /home/clab/lab2final/lab2_port_switch/lab2_port_switch.sch
--Design Name: lab2_port_switch
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

entity demultiplier_MUSER_lab2_port_switch is
   port ( e   : in    std_logic; 
          Ss0 : in    std_logic; 
          Ss1 : in    std_logic; 
          X   : in    std_logic; 
          Y0  : out   std_logic; 
          Y1  : out   std_logic; 
          Y2  : out   std_logic);
end demultiplier_MUSER_lab2_port_switch;

architecture BEHAVIORAL of demultiplier_MUSER_lab2_port_switch is
   attribute BOX_TYPE   : string ;
   component AND4B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B1 : component is "BLACK_BOX";
   
   component AND4B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B2 : component is "BLACK_BOX";
   
begin
   XLXI_1 : AND4B1
      port map (I0=>Ss0,
                I1=>Ss1,
                I2=>X,
                I3=>e,
                O=>Y2);
   
   XLXI_2 : AND4B1
      port map (I0=>Ss1,
                I1=>Ss0,
                I2=>X,
                I3=>e,
                O=>Y1);
   
   XLXI_3 : AND4B2
      port map (I0=>Ss0,
                I1=>Ss1,
                I2=>X,
                I3=>e,
                O=>Y0);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity decoder1final_MUSER_lab2_port_switch is
   port ( e  : in    std_logic; 
          S0 : in    std_logic; 
          S1 : in    std_logic; 
          Y0 : out   std_logic; 
          Y1 : out   std_logic; 
          Y2 : out   std_logic);
end decoder1final_MUSER_lab2_port_switch;

architecture BEHAVIORAL of decoder1final_MUSER_lab2_port_switch is
   attribute BOX_TYPE   : string ;
   component AND3B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B1 : component is "BLACK_BOX";
   
   component AND3B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B2 : component is "BLACK_BOX";
   
begin
   XLXI_1 : AND3B1
      port map (I0=>S0,
                I1=>S1,
                I2=>e,
                O=>Y2);
   
   XLXI_2 : AND3B1
      port map (I0=>S1,
                I1=>S0,
                I2=>e,
                O=>Y1);
   
   XLXI_3 : AND3B2
      port map (I0=>S1,
                I1=>S0,
                I2=>e,
                O=>Y0);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity priorityNewencoder_MUSER_lab2_port_switch is
   port ( X0 : in    std_logic; 
          X1 : in    std_logic; 
          X2 : in    std_logic; 
          e  : out   std_logic; 
          S0 : out   std_logic; 
          S1 : out   std_logic);
end priorityNewencoder_MUSER_lab2_port_switch;

architecture BEHAVIORAL of priorityNewencoder_MUSER_lab2_port_switch is
   attribute BOX_TYPE   : string ;
   signal XLXN_11 : std_logic;
   component AND2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
   
   component OR3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR3 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
begin
   XLXI_3 : AND2B1
      port map (I0=>X2,
                I1=>X1,
                O=>S0);
   
   XLXI_6 : OR3
      port map (I0=>X2,
                I1=>X1,
                I2=>X0,
                O=>e);
   
   XLXI_7 : INV
      port map (I=>X2,
                O=>XLXN_11);
   
   XLXI_8 : INV
      port map (I=>XLXN_11,
                O=>S1);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity lab2_port_switch is
   port ( dest0 : in    std_logic_vector (1 downto 0); 
          dest1 : in    std_logic_vector (1 downto 0); 
          dest2 : in    std_logic_vector (1 downto 0); 
          din0  : in    std_logic; 
          din1  : in    std_logic; 
          din2  : in    std_logic; 
          req0  : in    std_logic; 
          req1  : in    std_logic; 
          req2  : in    std_logic; 
          ack0  : out   std_logic; 
          ack1  : out   std_logic; 
          ack2  : out   std_logic; 
          dout0 : out   std_logic; 
          dout1 : out   std_logic; 
          dout2 : out   std_logic; 
          src   : out   std_logic_vector (1 downto 0));
end lab2_port_switch;

architecture BEHAVIORAL of lab2_port_switch is
   attribute BOX_TYPE   : string ;
   signal XLXN_63    : std_logic;
   signal XLXN_64    : std_logic;
   signal XLXN_65    : std_logic;
   signal XLXN_77    : std_logic;
   signal XLXN_78    : std_logic;
   signal XLXN_79    : std_logic;
   signal XLXN_81    : std_logic;
   signal XLXN_82    : std_logic;
   signal XLXN_83    : std_logic;
   signal XLXN_84    : std_logic;
   signal src_DUMMY  : std_logic_vector (1 downto 0);
   signal ack0_DUMMY : std_logic;
   signal ack1_DUMMY : std_logic;
   signal ack2_DUMMY : std_logic;
   component OR3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR3 : component is "BLACK_BOX";
   
   component priorityNewencoder_MUSER_lab2_port_switch
      port ( e  : out   std_logic; 
             S0 : out   std_logic; 
             S1 : out   std_logic; 
             X0 : in    std_logic; 
             X1 : in    std_logic; 
             X2 : in    std_logic);
   end component;
   
   component decoder1final_MUSER_lab2_port_switch
      port ( e  : in    std_logic; 
             S0 : in    std_logic; 
             S1 : in    std_logic; 
             Y0 : out   std_logic; 
             Y1 : out   std_logic; 
             Y2 : out   std_logic);
   end component;
   
   component demultiplier_MUSER_lab2_port_switch
      port ( e   : in    std_logic; 
             Ss0 : in    std_logic; 
             Ss1 : in    std_logic; 
             X   : in    std_logic; 
             Y0  : out   std_logic; 
             Y1  : out   std_logic; 
             Y2  : out   std_logic);
   end component;
   
begin
   ack0 <= ack0_DUMMY;
   ack1 <= ack1_DUMMY;
   ack2 <= ack2_DUMMY;
   src(1 downto 0) <= src_DUMMY(1 downto 0);
   XLXI_17 : OR3
      port map (I0=>XLXN_64,
                I1=>XLXN_83,
                I2=>XLXN_82,
                O=>dout1);
   
   XLXI_18 : OR3
      port map (I0=>XLXN_63,
                I1=>XLXN_79,
                I2=>XLXN_81,
                O=>dout2);
   
   XLXI_19 : OR3
      port map (I0=>XLXN_65,
                I1=>XLXN_77,
                I2=>XLXN_78,
                O=>dout0);
   
   XLXI_27 : priorityNewencoder_MUSER_lab2_port_switch
      port map (X0=>req0,
                X1=>req1,
                X2=>req2,
                e=>XLXN_84,
                S0=>src_DUMMY(0),
                S1=>src_DUMMY(1));
   
   XLXI_29 : decoder1final_MUSER_lab2_port_switch
      port map (e=>XLXN_84,
                S0=>src_DUMMY(0),
                S1=>src_DUMMY(1),
                Y0=>ack0_DUMMY,
                Y1=>ack1_DUMMY,
                Y2=>ack2_DUMMY);
   
   XLXI_30 : demultiplier_MUSER_lab2_port_switch
      port map (e=>ack1_DUMMY,
                Ss0=>dest1(0),
                Ss1=>dest1(1),
                X=>din1,
                Y0=>XLXN_78,
                Y1=>XLXN_82,
                Y2=>XLXN_81);
   
   XLXI_31 : demultiplier_MUSER_lab2_port_switch
      port map (e=>ack2_DUMMY,
                Ss0=>dest2(0),
                Ss1=>dest2(1),
                X=>din2,
                Y0=>XLXN_77,
                Y1=>XLXN_83,
                Y2=>XLXN_79);
   
   XLXI_32 : demultiplier_MUSER_lab2_port_switch
      port map (e=>ack0_DUMMY,
                Ss0=>dest0(0),
                Ss1=>dest0(1),
                X=>din0,
                Y0=>XLXN_65,
                Y1=>XLXN_64,
                Y2=>XLXN_63);
   
end BEHAVIORAL;


