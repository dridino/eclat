-- This VHDL was converted from Verilog using the
-- Icarus Verilog VHDL Code Generator 11.0 (stable) ()

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Generated from Verilog module led_driver (led_driver.v:1)
entity led_driver is
  port (
    iCLK : in std_logic;
    iDIG : in unsigned(9 downto 0);
    iG_INT2 : in std_logic;
    iRSTN : in std_logic;
    oLED : out unsigned(9 downto 0)
  );
end entity; 

-- Generated from Verilog module led_driver (led_driver.v:1)
architecture from_verilog of led_driver is
  signal tmp_ivl_1 : unsigned(4 downto 0);  -- Temporary created at led_driver.v:21
  signal tmp_ivl_10 : unsigned(4 downto 0);  -- Temporary created at led_driver.v:22
  signal tmp_ivl_100 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:51
  signal tmp_ivl_102 : unsigned(3 downto 0);  -- Temporary created at led_driver.v:52
  signal tmp_ivl_104 : std_logic;  -- Temporary created at led_driver.v:52
  signal tmp_ivl_106 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:52
  signal tmp_ivl_108 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:52
  signal tmp_ivl_110 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:52
  signal tmp_ivl_112 : unsigned(3 downto 0);  -- Temporary created at led_driver.v:53
  signal tmp_ivl_114 : std_logic;  -- Temporary created at led_driver.v:53
  signal tmp_ivl_116 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:53
  signal tmp_ivl_118 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:53
  signal tmp_ivl_120 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:53
  signal tmp_ivl_122 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:54
  signal tmp_ivl_124 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:54
  signal tmp_ivl_126 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:54
  signal tmp_ivl_128 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:53
  signal tmp_ivl_13 : std_logic;  -- Temporary created at led_driver.v:22
  signal tmp_ivl_130 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:52
  signal tmp_ivl_132 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:51
  signal tmp_ivl_134 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:50
  signal tmp_ivl_136 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:49
  signal tmp_ivl_138 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:48
  signal tmp_ivl_14 : unsigned(4 downto 0);  -- Temporary created at led_driver.v:22
  signal tmp_ivl_140 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:47
  signal tmp_ivl_142 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:46
  signal tmp_ivl_144 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:45
  signal tmp_ivl_147 : std_logic;  -- Temporary created at led_driver.v:55
  signal tmp_ivl_148 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:55
  signal tmp_ivl_150 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:55
  signal tmp_ivl_152 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:55
  signal tmp_ivl_17 : unsigned(4 downto 0);  -- Temporary created at led_driver.v:22
  signal tmp_ivl_18 : unsigned(4 downto 0);  -- Temporary created at led_driver.v:22
  signal tmp_ivl_20 : unsigned(4 downto 0);  -- Temporary created at led_driver.v:22
  signal tmp_ivl_27 : unsigned(3 downto 0);  -- Temporary created at led_driver.v:24
  signal tmp_ivl_28 : unsigned(3 downto 0);  -- Temporary created at led_driver.v:24
  signal tmp_ivl_3 : std_logic;  -- Temporary created at led_driver.v:22
  signal tmp_ivl_31 : unsigned(3 downto 0);  -- Temporary created at led_driver.v:24
  signal tmp_ivl_35 : std_logic;  -- Temporary created at led_driver.v:45
  signal tmp_ivl_36 : unsigned(3 downto 0);  -- Temporary created at led_driver.v:45
  signal tmp_ivl_38 : std_logic;  -- Temporary created at led_driver.v:45
  signal tmp_ivl_40 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:45
  signal tmp_ivl_42 : unsigned(3 downto 0);  -- Temporary created at led_driver.v:46
  signal tmp_ivl_44 : std_logic;  -- Temporary created at led_driver.v:46
  signal tmp_ivl_46 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:46
  signal tmp_ivl_48 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:46
  signal tmp_ivl_5 : std_logic;  -- Temporary created at led_driver.v:22
  signal tmp_ivl_50 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:46
  signal tmp_ivl_52 : unsigned(3 downto 0);  -- Temporary created at led_driver.v:47
  signal tmp_ivl_54 : std_logic;  -- Temporary created at led_driver.v:47
  signal tmp_ivl_56 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:47
  signal tmp_ivl_58 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:47
  signal tmp_ivl_60 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:47
  signal tmp_ivl_62 : unsigned(3 downto 0);  -- Temporary created at led_driver.v:48
  signal tmp_ivl_64 : std_logic;  -- Temporary created at led_driver.v:48
  signal tmp_ivl_66 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:48
  signal tmp_ivl_68 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:48
  signal tmp_ivl_7 : unsigned(4 downto 0);  -- Temporary created at led_driver.v:22
  signal tmp_ivl_70 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:48
  signal tmp_ivl_72 : unsigned(3 downto 0);  -- Temporary created at led_driver.v:49
  signal tmp_ivl_74 : std_logic;  -- Temporary created at led_driver.v:49
  signal tmp_ivl_76 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:49
  signal tmp_ivl_78 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:49
  signal tmp_ivl_8 : unsigned(4 downto 0);  -- Temporary created at led_driver.v:22
  signal tmp_ivl_80 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:49
  signal tmp_ivl_82 : unsigned(3 downto 0);  -- Temporary created at led_driver.v:50
  signal tmp_ivl_84 : std_logic;  -- Temporary created at led_driver.v:50
  signal tmp_ivl_86 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:50
  signal tmp_ivl_88 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:50
  signal tmp_ivl_90 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:50
  signal tmp_ivl_92 : unsigned(3 downto 0);  -- Temporary created at led_driver.v:51
  signal tmp_ivl_94 : std_logic;  -- Temporary created at led_driver.v:51
  signal tmp_ivl_96 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:51
  signal tmp_ivl_98 : unsigned(9 downto 0);  -- Temporary created at led_driver.v:51
  signal abs_select_high : unsigned(3 downto 0);  -- Declared at led_driver.v:13
  signal int2_count : unsigned(23 downto 0);  -- Declared at led_driver.v:15
  signal int2_count_en : std_logic;  -- Declared at led_driver.v:16
  signal int2_d : unsigned(1 downto 0);  -- Declared at led_driver.v:14
  signal select_data : unsigned(4 downto 0);  -- Declared at led_driver.v:11
  signal signed_bit : std_logic;  -- Declared at led_driver.v:12
