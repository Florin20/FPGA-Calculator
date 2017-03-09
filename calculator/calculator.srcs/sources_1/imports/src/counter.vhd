library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity deccounter is
	port(EN, clk: in std_logic;
	Q: out std_logic_vector(0 to 3));
end entity deccounter;

architecture counter of deccounter is
begin
	process (clk)
	variable temp:std_logic_vector(0 to 3):= "0000";
	begin
	if(rising_edge(clk)) then
		if(EN = '1') then
			temp := temp+'1';
			if(temp = "1010") then
				temp:= "0000";
	end if;
	end if;
	end if;
	Q <= temp;
end process;
end architecture counter;
			
		