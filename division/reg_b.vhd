library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity REG_B is
	port (X: in STD_LOGIC_VECTOR(7 downto 0);
	CLOCK, G, S, LD, SH: in STD_LOGIC;
	Q: out STD_LOGIC_VECTOR(7 downto 0));
end REG_B;

architecture REG_B of REG_B is

signal Q_INT: STD_LOGIC_VECTOR(7 downto 0);

begin
	
	process (CLOCK)
	begin
		if falling_edge(CLOCK) then
			if SH = '1' then
				Q_INT <= Q_INT(6 downto 0) & '0';
			elsif LD = '1' then
				if G = '1' then
					Q_INT <= x"00";
				elsif S = '0' then
					Q_INT <= X;
				else
					Q_INT(0) <= '1';
				end if;
			end if;
		end if;
	end process;
	
	Q <= Q_INT;

end REG_B;
	