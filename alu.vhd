LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use work.alu_pkg.all;

ENTITY alu is

	port(
			funct     : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			input_01  : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			input_02  : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			output_01 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);

END alu;

architecture logic of alu is

begin

	output_01 <= sum(input_01, input_02) when funct = "000" else
							 sub(input_01, input_02) when funct = "001" else
							 input_01 AND input_02   when funct = "010" else
							 input_01 OR input_02    when funct = "011" else
							 NOT(input_01)           when funct = "100" else
							 input_01 XOR input_02   when funct = "101" else
							 unaffected;

end architecture;
