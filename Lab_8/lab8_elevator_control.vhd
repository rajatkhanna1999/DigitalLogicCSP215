--Lab8_elevator_control
--Created By:
--Jatin Nandal(2017UCS0042)
--Rajat Khanna(2017UCS0050)

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:06:17 11/17/2018 
-- Design Name: 
-- Module Name:    lab8_elevator_control - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:22:00 11/30/2018 
-- Design Name: 
-- Module Name:    lab4_seven_segment_display - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--


----------------------------------------------------------------------------------------------------------------

--Seven Segment Display Code
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FTP_HXILINX_lab4_seven_segment_display is
generic(
    INIT : bit := '1'
    );

  port (
    Q   : out STD_LOGIC := '1';
    C   : in STD_LOGIC;
    PRE : in STD_LOGIC;
    T   : in STD_LOGIC
    );
end FTP_HXILINX_lab4_seven_segment_display;

architecture Behavioral of FTP_HXILINX_lab4_seven_segment_display is
signal q_tmp : std_logic := TO_X01(INIT);
begin

process(C, PRE)
begin
  if (PRE='1') then
    q_tmp <= '1';
  elsif (C'event and C = '1') then
    if(T='1') then
      q_tmp <= not q_tmp;
    end if;
  end if;  
end process;

Q <= q_tmp;

end Behavioral;


library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity ftp_counter_MUSER_lab4_seven_segment_display is
   port ( cl_ckk  : in    std_logic; 
          rd_clkk : out   std_logic);
end ftp_counter_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of ftp_counter_MUSER_lab4_seven_segment_display is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_39 : std_logic;
   signal XLXN_40 : std_logic;
   signal XLXN_41 : std_logic;
   signal XLXN_42 : std_logic;
   signal XLXN_43 : std_logic;
   signal XLXN_44 : std_logic;
   signal XLXN_45 : std_logic;
   signal XLXN_46 : std_logic;
   signal XLXN_47 : std_logic;
   signal XLXN_48 : std_logic;
   signal XLXN_49 : std_logic;
   signal XLXN_50 : std_logic;
   signal XLXN_51 : std_logic;
   signal XLXN_52 : std_logic;
   signal XLXN_53 : std_logic;
   signal XLXN_54 : std_logic;
   signal XLXN_56 : std_logic;
   signal XLXN_57 : std_logic;
   signal XLXN_59 : std_logic;
   signal XLXN_60 : std_logic;
   signal XLXN_61 : std_logic;
   signal XLXN_62 : std_logic;
   signal XLXN_63 : std_logic;
   signal XLXN_64 : std_logic;
   signal XLXN_65 : std_logic;
   signal XLXN_66 : std_logic;
   signal XLXN_67 : std_logic;
   signal XLXN_69 : std_logic;
   signal XLXN_70 : std_logic;
   signal XLXN_71 : std_logic;
   signal XLXN_75 : std_logic;
   signal XLXN_77 : std_logic;
   signal XLXN_78 : std_logic;
   signal XLXN_80 : std_logic;
   signal XLXN_81 : std_logic;
   signal XLXN_82 : std_logic;
   signal XLXN_83 : std_logic;
   signal XLXN_84 : std_logic;
   signal XLXN_85 : std_logic;
   signal XLXN_86 : std_logic;
   signal XLXN_87 : std_logic;
   component FTP_HXILINX_lab4_seven_segment_display
      generic( INIT : bit :=  '1');
      port ( C   : in    std_logic; 
             PRE : in    std_logic; 
             T   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_35 : label is "XLXI_35_48";
   attribute HU_SET of XLXI_36 : label is "XLXI_36_49";
   attribute HU_SET of XLXI_37 : label is "XLXI_37_50";
   attribute HU_SET of XLXI_38 : label is "XLXI_38_51";
   attribute HU_SET of XLXI_39 : label is "XLXI_39_52";
   attribute HU_SET of XLXI_40 : label is "XLXI_40_53";
   attribute HU_SET of XLXI_41 : label is "XLXI_41_54";
   attribute HU_SET of XLXI_42 : label is "XLXI_42_55";
   attribute HU_SET of XLXI_43 : label is "XLXI_43_56";
   attribute HU_SET of XLXI_44 : label is "XLXI_44_57";
   attribute HU_SET of XLXI_45 : label is "XLXI_45_58";
   attribute HU_SET of XLXI_46 : label is "XLXI_46_59";
   attribute HU_SET of XLXI_47 : label is "XLXI_47_60";
   attribute HU_SET of XLXI_48 : label is "XLXI_48_61";
   attribute HU_SET of XLXI_49 : label is "XLXI_49_62";
   attribute HU_SET of XLXI_50 : label is "XLXI_50_63";
begin
   XLXN_75 <= '1';
   XLXN_77 <= '0';
   XLXI_35 : FTP_HXILINX_lab4_seven_segment_display
      port map (C=>cl_ckk,
                PRE=>XLXN_77,
                T=>XLXN_75,
                Q=>XLXN_56);
   
   XLXI_36 : FTP_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_39,
                PRE=>XLXN_85,
                T=>XLXN_75,
                Q=>XLXN_54);
   
   XLXI_37 : FTP_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_40,
                PRE=>XLXN_86,
                T=>XLXN_75,
                Q=>XLXN_57);
   
   XLXI_38 : FTP_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_41,
                PRE=>XLXN_87,
                T=>XLXN_75,
                Q=>XLXN_69);
   
   XLXI_39 : FTP_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_42,
                PRE=>XLXN_77,
                T=>XLXN_75,
                Q=>XLXN_65);
   
   XLXI_40 : FTP_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_43,
                PRE=>XLXN_82,
                T=>XLXN_75,
                Q=>XLXN_66);
   
   XLXI_41 : FTP_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_44,
                PRE=>XLXN_83,
                T=>XLXN_75,
                Q=>XLXN_67);
   
   XLXI_42 : FTP_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_45,
                PRE=>XLXN_84,
                T=>XLXN_75,
                Q=>XLXN_70);
   
   XLXI_43 : FTP_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_46,
                PRE=>XLXN_77,
                T=>XLXN_75,
                Q=>XLXN_59);
   
   XLXI_44 : FTP_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_47,
                PRE=>XLXN_77,
                T=>XLXN_75,
                Q=>XLXN_64);
   
   XLXI_45 : FTP_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_48,
                PRE=>XLXN_80,
                T=>XLXN_75,
                Q=>XLXN_63);
   
   XLXI_46 : FTP_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_49,
                PRE=>XLXN_81,
                T=>XLXN_75,
                Q=>XLXN_71);
   
   XLXI_47 : FTP_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_50,
                PRE=>XLXN_77,
                T=>XLXN_75,
                Q=>XLXN_60);
   
   XLXI_48 : FTP_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_51,
                PRE=>XLXN_77,
                T=>XLXN_75,
                Q=>XLXN_61);
   
   XLXI_49 : FTP_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_52,
                PRE=>XLXN_77,
                T=>XLXN_75,
                Q=>XLXN_62);
   
   XLXI_50 : FTP_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_53,
                PRE=>XLXN_78,
                T=>XLXN_75,
                Q=>rd_clkk);
   
   XLXI_51 : INV
      port map (I=>XLXN_56,
                O=>XLXN_39);
   
   XLXI_52 : INV
      port map (I=>XLXN_54,
                O=>XLXN_40);
   
   XLXI_53 : INV
      port map (I=>XLXN_57,
                O=>XLXN_41);
   
   XLXI_54 : INV
      port map (I=>XLXN_69,
                O=>XLXN_42);
   
   XLXI_55 : INV
      port map (I=>XLXN_65,
                O=>XLXN_43);
   
   XLXI_56 : INV
      port map (I=>XLXN_66,
                O=>XLXN_44);
   
   XLXI_57 : INV
      port map (I=>XLXN_67,
                O=>XLXN_45);
   
   XLXI_58 : INV
      port map (I=>XLXN_70,
                O=>XLXN_46);
   
   XLXI_59 : INV
      port map (I=>XLXN_59,
                O=>XLXN_47);
   
   XLXI_60 : INV
      port map (I=>XLXN_64,
                O=>XLXN_48);
   
   XLXI_61 : INV
      port map (I=>XLXN_63,
                O=>XLXN_49);
   
   XLXI_62 : INV
      port map (I=>XLXN_71,
                O=>XLXN_50);
   
   XLXI_63 : INV
      port map (I=>XLXN_60,
                O=>XLXN_51);
   
   XLXI_64 : INV
      port map (I=>XLXN_61,
                O=>XLXN_52);
   
   XLXI_65 : INV
      port map (I=>XLXN_62,
                O=>XLXN_53);
   
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

