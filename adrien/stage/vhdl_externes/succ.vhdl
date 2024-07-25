library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package Pkg is
    function succ(v1:std_logic_vector(0 to 9)) return std_logic_vector;
end package;

package body Pkg is
    function succ(v1:std_logic_vector(0 to 9)) return std_logic_vector is
    variable res : signed(0 to 9);
    begin
        res := signed(v1) + 1;
        return std_logic_vector(res);
    end;
end Pkg;
