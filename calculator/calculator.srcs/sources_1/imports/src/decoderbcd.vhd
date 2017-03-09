library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SEGMENT_DECODER is
	port (I: in STD_LOGIC_VECTOR(3 downto 0);
		C: out STD_LOGIC_VECTOR(0 to 6));
end SEGMENT_DECODER;

architecture BEHAV of SEGMENT_DECODER is
begin
	process (I) begin
		case I is
			when "0000" => C <= "0000001";
			when "0001" => C <= "1001111";
			when "0010" => C <= "0010010";
			when "0011" => C <= "0000110";
			when "0100" => C <= "1001100";
			when "0101" => C <= "0100100";
			when "0110" => C <= "0100000";
			when "0111" => C <= "0001111";
			when "1000" => C <= "0000000";
			when "1001" => C <= "0000100";
			when others => C <= "0110000";
		end case;
	end process;
end BEHAV;