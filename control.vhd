LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY control is

	port(
			opcode              : IN UNSIGNED(3 DOWNTO 0);
			ctrl_alu            : OUT UNSIGNED(2 DOWNTO 0);
			--ctrl_input_02       : OUT BIT;
			ctrl_signalExtend   : OUT BIT;
			--ctrl_regBank       : OUT SIGNED(15 DOWNTO 0);
			ctrl_section_02Dmux : OUT BIT;
			ctrl_section_03Dmux : OUT UNSIGNED(1 DOWNTO 0);
			ctrl_section_04Dmux : OUT BIT
	);

END control;

architecture ctrl of control is
begin

	process(opcode)
	begin

		ctrl_alu <= ((not(opcode(3)) and opcode(2) and opcode(1) and not(opcode(0)))
								OR (opcode(3) and not(opcode(2)) and not(opcode(1)) and opcode(0))
								OR (opcode(3) and not(opcode(2)) and opcode(1) and not(opcode(0))))
								&
								((not(opcode(3)) and opcode(2) and not(opcode(1)))
								OR (opcode(3) and not(opcode(2)) and not(opcode(1)) and opcode(0)))
								&
								((not(opcode(3)) and opcode(1) and opcode(0))
								OR (not(opcode(3)) and opcode(2) and opcode(0))
								OR (not(opcode(3)) and opcode(2) and opcode(1)));

		ctrl_section_02Dmux <= to_bit(opcode(3) and opcode(2) and opcode(1));
		ctrl_section_03Dmux <= (not(opcode(3))
													 OR
													 (not(opcode(2)) and opcode(1) and not(opcode(0))))
													 &
													 (opcode(3) and not(opcode(1)));
		ctrl_section_04Dmux <= to_bit((opcode(3) and opcode(2)) OR (opcode(3) and not(opcode(1))));

		ctrl_signalExtend <= to_bit(opcode(1) or not(opcode(3)));

	end process;
end architecture;
