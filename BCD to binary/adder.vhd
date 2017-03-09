library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity  ADDER is
	generic (N: INTEGER := 8);
	port (A, B: in STD_LOGIC_VECTOR(N - 1 downto 0);
		SUM: out STD_LOGIC_VECTOR(N - 1 downto 0));
end ADDER;

architecture BEHAV of ADDER is
begin
	SUM <= A + B;
end BEHAV;