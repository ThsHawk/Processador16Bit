LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY regMux is

	port(
			adr        : IN UNSIGNED(3 DOWNTO 0);
			entrada_01 : IN SIGNED(15 DOWNTO 0);
			entrada_02 : IN SIGNED(15 DOWNTO 0);
			entrada_03 : IN SIGNED(15 DOWNTO 0);
			entrada_04 : IN SIGNED(15 DOWNTO 0);
			entrada_05 : IN SIGNED(15 DOWNTO 0);
			entrada_06 : IN SIGNED(15 DOWNTO 0);
			entrada_07 : IN SIGNED(15 DOWNTO 0);
			entrada_08 : IN SIGNED(15 DOWNTO 0);
			entrada_09 : IN SIGNED(15 DOWNTO 0);
			entrada_10 : IN SIGNED(15 DOWNTO 0);
			entrada_11 : IN SIGNED(15 DOWNTO 0);
			entrada_12 : IN SIGNED(15 DOWNTO 0);
			entrada_13 : IN SIGNED(15 DOWNTO 0);
			entrada_14 : IN SIGNED(15 DOWNTO 0);
			entrada_15 : IN SIGNED(15 DOWNTO 0);
			saida      : OUT SIGNED(15 DOWNTO 0)
	);

END regMux;

architecture mux of regMux is

	constant zero : SIGNED(15 DOWNTO 0) := "0000000000000000";

begin

	with adr select

		saida <= entrada_01 when "0001", --$t0
		         entrada_02 when "0010", --$t1
		         entrada_03 when "0011", --$t2
		         entrada_04 when "0100", --$a0
		         entrada_05 when "0101", --$a1
		         entrada_06 when "0110", --$a2
		         entrada_07 when "0111", --$s0
		         entrada_08 when "1000", --$s1
		         entrada_09 when "1001", --$s2
		         entrada_10 when "1010", --$s3
		         entrada_11 when "1011", --$s4
		         entrada_12 when "1100", --$gp
		         entrada_13 when "1101", --$sp
		         entrada_14 when "1110", --$pc
		         entrada_15 when "1111", --$ra
						 zero       when others; --$zero

end mux;
