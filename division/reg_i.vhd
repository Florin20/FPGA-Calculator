library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity REG_I is
	port (DATA: in STD_LOGIC_VECTOR(2 downto 0);
	CLOCK, NCLR, NLD, P: in STD_LOGIC;
	Q: out STD_LOGIC_VECTOR(2 downto 0));
end REG_I;

architecture REG_I of REG_I is

signal Q_INT: STD_LOGIC_VECTOR(2 downto 0);

begin
	
	process (CLOCK) begin
		if falling_edge(CLOCK) then
			if NCLR = '0' then
				Q_INT <= "000";
			elsif NLD = '0' then
				Q_INT <= DATA;
			elsif P = '1' then
				Q_INT <= Q_INT + 1;
			end if;
		end if;
	end process;
	
	Q <= Q_INT;
	
end REG_I;