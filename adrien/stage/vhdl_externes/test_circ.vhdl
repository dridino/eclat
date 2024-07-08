library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity test_circ1 is
  port (signal clk : in std_logic;
        signal reset : in std_logic;
        signal argument : in std_logic_vector(0 to 9);
        signal result : out std_logic_vector(0 to 9)
  );
end entity;

architecture rtl of test_circ1 is
    begin
        result <= argument(1 to 9) & "0";
end architecture;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity test_circ2 is
  port (signal clk : in std_logic;
        signal reset : in std_logic;
        signal argument : in std_logic_vector(0 to 9);
        signal result : out std_logic_vector(0 to 9)
  );
end entity;

architecture rtl of test_circ2 is
    begin
        result <= argument(0 to 8) & "0";
end architecture;
