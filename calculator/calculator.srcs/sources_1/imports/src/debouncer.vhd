library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DEBOUNCER is
    port (C, BTN: in STD_LOGIC;
    BTNDB: out STD_LOGIC);
end DEBOUNCER;

architecture A of DEBOUNCER is

signal REG: STD_LOGIC_VECTOR(1 downto 0);
signal COUNTER: STD_LOGIC_VECTOR(19 downto 0);
signal RESET_COUNTER: STD_LOGIC;

begin

COUNT: process (C) begin
    if rising_edge(C) then
    if RESET_COUNTER = '1' then
        COUNTER <= (others => '0');
    else
        COUNTER <= COUNTER + 1;
    end if;
    end if;
end process COUNT;

SHIFT: process (C) begin
    if rising_edge(C) then
    REG <= BTN & REG(1);
    end if;
end process SHIFT;

RESET_COUNTER <= REG(1) xor REG(0);

O: process (C) begin
if rising_edge(C) then
if COUNTER = "11111111111111111111" then
BTNDB <= REG(1);
end if;
end if;
end process O;

end A;