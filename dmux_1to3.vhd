LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY dmux_1to3 is

	port(
			ctrl     : IN UNSIGNED(1 DOWNTO 0);
			entrada  : IN UNSIGNED(3 DOWNTO 0);
			saida_01 : OUT UNSIGNED(3 DOWNTO 0);
			saida_02 : OUT UNSIGNED(3 DOWNTO 0);
			saida_03 : OUT UNSIGNED(3 DOWNTO 0)
	);

END dmux_1to3;

architecture dmux1to3 of dmux_1to3 is
begin

	saida_01 <= entrada when ctrl = "00" else unaffected;
	saida_02 <= entrada when ctrl = "01" else unaffected;
	saida_03 <= entrada when ctrl = "10" else unaffected;

end architecture;
