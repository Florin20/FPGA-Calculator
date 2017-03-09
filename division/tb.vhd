library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity tb is
end tb;

architecture tb of tb is

signal CLOCK: STD_LOGIC := '0';

component DIVIDER
	port (C, RESET, E: in STD_LOGIC;
	X, Y: in STD_LOGIC_VECTOR(7 downto 0);
	F: out STD_LOGIC;
	Q, R: out STD_LOGIC_VECTOR(7 downto 0));
end component;

signal RESET, E, F: STD_LOGIC;
signal X, Y, Q, R: STD_LOGIC_VECTOR(7 downto 0);

begin
	
	CLOCK <= not CLOCK after 10ns;
	
	process begin
		RESET <= '1';
		E <= '0';
		X <= x"F3"; --243
		Y <= x"1F"; --31
		
		wait for 30ns;
		RESET <= '0';
		E <= '1';
		
		wait for 100ns;
		E <= '0';
		
		wait;
	end process;
	
	div: divider port map (CLOCK, RESET, E, X, Y, F, Q, R);

end tb;