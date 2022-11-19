LIBRARY IEEE;
use IEEE.std_logic_1164.all;

ENTITY regBank is

	port(
			clk        : IN STD_LOGIC;
			reg_soure  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			reg_temp   : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			reg_dest   : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			saida_reg1 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			saida_reg2 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			writeback  : IN STD_LOGIC_VECTOR(15 DOWNTO 0)
	);

END regBank;

architecture bank of regBank is

	COMPONENT registrador is

		port(
				clk     : IN STD_LOGIC;
				entrada : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
				saida   : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
		);

	END COMPONENT;

	COMPONENT regMux is

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

	END COMPONENT;

	COMPONENT regDmux is

		port(
				adr      : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				entrada  : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
				saida_01 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
				saida_02 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
				saida_03 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
				saida_04 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
				saida_05 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
				saida_06 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
				saida_07 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
				saida_08 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
				saida_09 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
				saida_10 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
				saida_11 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
				saida_12 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
				saida_13 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
				saida_14 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
				saida_15 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
		);

	END COMPONENT;

	signal in_reg_01  : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal in_reg_02  : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal in_reg_03  : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal in_reg_04  : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal in_reg_05  : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal in_reg_06  : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal in_reg_07  : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal in_reg_08  : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal in_reg_09  : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal in_reg_10  : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal in_reg_11  : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal in_reg_12  : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal in_reg_13  : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal in_reg_14  : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal in_reg_15  : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal out_reg_01 : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal out_reg_02 : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal out_reg_03 : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal out_reg_04 : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal out_reg_05 : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal out_reg_06 : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal out_reg_07 : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal out_reg_08 : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal out_reg_09 : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal out_reg_10 : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal out_reg_11 : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal out_reg_12 : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal out_reg_13 : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal out_reg_14 : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal out_reg_15 : STD_LOGIC_VECTOR(15 DOWNTO 0);

begin

	mux_source: regMux port map(adr        => reg_soure,
	                            entrada_01 => out_reg_01,
															entrada_02 => out_reg_02,
															entrada_03 => out_reg_03,
															entrada_04 => out_reg_04,
															entrada_05 => out_reg_05,
															entrada_06 => out_reg_06,
															entrada_07 => out_reg_07,
															entrada_08 => out_reg_08,
															entrada_09 => out_reg_09,
															entrada_10 => out_reg_10,
															entrada_11 => out_reg_11,
															entrada_12 => out_reg_12,
															entrada_13 => out_reg_13,
															entrada_14 => out_reg_14,
															entrada_15 => out_reg_15,
															saida      => saida_reg1
															);

	mux_temp: regMux port map(adr        => reg_temp,
														entrada_01 => out_reg_01,
														entrada_02 => out_reg_02,
														entrada_03 => out_reg_03,
														entrada_04 => out_reg_04,
														entrada_05 => out_reg_05,
														entrada_06 => out_reg_06,
														entrada_07 => out_reg_07,
														entrada_08 => out_reg_08,
														entrada_09 => out_reg_09,
														entrada_10 => out_reg_10,
														entrada_11 => out_reg_11,
														entrada_12 => out_reg_12,
														entrada_13 => out_reg_13,
														entrada_14 => out_reg_14,
														entrada_15 => out_reg_15,
														saida      => saida_reg2
														);

	mux_dest: regDmux port map(adr      => reg_dest,
	                           entrada  => writeback,
														 saida_01 => in_reg_01,
														 saida_02 => in_reg_02,
														 saida_03 => in_reg_03,
														 saida_04 => in_reg_04,
														 saida_05 => in_reg_05,
														 saida_06 => in_reg_06,
														 saida_07 => in_reg_07,
														 saida_08 => in_reg_08,
														 saida_09 => in_reg_09,
														 saida_10 => in_reg_10,
														 saida_11 => in_reg_11,
														 saida_12 => in_reg_12,
														 saida_13 => in_reg_13,
														 saida_14 => in_reg_14,
														 saida_15 => in_reg_15
														 );

  reg_01 : registrador port map(clk     => clk,
	                              entrada => in_reg_01,
																saida   => out_reg_01
																);

  reg_02 : registrador port map(clk     => clk,
	                              entrada => in_reg_02,
																saida   => out_reg_02
																);

  reg_03 : registrador port map(clk     => clk,
	                              entrada => in_reg_03,
																saida   => out_reg_03
																);

  reg_04 : registrador port map(clk     => clk,
	                              entrada => in_reg_04,
																saida   => out_reg_04
																);

  reg_05 : registrador port map(clk     => clk,
	                              entrada => in_reg_05,
																saida   => out_reg_05
																);

  reg_06 : registrador port map(clk     => clk,
	                              entrada => in_reg_06,
																saida   => out_reg_06
																);

  reg_07 : registrador port map(clk     => clk,
	                              entrada => in_reg_07,
																saida   => out_reg_07
																);

  reg_08 : registrador port map(clk     => clk,
	                              entrada => in_reg_08,
																saida   => out_reg_08
																);

  reg_09 : registrador port map(clk     => clk,
	                              entrada => in_reg_09,
																saida   => out_reg_09
																);

  reg_10 : registrador port map(clk     => clk,
	                              entrada => in_reg_10,
																saida   => out_reg_10
																);

  reg_11 : registrador port map(clk     => clk,
	                              entrada => in_reg_11,
																saida   => out_reg_11
																);

  reg_12 : registrador port map(clk     => clk,
	                              entrada => in_reg_12,
																saida   => out_reg_12
																);

  reg_13 : registrador port map(clk     => clk,
	                              entrada => in_reg_13,
																saida   => out_reg_13
																);

  reg_14 : registrador port map(clk     => clk,
	                              entrada => in_reg_14,
																saida   => out_reg_14
																);

  reg_15 : registrador port map(clk     => clk,
	                              entrada => in_reg_15,
																saida   => out_reg_15
																);

end architecture;
