library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity REG_C is
	port (DATA: in STD_LOGIC_VECTOR(7 downto 0);
	CLOCK, WS: in STD_LOGIC;
	Q: out STD_LOGIC_VECTOR(7 downto 0));
end REG_C;

architecture REG_C of REG_C is

signal Q_INT: STD_LOGIC_VECTOR(7 downto 0);

begin
	
	process (CLOCK) begin
		if falling_edge(CLOCK) then
			if WS = '1' then
				Q_INT <= DATA;
			end if;
		end if;
	end process;
	
	Q <= Q_INT;
	
end REG_C;
			