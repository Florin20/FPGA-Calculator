library	 IEEE;
use IEEE.std_logic_1164.all;

entity tff is
	port(T, clk, R: in std_logic;
	Q: out std_logic);
end entity tff;

architecture tff of tff is 
signal temp: std_logic;
begin
	process(clk, R)
	begin
		if(R = '1') then
			temp <= '0';
		elsif(rising_edge(clk)) then
			if T = '1' then
				temp <= not temp;
			end if;
		end if;
		Q <= temp;
	end process;
end architecture tff;