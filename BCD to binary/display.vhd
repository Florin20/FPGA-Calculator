library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DISPLAY is
	port (C: in STD_LOGIC;
		D3, D2, D1, D0: in STD_LOGIC_VECTOR(6 downto 0);
		EN: out STD_LOGIC_VECTOR(3 downto 0);
		Q: out STD_LOGIC_VECTOR(6 downto 0));
end DISPLAY;

architecture A of DISPLAY is

signal FREQ_DIV: STD_LOGIC_VECTOR(15 downto 0);
signal COUNTER: STD_LOGIC_VECTOR(1 downto 0);
signal C_DIV: STD_LOGIC;

begin
	
	DIV: process (C)
	begin
		if rising_edge(C) then
			FREQ_DIV <= FREQ_DIV + 1;
		end if;
	end process DIV;
	
	COUNT: process (C_DIV)
	begin
		if rising_edge(C_DIV) then
			COUNTER <= COUNTER + 1;
		end if;
	end process COUNT;
	
	C_DIV <= FREQ_DIV(15);
	
	SEL_Q: process (COUNTER, D0, D1, D2, D3)
	begin
		case COUNTER is
			when "00" => Q <= D0;
			when "01" => Q <= D1;
			when "10" => Q <= D2;
			when "11" => Q <= D3;
			when others => null;
		end case;
	end process SEL_Q;
	
	EN(0) <= '1' when COUNTER = "00" else '0';
	EN(1) <= '1' when COUNTER = "01" else '0';
	EN(2) <= '1' when COUNTER = "10" else '0';
	EN(3) <= '1' when COUNTER = "11" else '0';
	
end A;