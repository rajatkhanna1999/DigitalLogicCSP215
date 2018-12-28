--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : lab4_seven_segment_display.vhf
-- /___/   /\     Timestamp : 09/26/2018 14:49:10
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
----- CELL FTP_HXILINX_lab4_seven_segment_display -----



--2017UCS0042 Jatin Nandal
--2017UCS0050 Rajat Khanna



-----------------------------------------------------------------------------------------------------------------------------------------------

--Component Full Adder
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity Full_adder is
port (
       cin : in std_logic;
	    a   : in std_logic;
	    b   : in std_logic;
	    sum : out std_logic;
	    carry: out std_logic );
end Full_adder;

architecture Behavioral of Full_adder is
begin
sum <= (a XOR b) XOR cin;
carry <= (a and b) or (b and cin) or (a and cin);

end Behavioral;

---------------------------------------------------------------------------------------------------------------------------------------------

--Component SelfAdder
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity Self_Adder is
port ( 
      a : in std_logic_vector(3 downto 0);
		b : in std_logic_vector(3 downto 0);
		c : in std_logic_vector(3 downto 0);
      s : out std_logic_vector(3 downto 0) );
end Self_Adder;

architecture sum of Self_Adder is
begin

process(a,b,c)
begin
--loop for calculating sum
for i in 0 to 3 loop
s(i) <= a(i) xor b(i) xor c(i);
end loop;

end process;
end sum;

----------------------------------------------------------------------------------------------------------------------------------------------

--Component  propogate and generate
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity Prop_gen is
port( 
		a : in std_logic_vector(3 downto 0);
		b : in std_logic_vector(3 downto 0);
		p : out std_logic_vector(3 downto 0);
      g : out std_logic_vector(3 downto 0)
	 );
end Prop_gen;

architecture behavioral of Prop_gen is
begin

process(a,b)
variable I: integer range 0 to 4;
begin
--Loop for calculating p and g because p = a(i)+b(i) and g = a(i)*b(i)
I := 0;
while (I <= 3) loop
p(I) <= a(I) or b(I);
g(I) <= a(I) and b(I);
I := I + 1;
end loop;

end process;
end behavioral;

----------------------------------------------------------------------------------------------------------------------------------------------

--Carry Look Ahead
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity Carry_look_ahead is
port ( 
		 a : in std_logic_vector(3 downto 0);
		 b : in std_logic_vector(3 downto 0);
		 c	: in std_logic;
       carry :out std_logic_vector(4 downto 0)
	  );
end Carry_look_ahead;

architecture behavioral of Carry_look_ahead is
begin
process(a,b,c)
variable var : std_logic_vector(4 downto 0);
begin
var(0) := c;
for i in 1 to 4 loop
var(i) := (a(i-1) and var(i-1)) or b(i-1);
end loop;
carry <= var;
end process;
end behavioral;

----------------------------------------------------------------------------------------------------------------------------------------------

--Propagate_carry
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity Propagate_carry is
port (
       a1 : in std_logic_vector(7 downto 0);
		 a2 : in std_logic_vector(7 downto 0);
		 sum1 : out std_logic_vector(7 downto 0);
		 carry1 : out std_logic );
end Propagate_carry;

architecture hi of Propagate_carry is
signal carry : std_logic_vector(8 downto 0);
component Full_adder 
port (
       cin : in std_logic;
	    a   : in std_logic;
	    b   : in std_logic;
	    s   : out std_logic;
	    c   : out std_logic);
end component;

begin
carry(0) <= '0';
l0to7:for i in 0 to 7 generate
li: Full_adder port map(cin => carry(i) ,
 a => a1(i),
 b => a2(i),
 s => sum1(i),
 c => carry(i+1) ); 
end generate;

carry1 <= carry(8);

end hi;

------------------------------------------------------------------------------------------------------------------------------------------------
-- Save_carry
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity Save_carry is
port (
	   a1 : in std_logic_vector(7 downto 0);	
		b1 : in std_logic_vector(7 downto 0);
      c1 : in std_logic_vector(6 downto 0);
		carry : out std_logic_vector(7 downto 0);
		sum : out std_logic_vector(7 downto 0)
	  );
end Save_carry;

