LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY mux_3to1x4 is

	port(
			ctrl       : IN UNSIGNED(1 DOWNTO 0);
			entrada_01 : IN UNSIGNED(3 DOWNTO 0);
			entrada_02 : IN UNSIGNED(3 DOWNTO 0);
			entrada_03 : IN UNSIGNED(3 DOWNTO 0);
			saida      : OUT UNSIGNED(3 DOWNTO 0)
	);

END mux_3to1x4;

architecture reg_destMux of mux_3to1x4 is
begin

	with ctrl select

		saida <= entrada_01 when "00", --J type
		         entrada_02 when "01", --I type
		         entrada_03 when "10", --R type
		         unaffected when others;

end architecture;
