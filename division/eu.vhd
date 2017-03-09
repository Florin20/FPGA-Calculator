library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity EU is
	port (CLOCK, AA, LDA, SHA, AAU, JF, KF, PI, LDI, CLRI, WSC, GB, SB, LDB, SHB: in STD_LOGIC;
	X, Y: in STD_LOGIC_VECTOR(7 downto 0);
	F: out STD_LOGIC;
	I: out STD_LOGIC_VECTOR(2 downto 0);
	Q, R: out STD_LOGIC_VECTOR(7 downto 0));
end EU;

architecture EU of EU is

component REG_A
	port (AU: in STD_LOGIC_VECTOR(7 downto 0);
	CLOCK, A, B7, LD, SH: in STD_LOGIC;
	Q: out STD_LOGIC_VECTOR(7 downto 0));
end component;

component AU
	port (A, C: in STD_LOGIC_VECTOR(7 downto 0);
	AAU: in STD_LOGIC;
	Y: out STD_LOGIC_VECTOR(7 downto 0));
end component;

component REG_B
	port (X: in STD_LOGIC_VECTOR(7 downto 0);
	CLOCK, G, S, LD, SH: in STD_LOGIC;
	Q: out STD_LOGIC_VECTOR(7 downto 0));
end component;

component REG_I
	port (DATA: in STD_LOGIC_VECTOR(2 downto 0);
	CLOCK, NCLR, NLD, P: in STD_LOGIC;
	Q: out STD_LOGIC_VECTOR(2 downto 0));
end component;

component REG_C
	port (DATA: in STD_LOGIC_VECTOR(7 downto 0);
	CLOCK, WS: in STD_LOGIC;
	Q: out STD_LOGIC_VECTOR(7 downto 0));
end component;

component REG_F
	port (CLOCK, J, K: in STD_LOGIC;
	Q: out STD_LOGIC);
end component;

signal Y_AU, Q_A, Q_B, Q_C: STD_LOGIC_VECTOR(7 downto 0);
signal Q_I: STD_LOGIC_VECTOR(2 downto 0);
signal NLDI, NCLRI, Q_F: STD_LOGIC;

begin
	
	RA: REG_A port map (Y_AU, CLOCK, AA, Q_B(7), LDA, SHA, Q_A);
	
	RB: REG_B port map (X, CLOCK, GB, SB, LDB, SHB, Q_B);
	
	RC: REG_C port map (Y, CLOCK, WSC, Q_C);
	
	RI: REG_I port map ("000", CLOCK, NCLRI, NLDI, PI, Q_I);
	
	RF: REG_F port map (CLOCK, JF, KF, Q_F);
	
	AUNIT: AU port map (Q_A, Q_C, AAU, Y_AU);
	
	NLDI <= not LDI;
	NCLRI <= not CLRI;
	
	F <= Q_F;
	I <= Q_I;
	Q <= Q_B;
	R <= Q_A;
	
end EU;
	