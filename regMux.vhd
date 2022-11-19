LIBRARY IEEE;
use IEEE.std_logic_1164.all;

ENTITY regMux is

	port(
			adr        : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			entrada_01 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			entrada_02 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			entrada_03 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			entrada_04 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			entrada_05 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			entrada_06 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			entrada_07 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			entrada_08 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			entrada_09 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			entrada_10 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			entrada_11 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			entrada_12 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			entrada_13 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			entrada_14 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			entrada_15 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			saida      : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);

END regMux;

architecture mux of regMux is

begin

	with adr select

		saida <= entrada_01 when "0001", --$t0
		         entrada_02 when "0010", --$t1
		         entrada_03 when "0011", --$t2
		         entrada_03 when "0100", --$a0
		         entrada_03 when "0101", --$a1
		         entrada_03 when "0110", --$a2
		         entrada_03 when "0111", --$s0
		         entrada_03 when "1000", --$s1
		         entrada_03 when "1001", --$s2
		         entrada_03 when "1010", --$s3
		         entrada_03 when "1011", --$s4
		         entrada_03 when "1100", --$gp
		         entrada_03 when "1101", --$sp
		         entrada_03 when "1110", --$pc
		         entrada_03 when "1111", --$ra
						 unaffected when others;
						 --"0000000000000000" when "0000"; --$zero

end architecture;
