----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2024 02:06:42 PM
-- Design Name: 
-- Module Name: sevenSegDecoder - Behavioral
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

entity sevenSegDecoder is
    Port ( 
    i_D : in STD_LOGIC_VECTOR (3 downto 0);
    o_S : out STD_LOGIC_VECTOR (6 downto 0)
          );
           
end sevenSegDecoder;

architecture Behavioral of sevenSegDecoder is
signal Sa : std_logic;
signal Sb : std_logic;
signal Sc : std_logic;
signal Sd : std_logic;
signal Se : std_logic;
signal Sf : std_logic;
signal Sg : std_logic;


begin
Sa <= '1' when ( (i_D = x"1") or
                 (i_D = x"4") or
                 (i_D = x"B") or
                 (i_D = x"C") or
                 (i_D = x"D") ) else '0';
                 
o_S(0)<=Sa;          

Sb <= '1' when ( (i_D = x"5") or
                 (i_D = x"6") or
                 (i_D = x"B") or 
                 (i_D = x"C") or
                 (i_D = x"E") or
                 (i_D = x"F") ) else '0';
o_S(1)<=Sb;

Sc <= ( i_D(3) and i_D(2) and i_D(1) )
 or ( i_D(3) and i_D(2) and not i_D(0) )
 or ( not i_D(3) and not i_D(2) and i_D(1) and not i_D(0) );
 o_S(2)<=Sc;
 
 Sd <= ( i_D(1) and i_D(0) and i_D(2) ) 
 or ( not i_D(1) and i_D(0) and not i_D(2) ) 
 or ( i_D(1) and not i_D(0) and i_D(3) and not i_D(2) )
 or ( not i_D(1) and not i_D(0) and not i_D(3) and i_D(2) );
 o_S(3)<=Sd;
 
 Se <= ( i_D(0) and not i_D(3) )
 or (not i_D(1) and i_D(0) and not i_D(2) )
 or ( not i_D(3) and i_D(2) and not i_D(1) );
 o_S(4)<=Se;
 
 Sf <= ( i_D(3) and i_D(2) and not i_D(1) )
 or (not i_D(3) and not i_D(2) and i_D(0) )
 or (i_D(1) and i_D(0) and not i_D(3) )
 or (not i_D(3) and not i_D(2) and i_D(1) );
 o_S(5)<=Sf;
 
 Sg <= ( not i_D(3) and not i_D(2) and not i_D(1) )
 or (i_D(1) and i_D(0) and not i_D(3) and i_D(2) );
o_S(6)<=Sg; 

end Behavioral;
