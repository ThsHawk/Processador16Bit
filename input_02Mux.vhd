LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY input_02Mux is

	port(
			ctrl       : IN BIT;
			entrada_01 : IN SIGNED(15 DOWNTO 0);
			entrada_02 : IN SIGNED(15 DOWNTO 0);
			saida      : OUT SIGNED(15 DOWNTO 0)
	);

END input_02Mux;

architecture aluMux of input_02Mux is
begin

	with ctrl select

		saida <= entrada_01 when '0', --$t0
		         entrada_02 when '1'; --$t1

end architecture;
