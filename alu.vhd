LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY alu is

	port(
			funct     : IN UNSIGNED(2 DOWNTO 0);
			input_01  : IN SIGNED(15 DOWNTO 0);
			input_02  : IN SIGNED(15 DOWNTO 0);
			equal     : OUT BIT;
			output_01 : OUT SIGNED(15 DOWNTO 0)
	);

END alu;

architecture logic of alu is

	signal temp : SIGNED(15 DOWNTO 0);

begin

	temp <= input_01 + input_02   when funct = "000" else
					input_01 - input_02   when funct = "001" else
				  input_01 AND input_02 when funct = "010" else
				  input_01 OR input_02  when funct = "011" else
				  NOT(input_01)         when funct = "100" else
				  input_01 XOR input_02 when funct = "101" else
				  unaffected;

	output_01 <= temp;

	process(temp)
  begin

		if temp = "0000000000000000" then equal <= '1';
		else equal <= '0';
		end if;

	end process;
end architecture;
