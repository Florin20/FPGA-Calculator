library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AM is
	port (A, B: in STD_LOGIC_VECTOR(3 downto 0);
	S: in STD_LOGIC;
	Y: out STD_LOGIC_VECTOR(3 downto 0));
end AM;

architecture AM of AM is
begin
	Y <= A when S = '0' else B;
end AM;