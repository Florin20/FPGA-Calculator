library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DIVIDER is
	port (C, RESET, E: in STD_LOGIC;
	X, Y: in STD_LOGIC_VECTOR(7 downto 0);
	F: out STD_LOGIC;
	Q, R: out STD_LOGIC_VECTOR(7 downto 0));
end DIVIDER;

architecture STRUCTURAL of DIVIDER is

component EU
	port (CLOCK, AA, LDA, SHA, AAU, JF, KF, PI, LDI, CLRI, WSC, GB, SB, LDB, SHB: in STD_LOGIC;
	X, Y: in STD_LOGIC_VECTOR(7 downto 0);
	F: out STD_LOGIC;
	I: out STD_LOGIC_VECTOR(2 downto 0);
	Q, R: out STD_LOGIC_VECTOR(7 downto 0));
end component;

component CU
	port (CLOCK, RESET, E, A7: in STD_LOGIC;
	I: in STD_LOGIC_VECTOR(2 downto 0);
	AA, LDA, SHA, AAU, JF, KF, PI, LDI, CLRI, WSC, GB, SB, LDB, SHB: out STD_LOGIC);
end component;

signal AA, LDA, SHA, AAU, JF, KF, PI, LDI, CLRI, WSC, GB, SB, LDB, SHB: STD_LOGIC;
signal A: STD_LOGIC_VECTOR(7 downto 0);
signal I: STD_LOGIC_VECTOR(2 downto 0);

begin
	
	COMMAND_UNIT: CU port map (C, '0', E, A(7), I, AA, LDA, SHA, AAU, JF, KF, PI, LDI, CLRI, WSC, GB, SB, LDB, SHB);
	EXECUTION_UNIT: EU port map (C, AA, LDA, SHA, AAU, JF, KF, PI, LDI, CLRI, WSC, GB, SB, LDB, SHB, X, Y, F, I, Q, A);
	
	R <= A;
	
end STRUCTURAL;
	