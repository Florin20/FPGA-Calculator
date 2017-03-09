library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ROM is
	port (A: in STD_LOGIC_VECTOR(3 downto 0);
	C: out STD_LOGIC_VECTOR(15 downto 0));
end ROM;

architecture ROM of ROM is

type MEMORY_MAP is array(0 to 15) of STD_LOGIC_VECTOR(15 downto 0);

signal MMAP: MEMORY_MAP := (x"1041", x"0002", x"1383", x"1404", x"1A15", x"01B6", x"1407", x"1A28",
							x"0259", x"01EA", x"1A00", x"190C", x"140D", x"1A38", x"1900", x"0000");

begin
	C <= MMAP(conv_integer(A));
end ROM;