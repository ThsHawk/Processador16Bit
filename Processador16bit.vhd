LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY Processador16bit is

	port(
			clk        : IN STD_LOGIC;
			opcode     : IN UNSIGNED(3 DOWNTO 0);
			section_02 : IN UNSIGNED(3 DOWNTO 0);
			section_03 : IN UNSIGNED(3 DOWNTO 0);
			section_04 : IN UNSIGNED(3 DOWNTO 0);
			saida      : OUT SIGNED(15 DOWNTO 0)
	);

END Processador16bit;

architecture processador of Processador16bit is

  COMPONENT regBank is

  	port(
  			clk        : IN STD_LOGIC;
  			reg_soure  : IN UNSIGNED(3 DOWNTO 0);
  			reg_temp   : IN UNSIGNED(3 DOWNTO 0);
  			reg_dest   : IN UNSIGNED(3 DOWNTO 0);
  			saida_reg1 : OUT SIGNED(15 DOWNTO 0);
  			saida_reg2 : OUT SIGNED(15 DOWNTO 0);
  			writeback  : IN SIGNED(15 DOWNTO 0)
  	);

  END COMPONENT regBank;

  COMPONENT alu is

  	port(
  			funct     : IN UNSIGNED(2 DOWNTO 0);
  			input_01  : IN SIGNED(15 DOWNTO 0);
  			input_02  : IN SIGNED(15 DOWNTO 0);
  			equal     : OUT BIT;
  			output_01 : OUT SIGNED(15 DOWNTO 0)
  	);

  END COMPONENT alu;

  COMPONENT control is

  	port(
  			opcode              : IN UNSIGNED(3 DOWNTO 0);
  			ctrl_alu            : OUT UNSIGNED(2 DOWNTO 0);
  			--ctrl_input_02       : OUT BIT;
  			ctrl_signalExtend   : OUT BIT;
  			--ctrl_regBank       : OUT SIGNED(15 DOWNTO 0);
				--ctrl_mux_reg_dest   : OUT UNSIGNED(1 DOWNTO 0);
  			ctrl_section_02Dmux : OUT BIT;
  			ctrl_section_03Dmux : OUT UNSIGNED(1 DOWNTO 0);
  			ctrl_section_04Dmux : OUT BIT
  	);

  END COMPONENT control;

  COMPONENT dmux_1to2 is

  	port(
  			ctrl     : IN BIT;
  			entrada  : IN UNSIGNED(3 DOWNTO 0);
  			saida_01 : OUT UNSIGNED(3 DOWNTO 0);
  			saida_02 : OUT UNSIGNED(3 DOWNTO 0)
  	);

  END COMPONENT dmux_1to2;

  COMPONENT dmux_1to3 is

  	port(
  			ctrl     : IN UNSIGNED(1 DOWNTO 0);
  			entrada  : IN UNSIGNED(3 DOWNTO 0);
  			saida_01 : OUT UNSIGNED(3 DOWNTO 0);
  			saida_02 : OUT UNSIGNED(3 DOWNTO 0);
				saida_03 : OUT UNSIGNED(3 DOWNTO 0)
  	);

  END COMPONENT dmux_1to3;

  COMPONENT input_02Mux is

  	port(
  			ctrl       : IN BIT;
  			entrada_01 : IN SIGNED(15 DOWNTO 0);
  			entrada_02 : IN SIGNED(15 DOWNTO 0);
  			saida      : OUT SIGNED(15 DOWNTO 0)
  	);

  END COMPONENT input_02Mux;

	COMPONENT mux_3to1x4 is

		port(
				ctrl       : IN UNSIGNED(1 DOWNTO 0);
				entrada_01 : IN UNSIGNED(3 DOWNTO 0);
				entrada_02 : IN UNSIGNED(3 DOWNTO 0);
				entrada_03 : IN UNSIGNED(3 DOWNTO 0);
				saida      : OUT UNSIGNED(3 DOWNTO 0)
		);

	END COMPONENT;

	COMPONENT signalExtend is

		port(
				ctrl       : IN BIT;
				section_03 : IN UNSIGNED(3 DOWNTO 0);
				section_04 : IN UNSIGNED(3 DOWNTO 0);
				saida      : OUT SIGNED(15 DOWNTO 0)
		);

	END COMPONENT;

  signal signal_ctrl_alu            : UNSIGNED(2 DOWNTO 0);
  --signal signal_ctrl_input_02       : BIT;
	signal signal_ctrl_signalExtend   : BIT;
  signal signal_ctrl_section_02Dmux : BIT;
  signal signal_ctrl_section_03Dmux : UNSIGNED(1 DOWNTO 0);
  signal signal_ctrl_section_04Dmux : BIT;
	--signal signal_ctrl_mux_reg_dest   : UNSIGNED(1 DOWNTO 0);
  signal signal_reg_soure           : UNSIGNED(3 DOWNTO 0);
  signal signal_reg_temp            : UNSIGNED(3 DOWNTO 0);
  signal signal_reg_dest            : UNSIGNED(3 DOWNTO 0);
  signal signal_writeback           : SIGNED(15 DOWNTO 0);
  signal signal_in1_alu             : SIGNED(15 DOWNTO 0);
  signal signal_saida_regBank2      : SIGNED(15 DOWNTO 0);
  signal signal_in2_alu             : SIGNED(15 DOWNTO 0);
	signal signal_4bit_section03      : UNSIGNED(3 DOWNTO 0);
	signal signal_4bit_section04      : UNSIGNED(3 DOWNTO 0);
	signal signal_sigExt_out          : SIGNED(15 DOWNTO 0);
	signal signal_equal               : BIT;
	signal reg_dest_I_type            : UNSIGNED(3 DOWNTO 0);
	signal reg_dest_J_type            : UNSIGNED(3 DOWNTO 0);
	signal reg_dest_R_type            : UNSIGNED(3 DOWNTO 0);