architecture hey of Save_carry is
component Full_adder 
port (
       cin : in std_logic;
	    a   : in std_logic;
	    b   : in std_logic;
	    s   : out std_logic;
	    c   : out std_logic
     );
end component;
begin
U0 : Full_adder port map (cin => '0',
 a => a1(0), 
 b => b1(0),
 s => sum(0),
 c => carry(0));

L11to7 : for i in 1 to 7 generate
Li: Full_adder port map (cin => c1(i-1), 
a => a1(i),
 b => b1(i),
 s => sum(i),
 c => carry(i));
end generate;

end hey;

------------------------------------------------------------------------------------------------------------------------------------------------
--Look_ahead_carry
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity look_ahead_adder is
port ( a1 : in std_logic_vector(3 downto 0);
       b1 : in std_logic_vector(3 downto 0);
       c1 : in std_logic;
       sum : out std_logic_vector(3 downto 0);
       carry : out std_logic
     ); 		 
end look_ahead_adder;

architecture hello of look_ahead_adder is
signal prop, gen : std_logic_vector(3 downto 0);
signal temp_carry : std_logic_vector(4 downto 0);

component Prop_gen 
port( a : in std_logic_vector(3 downto 0);
      b : in std_logic_vector(3 downto 0);
      p : out std_logic_vector(3 downto 0);
		g : out std_logic_vector(3 downto 0)
	 );
end component;			

component Carry_look_ahead 
port ( a : in std_logic_vector(3 downto 0);
       b : in std_logic_vector(3 downto 0);
       c : in std_logic;
		 carry : out std_logic_vector(4 downto 0)
	  );
end component;
		
component Self_Adder 
port ( a : in std_logic_vector(3 downto 0);
       b : in std_logic_vector(3 downto 0);
		 c : in std_logic_vector(3 downto 0);
       s : out std_logic_vector(3 downto 0)
	  );
end component;	
begin
L1 : Prop_gen port map( a => a1,
 b => b1,
 p => prop,
 g => gen);
L2 : Carry_look_ahead port map( a => prop,
 b => gen,
 c => c1, 
 carry => temp_carry);
L3 : Self_Adder  port map( a => a1,
 b => b1, 
 c => temp_carry(3 downto 0),
 s => sum);

carry <= temp_carry(4);

end hello;
------------------------------------------------------------------------------------------------------------------------------------------------
--Calculations 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.VComponents.all;
 
entity P_calculation is
port ( a1,b1 : in std_logic_vector(7 downto 0);
       v0,v1,v2,v3,v4,v5,v6,v7 : out std_logic_vector(7 downto 0) );
end P_calculation;

architecture hmm of P_calculation is
begin   
process(a1,b1)
begin
for i in 0 to 7 loop
v0(i) <= b1(0) and a1(i);
end loop;
for i in 0 to 7 loop
v1(i) <= b1(1) and a1(i);
end loop;
for i in 0 to 7 loop
v2(i) <= b1(2) and a1(i);
end loop;
for i in 0 to 7 loop
v3(i) <= b1(3) and a1(i);
end loop;
for i in 0 to 7 loop
v4(i) <= b1(4) and a1(i);
end loop;
for i in 0 to 7 loop
v5(i) <= b1(5) and a1(i);
end loop;
for i in 0 to 7 loop
v6(i) <= b1(6) and a1(i);
end loop;
for i in 0 to 7 loop
v7(i) <= b1(7) and a1(i);
end loop;
end process;
end hmm;

------------------------------------------------------------------------------------------------------------------------------------------------
--Multiplier_carry_propogate
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity Multiplier_carry_propogate is
port ( 
      v0,v1,v2,v3,v4,v5,v6,v7 : in std_logic_vector(7 downto 0);
       prd : out std_logic_vector(15 downto 0)
     );
end Multiplier_carry_propogate;

architecture structural of Multiplier_carry_propogate is
signal t1,t2,t3,t4,t5,t6 : std_logic_vector(7 downto 0);
signal carry_1 : std_logic_vector(5 downto 0);
		
component Propagate_carry is
port (
       a1 : in std_logic_vector(7 downto 0);
		 a2 : in std_logic_vector(7 downto 0);
		 sum1 : out std_logic_vector(7 downto 0);
		 carry1 : out std_logic );		
