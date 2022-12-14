library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Display7seg is

  port(
    enable      : in BIT := '1';
  	in_16_bit   : in signed(0 to 15) := "0000000011111111"; -- variáveis de entrada para as operações.
    RAM_CLOCK   : in std_logic;                  -- clock
  	Display0    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- Primeiro display de 7 segmentos  -> HEX20 - HEX27
  	Display1    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- Segundo display de 7 segmentos   -> HEX30 - HEX37
  	Display2    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- Terceiro display de 7 segmentos  -> HEX40 - HEX47
  	Display3    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); --
  	Display4    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); --
  	Display5    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) --
  );

end Display7seg;

architecture behav of Display7seg is

-- variaveis
signal resto1 : integer;
signal resto2 : integer;
signal resto3 : integer;
signal resto4 : integer;
signal resto5 : integer;



begin



process(in_16_bit,enable,RAM_CLOCK)
variable SaveInteger  : integer;
variable SaveUnsigned : integer;
variable SaveResto    : integer;
variable aux          : integer;

begin

	if(rising_edge(RAM_CLOCK)) then




	if enable = '1' then
				SaveInteger := to_integer(abs(in_16_bit));
				SaveUnsigned := SaveInteger;
				SaveUnsigned := SaveUnsigned / 10000;
				resto1 <= SaveInteger rem 10000;
				case (SaveUnsigned) is

					when 1 =>Display5  <= "11111001";
					when 2 =>Display5  <= "10100100";
					when 3 =>Display5  <= "10110000";
					when 4 =>Display5  <= "10011001";
					when 5 =>Display5  <= "10010010";
					when 6 =>Display5  <= "10000010";
					when 7 =>Display5  <= "11111000";
					when 8 =>Display5  <= "10000000";
					when 9 =>Display5  <= "10010000";
			   		when others =>Display5  <= "11000000";
			   								end case;



	end if;
	end if;
	end process;


process(in_16_bit,enable,RAM_CLOCK)
variable SaveInteger  : integer;
variable SaveUnsigned : integer;
variable SaveResto    : integer;
variable aux          : integer;
	begin
	if(rising_edge(RAM_CLOCK)) then
	if enable = '1' then

		SaveUnsigned := resto1 / 1000;
		SaveResto := resto1;
		resto2 <= SaveResto rem 1000;


		case (SaveUnsigned) is

			when 1 =>Display4  <= "11111001";
			when 2 =>Display4  <= "10100100";
			when 3 =>Display4  <= "10110000";
			when 4 =>Display4  <= "10011001";
			when 5 =>Display4  <= "10010010";
			when 6 =>Display4  <= "10000010";
			when 7 =>Display4  <= "11111000";
			when 8 =>Display4  <= "10000000";
			when 9 =>Display4  <= "10010000";
			   when others =>Display4  <= "11000000";
									   end case;
	end if;
	end if;


end process;

process(in_16_bit,enable,RAM_CLOCK)
variable SaveInteger  : integer;
variable SaveUnsigned : integer;
variable SaveResto    : integer;
variable aux          : integer;
	begin
	if(rising_edge(RAM_CLOCK)) then
	if enable = '1' then

		SaveUnsigned := resto2 / 100;
		SaveResto := resto2;
		resto3 <= SaveResto rem 100;


		case (SaveUnsigned) is

			when 1 =>Display3  <= "11111001";
			when 2 =>Display3  <= "10100100";
			when 3 =>Display3  <= "10110000";
			when 4 =>Display3  <= "10011001";
			when 5 =>Display3  <= "10010010";
			when 6 =>Display3  <= "10000010";
			when 7 =>Display3  <= "11111000";
			when 8 =>Display3  <= "10000000";
			when 9 =>Display3  <= "10010000";
			   when others =>Display3  <= "11000000";
									   end case;
	end if;
	end if;


end process;


process(in_16_bit,enable,RAM_CLOCK)
variable SaveInteger  : integer;
variable SaveUnsigned : integer;
variable SaveResto    : integer;
variable aux          : integer;
	begin
	if(rising_edge(RAM_CLOCK)) then
	if enable = '1' then

		SaveUnsigned := resto3 / 10;
		SaveResto := resto3;
		resto4 <= SaveResto rem 10;


		case (SaveUnsigned) is

			when 1 =>Display2  <= "11111001";
			when 2 =>Display2  <= "10100100";
			when 3 =>Display2  <= "10110000";
			when 4 =>Display2  <= "10011001";
			when 5 =>Display2  <= "10010010";
			when 6 =>Display2  <= "10000010";
			when 7 =>Display2  <= "11111000";
			when 8 =>Display2  <= "10000000";
			when 9 =>Display2  <= "10010000";
			   when others =>Display2  <= "11000000";
									   end case;
	end if;
	end if;


end process;


process(in_16_bit,enable,RAM_CLOCK)
variable SaveInteger  : integer;
variable SaveUnsigned : integer;
variable SaveResto    : integer;
variable aux          : integer;
	begin
	if(rising_edge(RAM_CLOCK)) then
	if enable = '1' then

		SaveUnsigned := resto4 / 1;
		SaveResto := resto4;
		resto5 <= SaveResto rem 1;


		case (SaveUnsigned) is

			when 1 =>Display1  <= "11111001";
			when 2 =>Display1  <= "10100100";
			when 3 =>Display1  <= "10110000";
			when 4 =>Display1  <= "10011001";
			when 5 =>Display1  <= "10010010";
			when 6 =>Display1  <= "10000010";
			when 7 =>Display1  <= "11111000";
			when 8 =>Display1  <= "10000000";
			when 9 =>Display1  <= "10010000";
			   when others =>Display1  <= "11000000";
									   end case;
	end if;
	end if;


end process;


process(in_16_bit,enable,RAM_CLOCK)
variable SaveInteger  : integer;
variable sinal : bit;
	begin

	if(rising_edge(RAM_CLOCK)) then
	if enable = '1' then

	SaveInteger := to_integer(in_16_bit);

	if (SaveInteger < 0) then

	sinal := '1';

	case (sinal) is
		when '1' => Display0 <= "11111101";
	 when others => Display0 <= "11111111";
		end case;

	end if;
	end if;
	end if;

end process;


end architecture;