begin

  ctrl : control port map(opcode              => opcode,
													ctrl_alu            => signal_ctrl_alu,
													ctrl_signalExtend   => signal_ctrl_signalExtend,
													ctrl_section_02Dmux => signal_ctrl_section_02Dmux,
													ctrl_section_03Dmux => signal_ctrl_section_03Dmux,
													ctrl_section_04Dmux => signal_ctrl_section_04Dmux
													);

  dmux_section02 : dmux_1to2 port map(ctrl     => signal_ctrl_section_02Dmux,
																			entrada  => section_02,
																			saida_01 => signal_reg_soure,
																			saida_02 => reg_dest_J_type
																			);

	dmux_section03 : dmux_1to3 port map(ctrl     => signal_ctrl_section_03Dmux,
																			entrada  => section_03,
																			saida_01 => signal_reg_temp,
																			saida_02 => reg_dest_I_type,
																			saida_03 => signal_4bit_section03
																			);

	dmux_section04 : dmux_1to2 port map(ctrl     => signal_ctrl_section_04Dmux,
																			entrada  => section_04,
																			saida_01 => reg_dest_R_type,
																			saida_02 => signal_4bit_section04
																			);

  regs : regBank port map(clk        => clk,
													reg_soure  => signal_reg_soure,
													reg_temp   => signal_reg_temp,
													reg_dest   => signal_reg_dest,
													saida_reg1 => signal_in1_alu,
													saida_reg2 => signal_saida_regBank2,
													writeback  => signal_writeback
													);

  mux_alu : input_02Mux port map(ctrl       => signal_ctrl_section_04Dmux,
																 entrada_01 => signal_saida_regBank2,
																 entrada_02 => signal_sigExt_out,
																 saida      => signal_in2_alu
																 );

  math : alu port map(funct     => signal_ctrl_alu,
											input_01  => signal_in1_alu,
											input_02  => signal_in2_alu,
											equal     => signal_equal,
											output_01 => signal_writeback
											);

  regdestMux : mux_3to1x4 port map(ctrl       => signal_ctrl_section_03Dmux,
																	 entrada_01 => reg_dest_J_type,
																	 entrada_02 => reg_dest_I_type,
																	 entrada_03 => reg_dest_R_type,
																	 saida      => signal_reg_dest
																	 );

	extender : signalExtend port map(ctrl       => signal_ctrl_signalExtend,
																 	 section_03 => signal_4bit_section03,
																	 section_04 => signal_4bit_section04,
																	 saida      => signal_sigExt_out
																	 );

  saida <= signal_writeback;

end architecture;
