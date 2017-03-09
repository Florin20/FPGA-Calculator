library IEEE;
use IEEE.std_logic_1164.all;

entity registru is
	generic(N:integer);
	port(clk, clear, pl : in std_logic;
	data: in std_logic_vector(0 to N-1);
	Q: out std_logic_vector(0 to N-1));						
end entity registru;

architecture registru of registru is 
signal temp:std_logic_vector(0 to N-1);
begin
	process(clk)
	begin
		if(rising_edge(clk))then
			if(clear = '1') then
				temp <= (others => '0');
			elsif (pl = '1') then
				temp <= data;
		    end if;
		end if;
		Q <= temp;
	end process;
end architecture registru;