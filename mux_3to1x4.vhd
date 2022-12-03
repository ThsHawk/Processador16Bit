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

	constant zero : UNSIGNED(3 DOWNTO 0) := "0000";

begin

	process(ctrl, entrada_01, entrada_02, entrada_03)
	begin
		
		if ctrl = "00" then

			saida <= entrada_01;

		elsif ctrl = "01" then

			saida <= entrada_02;

		else

			saida <= entrada_03;

		end if;
	end process;
end architecture;
