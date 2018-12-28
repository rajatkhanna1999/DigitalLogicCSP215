----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.09.2017 16:19:02
-- Design Name: 
-- Module Name: vector_to_cathode - struc
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity v_to_cathode_char is
--  Port ( )
PORT (
	to_display : IN std_logic_vector(1 downto 0);
	res : OUT std_logic_vector (6 downto 0)
	);
end v_to_cathode_char;

architecture struc of v_to_cathode_char is

begin
PROCESS (to_display)
		BEGIN
			CASE to_display IS
				when "00"=>res<="1100011";--u
				when "01"=>res<="0100001";--d
				when "10"=>res<="0100111";--c
				when others =>res<="0100011";--o

			END CASE;
		END PROCESS;


end struc;
