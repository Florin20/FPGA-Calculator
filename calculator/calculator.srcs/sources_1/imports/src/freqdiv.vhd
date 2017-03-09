library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FREQ_DIV is
    port (C: in STD_LOGIC; C2: out STD_LOGIC);
end FREQ_DIV;

architecture Behavioral of FREQ_DIV is

signal Q_INT: STD_LOGIC_VECTOR(25 downto 0);

begin
    
    process (C) begin
		if rising_edge(C) then
			Q_INT <= Q_INT + 1;
		end if;
	end process;
    
    C2 <= Q_INT(25);

end Behavioral;