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

	constant zero : UNSIGNED(3 DOWNTO 0) := "0000";

begin

	process(ctrl, entrada)
	begin

		if ctrl = "00" then

			saida_01 <= entrada;
		  saida_02 <= zero;
		  saida_03 <= zero;

		elsif ctrl = "01" then

			saida_01 <= zero;
		  saida_02 <= entrada;
		  saida_03 <= zero;

		else

			saida_01 <= zero;
		  saida_02 <= zero;
		  saida_03 <= entrada;

	  end if;

	end process;
end architecture;
