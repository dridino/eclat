library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package ex1 is
	function ex_or(v1:std_logic_vector(0 to 0); v2:std_logic_vector(0 to 0)) return std_logic_vector;
	function ex_add(v1:signed(0 to 9); v2:signed(0 to 9)) return signed;
	function ex_unit return std_logic;
end package;

package body ex1 is
	function ex_or(v1:std_logic_vector(0 to 0); v2:std_logic_vector(0 to 0)) return std_logic_vector is
	begin
		return (0 => v1(0) or v2(0));
	end;

	function ex_add(v1:signed(0 to 9); v2:signed(0 to 9)) return signed is
	begin
		return v1 + v2;
	end;

	function ex_unit return std_logic is
	begin
		return '1';
	end;
end ex1;
