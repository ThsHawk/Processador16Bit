LIBRARY IEEE;
LIBRARY IEEE;
use IEEE.std_logic_1164.all;

PACKAGE alu_pkg IS

	function sum (input_01, input_02 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
	function sub (input_01, input_02 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;

END;

PACKAGE BODY alu_pkg IS

	function sum (input_01, input_02 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is

		-- Recebera a saida de cada sum
		VARIABLE sum : STD_LOGIC_VECTOR(15 DOWNTO 0);
		-- Recebera o carry de cada sum
		VARIABLE carry	  : STD_LOGIC;

	begin

		-- half adder
		sum(0) := input_01(0) XOR input_02(0);
		carry := input_01(0) AND input_02(0);
		-- full-adder
		sum(1) := input_01(1) XOR input_02(1) XOR carry;
		carry := (input_01(1) AND input_02(1)) OR ((input_01(1) XOR input_02(1)) AND carry);
		-- full-adder
		sum(2) := input_01(2) XOR input_02(2) XOR carry;
		carry := (input_01(2) AND input_02(2)) OR ((input_01(2) XOR input_02(2)) AND carry);
		-- full-adder
		sum(3) := input_01(3) XOR input_02(3) XOR carry;
		carry := (input_01(3) AND input_02(3)) OR ((input_01(3) XOR input_02(3)) AND carry);
		-- full-adder
		sum(4) := input_01(4) XOR input_02(4) XOR carry;
		carry := (input_01(4) AND input_02(4)) OR ((input_01(4) XOR input_02(4)) AND carry);
		-- full-adder
		sum(5) := input_01(5) XOR input_02(5) XOR carry;
		carry := (input_01(5) AND input_02(5)) OR ((input_01(5) XOR input_02(5)) AND carry);
		-- full-adder
		sum(6) := input_01(6) XOR input_02(6) XOR carry;
		carry := (input_01(6) AND input_02(6)) OR ((input_01(6) XOR input_02(6)) AND carry);
		-- full-adder
		sum(7) := input_01(7) XOR input_02(7) XOR carry;
		carry := (input_01(7) AND input_02(7)) OR ((input_01(7) XOR input_02(7)) AND carry);
		-- full-adder
		sum(8) := input_01(8) XOR input_02(8) XOR carry;
		carry := (input_01(8) AND input_02(8)) OR ((input_01(8) XOR input_02(8)) AND carry);
		-- full-adder
		sum(9) := input_01(9) XOR input_02(9) XOR carry;
		carry := (input_01(9) AND input_02(9)) OR ((input_01(9) XOR input_02(9)) AND carry);
		-- full-adder
		sum(10) := input_01(10) XOR input_02(10) XOR carry;
		carry := (input_01(10) AND input_02(10)) OR ((input_01(10) XOR input_02(10)) AND carry);
		-- full-adder
		sum(11) := input_01(11) XOR input_02(11) XOR carry;
		carry := (input_01(11) AND input_02(11)) OR ((input_01(11) XOR input_02(11)) AND carry);
		-- full-adder
		sum(12) := input_01(12) XOR input_02(12) XOR carry;
		carry := (input_01(12) AND input_02(12)) OR ((input_01(12) XOR input_02(12)) AND carry);
		-- full-adder
		sum(13) := input_01(13) XOR input_02(13) XOR carry;
		carry := (input_01(13) AND input_02(13)) OR ((input_01(13) XOR input_02(13)) AND carry);
		-- full-adder
		sum(14) := input_01(14) XOR input_02(14) XOR carry;
		carry := (input_01(14) AND input_02(14)) OR ((input_01(14) XOR input_02(14)) AND carry);
		-- full-adder
		sum(15) := input_01(15) XOR input_02(15) XOR carry;
		carry := (input_01(15) AND input_02(15)) OR ((input_01(15) XOR input_02(15)) AND carry);

		return sum;

	end function;

	function sub (input_01, input_02 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is

		VARIABLE sub    : STD_LOGIC_VECTOR(15 DOWNTO 0);
		VARIABLE Borrow	: STD_LOGIC;

	begin

		sub(0) := input_01(0) xor input_02(0);
		Borrow := ((not input_01(0)) and input_02(0));

		sub(1) := (input_01(1) xor input_02(1)) xor Borrow;
		Borrow := ((not input_01(1)) and (input_02(1) or Borrow)) or (input_02(1) and Borrow);

		sub(2) := (input_01(2) xor input_02(2)) xor Borrow;
		Borrow := ((not input_01(2)) and (input_02(2) or Borrow)) or (input_02(2) and Borrow);

		sub(3) := (input_01(3) xor input_02(3)) xor Borrow;
		Borrow := ((not input_01(3)) and (input_02(3) or Borrow)) or (input_02(3) and Borrow);

		sub(4) := (input_01(4) xor input_02(4)) xor Borrow;
		Borrow := ((not input_01(4)) and (input_02(4) or Borrow)) or (input_02(4) and Borrow);

		sub(5) := (input_01(5) xor input_02(5)) xor Borrow;
		Borrow := ((not input_01(5)) and (input_02(5) or Borrow)) or (input_02(5) and Borrow);

		sub(6) := (input_01(6) xor input_02(6)) xor Borrow;
		Borrow := ((not input_01(6)) and (input_02(6) or Borrow)) or (input_02(6) and Borrow);

		sub(7) := (input_01(7) xor input_02(7)) xor Borrow;
		Borrow := ((not input_01(7)) and (input_02(7) or Borrow)) or (input_02(7) and Borrow);

		sub(8) := (input_01(8) xor input_02(8)) xor Borrow;
		Borrow := ((not input_01(8)) and (input_02(8) or Borrow)) or (input_02(8) and Borrow);

		sub(9) := (input_01(9) xor input_02(9)) xor Borrow;
		Borrow := ((not input_01(9)) and (input_02(9) or Borrow)) or (input_02(9) and Borrow);

		sub(10) := (input_01(10) xor input_02(10)) xor Borrow;
		Borrow := ((not input_01(10)) and (input_02(10) or Borrow)) or (input_02(10) and Borrow);

		sub(11) := (input_01(11) xor input_02(11)) xor Borrow;
		Borrow := ((not input_01(11)) and (input_02(11) or Borrow)) or (input_02(11) and Borrow);

		sub(12) := (input_01(12) xor input_02(12)) xor Borrow;
		Borrow := ((not input_01(12)) and (input_02(12) or Borrow)) or (input_02(12) and Borrow);

		sub(13) := (input_01(13) xor input_02(13)) xor Borrow;
		Borrow := ((not input_01(13)) and (input_02(13) or Borrow)) or (input_02(13) and Borrow);

		sub(14) := (input_01(14) xor input_02(14)) xor Borrow;
		Borrow := ((not input_01(14)) and (input_02(14) or Borrow)) or (input_02(14) and Borrow);

		sub(15) := (input_01(15) xor input_02(15)) xor Borrow;
		Borrow := ((not input_01(15)) and (input_02(15) or Borrow)) or (input_02(15) and Borrow);

		return sub;

	end function;

END PACKAGE BODY;
