library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity C is
	port (A: in STD_LOGIC;
	B: in STD_LOGIC_VECTOR(7 downto 0);
	Y: out STD_LOGIC_VECTOR(7 downto 0));
end C;

architecture C of C is
signal A_VECTOR: STD_LOGIC_VECTOR(7 downto 0);
begin
	A_VECTOR <= (others => A);
	Y <= A_VECTOR and B;
end C;
	
	