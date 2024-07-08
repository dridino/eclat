-- This VHDL was converted from Verilog using the
-- Icarus Verilog VHDL Code Generator 11.0 (stable) ()

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Generated from Verilog module spi_controller (spi_controller.v:1)
--   ACT_INACT_CTL = 39
--   BW_RATE = 44
--   DATA_FORMAT = 49
--   IDLE = 0
--   IDLE_MSB = 14
--   INI_NUMBER = 11
--   INT_ENABLE = 46
--   INT_MAP = 47
--   INT_SOURCE = 48
--   POWER_CONTROL = 45
--   READ_MODE = 2
--   SI_DataL = 15
--   SO_DataL = 7
--   THRESH_ACT = 36
--   THRESH_FF = 40
--   THRESH_INACT = 37
--   TIME_FF = 41
--   TIME_INACT = 38
--   TRANSFER = 1
--   WRITE_MODE = 0
--   X_HB = 51
--   X_LB = 50
--   Y_HB = 53
--   Y_LB = 52
--   Z_HB = 55
--   Z_LB = 54
entity spi_controller is
  port (
    SPI_SDIO : inout std_logic;
    iP2S_DATA : in unsigned(15 downto 0);
    iRSTN : in std_logic;
    iSPI_CLK : in std_logic;
    iSPI_CLK_OUT : in std_logic;
    iSPI_GO : in std_logic;
    oS2P_DATA : out unsigned(7 downto 0);
    oSPI_CLK : out std_logic;
    oSPI_CSN : out std_logic;
    oSPI_END : buffer std_logic
  );
end entity; 

-- Generated from Verilog module spi_controller (spi_controller.v:1)
--   ACT_INACT_CTL = 39
--   BW_RATE = 44
--   DATA_FORMAT = 49
--   IDLE = 0
--   IDLE_MSB = 14
--   INI_NUMBER = 11
--   INT_ENABLE = 46
--   INT_MAP = 47
--   INT_SOURCE = 48
--   POWER_CONTROL = 45
--   READ_MODE = 2
--   SI_DataL = 15
--   SO_DataL = 7
--   THRESH_ACT = 36
--   THRESH_FF = 40
--   THRESH_INACT = 37
--   TIME_FF = 41
--   TIME_INACT = 38
--   TRANSFER = 1
--   WRITE_MODE = 0
--   X_HB = 51
--   X_LB = 50
--   Y_HB = 53
--   Y_LB = 52
--   Z_HB = 55
--   Z_LB = 54
architecture from_verilog of spi_controller is
  signal oS2P_DATA_Reg : unsigned(7 downto 0);
  signal tmp_ivl_13 : std_logic;  -- Temporary created at spi_controller.v:46
  signal tmp_ivl_15 : std_logic;  -- Temporary created at spi_controller.v:46
  signal tmp_ivl_17 : std_logic;  -- Temporary created at spi_controller.v:46
  signal tmp_ivl_19 : std_logic;  -- Temporary created at spi_controller.v:46
  signal tmp_ivl_20 : std_logic;  -- Temporary created at spi_controller.v:46
  signal tmp_ivl_8 : std_logic;  -- Temporary created at spi_controller.v:45
  signal read_mode : std_logic;  -- Declared at spi_controller.v:34
  signal spi_count : unsigned(3 downto 0);  -- Declared at spi_controller.v:36
  signal spi_count_en : std_logic;  -- Declared at spi_controller.v:35
  signal write_address : std_logic;  -- Declared at spi_controller.v:34
  
  function Reduce_OR(X : std_logic_vector) return std_logic is
    variable R : std_logic := '0';
  begin
    for I in X'Range loop
      R := X(I) or R;
    end loop;
    return R;
  end function;
begin
  oS2P_DATA <= oS2P_DATA_Reg;
  oSPI_CSN <= not iSPI_GO;
  tmp_ivl_15 <= tmp_ivl_13 or write_address;
  tmp_ivl_17 <= spi_count_en and tmp_ivl_15;
  read_mode <= iP2S_DATA(15);
  write_address <= spi_count(3);
  oSPI_END <= not Reduce_OR(std_logic_vector(spi_count));
  oSPI_CLK <= iSPI_CLK_OUT when spi_count_en = '1' else tmp_ivl_8;
  tmp_ivl_13 <= not read_mode;
  tmp_ivl_19 <= iP2S_DATA(To_Integer(spi_count));
  SPI_SDIO <= tmp_ivl_19 when tmp_ivl_17 = '1' else tmp_ivl_20;
  tmp_ivl_20 <= 'Z';
  tmp_ivl_8 <= '1';
  
  -- Generated from always process in spi_controller (spi_controller.v:48)
  process (iRSTN, iSPI_CLK) is
  begin
    if (not iRSTN) = '1' then
      spi_count_en <= '0';
      spi_count <= X"f";
    elsif rising_edge(iSPI_CLK) then
      if oSPI_END = '1' then
        spi_count_en <= '0';
      else
        if iSPI_GO = '1' then
          spi_count_en <= '1';
        end if;
      end if;
      if (not spi_count_en) = '1' then
        spi_count <= X"f";
      else
        spi_count <= spi_count - X"1";
      end if;
      if (read_mode = '1') and ((not write_address) = '1') then
        oS2P_DATA_Reg <= oS2P_DATA_Reg(0 + 6 downto 0) & SPI_SDIO;
      end if;
    end if;
  end process;
end architecture;

