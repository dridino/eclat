-- code generated from the following source code:
--   ../examples/counter.ecl
--
-- with the following command:
--
--    ./eclat ../examples/counter.ecl -main=counter -top=i:1|o:32 -arg=false;false;false;true;true;false;false

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.runtime.all;


entity top is
  port (signal clk : in std_logic;
        signal i : in std_logic;
        signal o : out std_logic_vector(0 to 31)
  );
end entity;

architecture rtl of top is

    component main is
        port (signal clk : in std_logic;
              signal run : in std_logic;
              signal reset : in std_logic;
              signal rdy : out value(0 to 0);
              signal argument : in value(0 to 0);
              signal result : out value(0 to 31)
        );
    end component;
    signal RST : std_logic := '1';
    signal argument : value(0 to 0);
    signal result : value(0 to 31);
    signal ready : value (0 to 0);
    begin
        process (clk)
            begin
            if (rising_edge(clk)) then
                if RST = '1' then
                    RST <= '0';
                end if;
            end if;
        end process;
argument <= "" & i;
main_CC : component main
        port map (clk => clk,
                  run => '1',
                  reset => RST,
                  rdy => ready,
                  argument => argument,
                  result => result
                  );
o <= result(0 to 31);

end architecture;

