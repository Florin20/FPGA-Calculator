library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AR is
	port (CLOCK, CLR: in STD_LOGIC;
	DATA: in STD_LOGIC_VECTOR(3 downto 0);
	Q: out STD_LOGIC_VECTOR(3 downto 0));
end AR;

architecture AR of AR is
signal Q_INT: STD_LOGIC_VECTOR(3 downto 0);
begin
	process(CLOCK) begin
		if falling_edge(CLOCK) then
			if CLR = '1' then
				Q_INT <= x"0";
			else
				Q_INT <= DATA;
			end if;
		end if;
	end process;
	Q <= Q_INT;
end AR;