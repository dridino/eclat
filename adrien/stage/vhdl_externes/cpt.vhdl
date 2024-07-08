library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity cpt is
  port (signal clk : in std_logic;
        signal reset : in std_logic;
        signal start : in std_logic;
        signal argument : in std_logic_vector(0 to 0);
        signal result : out std_logic_vector(0 to 7)
  );
end entity;

architecture rtl of cpt is
    signal c : signed(0 to 7) := (others => '0');
    begin
        process(clk,start) is begin
            if rising_edge(clk) and start = '1' then
                c <= c + 1;
            end if;
            result <= std_logic_vector(c);
        end process;
end architecture;