library	 IEEE;
use IEEE.std_logic_1164.all;

entity BCD_TO_BINARY is
	port (H: in STD_LOGIC;
	T, U: in STD_LOGIC_VECTOR(0 to 3);
	RESULT: out STD_LOGIC_VECTOR(0 to 6));
end BCD_TO_BINARY;

architecture ARH of BCD_TO_BINARY is

component ADDER
	generic (N: INTEGER := 8);
	port (A, B: in STD_LOGIC_VECTOR(N - 1 downto 0);
	SUM: out STD_LOGIC_VECTOR(N - 1 downto 0));
end component;

signal CONTRIB_H, CONTRIB_T, CONTRIB_U: STD_LOGIC_VECTOR(0 to 6);
signal T_AUX_1, T_AUX_2, H_PLUS_T: STD_LOGIC_VECTOR(0 to 6);

begin
	
	process(H) begin
		if H = '1' then
			CONTRIB_H <= "1100100";
		else
			CONTRIB_H <= "0000000";
		end if;
	end process;
	
	T_AUX_1 <= "00" & T & "0";
	T_AUX_2 <= T & "000";
	
	ADD1: ADDER generic map(7) port map(T_AUX_1, T_AUX_2, CONTRIB_T);
	
	CONTRIB_U <= "000" & U;
	
	ADD2: ADDER generic map(7) port map(CONTRIB_H, CONTRIB_T, H_PLUS_T);
	ADD3: ADDER generic map(7) port map(H_PLUS_T, CONTRIB_U, RESULT);
	
end ARH;	