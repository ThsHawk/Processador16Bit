LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY dmux_1to2 is

	port(
			ctrl     : IN BIT;
			entrada  : IN UNSIGNED(3 DOWNTO 0);
			saida_01 : OUT UNSIGNED(3 DOWNTO 0);
			saida_02 : OUT UNSIGNED(3 DOWNTO 0)
	);

END dmux_1to2;

architecture dmux1to2 of dmux_1to2 is

	begin

		saida_01 <= entrada when ctrl = '1' else unaffected;
		saida_02 <= entrada when ctrl = '0' else unaffected;

	end architecture;