end component;
begin
L0 : Propagate_carry port map ( a1(7) => '0',
 a1(6 downto 0) => v0(7 downto 1),
 a2 => v1,
 sum1 => t1, 
 carry1 => carry_1(0));
L1 : Propagate_carry port map ( a1(7) => carry_1(0),
 a1(6 downto 0) => t1(7 downto 1), 
 a2 => v2,
 sum1 => t2,
 carry1 => carry_1(1));
L2 : Propagate_carry port map ( a1(7) => carry_1(1),
 a1(6 downto 0) => t2(7 downto 1), 
 a2 => v3,
 sum1 => t3,
 carry1=> carry_1(2));
L3 : Propagate_carry port map ( a1(7) => carry_1(2),
 a1(6 downto 0) => t3(7 downto 1),
 a2 => v4, sum1 => t4, 
 carry1 => carry_1(3));
L4 : Propagate_carry port map ( a1(7) => carry_1(3),
 a1(6 downto 0) => t4(7 downto 1),
 a2 => v5, 
 sum1 => t5,
 carry1 => carry_1(4));
L5 : Propagate_carry port map ( a1(7) => carry_1(4),
 a1(6 downto 0) => t5(7 downto 1),
 a2 => v6,
 sum1 => t6,
 carry1=> carry_1(5));
L6 : Propagate_carry port map ( a1(7) => carry_1(5),
 a1(6 downto 0) => t6(7 downto 1), 
 a2 => v7, 
 sum1 => prd(14 downto 7),
 carry1 => prd(15));
prd(0) <= v0(0);
prd(1) <= t1(0);
prd(2) <= t2(0);
prd(3) <= t3(0);
prd(4) <= t4(0);
prd(5) <= t5(0);
prd(6) <= t6(0);
end structural;  

------------------------------------------------------------------------------------------------------------------------------------------------
--Multiplier_savecarry
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity Multiplier_savecarry is
port ( y0,y1,y2,y3 : in std_logic_vector(7 downto 0);
       y4,y5,y6,y7 : in std_logic_vector(7 downto 0);
       prd2 : out std_logic_vector(15 downto 0)
     );
end Multiplier_savecarry;

architecture structural of Multiplier_savecarry is 
signal t1,t2,t3,t4,t5,t6 : std_logic_vector(7 downto 0);  
signal c1,c2,c3,c4,c5,c6 : std_logic_vector(7 downto 0);   
component Propagate_carry
port (	 
		 a1 : in std_logic_vector(7 downto 0);
		 a2 : in std_logic_vector(7 downto 0);
		 sum1 : out std_logic_vector(7 downto 0);
		 carry1 : out std_logic 	
	   );
end component;
  
component Save_carry 
port ( 		 
   a1 : in std_logic_vector(7 downto 0);	
		b1 : in std_logic_vector(7 downto 0);
      c1 : in std_logic_vector(6 downto 0);
		carry : out std_logic_vector(7 downto 0);
		sum : out std_logic_vector(7 downto 0)
	  );
end component;
begin
L0 : Save_carry port map ( a1(7) => '0',
 a1(6 downto 0) => y0(7 downto 1),
 b1 => y1,
 c1=> y2(6 downto 0),
 sum => t1,
 carry => c1);
L1 : Save_carry port map ( a1(7) => y2(7),
 a1(6 downto 0) => t1(7 downto 1),
 b1 => c1,
 c1 => y3(6 downto 0),
 sum => t2, 
 carry => c2);  
L2 : Save_carry port map ( a1(7) => y3(7),
 a1(6 downto 0) => t2(7 downto 1), 
 b1 => c2,
 c1 => y4(6 downto 0),
 sum => t3,
 carry => c3); 
L3 : Save_carry port map ( a1(7) => y4(7), 
a1(6 downto 0) => t3(7 downto 1),
 b1 => c3, 
 c1 => y5(6 downto 0), 
 sum => t4, 
 carry => c4); 
L4 : Save_carry port map ( a1(7) => y5(7), 
a1(6 downto 0) => t4(7 downto 1),
 b1 => c4,
 c1 => y6(6 downto 0),
 sum => t5,
 carry => c5); 
L5 : Save_carry port map ( a1(7) => y6(7),
 a1(6 downto 0) => t5(7 downto 1),
 b1 => c5, 
 c1 => y7(6 downto 0), 
 sum => t6, 
 carry => c6);   
