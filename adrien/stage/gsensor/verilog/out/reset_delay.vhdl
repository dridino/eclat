-- This VHDL was converted from Verilog using the
-- Icarus Verilog VHDL Code Generator 11.0 (stable) ()

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Generated from Verilog module reset_delay (reset_delay.v:1)
entity reset_delay is
  port (
    iCLK : in std_logic;
    iRSTN : in std_logic;
    oRST : out std_logic
  );
end entity; 

-- Generated from Verilog module reset_delay (reset_delay.v:1)
architecture from_verilog of reset_delay is
  signal oRST_Reg : std_logic;
  signal cont : unsigned(20 downto 0);  -- Declared at reset_delay.v:6
begin
  oRST <= oRST_Reg;
  
  -- Generated from always process in reset_delay (reset_delay.v:8)
  process (iCLK, iRSTN) is
  begin
    if (not iRSTN) = '1' then
      cont <= "000000000000000000000";
      oRST_Reg <= '1';
    elsif rising_edge(iCLK) then
      if (not cont(20)) = '1' then
        cont <= cont + "000000000000000000001";
        oRST_Reg <= '1';
      else
        oRST_Reg <= '0';
      end if;
    end if;
  end process;
end architecture;

