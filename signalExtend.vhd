LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY signalExtend is

	port(
			ctrl       : IN BIT;
			section_03 : IN UNSIGNED(3 DOWNTO 0);
			section_04 : IN UNSIGNED(3 DOWNTO 0);
			saida      : OUT SIGNED(15 DOWNTO 0)
	);

END signalExtend;

architecture sigExt of signalExtend is

  constant zero_12bit : SIGNED(11 DOWNTO 0) := "000000000000";
  constant one_12bit  : SIGNED(11 DOWNTO 0) := "111111111111";
  constant zero_08bit : SIGNED(7 DOWNTO 0) := "00000000";
  constant one_08bit  : SIGNED(7 DOWNTO 0) := "11111111";

begin

  process(ctrl, section_03, section_04)
  begin

    if ctrl  = '0' then
      if section_04(3) = '0' then
        saida <= zero_12bit & signed(section_04);
      else
        saida <= one_12bit & signed(section_04);
      end if;
    else
      if section_03(3) = '0' then
        saida <= zero_08bit & signed(section_03) & signed(section_04); --I type
      else
        saida <= one_08bit & signed(section_03) & signed(section_04); --I type
      end if;
    end if;

   end process;
end architecture;
