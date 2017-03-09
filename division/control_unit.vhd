library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CU is
	port (CLOCK, RESET, E, A7: in STD_LOGIC;
	I: in STD_LOGIC_VECTOR(2 downto 0);
	AA, LDA, SHA, AAU, JF, KF, PI, LDI, CLRI, WSC, GB, SB, LDB, SHB: out STD_LOGIC);
end CU;

architecture CU of CU is

component AM
	port (A, B: in STD_LOGIC_VECTOR(3 downto 0);
	S: in STD_LOGIC;
	Y: out STD_LOGIC_VECTOR(3 downto 0));
end component;

component ROM
	port (A: in STD_LOGIC_VECTOR(3 downto 0);
	C: out STD_LOGIC_VECTOR(15 downto 0));
end component;

component AR
	port (CLOCK, CLR: in STD_LOGIC;
	DATA: in STD_LOGIC_VECTOR(3 downto 0);
	Q: out STD_LOGIC_VECTOR(3 downto 0));
end component;

component TM
	port (A: in STD_LOGIC_VECTOR(2 downto 0);
	S: in STD_LOGIC_VECTOR(1 downto 0);
	Y: out STD_LOGIC);
end component;

component C
	port (A: in STD_LOGIC;
	B: in STD_LOGIC_VECTOR(7 downto 0);
	Y: out STD_LOGIC_VECTOR(7 downto 0));
end component;

signal Q_AR, Y_AM: STD_LOGIC_VECTOR(3 downto 0);
signal C_ROM: STD_LOGIC_VECTOR(15 downto 0);
signal S_AM, Y_T, I7: STD_LOGIC;
signal DATA_T: STD_LOGIC_VECTOR(2 downto 0);
signal OP: STD_LOGIC_VECTOR(7 downto 0);

begin
	
	MEM: ROM port map (Q_AR, C_ROM);
	MADR: AM port map (C_ROM(7 downto 4), C_ROM(3 downto 0), S_AM, Y_AM);
	RADR: AR port map (CLOCK, RESET, Y_AM, Q_AR);
	MTEST: TM port map (DATA_T, C_ROM(9 downto 8), Y_T);
	CMD: C port map (C_ROM(12), C_ROM(11 downto 4), OP); 
	
	S_AM <= C_ROM(12) or Y_T;
	I7 <= '1' when I = "111" else '0';
	DATA_T <= E & A7 & I7;
	
	AA <= OP(7);
	LDA <= OP(5);
	SHA <= OP(6);
	AAU <= OP(0);
	JF <= OP(2);
	KF <= OP(3);
	PI <= OP(1);
	LDI <= '0';
	CLRI <= OP(3);
	WSC <= OP(3);
	GB <= '0';
	SB <= OP(7);
	LDB <= OP(4);
	SHB <= OP(6);
	
end CU;