begin
  tmp_ivl_28 <= not tmp_ivl_27;
  tmp_ivl_1 <= iDIG(5 + 4 downto 5);
  tmp_ivl_3 <= iDIG(9);
  tmp_ivl_5 <= iDIG(8);
  tmp_ivl_7 <= iDIG(4 + 4 downto 4);
  tmp_ivl_10 <= tmp_ivl_7 when tmp_ivl_5 = '1' else tmp_ivl_8;
  tmp_ivl_13 <= iDIG(8);
  tmp_ivl_17 <= iDIG(4 + 4 downto 4);
  tmp_ivl_18 <= tmp_ivl_14 when tmp_ivl_13 = '1' else tmp_ivl_17;
  tmp_ivl_20 <= tmp_ivl_10 when tmp_ivl_3 = '1' else tmp_ivl_18;
  select_data <= tmp_ivl_1 when iG_INT2 = '1' else tmp_ivl_20;
  signed_bit <= select_data(4);
  tmp_ivl_27 <= select_data(0 + 3 downto 0);
  tmp_ivl_31 <= select_data(0 + 3 downto 0);
  abs_select_high <= tmp_ivl_28 when signed_bit = '1' else tmp_ivl_31;
  tmp_ivl_35 <= int2_count(23);
  tmp_ivl_38 <= '1' when abs_select_high = tmp_ivl_36 else '0';
  tmp_ivl_44 <= '1' when abs_select_high = tmp_ivl_42 else '0';
  tmp_ivl_50 <= tmp_ivl_46 when signed_bit = '1' else tmp_ivl_48;
  tmp_ivl_54 <= '1' when abs_select_high = tmp_ivl_52 else '0';
  tmp_ivl_60 <= tmp_ivl_56 when signed_bit = '1' else tmp_ivl_58;
  tmp_ivl_64 <= '1' when abs_select_high = tmp_ivl_62 else '0';
  tmp_ivl_70 <= tmp_ivl_66 when signed_bit = '1' else tmp_ivl_68;
  tmp_ivl_74 <= '1' when abs_select_high = tmp_ivl_72 else '0';
  tmp_ivl_80 <= tmp_ivl_76 when signed_bit = '1' else tmp_ivl_78;
  tmp_ivl_84 <= '1' when abs_select_high = tmp_ivl_82 else '0';
  tmp_ivl_90 <= tmp_ivl_86 when signed_bit = '1' else tmp_ivl_88;
  tmp_ivl_94 <= '1' when abs_select_high = tmp_ivl_92 else '0';
  tmp_ivl_100 <= tmp_ivl_96 when signed_bit = '1' else tmp_ivl_98;
  tmp_ivl_104 <= '1' when abs_select_high = tmp_ivl_102 else '0';
  tmp_ivl_110 <= tmp_ivl_106 when signed_bit = '1' else tmp_ivl_108;
  tmp_ivl_114 <= '1' when abs_select_high = tmp_ivl_112 else '0';
  tmp_ivl_120 <= tmp_ivl_116 when signed_bit = '1' else tmp_ivl_118;
  tmp_ivl_126 <= tmp_ivl_122 when signed_bit = '1' else tmp_ivl_124;
  tmp_ivl_128 <= tmp_ivl_120 when tmp_ivl_114 = '1' else tmp_ivl_126;
  tmp_ivl_130 <= tmp_ivl_110 when tmp_ivl_104 = '1' else tmp_ivl_128;
  tmp_ivl_132 <= tmp_ivl_100 when tmp_ivl_94 = '1' else tmp_ivl_130;
  tmp_ivl_134 <= tmp_ivl_90 when tmp_ivl_84 = '1' else tmp_ivl_132;
  tmp_ivl_136 <= tmp_ivl_80 when tmp_ivl_74 = '1' else tmp_ivl_134;
  tmp_ivl_138 <= tmp_ivl_70 when tmp_ivl_64 = '1' else tmp_ivl_136;
  tmp_ivl_140 <= tmp_ivl_60 when tmp_ivl_54 = '1' else tmp_ivl_138;
  tmp_ivl_142 <= tmp_ivl_50 when tmp_ivl_44 = '1' else tmp_ivl_140;
  tmp_ivl_144 <= tmp_ivl_40 when tmp_ivl_38 = '1' else tmp_ivl_142;
  tmp_ivl_147 <= int2_count(20);
  tmp_ivl_152 <= tmp_ivl_148 when tmp_ivl_147 = '1' else tmp_ivl_150;
  oLED <= tmp_ivl_144 when tmp_ivl_35 = '1' else tmp_ivl_152;
  tmp_ivl_102 <= X"7";
  tmp_ivl_106 <= "0000000010";
  tmp_ivl_108 <= "0100000000";
  tmp_ivl_112 <= X"0";
  tmp_ivl_116 <= "0000000011";
  tmp_ivl_118 <= "1100000000";
  tmp_ivl_122 <= "0000000001";
  tmp_ivl_124 <= "1000000000";
  tmp_ivl_14 <= "01111";
  tmp_ivl_148 <= "0000000000";
  tmp_ivl_150 <= "1111111111";
  tmp_ivl_36 <= X"0";
  tmp_ivl_40 <= "0000110000";
  tmp_ivl_42 <= X"1";
  tmp_ivl_46 <= "0000010000";
  tmp_ivl_48 <= "0000100000";
  tmp_ivl_52 <= X"2";
  tmp_ivl_56 <= "0000011000";
  tmp_ivl_58 <= "0001100000";
  tmp_ivl_62 <= X"3";
  tmp_ivl_66 <= "0000001000";
  tmp_ivl_68 <= "0001000000";
  tmp_ivl_72 <= X"4";
  tmp_ivl_76 <= "0000001100";
  tmp_ivl_78 <= "0011000000";
  tmp_ivl_8 <= "10000";
  tmp_ivl_82 <= X"5";
  tmp_ivl_86 <= "0000000100";
  tmp_ivl_88 <= "0010000000";
  tmp_ivl_92 <= X"6";
  tmp_ivl_96 <= "0000000110";
  tmp_ivl_98 <= "0110000000";
  
  -- Generated from always process in led_driver (led_driver.v:60)
  process (iCLK, iRSTN) is
  begin
    if (not iRSTN) = '1' then
      int2_count_en <= '0';
      int2_count <= X"800000";
    elsif rising_edge(iCLK) then
      int2_d <= int2_d(0) & iG_INT2;
      if ((not int2_d(1)) = '1') and (int2_d(0) = '1') then
        int2_count_en <= '1';
        int2_count <= X"000000";
      else
        if int2_count(23) = '1' then
          int2_count_en <= '0';
        else
          int2_count <= int2_count + X"000001";
        end if;
      end if;
    end if;
  end process;
