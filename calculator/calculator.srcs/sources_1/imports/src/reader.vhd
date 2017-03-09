library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity READER is
	port (C, ENH, ENZ, ENU, CONFIRM: in STD_LOGIC;
	SEGM, NUMBER: out STD_LOGIC_VECTOR(0 to 6);
	AN: out STD_LOGIC_VECTOR(0 to 3));
end READER;

architecture READER of READER is

component DEBOUNCER
	port (C, BTN: in STD_LOGIC;
    BTNDB: out STD_LOGIC);
end component;

component DISPLAY
	port (C: in STD_LOGIC;
		D3, D2, D1, D0: in STD_LOGIC_VECTOR(6 downto 0);
		EN: out STD_LOGIC_VECTOR(3 downto 0);
		Q: out STD_LOGIC_VECTOR(6 downto 0));
end component;

component DECCOUNTER
	port(EN, clk: in std_logic;
	Q: out std_logic_vector(0 to 3));
end component;

component FREQ_DIV
	port (C: in STD_LOGIC; C2: out STD_LOGIC);
end component;

component TFF
	port(T, clk, R: in std_logic;
	Q: out std_logic);
end component;

component SEGMENT_DECODER
	port (I: in STD_LOGIC_VECTOR(3 downto 0);
	C: out STD_LOGIC_VECTOR(0 to 6));
end component;

component BCD_TO_BINARY
	port (H: in STD_LOGIC;
	T, U: in STD_LOGIC_VECTOR(0 to 3);
	RESULT: out STD_LOGIC_VECTOR(0 to 6));
end component;

component registru
	generic(N:integer);
	port(clk, clear, pl : in std_logic;
	data: in std_logic_vector(0 to N-1);
	Q: out std_logic_vector(0 to N-1));
end component;

signal CONFIRM_DEB, C_DIV, Q_INT_COUNTH: STD_LOGIC;
signal SEGM2, SEGM1, SEGM0: STD_LOGIC_VECTOR(0 to 6);
signal DIGIT_HUNDREDS, DIGIT_TENS, DIGIT_UNITS: STD_LOGIC_VECTOR(0 to 3);
signal CONF_H: STD_LOGIC_VECTOR(0 to 0);
signal CONF_T, CONF_U: STD_LOGIC_VECTOR(0 to 3);

begin
	
	--divide clock
	CDIV: FREQ_DIV port map(C, C_DIV);
	
	--debounce confirm button signal
	DEB: DEBOUNCER port map (C, CONFIRM, CONFIRM_DEB);
	
	--display digits
	SEGMENTS_DISPLAY: DISPLAY port map (C, SEGM0, SEGM1, SEGM2, "1111111", AN, SEGM);
	
	--count digits
	COUNT_HUNDREDS: TFF port map(ENH, C_DIV, '0', Q_INT_COUNTH);
	COUNT_TENS: DECCOUNTER port map(ENZ, C_DIV, DIGIT_TENS);
	COUNT_UNITS: DECCOUNTER port map(ENU, C_DIV, DIGIT_UNITS);
	DIGIT_HUNDREDS <= "000" & Q_INT_COUNTH;
	
	--decode digits
	DECODE_HUNDREDS: SEGMENT_DECODER port map(DIGIT_HUNDREDS, SEGM2);
	DECODE_TENS: SEGMENT_DECODER port map(DIGIT_TENS, SEGM1);
	DECODE_UNITS: SEGMENT_DECODER port map(DIGIT_UNITS, SEGM0);
	
	--convert from bcd to binary
	CONV: BCD_TO_BINARY port map(CONF_H(0), CONF_T, CONF_U, NUMBER);
	
	--confirm input
	CONF1: REGISTRU generic map(1) port map(C, '0', CONFIRM_DEB, DIGIT_HUNDREDS(3 to 3), CONF_H);
	CONF2: REGISTRU generic map(4) port map(C, '0', CONFIRM_DEB, DIGIT_TENS, CONF_T);
	CONF3: REGISTRU generic map(4) port map(C, '0', CONFIRM_DEB, DIGIT_UNITS, CONF_U);
	

end READER;