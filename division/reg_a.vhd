library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity REG_A is
	port (AU: in STD_LOGIC_VECTOR(7 downto 0);
	CLOCK, A, B7, LD, SH: in STD_LOGIC;
	Q: out STD_LOGIC_VECTOR(7 downto 0));
end REG_A;

architecture REG_A of REG_A is

signal Q_INT: STD_LOGIC_VECTOR(7 downto 0);

begin
	
	process (CLOCK)
	begin
		if falling_edge(CLOCK) then
			if SH = '1' then
				Q_INT <= Q_INT(6 downto 0) & B7;
			elsif LD = '1' then
				if A = '0' then
					Q_INT <= x"00";
				else
					Q_INT <= AU;
				end if;
			end if;
		end if;
	end process;
	
	Q <= Q_INT;

end REG_A;
	