end architecture;

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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Generated from Verilog module spi_ee_config (spi_ee_config.v:1)
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
entity spi_ee_config is
  port (
    SPI_SDIO : inout std_logic;
    iG_INT2 : in std_logic;
    iRSTN : in std_logic;
    iSPI_CLK : in std_logic;
    iSPI_CLK_OUT : in std_logic;
    oDATA_H : out unsigned(7 downto 0);
    oDATA_L : out unsigned(7 downto 0);
    oSPI_CLK : out std_logic;
    oSPI_CSN : out std_logic
  );
end entity; 

-- Generated from Verilog module spi_ee_config (spi_ee_config.v:1)
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
architecture from_verilog of spi_ee_config is
  signal oDATA_H_Reg : unsigned(7 downto 0);
  signal oDATA_L_Reg : unsigned(7 downto 0);
  signal clear_status : std_logic;  -- Declared at spi_ee_config.v:42
  signal clear_status_d : unsigned(3 downto 0);  -- Declared at spi_ee_config.v:43
  signal high_byte : std_logic;  -- Declared at spi_ee_config.v:40
  signal high_byte_d : std_logic;  -- Declared at spi_ee_config.v:44
  signal ini_index : unsigned(3 downto 0);  -- Declared at spi_ee_config.v:32
  signal low_byte_data : unsigned(7 downto 0);  -- Declared at spi_ee_config.v:38
  signal p2s_data : unsigned(15 downto 0);  -- Declared at spi_ee_config.v:34
  signal read_back : std_logic;  -- Declared at spi_ee_config.v:41
  signal read_back_d : std_logic;  -- Declared at spi_ee_config.v:44
  signal read_idle_count : unsigned(14 downto 0);  -- Declared at spi_ee_config.v:45
  signal read_ready : std_logic;  -- Declared at spi_ee_config.v:42
  signal s2p_data : unsigned(7 downto 0);  -- Declared at spi_ee_config.v:37
  signal spi_end : std_logic;  -- Declared at spi_ee_config.v:36
  signal spi_go : std_logic;  -- Declared at spi_ee_config.v:35
  signal spi_state : std_logic;  -- Declared at spi_ee_config.v:39
  signal write_data : unsigned(13 downto 0);  -- Declared at spi_ee_config.v:33
  
  component spi_controller is
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
  end component;
  signal oSPI_CLK_Readable : std_logic;  -- Needed to connect outputs
  signal oSPI_CSN_Readable : std_logic;  -- Needed to connect outputs
