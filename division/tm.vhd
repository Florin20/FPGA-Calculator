library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TM is
	port (A: in STD_LOGIC_VECTOR(0 to 2);
	S: in STD_LOGIC_VECTOR(1 downto 0);
	Y: out STD_LOGIC);
end TM;

architecture TM of TM is
begin
	process (A, S) begin
		case S is
			when "00" => Y <= A(0);
			when "01" => Y <= A(1);
			when "10" => Y <= A(2);
			when others => Y <= '0';
		end case;
	end process;
end TM;