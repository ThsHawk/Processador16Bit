LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY regDmux is

	port(
			adr      : IN UNSIGNED(3 DOWNTO 0);
			entrada  : IN SIGNED(15 DOWNTO 0);
			saida_01 : OUT SIGNED(15 DOWNTO 0);
			saida_02 : OUT SIGNED(15 DOWNTO 0);
			saida_03 : OUT SIGNED(15 DOWNTO 0);
			saida_04 : OUT SIGNED(15 DOWNTO 0);
			saida_05 : OUT SIGNED(15 DOWNTO 0);
			saida_06 : OUT SIGNED(15 DOWNTO 0);
			saida_07 : OUT SIGNED(15 DOWNTO 0);
			saida_08 : OUT SIGNED(15 DOWNTO 0);
			saida_09 : OUT SIGNED(15 DOWNTO 0);
			saida_10 : OUT SIGNED(15 DOWNTO 0);
			saida_11 : OUT SIGNED(15 DOWNTO 0);
			saida_12 : OUT SIGNED(15 DOWNTO 0);
			saida_13 : OUT SIGNED(15 DOWNTO 0);
			saida_14 : OUT SIGNED(15 DOWNTO 0);
			saida_15 : OUT SIGNED(15 DOWNTO 0)
	);

END regDmux;

architecture dmux of regDmux is

	begin

		saida_01 <= entrada when adr = "0001" else unaffected; --$t0
		saida_02 <= entrada when adr = "0010" else unaffected; --$t1
		saida_03 <= entrada when adr = "0011" else unaffected; --$t2
		saida_04 <= entrada when adr = "0100" else unaffected; --$a0
		saida_05 <= entrada when adr = "0101" else unaffected; --$a1
		saida_06 <= entrada when adr = "0110" else unaffected; --$a2
		saida_07 <= entrada when adr = "0111" else unaffected; --$s0
		saida_08 <= entrada when adr = "1000" else unaffected; --$s1
		saida_09 <= entrada when adr = "1001" else unaffected; --$s2
		saida_10 <= entrada when adr = "1010" else unaffected; --$s3
		saida_11 <= entrada when adr = "1011" else unaffected; --$s4
		saida_12 <= entrada when adr = "1100" else unaffected; --$gp
		saida_13 <= entrada when adr = "1101" else unaffected; --$sp
		saida_14 <= entrada when adr = "1110" else unaffected; --$pc
		saida_15 <= entrada when adr = "1111" else unaffected; --$ra

	end architecture;
