-- code generated from the following source code:
--   ../ocaml-vm/vm/target-specific/intel-max10/IOs.ecl
--   ../../adrien/stage/vga/pong_v7.ecl
--
-- with the following command:
--
--    ./eclat ../ocaml-vm/vm/target-specific/intel-max10/IOs.ecl ../../adrien/stage/vga/pong_v7.ecl -intel-max10

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.runtime.all;


entity top is
  port (signal MAX10_CLK1_50 : in std_logic;
        signal SW : in std_logic_vector(0 to 9);
        signal KEY : in std_logic_vector(0 to 1);
        signal GSENSOR_INT : in std_logic_vector(2 downto 1);
        signal LEDR : out std_logic_vector(0 to 9);
        signal HEX0 : out std_logic_vector(0 to 7);
        signal HEX1 : out std_logic_vector(0 to 7);
        signal HEX2 : out std_logic_vector(0 to 7);
        signal HEX3 : out std_logic_vector(0 to 7);
        signal HEX4 : out std_logic_vector(0 to 7);
        signal HEX5 : out std_logic_vector(0 to 7);
        signal GSENSOR_CS_N : out std_logic;
        signal GSENSOR_SCLK : out std_logic;
        signal VGA_HS : out std_logic;
        signal VGA_VS : out std_logic;
        signal VGA_R : out std_logic_vector(0 to 3);
        signal VGA_G : out std_logic_vector(0 to 3);
        signal VGA_B : out std_logic_vector(0 to 3);
        signal GSENSOR_SDO : inout std_logic;
        signal GSENSOR_SDI : inout std_logic
  );
end entity;

architecture rtl of top is

    component main is
        port (signal clk : in std_logic;
              signal run : in std_logic;
              signal reset : in std_logic;
              signal rdy : out value(0 to 0);
              signal argument : in value(0 to 15);
              signal result : out value(0 to 75)
        );
    end component;
    signal RST : std_logic := '1';
    signal argument : value(0 to 15);
    signal result : value(0 to 75);
    signal ready : value (0 to 0);
    begin
        process (MAX10_CLK1_50)
            begin
            if (rising_edge(MAX10_CLK1_50)) then
                if RST = '1' then
                    RST <= '0';
                end if;
            end if;
        end process;
argument <= SW & KEY & GSENSOR_INT & GSENSOR_SDO & GSENSOR_SDI;
main_CC : component main
        port map (clk => MAX10_CLK1_50,
                  run => '1',
                  reset => RST,
                  rdy => ready,
                  argument => argument,
                  result => result
                  );
LEDR <= result(0 to 9);
HEX0 <= result(10 to 17);
HEX1 <= result(18 to 25);
HEX2 <= result(26 to 33);
HEX3 <= result(34 to 41);
HEX4 <= result(42 to 49);
HEX5 <= result(50 to 57);
GSENSOR_CS_N <= result(58);
GSENSOR_SCLK <= result(59);
VGA_HS <= result(60);
VGA_VS <= result(61);
VGA_R <= result(62 to 65);
VGA_G <= result(66 to 69);
VGA_B <= result(70 to 73);
GSENSOR_SDO <= result(74);
GSENSOR_SDI <= result(75);

end architecture;