begin
  oDATA_H <= oDATA_H_Reg;
  oDATA_L <= oDATA_L_Reg;
  oSPI_CLK <= oSPI_CLK_Readable;
  oSPI_CSN <= oSPI_CSN_Readable;
  
  -- Generated from instantiation at spi_ee_config.v:50
  u_spi_controller: spi_controller
    port map (
      SPI_SDIO => SPI_SDIO,
      iP2S_DATA => p2s_data,
      iRSTN => iRSTN,
      iSPI_CLK => iSPI_CLK,
      iSPI_CLK_OUT => iSPI_CLK_OUT,
      iSPI_GO => spi_go,
      oS2P_DATA => s2p_data,
      oSPI_CLK => oSPI_CLK_Readable,
      oSPI_CSN => oSPI_CSN_Readable,
      oSPI_END => spi_end
    );
  
  -- Generated from always process in spi_ee_config (spi_ee_config.v:66)
  process (ini_index) is
  begin
    case ini_index is
      when X"0" =>
        write_data <= "10010000100000";
      when X"1" =>
        write_data <= "10010100000011";
      when X"2" =>
        write_data <= "10011000000001";
      when X"3" =>
        write_data <= "10011101111111";
      when X"4" =>
        write_data <= "10100000001001";
      when X"5" =>
        write_data <= "10100101000110";
      when X"6" =>
        write_data <= "10110000001001";
      when X"7" =>
        write_data <= "10111000010000";
      when X"8" =>
        write_data <= "10111100010000";
      when X"9" =>
        write_data <= "11000101000000";
      when others =>
        write_data <= "10110100001000";
    end case;
  end process;
  
  -- Generated from always process in spi_ee_config (spi_ee_config.v:81)
  process (iRSTN, iSPI_CLK) is
  begin
    if (not iRSTN) = '1' then
      ini_index <= X"0";
      spi_go <= '0';
      spi_state <= '0';
      read_idle_count <= "000000000000000";
      high_byte <= '0';
      read_back <= '0';
      clear_status <= '0';
    elsif rising_edge(iSPI_CLK) then
      if ini_index < X"b" then
        case spi_state is
          when '0' =>
            p2s_data <= "00" & write_data;
            spi_go <= '1';
            spi_state <= '1';
          when '1' =>
            if spi_end = '1' then
              ini_index <= ini_index + X"1";
              spi_go <= '0';
              spi_state <= '0';
            end if;
          when others =>
            null;
        end case;
      else
        case spi_state is
          when '0' =>
            read_idle_count <= read_idle_count + "000000000000001";
            if high_byte = '1' then
              p2s_data(8 + 7 downto 8) <= X"b3";
              read_back <= '1';
            else
              if read_ready = '1' then
                p2s_data(8 + 7 downto 8) <= X"b2";
                read_back <= '1';
              else
                if (((not clear_status_d(3)) = '1') and (iG_INT2 = '1')) or (read_idle_count(14) = '1') then
                  p2s_data(8 + 7 downto 8) <= X"b0";
                  clear_status <= '1';
                end if;
              end if;
            end if;
            if (((high_byte = '1') or (read_ready = '1')) or (read_idle_count(14) = '1')) or (((not clear_status_d(3)) = '1') and (iG_INT2 = '1')) then
              spi_go <= '1';
              spi_state <= '1';
            end if;
            if read_back_d = '1' then
              if high_byte_d = '1' then
                oDATA_H_Reg <= s2p_data;
                oDATA_L_Reg <= low_byte_data;
              else
                low_byte_data <= s2p_data;
              end if;
            end if;
          when '1' =>
            if spi_end = '1' then
              spi_go <= '0';
              spi_state <= '0';
              if read_back = '1' then
                read_back <= '0';
                high_byte <= not high_byte;
                read_ready <= '0';
              else
                clear_status <= '0';
                read_ready <= s2p_data(6);
                read_idle_count <= "000000000000000";
              end if;
            end if;
          when others =>
            null;
        end case;
      end if;
    end if;
  end process;
  
  -- Generated from always process in spi_ee_config (spi_ee_config.v:170)
  process (iRSTN, iSPI_CLK) is
  begin
    if (not iRSTN) = '1' then
      high_byte_d <= '0';
      read_back_d <= '0';
      clear_status_d <= X"0";
    elsif rising_edge(iSPI_CLK) then
      high_byte_d <= high_byte;
      read_back_d <= read_back;
      clear_status_d <= clear_status_d(0 + 2 downto 0) & clear_status;
    end if;
  end process;
end architecture;

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

