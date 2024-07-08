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
      int2_count <= X"800000";
    elsif rising_edge(iCLK) then
      int2_d <= int2_d(0) & iG_INT2;
      if ((not int2_d(1)) = '1') and (int2_d(0) = '1') then
        int2_count <= X"000000";
      else
        if int2_count(23) = '0' then
          int2_count <= int2_count + X"000001";
        end if;
      end if;
    end if;
  end process;
end architecture;

