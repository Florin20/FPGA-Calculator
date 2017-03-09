library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity AU is
	port (A, C: in STD_LOGIC_VECTOR(7 downto 0);
	AAU: in STD_LOGIC;
	Y: out STD_LOGIC_VECTOR(7 downto 0));
end AU;

architecture AU of AU is
begin
	Y <= A + C when AAU = '0' else A - C;
end AU;
	