entity fi_nal_cloooking_MUSER_lab4_seven_segment_display is
   port ( cl_oock : in    std_logic; 
          pu_sh   : in    std_logic; 
          an_ode  : out   std_logic_vector (3 downto 0));
end fi_nal_cloooking_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of fi_nal_cloooking_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_13 : std_logic;
   signal XLXN_14 : std_logic;
   signal XLXN_15 : std_logic;
   signal XLXN_19 : std_logic;
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
   
   component ftp_counter_MUSER_lab4_seven_segment_display
      port ( cl_ckk  : in    std_logic; 
             rd_clkk : out   std_logic);
   end component;
   
begin
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
   
   XLXI_11 : ftp_counter_MUSER_lab4_seven_segment_display
      port map (cl_ckk=>cl_oock,
                rd_clkk=>XLXN_13);
   
end BEHAVIORAL;



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

entity lab4_seven_segment_display is
   port ( b          : in    std_logic_vector (15 downto 0); 
          clk        : in    std_logic; 
          pushbutton : in    std_logic; 
          anode      : out   std_logic_vector (3 downto 0); 
          cathode    : out   std_logic_vector (6 downto 0));
end lab4_seven_segment_display;

architecture BEHAVIORAL of lab4_seven_segment_display is
   signal anode_DUMMY : std_logic_vector (3 downto 0);
	   signal anode_DUMMY_ch : std_logic_vector (6 downto 0);
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
   
   component fi_nal_cloooking_MUSER_lab4_seven_segment_display
      port ( pu_sh   : in    std_logic; 
             cl_oock : in    std_logic; 
             an_ode  : out   std_logic_vector (3 downto 0));
   end component;
   