L6 : Propagate_carry port map( a1(7) => y7(7),
 a1(6 downto 0) => t6(7 downto 1), 
 a2 => c6, 
 sum1 => prd2(14 downto 7), 
 carry1 => prd2(15));

prd2(0) <= y0(0);
prd2(1) <= t1(0);  
prd2(2) <= t2(0); 
prd2(3) <= t3(0); 
prd2(4) <= t4(0); 
prd2(5) <= t5(0); 
prd2(6) <= t6(0);   
  
end structural;
--------------------------------------------------------------------------------------------------------------------------------------------
--MultiplierCLA
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity MultiplierCLA is
port ( v0,v1,v2,v3,v4,v5,v6,v7 : in std_logic_vector(7 downto 0);
       prd3 : out std_logic_vector(15 downto 0)
     );
end MultiplierCLA;

architecture structural of MultiplierCLA is 
signal r1,r2,r3,r4,r5,r6 : std_logic_vector(7 downto 0);
signal d1,d2,d3,d4,d5,d6 : std_logic_vector(7 downto 0);   
signal cp : std_logic; 
component Save_carry 
port (	 
		 a1 : in std_logic_vector(7 downto 0);	
		b1 : in std_logic_vector(7 downto 0);
      c1 : in std_logic_vector(6 downto 0);
		carry : out std_logic_vector(7 downto 0);
		sum : out std_logic_vector(7 downto 0) 
	  );
end component;

component look_ahead_adder
port ( 
		 a1 : in std_logic_vector(3 downto 0);
       b1 : in std_logic_vector(3 downto 0);
       c1 : in std_logic;
       sum : out std_logic_vector(3 downto 0);
       carry : out std_logic
     ); 		 
end component;

begin
L0 : Save_carry port map ( a1(7) => '0',
 a1(6 downto 0) => v0(7 downto 1),
 b1 => v1,
 c1 => v2(6 downto 0), 
 sum => r1,
 carry => d1);
L1 : Save_carry port map ( a1(7) => v2(7), 
a1(6 downto 0) => r1(7 downto 1),
 b1 => d1,
 c1 => v3(6 downto 0), 
 sum => r2, 
 carry => d2);  
L2 : Save_carry port map ( a1(7) => v3(7),
 a1(6 downto 0) => r2(7 downto 1),
 b1 => d2,
 c1 => v4(6 downto 0), 
 sum => r3,
 carry => d3); 
L3 : Save_carry port map ( a1(7) => v4(7),
 a1(6 downto 0) => r3(7 downto 1), 
 b1 => d3,
 c1 => v5(6 downto 0),
 sum => r4,
 carry => d4); 
L4 : Save_carry port map ( a1(7) => v5(7),
 a1(6 downto 0) => r4(7 downto 1),
 b1 => d4,
 c1 => v6(6 downto 0),
 sum => r5, 
 carry => d5); 
L5 : Save_carry port map ( a1(7) => v6(7),
 a1(6 downto 0) => r5(7 downto 1),
 b1 => d5,
 c1 => v7(6 downto 0), 
 sum => r6,
 carry => d6);   
L6 : look_ahead_adder port map ( a1 => r6(4 downto 1),
 b1 => d6(3 downto 0),
 c1 => '0', 
 sum => prd3(10 downto 7),
 carry => cp);
L7 : look_ahead_adder port map ( a1(3) => v7(7),
 a1(2 downto 0) => r6(7 downto 5),
 b1 => d6(7 downto 4),
 c1 => cp,
 sum => prd3(14 downto 11), 
 carry => prd3(15));

prd3(0) <= v0(0);
prd3(1) <= r1(0);  
prd3(2) <= r2(0); 
prd3(3) <= r3(0); 
prd3(4) <= r4(0); 
prd3(5) <= r5(0); 
prd3(6) <= r6(0);   
  
end structural;
--------------------------------------------------------------------------------------------------------------------------------------------
--multiplexer
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity multiplexer is
port ( a1, a2, a3 : in std_logic_vector(15 downto 0);
       s : in std_logic_vector(1 downto 0);
       a4 : out std_logic_vector(15 downto 0)
     );		 
end multiplexer;

architecture behavioral of multiplexer is
begin

