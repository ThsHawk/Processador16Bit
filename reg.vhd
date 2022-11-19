LIBRARY IEEE;
use IEEE.std_logic_1164.all;

ENTITY registrador is

	port(
			clk     : IN STD_LOGIC;
			entrada : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			saida   : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);

END registrador;

architecture reg of registrador is

	signal memoria   : STD_LOGIC_VECTOR(15 DOWNTO 0);

begin

	process(clk)

	begin

		if rising_edge(clk) then

			memoria <= entrada;

		end if;

	end process;

	saida <= memoria;

end architecture;
