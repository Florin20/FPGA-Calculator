library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity REG_F is
	port (CLOCK, J, K: in STD_LOGIC;
	Q: out STD_LOGIC);
end REG_F;

architecture REG_F of REG_F is

signal Q_INT: STD_LOGIC;

begin
	
	process (CLOCK) begin
		if falling_edge(CLOCK) then
			if J = '0' then
				if K = '1' then
					Q_INT <= '0';
				end if;
			else
				if K = '0' then
					Q_INT <= '1';
				else
					Q_INT <= not Q_INT;
				end if;
			end if;
		end if;
	end process;
	
	Q <= Q_INT;
	
end REG_F;