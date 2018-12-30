----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.08.2017 19:05:48
-- Design Name: 
-- Module Name: clock_modifier - struc
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
-- Rajat Khanna
-- 2017UCS0050

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_modifier is
    Port ( clock : in std_logic;
           slow_gcd : out std_logic;
           slow_display : out std_logic;
           fast_gcd : out std_logic                          
           );
end clock_modifier;

architecture struc of clock_modifier is
SIGNAL ring : std_logic_vector (27 downto 0) := "0000000000000000000000000000";
BEGIN

	process(clock)
	begin
	IF (clock='1' AND clock'EVENT) THEN 
	ring <= ring +1;
               
	END IF;
	 slow_gcd <= ring(26);
	 slow_display <= ring(8);
	 fast_gcd <= ring(1);
	end process;
end struc;