process(s,a1,a2,a3)
begin
if s = "00" then
a4 <= a1;
elsif s = "01" then
a4 <= a2;
elsif s="10" then 
a4 <= a3;
end if;
end process;
end behavioral;
-----------------------------------------------------------------------------------------------------------------------------------------------
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
   
   XLXI_14 : fi_nal_cloooking_MUSER_lab4_seven_segment_display
      port map (cl_oock=>clk,
                pu_sh=>pushbutton,
                an_ode(3 downto 0)=>anode_DUMMY(3 downto 0));
   
end BEHAVIORAL;
------------------------------------------------------------------------------------------------------------------------------------------------

--lab6_multiplier

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity lab6_multiplier is
port ( in1 : in std_logic_vector(7 downto 0);
       in2 : in std_logic_vector(7 downto 0);
		 clk : in std_logic;
		 display_button : in std_logic;
		 multiplier_select : in std_logic_vector(1 downto 0);
		 anode : out std_logic_vector(3 downto 0);
		 cathode : out std_logic_vector(6 downto 0);
		 product : out std_logic_vector(15 downto 0)
     );
end lab6_multiplier;

architecture Behavioral of lab6_multiplier is

signal sig0,sig1,sig2,sig3,sig4,sig5,sig6,sig7 : std_logic_vector(7 downto 0);
signal prod, prod1, prod2, prod3 : std_logic_vector(15 downto 0);

component P_calculation is
port ( a1,b1 : in std_logic_vector(7 downto 0);
       v0,v1,v2,v3,v4,v5,v6,v7 : out std_logic_vector(7 downto 0) );
end component;

component Multiplier_carry_propogate is
port ( 
      v0,v1,v2,v3,v4,v5,v6,v7 : in std_logic_vector(7 downto 0);
       prd : out std_logic_vector(15 downto 0)
     );
end component;

component Multiplier_savecarry is
port ( y0,y1,y2,y3 : in std_logic_vector(7 downto 0);
       y4,y5,y6,y7 : in std_logic_vector(7 downto 0);
       prd2 : out std_logic_vector(15 downto 0)
     );
end component;

component MultiplierCLA is
port ( v0,v1,v2,v3,v4,v5,v6,v7 : in std_logic_vector(7 downto 0);
       prd3 : out std_logic_vector(15 downto 0)
     );
end component;

component lab4_seven_segment_display 
   port ( b    : in    std_logic_vector (15 downto 0); 
          clk   : in    std_logic; 
          pushbutton : in    std_logic; 
          anode   : out   std_logic_vector (3 downto 0); 
          cathode  : out   std_logic_vector (6 downto 0));
end component;

component multiplexer is
port ( a1, a2, a3 : in std_logic_vector(15 downto 0);
       s : in std_logic_vector(1 downto 0);
       a4 : out std_logic_vector(15 downto 0)
     );		 
end component;

begin
L1 : P_calculation port map( a1 => in1,
 b1 => in2,
 v0 => sig0,
 v1 => sig1,
 v2 => sig2, 
 v3 => sig3,
 v4 => sig4,
 v5 => sig5,
 v6 => sig6,
 v7 => sig7 );
L2 : Multiplier_carry_propogate port map( v0 => sig0,
 v1 => sig1, 
 v2 => sig2,
 v3 =>sig3, 
 v4 => sig4,
 v5 => sig5,
 v6 => sig6,
 v7 => sig7,
 prd => prod1 );
L3 : Multiplier_savecarry port map( y0 => sig0,
 y1 => sig1,
 y2 =>sig2,
 y3 => sig3,
 y4 => sig4,
 y5 => sig5,
 y6 => sig6,
 y7 => sig7,
 prd2 => prod2 );
L4 : MultiplierCLA port map( v0 => sig0,
 v1 => sig1,
 v2 => sig2,
 v3 => sig3,
 v4 => sig4,
 v5 => sig5,
 v6 => sig6,
 v7 => sig7,
 prd3 => prod3 );
L5 : multiplexer port map( a1 => prod1,
 a2 => prod2,
 a3 => prod3,
 s => multiplier_select ,
 a4 => prod);
L6 : lab4_seven_segment_display port map( b => prod,
 clk => clk,
 pushbutton => display_button, 
 anode => anode, 
 cathode => cathode);
 
product <= prod;

end Behavioral;
--------------------------------------------------------------------------------------------------------------------------------------------