begin
   anode(3 downto 0) <= anode_DUMMY(3 downto 0);
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
   anode_DUMMY_ch <= "1000000" when "0000",
							"1111001" when "0001",
							"0100100" when "0010",
							"0110000" when "0011",
							"1100011" when "0100",
							"0100011" when "0111",
							"0100111" when "0110",
							"0100001" when "0101",
							"1111111" when others,

	
   XLXI_14 : fi_nal_cloooking_MUSER_lab4_seven_segment_display
      port map (cl_oock=>clk,
                pu_sh=>pushbutton,
                an_ode(3 downto 0)=>anode_DUMMY(3 downto 0));
   
end BEHAVIORAL;


---------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;  

entity lab8_elevator_control is
port(
	up_request : in std_logic_vector(3 downto 0);
	down_request : in std_logic_vector(3 downto 0);
	reset : in std_logic;
	door_open : in std_logic_vector(1 downto 0);
	door_closed : in std_logic_vector(1 downto 0);
	clk : in std_logic;
	lift1_floor : in std_logic_vector(3 downto 0);
	lift2_floor : in std_logic_vector(3 downto 0);
	sim_mode : in std_logic;
	up_request_indicator : out std_logic_vector(3 downto 0);
	down_request_indicator : out std_logic_vector(3 downto 0);
	cathode : out std_logic_vector(6 downto 0);
	anode : out std_logic_vector(3 downto 0);
	lift1_floor_indicator : out std_logic_vector(3 downto 0);
	lift2_floor_indicator : out std_logic_vector(3 downto 0)
	);
end lab8_elevator_control;

architecture Behavioral of lab8_elevator_control is
signal r:std_logic_vector(3 downto 0);
begin
	-- L1: entity work.flana;
   --    port map();
	-- L2: entity work.timkana;
	--   port map();
    

end Behavioral;

