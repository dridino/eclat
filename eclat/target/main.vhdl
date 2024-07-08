-- code generated from the following source code:
--   ../ocaml-vm/vm/target-specific/intel-max10/IOs.ecl
--   ../../adrien/stage/vhdl_externes/test.ecl
--
-- with the following command:
--
--    ./eclat ../ocaml-vm/vm/target-specific/intel-max10/IOs.ecl ../../adrien/stage/vhdl_externes/test.ecl

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.runtime.all;


entity main is
  
  port(signal clk    : in std_logic;
       signal reset  : in std_logic;
       signal run    : in std_logic;
       signal rdy    : out value(0 to 0);
       signal argument : in value(0 to 15);
       signal result : out value(0 to 75));
       
end entity;
architecture rtl of main is

  type t_state is (compute620);
  signal state, \state%next\: t_state;
  signal Interface_accelerometer_argument_0 : std_logic_vector(0 to 3) := (others => '0');
signal Interface_accelerometer_result_0 : std_logic_vector(0 to 51) := (others => '0');
component Interface_accelerometer is
 port(
signal clk : in std_logic;
signal reset : in std_logic;
signal start : in std_logic;
signal argument : in std_logic_vector(0 to 3);
signal result : out std_logic_vector(0 to 51)
);
end component;

signal \$v636%now\ : value(0 to 3) := (others => '0');
  signal \$v636%next\ : value(0 to 3) := (others => '0');
  signal \$806%now\ : value(0 to 7) := (others => '0');
  signal \$806%next\ : value(0 to 7) := (others => '0');
  signal \$v634%now\ : value(0 to 3) := (others => '0');
  signal \$v634%next\ : value(0 to 3) := (others => '0');
  signal \$v644%now\ : value(0 to 3) := (others => '0');
  signal \$v644%next\ : value(0 to 3) := (others => '0');
  signal \$v640%now\ : value(0 to 3) := (others => '0');
  signal \$v640%next\ : value(0 to 3) := (others => '0');
  signal \$v628%now\ : value(0 to 3) := (others => '0');
  signal \$v628%next\ : value(0 to 3) := (others => '0');
  signal \$875%now\ : value(0 to 7) := (others => '0');
  signal \$875%next\ : value(0 to 7) := (others => '0');
  signal \$773%now\ : value(0 to 7) := (others => '0');
  signal \$773%next\ : value(0 to 7) := (others => '0');
  signal \$805%now\ : value(0 to 7) := (others => '0');
  signal \$805%next\ : value(0 to 7) := (others => '0');
  signal \$v643%now\ : value(0 to 3) := (others => '0');
  signal \$v643%next\ : value(0 to 3) := (others => '0');
  signal \$v641%now\ : value(0 to 3) := (others => '0');
  signal \$v641%next\ : value(0 to 3) := (others => '0');
  signal \$803%now\ : value(0 to 7) := (others => '0');
  signal \$803%next\ : value(0 to 7) := (others => '0');
  signal \$911%now\ : value(0 to 7) := (others => '0');
  signal \$911%next\ : value(0 to 7) := (others => '0');
  signal \$v642%now\ : value(0 to 3) := (others => '0');
  signal \$v642%next\ : value(0 to 3) := (others => '0');
  signal \$v633%now\ : value(0 to 3) := (others => '0');
  signal \$v633%next\ : value(0 to 3) := (others => '0');
  signal \$v649%now\ : value(0 to 0) := (others => '0');
  signal \$v649%next\ : value(0 to 0) := (others => '0');
  signal \$v631%now\ : value(0 to 3) := (others => '0');
  signal \$v631%next\ : value(0 to 3) := (others => '0');
  signal \$v639%now\ : value(0 to 3) := (others => '0');
  signal \$v639%next\ : value(0 to 3) := (others => '0');
  signal \$774%now\ : value(0 to 7) := (others => '0');
  signal \$774%next\ : value(0 to 7) := (others => '0');
  signal \$v630%now\ : value(0 to 3) := (others => '0');
  signal \$v630%next\ : value(0 to 3) := (others => '0');
  signal \$843%now\ : value(0 to 7) := (others => '0');
  signal \$843%next\ : value(0 to 7) := (others => '0');
  signal \$v626%now\ : value(0 to 3) := (others => '0');
  signal \$v626%next\ : value(0 to 3) := (others => '0');
  signal \$716%now\ : value(0 to 51) := (others => '0');
  signal \$716%next\ : value(0 to 51) := (others => '0');
  signal \$844%now\ : value(0 to 7) := (others => '0');
  signal \$844%next\ : value(0 to 7) := (others => '0');
  signal \result618%now\ : value(0 to 75) := (others => '0');
  signal \result618%next\ : value(0 to 75) := (others => '0');
  signal \$735%now\ : value(0 to 7) := (others => '0');
  signal \$735%next\ : value(0 to 7) := (others => '0');
  signal \$v635%now\ : value(0 to 3) := (others => '0');
  signal \$v635%next\ : value(0 to 3) := (others => '0');
  signal \$873%now\ : value(0 to 7) := (others => '0');
  signal \$873%next\ : value(0 to 7) := (others => '0');
  signal \$v637%now\ : value(0 to 3) := (others => '0');
  signal \$v637%next\ : value(0 to 3) := (others => '0');
  signal \$841%now\ : value(0 to 7) := (others => '0');
  signal \$841%next\ : value(0 to 7) := (others => '0');
  signal \$v622%now\ : value(0 to 3) := (others => '0');
  signal \$v622%next\ : value(0 to 3) := (others => '0');
  signal \$874%now\ : value(0 to 7) := (others => '0');
  signal \$874%next\ : value(0 to 7) := (others => '0');
  signal \$v625%now\ : value(0 to 3) := (others => '0');
  signal \$v625%next\ : value(0 to 3) := (others => '0');
  signal \$v621%now\ : value(0 to 3) := (others => '0');
  signal \$v621%next\ : value(0 to 3) := (others => '0');
  signal \$v627%now\ : value(0 to 3) := (others => '0');
  signal \$v627%next\ : value(0 to 3) := (others => '0');
  signal \$912%now\ : value(0 to 7) := (others => '0');
  signal \$912%next\ : value(0 to 7) := (others => '0');
  signal \$v650%now\ : value(0 to 0) := (others => '0');
  signal \$v650%next\ : value(0 to 0) := (others => '0');
  signal \$804%now\ : value(0 to 7) := (others => '0');
  signal \$804%next\ : value(0 to 7) := (others => '0');
  signal \$v647%now\ : value(0 to 0) := (others => '0');
  signal \$v647%next\ : value(0 to 0) := (others => '0');
  signal \$724_digs%now\ : value(0 to 47) := (others => '0');
  signal \$724_digs%next\ : value(0 to 47) := (others => '0');
  signal \$734%now\ : value(0 to 7) := (others => '0');
  signal \$734%next\ : value(0 to 7) := (others => '0');
  signal \$910%now\ : value(0 to 7) := (others => '0');
  signal \$910%next\ : value(0 to 7) := (others => '0');
  signal \$v624%now\ : value(0 to 3) := (others => '0');
  signal \$v624%next\ : value(0 to 3) := (others => '0');
  signal \$736%now\ : value(0 to 7) := (others => '0');
  signal \$736%next\ : value(0 to 7) := (others => '0');
  signal \$772%now\ : value(0 to 7) := (others => '0');
  signal \$772%next\ : value(0 to 7) := (others => '0');
  signal \$913%now\ : value(0 to 7) := (others => '0');
  signal \$913%next\ : value(0 to 7) := (others => '0');
  signal \$872%now\ : value(0 to 7) := (others => '0');
  signal \$872%next\ : value(0 to 7) := (others => '0');
  signal \$842%now\ : value(0 to 7) := (others => '0');
  signal \$842%next\ : value(0 to 7) := (others => '0');
  signal \$v623%now\ : value(0 to 3) := (others => '0');
  signal \$v623%next\ : value(0 to 3) := (others => '0');
  signal \$775%now\ : value(0 to 7) := (others => '0');
  signal \$775%next\ : value(0 to 7) := (others => '0');
  signal \$v648%now\ : value(0 to 0) := (others => '0');
  signal \$v648%next\ : value(0 to 0) := (others => '0');
  signal \$v646%now\ : value(0 to 3) := (others => '0');
  signal \$v646%next\ : value(0 to 3) := (others => '0');
  signal \$v632%now\ : value(0 to 3) := (others => '0');
  signal \$v632%next\ : value(0 to 3) := (others => '0');
  signal \rdy619%now\ : value(0 to 0) := (others => '0');
  signal \rdy619%next\ : value(0 to 0) := (others => '0');
  signal \$v645%now\ : value(0 to 3) := (others => '0');
  signal \$v645%next\ : value(0 to 3) := (others => '0');
  signal \$v638%now\ : value(0 to 0) := (others => '0');
  signal \$v638%next\ : value(0 to 0) := (others => '0');
  signal \$v629%now\ : value(0 to 0) := (others => '0');
  signal \$v629%next\ : value(0 to 0) := (others => '0');
  signal \$737%now\ : value(0 to 7) := (others => '0');
  signal \$737%next\ : value(0 to 7) := (others => '0');
  
  begin
    Interface_accelerometer_cc_0 : component Interface_accelerometer port map (
clk => clk,
reset => reset,
start => '1',
argument => Interface_accelerometer_argument_0,
result => Interface_accelerometer_result_0
);

process (reset,clk)
        begin
          if reset = '1' then
    \$v636%now\ <= (others => '0');
    \$806%now\ <= (others => '0');
    \$v634%now\ <= (others => '0');
    \$v644%now\ <= (others => '0');
    \$v640%now\ <= (others => '0');
    \$v628%now\ <= (others => '0');
    \$875%now\ <= (others => '0');
    \$773%now\ <= (others => '0');
    \$805%now\ <= (others => '0');
    \$v643%now\ <= (others => '0');
    \$v641%now\ <= (others => '0');
    \$803%now\ <= (others => '0');
    \$911%now\ <= (others => '0');
    \$v642%now\ <= (others => '0');
    \$v633%now\ <= (others => '0');
    \$v649%now\ <= (others => '0');
    \$v631%now\ <= (others => '0');
    \$v639%now\ <= (others => '0');
    \$774%now\ <= (others => '0');
    \$v630%now\ <= (others => '0');
    \$843%now\ <= (others => '0');
    \$v626%now\ <= (others => '0');
    \$716%now\ <= (others => '0');
    \$844%now\ <= (others => '0');
    \result618%now\ <= (others => '0');
    \$735%now\ <= (others => '0');
    \$v635%now\ <= (others => '0');
    \$873%now\ <= (others => '0');
    \$v637%now\ <= (others => '0');
    \$841%now\ <= (others => '0');
    \$v622%now\ <= (others => '0');
    \$874%now\ <= (others => '0');
    \$v625%now\ <= (others => '0');
    \$v621%now\ <= (others => '0');
    \$v627%now\ <= (others => '0');
    \$912%now\ <= (others => '0');
    \$v650%now\ <= (others => '0');
    \$804%now\ <= (others => '0');
    \$v647%now\ <= (others => '0');
    \$724_digs%now\ <= (others => '0');
    \$734%now\ <= (others => '0');
    \$910%now\ <= (others => '0');
    \$v624%now\ <= (others => '0');
    \$736%now\ <= (others => '0');
    \$772%now\ <= (others => '0');
    \$913%now\ <= (others => '0');
    \$872%now\ <= (others => '0');
    \$842%now\ <= (others => '0');
    \$v623%now\ <= (others => '0');
    \$775%now\ <= (others => '0');
    \$v648%now\ <= (others => '0');
    \$v646%now\ <= (others => '0');
    \$v632%now\ <= (others => '0');
    \rdy619%now\ <= (others => '0');
    \$v645%now\ <= (others => '0');
    \$v638%now\ <= (others => '0');
    \$v629%now\ <= (others => '0');
    \$737%now\ <= (others => '0');
    elsif (rising_edge(clk)) then
    \$v636%now\ <= \$v636%next\;
    \$806%now\ <= \$806%next\;
    \$v634%now\ <= \$v634%next\;
    \$v644%now\ <= \$v644%next\;
    \$v640%now\ <= \$v640%next\;
    \$v628%now\ <= \$v628%next\;
    \$875%now\ <= \$875%next\;
    \$773%now\ <= \$773%next\;
    \$805%now\ <= \$805%next\;
    \$v643%now\ <= \$v643%next\;
    \$v641%now\ <= \$v641%next\;
    \$803%now\ <= \$803%next\;
    \$911%now\ <= \$911%next\;
    \$v642%now\ <= \$v642%next\;
    \$v633%now\ <= \$v633%next\;
    \$v649%now\ <= \$v649%next\;
    \$v631%now\ <= \$v631%next\;
    \$v639%now\ <= \$v639%next\;
    \$774%now\ <= \$774%next\;
    \$v630%now\ <= \$v630%next\;
    \$843%now\ <= \$843%next\;
    \$v626%now\ <= \$v626%next\;
    \$716%now\ <= \$716%next\;
    \$844%now\ <= \$844%next\;
    \result618%now\ <= \result618%next\;
    \$735%now\ <= \$735%next\;
    \$v635%now\ <= \$v635%next\;
    \$873%now\ <= \$873%next\;
    \$v637%now\ <= \$v637%next\;
    \$841%now\ <= \$841%next\;
    \$v622%now\ <= \$v622%next\;
    \$874%now\ <= \$874%next\;
    \$v625%now\ <= \$v625%next\;
    \$v621%now\ <= \$v621%next\;
    \$v627%now\ <= \$v627%next\;
    \$912%now\ <= \$912%next\;
    \$v650%now\ <= \$v650%next\;
    \$804%now\ <= \$804%next\;
    \$v647%now\ <= \$v647%next\;
    \$724_digs%now\ <= \$724_digs%next\;
    \$734%now\ <= \$734%next\;
    \$910%now\ <= \$910%next\;
    \$v624%now\ <= \$v624%next\;
    \$736%now\ <= \$736%next\;
    \$772%now\ <= \$772%next\;
    \$913%now\ <= \$913%next\;
    \$872%now\ <= \$872%next\;
    \$842%now\ <= \$842%next\;
    \$v623%now\ <= \$v623%next\;
    \$775%now\ <= \$775%next\;
    \$v648%now\ <= \$v648%next\;
    \$v646%now\ <= \$v646%next\;
    \$v632%now\ <= \$v632%next\;
    \rdy619%now\ <= \rdy619%next\;
    \$v645%now\ <= \$v645%next\;
    \$v638%now\ <= \$v638%next\;
    \$v629%now\ <= \$v629%next\;
    \$737%now\ <= \$737%next\;
    state <= \state%next\;
    
    end if;
    end process;
    
    process(argument, clk, \$v636%now\, \$806%now\, \$v634%now\, \$v644%now\, \$v640%now\, \$v628%now\, \$875%now\, \$773%now\, \$805%now\, \$v643%now\, \$v641%now\, \$803%now\, \$911%now\, \$v642%now\, \$v633%now\, \$v649%now\, \$v631%now\, \$v639%now\, \$774%now\, \$v630%now\, \$843%now\, \$v626%now\, \$716%now\, \$844%now\, \result618%now\, \$735%now\, \$v635%now\, \$873%now\, \$v637%now\, \$841%now\, \$v622%now\, \$874%now\, \$v625%now\, \$v621%now\, \$v627%now\, \$912%now\, \$v650%now\, \$804%now\, \$v647%now\, \$724_digs%now\, \$734%now\, \$910%now\, \$v624%now\, \$736%now\, \$772%now\, \$913%now\, \$872%now\, \$842%now\, \$v623%now\, \$775%now\, \$v648%now\, \$v646%now\, \$v632%now\, \rdy619%now\, \$v645%now\, \$v638%now\, \$v629%now\, \$737%now\)
      variable result618 : value(0 to 75) := (others => '0');
      variable \$724_digs\ : value(0 to 47) := (others => '0');
      variable \$737\, \$775\, \$842\, \$872\, \$913\, \$772\, \$736\, 
               \$910\, \$734\, \$804\, \$912\, \$874\, \$841\, \$873\, 
               \$735\, \$844\, \$843\, \$774\, \$911\, \$803\, \$805\, 
               \$773\, \$875\, \$806\ : value(0 to 7) := (others => '0');
      variable \$v645\, \$v632\, \$v646\, \$v623\, \$v624\, \$v627\, \$v621\, 
               \$v625\, \$v622\, \$v637\, \$v635\, \$v626\, \$v630\, \$v639\, 
               \$v631\, \$v633\, \$v642\, \$v641\, \$v643\, \$v628\, \$v640\, 
               \$v644\, \$v634\, \$v636\ : value(0 to 3) := (others => '0');
      variable \$716\ : value(0 to 51) := (others => '0');
      variable \$v629\, \$v638\, rdy619, \$v648\, \$v647\, \$v650\, \$v649\ : value(0 to 0) := (others => '0');
      
    begin
      if run = '1' then
      \$v636\ := \$v636%now\;
      \$806\ := \$806%now\;
      \$v634\ := \$v634%now\;
      \$v644\ := \$v644%now\;
      \$v640\ := \$v640%now\;
      \$v628\ := \$v628%now\;
      \$875\ := \$875%now\;
      \$773\ := \$773%now\;
      \$805\ := \$805%now\;
      \$v643\ := \$v643%now\;
      \$v641\ := \$v641%now\;
      \$803\ := \$803%now\;
      \$911\ := \$911%now\;
      \$v642\ := \$v642%now\;
      \$v633\ := \$v633%now\;
      \$v649\ := \$v649%now\;
      \$v631\ := \$v631%now\;
      \$v639\ := \$v639%now\;
      \$774\ := \$774%now\;
      \$v630\ := \$v630%now\;
      \$843\ := \$843%now\;
      \$v626\ := \$v626%now\;
      \$716\ := \$716%now\;
      \$844\ := \$844%now\;
      result618 := \result618%now\;
      \$735\ := \$735%now\;
      \$v635\ := \$v635%now\;
      \$873\ := \$873%now\;
      \$v637\ := \$v637%now\;
      \$841\ := \$841%now\;
      \$v622\ := \$v622%now\;
      \$874\ := \$874%now\;
      \$v625\ := \$v625%now\;
      \$v621\ := \$v621%now\;
      \$v627\ := \$v627%now\;
      \$912\ := \$912%now\;
      \$v650\ := \$v650%now\;
      \$804\ := \$804%now\;
      \$v647\ := \$v647%now\;
      \$724_digs\ := \$724_digs%now\;
      \$734\ := \$734%now\;
      \$910\ := \$910%now\;
      \$v624\ := \$v624%now\;
      \$736\ := \$736%now\;
      \$772\ := \$772%now\;
      \$913\ := \$913%now\;
      \$872\ := \$872%now\;
      \$842\ := \$842%now\;
      \$v623\ := \$v623%now\;
      \$775\ := \$775%now\;
      \$v648\ := \$v648%now\;
      \$v646\ := \$v646%now\;
      \$v632\ := \$v632%now\;
      rdy619 := \rdy619%now\;
      \$v645\ := \$v645%now\;
      \$v638\ := \$v638%now\;
      \$v629\ := \$v629%now\;
      \$737\ := \$737%now\;
      
      rdy <= "1";
      rdy619 := "0";
      case state is
      when compute620 =>
        rdy619 := eclat_false;
        Interface_accelerometer_argument_0 <= argument(12 to 13) & ""&argument(14) & ""&argument(15);
        \$716\ := Interface_accelerometer_result_0;
        \$v650\ := ""&argument(0);
        if \$v650\(0) = '1' then
          \$v629\ := eclat_ge(\$716\(0 to 15) & X"000" & X"0");
          if \$v629\(0) = '1' then
            \$v624\ := eclat_getBit(\$716\(0 to 15) & X"0000000" & X"3") & eclat_getBit(\$716\(0 to 15) & X"0000000" & X"2") & eclat_getBit(\$716\(0 to 15) & X"0000000" & X"1") & eclat_getBit(\$716\(0 to 15) & X"0000000" & X"0");
            case \$v624\ is
            when "0000" =>
              \$910\ := "00000011";
            when "0001" =>
              \$910\ := "10011111";
            when "0010" =>
              \$910\ := "00100101";
            when "0011" =>
              \$910\ := "00001101";
            when "0100" =>
              \$910\ := "10011001";
            when "0101" =>
              \$910\ := "01001001";
            when "0110" =>
              \$910\ := "01000001";
            when "0111" =>
              \$910\ := "00011111";
            when "1000" =>
              \$910\ := "00000001";
            when "1001" =>
              \$910\ := "00001001";
            when "1010" =>
              \$910\ := "00010001";
            when "1011" =>
              \$910\ := "11000001";
            when "1100" =>
              \$910\ := "01100011";
            when "1101" =>
              \$910\ := "10000101";
            when "1110" =>
              \$910\ := "01100001";
            when "1111" =>
              \$910\ := "01110001";
            when others =>
              \$910\ := "11100011";
            end case;
            \$v623\ := eclat_getBit(\$716\(0 to 15) & X"0000000" & X"7") & eclat_getBit(\$716\(0 to 15) & X"0000000" & X"6") & eclat_getBit(\$716\(0 to 15) & X"0000000" & X"5") & eclat_getBit(\$716\(0 to 15) & X"0000000" & X"4");
            case \$v623\ is
            when "0000" =>
              \$911\ := "00000011";
            when "0001" =>
              \$911\ := "10011111";
            when "0010" =>
              \$911\ := "00100101";
            when "0011" =>
              \$911\ := "00001101";
            when "0100" =>
              \$911\ := "10011001";
            when "0101" =>
              \$911\ := "01001001";
            when "0110" =>
              \$911\ := "01000001";
            when "0111" =>
              \$911\ := "00011111";
            when "1000" =>
              \$911\ := "00000001";
            when "1001" =>
              \$911\ := "00001001";
            when "1010" =>
              \$911\ := "00010001";
            when "1011" =>
              \$911\ := "11000001";
            when "1100" =>
              \$911\ := "01100011";
            when "1101" =>
              \$911\ := "10000101";
            when "1110" =>
              \$911\ := "01100001";
            when "1111" =>
              \$911\ := "01110001";
            when others =>
              \$911\ := "11100011";
            end case;
            \$v622\ := eclat_getBit(\$716\(0 to 15) & X"0000000" & X"b") & eclat_getBit(\$716\(0 to 15) & X"0000000" & X"a") & eclat_getBit(\$716\(0 to 15) & X"0000000" & X"9") & eclat_getBit(\$716\(0 to 15) & X"0000000" & X"8");
            case \$v622\ is
            when "0000" =>
              \$912\ := "00000011";
            when "0001" =>
              \$912\ := "10011111";
            when "0010" =>
              \$912\ := "00100101";
            when "0011" =>
              \$912\ := "00001101";
            when "0100" =>
              \$912\ := "10011001";
            when "0101" =>
              \$912\ := "01001001";
            when "0110" =>
              \$912\ := "01000001";
            when "0111" =>
              \$912\ := "00011111";
            when "1000" =>
              \$912\ := "00000001";
            when "1001" =>
              \$912\ := "00001001";
            when "1010" =>
              \$912\ := "00010001";
            when "1011" =>
              \$912\ := "11000001";
            when "1100" =>
              \$912\ := "01100011";
            when "1101" =>
              \$912\ := "10000101";
            when "1110" =>
              \$912\ := "01100001";
            when "1111" =>
              \$912\ := "01110001";
            when others =>
              \$912\ := "11100011";
            end case;
            \$v621\ := eclat_getBit(\$716\(0 to 15) & X"0000000" & X"f") & eclat_getBit(\$716\(0 to 15) & X"0000000" & X"e") & eclat_getBit(\$716\(0 to 15) & X"0000000" & X"d") & eclat_getBit(\$716\(0 to 15) & X"0000000" & X"c");
            case \$v621\ is
            when "0000" =>
              \$913\ := "00000011";
            when "0001" =>
              \$913\ := "10011111";
            when "0010" =>
              \$913\ := "00100101";
            when "0011" =>
              \$913\ := "00001101";
            when "0100" =>
              \$913\ := "10011001";
            when "0101" =>
              \$913\ := "01001001";
            when "0110" =>
              \$913\ := "01000001";
            when "0111" =>
              \$913\ := "00011111";
            when "1000" =>
              \$913\ := "00000001";
            when "1001" =>
              \$913\ := "00001001";
            when "1010" =>
              \$913\ := "00010001";
            when "1011" =>
              \$913\ := "11000001";
            when "1100" =>
              \$913\ := "01100011";
            when "1101" =>
              \$913\ := "10000101";
            when "1110" =>
              \$913\ := "01100001";
            when "1111" =>
              \$913\ := "01110001";
            when others =>
              \$913\ := "11100011";
            end case;
            \$724_digs\ := \$910\ & \$911\ & \$912\ & \$913\ & "00000011" & "00000011";
            result618 := ""&argument(0) & ""&argument(1) & ""&argument(2) & ""&argument(3) & ""&argument(4) & ""&argument(5) & ""&argument(6) & ""&argument(7) & ""&argument(8) & eclat_gt(\$716\(32 to 47) & X"000" & X"0") & \$724_digs\ & ""&\$716\(48) & ""&\$716\(49) & eclat_false & eclat_false & "0000" & "0000" & "0000" & ""&\$716\(50) & ""&\$716\(51);
            rdy619 := eclat_true;
            \state%next\ <= compute620;
          else
            \$v628\ := eclat_sub("1111" & eclat_getBit(\$716\(0 to 15) & X"0000000" & X"3") & eclat_getBit(\$716\(0 to 15) & X"0000000" & X"2") & eclat_getBit(\$716\(0 to 15) & X"0000000" & X"1") & eclat_getBit(\$716\(0 to 15) & X"0000000" & X"0"));
            case \$v628\ is
            when "0000" =>
              \$872\ := "00000011";
            when "0001" =>
              \$872\ := "10011111";
            when "0010" =>
              \$872\ := "00100101";
            when "0011" =>
              \$872\ := "00001101";
            when "0100" =>
              \$872\ := "10011001";
            when "0101" =>
              \$872\ := "01001001";
            when "0110" =>
              \$872\ := "01000001";
            when "0111" =>
              \$872\ := "00011111";
            when "1000" =>
              \$872\ := "00000001";
            when "1001" =>
              \$872\ := "00001001";
            when "1010" =>
              \$872\ := "00010001";
            when "1011" =>
              \$872\ := "11000001";
            when "1100" =>
              \$872\ := "01100011";
            when "1101" =>
              \$872\ := "10000101";
            when "1110" =>
              \$872\ := "01100001";
            when "1111" =>
              \$872\ := "01110001";
            when others =>
              \$872\ := "11100011";
            end case;
            \$v627\ := eclat_sub("1111" & eclat_getBit(\$716\(0 to 15) & X"0000000" & X"7") & eclat_getBit(\$716\(0 to 15) & X"0000000" & X"6") & eclat_getBit(\$716\(0 to 15) & X"0000000" & X"5") & eclat_getBit(\$716\(0 to 15) & X"0000000" & X"4"));
            case \$v627\ is
            when "0000" =>
              \$873\ := "00000011";
            when "0001" =>
              \$873\ := "10011111";
            when "0010" =>
              \$873\ := "00100101";
            when "0011" =>
              \$873\ := "00001101";
            when "0100" =>
              \$873\ := "10011001";
            when "0101" =>
              \$873\ := "01001001";
            when "0110" =>
              \$873\ := "01000001";
            when "0111" =>
              \$873\ := "00011111";
            when "1000" =>
              \$873\ := "00000001";
            when "1001" =>
              \$873\ := "00001001";
            when "1010" =>
              \$873\ := "00010001";
            when "1011" =>
              \$873\ := "11000001";
            when "1100" =>
              \$873\ := "01100011";
            when "1101" =>
              \$873\ := "10000101";
            when "1110" =>
              \$873\ := "01100001";
            when "1111" =>
              \$873\ := "01110001";
            when others =>
              \$873\ := "11100011";
            end case;
            \$v626\ := eclat_sub("1111" & eclat_getBit(\$716\(0 to 15) & X"0000000" & X"b") & eclat_getBit(\$716\(0 to 15) & X"0000000" & X"a") & eclat_getBit(\$716\(0 to 15) & X"0000000" & X"9") & eclat_getBit(\$716\(0 to 15) & X"0000000" & X"8"));
            case \$v626\ is
            when "0000" =>
              \$874\ := "00000011";
            when "0001" =>
              \$874\ := "10011111";
            when "0010" =>
              \$874\ := "00100101";
            when "0011" =>
              \$874\ := "00001101";
            when "0100" =>
              \$874\ := "10011001";
            when "0101" =>
              \$874\ := "01001001";
            when "0110" =>
              \$874\ := "01000001";
            when "0111" =>
              \$874\ := "00011111";
            when "1000" =>
              \$874\ := "00000001";
            when "1001" =>
              \$874\ := "00001001";
            when "1010" =>
              \$874\ := "00010001";
            when "1011" =>
              \$874\ := "11000001";
            when "1100" =>
              \$874\ := "01100011";
            when "1101" =>
              \$874\ := "10000101";
            when "1110" =>
              \$874\ := "01100001";
            when "1111" =>
              \$874\ := "01110001";
            when others =>
              \$874\ := "11100011";
            end case;
            \$v625\ := eclat_sub("1111" & eclat_getBit(\$716\(0 to 15) & X"0000000" & X"f") & eclat_getBit(\$716\(0 to 15) & X"0000000" & X"e") & eclat_getBit(\$716\(0 to 15) & X"0000000" & X"d") & eclat_getBit(\$716\(0 to 15) & X"0000000" & X"c"));
            case \$v625\ is
            when "0000" =>
              \$875\ := "00000011";
            when "0001" =>
              \$875\ := "10011111";
            when "0010" =>
              \$875\ := "00100101";
            when "0011" =>
              \$875\ := "00001101";
            when "0100" =>
              \$875\ := "10011001";
            when "0101" =>
              \$875\ := "01001001";
            when "0110" =>
              \$875\ := "01000001";
            when "0111" =>
              \$875\ := "00011111";
            when "1000" =>
              \$875\ := "00000001";
            when "1001" =>
              \$875\ := "00001001";
            when "1010" =>
              \$875\ := "00010001";
            when "1011" =>
              \$875\ := "11000001";
            when "1100" =>
              \$875\ := "01100011";
            when "1101" =>
              \$875\ := "10000101";
            when "1110" =>
              \$875\ := "01100001";
            when "1111" =>
              \$875\ := "01110001";
            when others =>
              \$875\ := "11100011";
            end case;
            \$724_digs\ := \$872\ & \$873\ & \$874\ & \$875\ & "11111101" & "00000011";
            result618 := ""&argument(0) & ""&argument(1) & ""&argument(2) & ""&argument(3) & ""&argument(4) & ""&argument(5) & ""&argument(6) & ""&argument(7) & ""&argument(8) & eclat_gt(\$716\(32 to 47) & X"000" & X"0") & \$724_digs\ & ""&\$716\(48) & ""&\$716\(49) & eclat_false & eclat_false & "0000" & "0000" & "0000" & ""&\$716\(50) & ""&\$716\(51);
            rdy619 := eclat_true;
            \state%next\ <= compute620;
          end if;
        else
          \$v649\ := ""&argument(1);
          if \$v649\(0) = '1' then
            \$v638\ := eclat_ge(\$716\(16 to 31) & X"000" & X"0");
            if \$v638\(0) = '1' then
              \$v633\ := eclat_getBit(\$716\(16 to 31) & X"0000000" & X"3") & eclat_getBit(\$716\(16 to 31) & X"0000000" & X"2") & eclat_getBit(\$716\(16 to 31) & X"0000000" & X"1") & eclat_getBit(\$716\(16 to 31) & X"0000000" & X"0");
              case \$v633\ is
              when "0000" =>
                \$841\ := "00000011";
              when "0001" =>
                \$841\ := "10011111";
              when "0010" =>
                \$841\ := "00100101";
              when "0011" =>
                \$841\ := "00001101";
              when "0100" =>
                \$841\ := "10011001";
              when "0101" =>
                \$841\ := "01001001";
              when "0110" =>
                \$841\ := "01000001";
              when "0111" =>
                \$841\ := "00011111";
              when "1000" =>
                \$841\ := "00000001";
              when "1001" =>
                \$841\ := "00001001";
              when "1010" =>
                \$841\ := "00010001";
              when "1011" =>
                \$841\ := "11000001";
              when "1100" =>
                \$841\ := "01100011";
              when "1101" =>
                \$841\ := "10000101";
              when "1110" =>
                \$841\ := "01100001";
              when "1111" =>
                \$841\ := "01110001";
              when others =>
                \$841\ := "11100011";
              end case;
              \$v632\ := eclat_getBit(\$716\(16 to 31) & X"0000000" & X"7") & eclat_getBit(\$716\(16 to 31) & X"0000000" & X"6") & eclat_getBit(\$716\(16 to 31) & X"0000000" & X"5") & eclat_getBit(\$716\(16 to 31) & X"0000000" & X"4");
              case \$v632\ is
              when "0000" =>
                \$842\ := "00000011";
              when "0001" =>
                \$842\ := "10011111";
              when "0010" =>
                \$842\ := "00100101";
              when "0011" =>
                \$842\ := "00001101";
              when "0100" =>
                \$842\ := "10011001";
              when "0101" =>
                \$842\ := "01001001";
              when "0110" =>
                \$842\ := "01000001";
              when "0111" =>
                \$842\ := "00011111";
              when "1000" =>
                \$842\ := "00000001";
              when "1001" =>
                \$842\ := "00001001";
              when "1010" =>
                \$842\ := "00010001";
              when "1011" =>
                \$842\ := "11000001";
              when "1100" =>
                \$842\ := "01100011";
              when "1101" =>
                \$842\ := "10000101";
              when "1110" =>
                \$842\ := "01100001";
              when "1111" =>
                \$842\ := "01110001";
              when others =>
                \$842\ := "11100011";
              end case;
              \$v631\ := eclat_getBit(\$716\(16 to 31) & X"0000000" & X"b") & eclat_getBit(\$716\(16 to 31) & X"0000000" & X"a") & eclat_getBit(\$716\(16 to 31) & X"0000000" & X"9") & eclat_getBit(\$716\(16 to 31) & X"0000000" & X"8");
              case \$v631\ is
              when "0000" =>
                \$843\ := "00000011";
              when "0001" =>
                \$843\ := "10011111";
              when "0010" =>
                \$843\ := "00100101";
              when "0011" =>
                \$843\ := "00001101";
              when "0100" =>
                \$843\ := "10011001";
              when "0101" =>
                \$843\ := "01001001";
              when "0110" =>
                \$843\ := "01000001";
              when "0111" =>
                \$843\ := "00011111";
              when "1000" =>
                \$843\ := "00000001";
              when "1001" =>
                \$843\ := "00001001";
              when "1010" =>
                \$843\ := "00010001";
              when "1011" =>
                \$843\ := "11000001";
              when "1100" =>
                \$843\ := "01100011";
              when "1101" =>
                \$843\ := "10000101";
              when "1110" =>
                \$843\ := "01100001";
              when "1111" =>
                \$843\ := "01110001";
              when others =>
                \$843\ := "11100011";
              end case;
              \$v630\ := eclat_getBit(\$716\(16 to 31) & X"0000000" & X"f") & eclat_getBit(\$716\(16 to 31) & X"0000000" & X"e") & eclat_getBit(\$716\(16 to 31) & X"0000000" & X"d") & eclat_getBit(\$716\(16 to 31) & X"0000000" & X"c");
              case \$v630\ is
              when "0000" =>
                \$844\ := "00000011";
              when "0001" =>
                \$844\ := "10011111";
              when "0010" =>
                \$844\ := "00100101";
              when "0011" =>
                \$844\ := "00001101";
              when "0100" =>
                \$844\ := "10011001";
              when "0101" =>
                \$844\ := "01001001";
              when "0110" =>
                \$844\ := "01000001";
              when "0111" =>
                \$844\ := "00011111";
              when "1000" =>
                \$844\ := "00000001";
              when "1001" =>
                \$844\ := "00001001";
              when "1010" =>
                \$844\ := "00010001";
              when "1011" =>
                \$844\ := "11000001";
              when "1100" =>
                \$844\ := "01100011";
              when "1101" =>
                \$844\ := "10000101";
              when "1110" =>
                \$844\ := "01100001";
              when "1111" =>
                \$844\ := "01110001";
              when others =>
                \$844\ := "11100011";
              end case;
              \$724_digs\ := \$841\ & \$842\ & \$843\ & \$844\ & "00000011" & "00000011";
              result618 := ""&argument(0) & ""&argument(1) & ""&argument(2) & ""&argument(3) & ""&argument(4) & ""&argument(5) & ""&argument(6) & ""&argument(7) & ""&argument(8) & eclat_gt(\$716\(32 to 47) & X"000" & X"0") & \$724_digs\ & ""&\$716\(48) & ""&\$716\(49) & eclat_false & eclat_false & "0000" & "0000" & "0000" & ""&\$716\(50) & ""&\$716\(51);
              rdy619 := eclat_true;
              \state%next\ <= compute620;
            else
              \$v637\ := eclat_sub("1111" & eclat_getBit(\$716\(16 to 31) & X"0000000" & X"3") & eclat_getBit(\$716\(16 to 31) & X"0000000" & X"2") & eclat_getBit(\$716\(16 to 31) & X"0000000" & X"1") & eclat_getBit(\$716\(16 to 31) & X"0000000" & X"0"));
              case \$v637\ is
              when "0000" =>
                \$803\ := "00000011";
              when "0001" =>
                \$803\ := "10011111";
              when "0010" =>
                \$803\ := "00100101";
              when "0011" =>
                \$803\ := "00001101";
              when "0100" =>
                \$803\ := "10011001";
              when "0101" =>
                \$803\ := "01001001";
              when "0110" =>
                \$803\ := "01000001";
              when "0111" =>
                \$803\ := "00011111";
              when "1000" =>
                \$803\ := "00000001";
              when "1001" =>
                \$803\ := "00001001";
              when "1010" =>
                \$803\ := "00010001";
              when "1011" =>
                \$803\ := "11000001";
              when "1100" =>
                \$803\ := "01100011";
              when "1101" =>
                \$803\ := "10000101";
              when "1110" =>
                \$803\ := "01100001";
              when "1111" =>
                \$803\ := "01110001";
              when others =>
                \$803\ := "11100011";
              end case;
              \$v636\ := eclat_sub("1111" & eclat_getBit(\$716\(16 to 31) & X"0000000" & X"7") & eclat_getBit(\$716\(16 to 31) & X"0000000" & X"6") & eclat_getBit(\$716\(16 to 31) & X"0000000" & X"5") & eclat_getBit(\$716\(16 to 31) & X"0000000" & X"4"));
              case \$v636\ is
              when "0000" =>
                \$804\ := "00000011";
              when "0001" =>
                \$804\ := "10011111";
              when "0010" =>
                \$804\ := "00100101";
              when "0011" =>
                \$804\ := "00001101";
              when "0100" =>
                \$804\ := "10011001";
              when "0101" =>
                \$804\ := "01001001";
              when "0110" =>
                \$804\ := "01000001";
              when "0111" =>
                \$804\ := "00011111";
              when "1000" =>
                \$804\ := "00000001";
              when "1001" =>
                \$804\ := "00001001";
              when "1010" =>
                \$804\ := "00010001";
              when "1011" =>
                \$804\ := "11000001";
              when "1100" =>
                \$804\ := "01100011";
              when "1101" =>
                \$804\ := "10000101";
              when "1110" =>
                \$804\ := "01100001";
              when "1111" =>
                \$804\ := "01110001";
              when others =>
                \$804\ := "11100011";
              end case;
              \$v635\ := eclat_sub("1111" & eclat_getBit(\$716\(16 to 31) & X"0000000" & X"b") & eclat_getBit(\$716\(16 to 31) & X"0000000" & X"a") & eclat_getBit(\$716\(16 to 31) & X"0000000" & X"9") & eclat_getBit(\$716\(16 to 31) & X"0000000" & X"8"));
              case \$v635\ is
              when "0000" =>
                \$805\ := "00000011";
              when "0001" =>
                \$805\ := "10011111";
              when "0010" =>
                \$805\ := "00100101";
              when "0011" =>
                \$805\ := "00001101";
              when "0100" =>
                \$805\ := "10011001";
              when "0101" =>
                \$805\ := "01001001";
              when "0110" =>
                \$805\ := "01000001";
              when "0111" =>
                \$805\ := "00011111";
              when "1000" =>
                \$805\ := "00000001";
              when "1001" =>
                \$805\ := "00001001";
              when "1010" =>
                \$805\ := "00010001";
              when "1011" =>
                \$805\ := "11000001";
              when "1100" =>
                \$805\ := "01100011";
              when "1101" =>
                \$805\ := "10000101";
              when "1110" =>
                \$805\ := "01100001";
              when "1111" =>
                \$805\ := "01110001";
              when others =>
                \$805\ := "11100011";
              end case;
              \$v634\ := eclat_sub("1111" & eclat_getBit(\$716\(16 to 31) & X"0000000" & X"f") & eclat_getBit(\$716\(16 to 31) & X"0000000" & X"e") & eclat_getBit(\$716\(16 to 31) & X"0000000" & X"d") & eclat_getBit(\$716\(16 to 31) & X"0000000" & X"c"));
              case \$v634\ is
              when "0000" =>
                \$806\ := "00000011";
              when "0001" =>
                \$806\ := "10011111";
              when "0010" =>
                \$806\ := "00100101";
              when "0011" =>
                \$806\ := "00001101";
              when "0100" =>
                \$806\ := "10011001";
              when "0101" =>
                \$806\ := "01001001";
              when "0110" =>
                \$806\ := "01000001";
              when "0111" =>
                \$806\ := "00011111";
              when "1000" =>
                \$806\ := "00000001";
              when "1001" =>
                \$806\ := "00001001";
              when "1010" =>
                \$806\ := "00010001";
              when "1011" =>
                \$806\ := "11000001";
              when "1100" =>
                \$806\ := "01100011";
              when "1101" =>
                \$806\ := "10000101";
              when "1110" =>
                \$806\ := "01100001";
              when "1111" =>
                \$806\ := "01110001";
              when others =>
                \$806\ := "11100011";
              end case;
              \$724_digs\ := \$803\ & \$804\ & \$805\ & \$806\ & "11111101" & "00000011";
              result618 := ""&argument(0) & ""&argument(1) & ""&argument(2) & ""&argument(3) & ""&argument(4) & ""&argument(5) & ""&argument(6) & ""&argument(7) & ""&argument(8) & eclat_gt(\$716\(32 to 47) & X"000" & X"0") & \$724_digs\ & ""&\$716\(48) & ""&\$716\(49) & eclat_false & eclat_false & "0000" & "0000" & "0000" & ""&\$716\(50) & ""&\$716\(51);
              rdy619 := eclat_true;
              \state%next\ <= compute620;
            end if;
          else
            \$v648\ := ""&argument(2);
            if \$v648\(0) = '1' then
              \$v647\ := eclat_ge(\$716\(32 to 47) & X"000" & X"0");
              if \$v647\(0) = '1' then
                \$v642\ := eclat_getBit(\$716\(32 to 47) & X"0000000" & X"3") & eclat_getBit(\$716\(32 to 47) & X"0000000" & X"2") & eclat_getBit(\$716\(32 to 47) & X"0000000" & X"1") & eclat_getBit(\$716\(32 to 47) & X"0000000" & X"0");
                case \$v642\ is
                when "0000" =>
                  \$772\ := "00000011";
                when "0001" =>
                  \$772\ := "10011111";
                when "0010" =>
                  \$772\ := "00100101";
                when "0011" =>
                  \$772\ := "00001101";
                when "0100" =>
                  \$772\ := "10011001";
                when "0101" =>
                  \$772\ := "01001001";
                when "0110" =>
                  \$772\ := "01000001";
                when "0111" =>
                  \$772\ := "00011111";
                when "1000" =>
                  \$772\ := "00000001";
                when "1001" =>
                  \$772\ := "00001001";
                when "1010" =>
                  \$772\ := "00010001";
                when "1011" =>
                  \$772\ := "11000001";
                when "1100" =>
                  \$772\ := "01100011";
                when "1101" =>
                  \$772\ := "10000101";
                when "1110" =>
                  \$772\ := "01100001";
                when "1111" =>
                  \$772\ := "01110001";
                when others =>
                  \$772\ := "11100011";
                end case;
                \$v641\ := eclat_getBit(\$716\(32 to 47) & X"0000000" & X"7") & eclat_getBit(\$716\(32 to 47) & X"0000000" & X"6") & eclat_getBit(\$716\(32 to 47) & X"0000000" & X"5") & eclat_getBit(\$716\(32 to 47) & X"0000000" & X"4");
                case \$v641\ is
                when "0000" =>
                  \$773\ := "00000011";
                when "0001" =>
                  \$773\ := "10011111";
                when "0010" =>
                  \$773\ := "00100101";
                when "0011" =>
                  \$773\ := "00001101";
                when "0100" =>
                  \$773\ := "10011001";
                when "0101" =>
                  \$773\ := "01001001";
                when "0110" =>
                  \$773\ := "01000001";
                when "0111" =>
                  \$773\ := "00011111";
                when "1000" =>
                  \$773\ := "00000001";
                when "1001" =>
                  \$773\ := "00001001";
                when "1010" =>
                  \$773\ := "00010001";
                when "1011" =>
                  \$773\ := "11000001";
                when "1100" =>
                  \$773\ := "01100011";
                when "1101" =>
                  \$773\ := "10000101";
                when "1110" =>
                  \$773\ := "01100001";
                when "1111" =>
                  \$773\ := "01110001";
                when others =>
                  \$773\ := "11100011";
                end case;
                \$v640\ := eclat_getBit(\$716\(32 to 47) & X"0000000" & X"b") & eclat_getBit(\$716\(32 to 47) & X"0000000" & X"a") & eclat_getBit(\$716\(32 to 47) & X"0000000" & X"9") & eclat_getBit(\$716\(32 to 47) & X"0000000" & X"8");
                case \$v640\ is
                when "0000" =>
                  \$774\ := "00000011";
                when "0001" =>
                  \$774\ := "10011111";
                when "0010" =>
                  \$774\ := "00100101";
                when "0011" =>
                  \$774\ := "00001101";
                when "0100" =>
                  \$774\ := "10011001";
                when "0101" =>
                  \$774\ := "01001001";
                when "0110" =>
                  \$774\ := "01000001";
                when "0111" =>
                  \$774\ := "00011111";
                when "1000" =>
                  \$774\ := "00000001";
                when "1001" =>
                  \$774\ := "00001001";
                when "1010" =>
                  \$774\ := "00010001";
                when "1011" =>
                  \$774\ := "11000001";
                when "1100" =>
                  \$774\ := "01100011";
                when "1101" =>
                  \$774\ := "10000101";
                when "1110" =>
                  \$774\ := "01100001";
                when "1111" =>
                  \$774\ := "01110001";
                when others =>
                  \$774\ := "11100011";
                end case;
                \$v639\ := eclat_getBit(\$716\(32 to 47) & X"0000000" & X"f") & eclat_getBit(\$716\(32 to 47) & X"0000000" & X"e") & eclat_getBit(\$716\(32 to 47) & X"0000000" & X"d") & eclat_getBit(\$716\(32 to 47) & X"0000000" & X"c");
                case \$v639\ is
                when "0000" =>
                  \$775\ := "00000011";
                when "0001" =>
                  \$775\ := "10011111";
                when "0010" =>
                  \$775\ := "00100101";
                when "0011" =>
                  \$775\ := "00001101";
                when "0100" =>
                  \$775\ := "10011001";
                when "0101" =>
                  \$775\ := "01001001";
                when "0110" =>
                  \$775\ := "01000001";
                when "0111" =>
                  \$775\ := "00011111";
                when "1000" =>
                  \$775\ := "00000001";
                when "1001" =>
                  \$775\ := "00001001";
                when "1010" =>
                  \$775\ := "00010001";
                when "1011" =>
                  \$775\ := "11000001";
                when "1100" =>
                  \$775\ := "01100011";
                when "1101" =>
                  \$775\ := "10000101";
                when "1110" =>
                  \$775\ := "01100001";
                when "1111" =>
                  \$775\ := "01110001";
                when others =>
                  \$775\ := "11100011";
                end case;
                \$724_digs\ := \$772\ & \$773\ & \$774\ & \$775\ & "00000011" & "00000011";
                result618 := ""&argument(0) & ""&argument(1) & ""&argument(2) & ""&argument(3) & ""&argument(4) & ""&argument(5) & ""&argument(6) & ""&argument(7) & ""&argument(8) & eclat_gt(\$716\(32 to 47) & X"000" & X"0") & \$724_digs\ & ""&\$716\(48) & ""&\$716\(49) & eclat_false & eclat_false & "0000" & "0000" & "0000" & ""&\$716\(50) & ""&\$716\(51);
                rdy619 := eclat_true;
                \state%next\ <= compute620;
              else
                \$v646\ := eclat_sub("1111" & eclat_getBit(\$716\(32 to 47) & X"0000000" & X"3") & eclat_getBit(\$716\(32 to 47) & X"0000000" & X"2") & eclat_getBit(\$716\(32 to 47) & X"0000000" & X"1") & eclat_getBit(\$716\(32 to 47) & X"0000000" & X"0"));
                case \$v646\ is
                when "0000" =>
                  \$734\ := "00000011";
                when "0001" =>
                  \$734\ := "10011111";
                when "0010" =>
                  \$734\ := "00100101";
                when "0011" =>
                  \$734\ := "00001101";
                when "0100" =>
                  \$734\ := "10011001";
                when "0101" =>
                  \$734\ := "01001001";
                when "0110" =>
                  \$734\ := "01000001";
                when "0111" =>
                  \$734\ := "00011111";
                when "1000" =>
                  \$734\ := "00000001";
                when "1001" =>
                  \$734\ := "00001001";
                when "1010" =>
                  \$734\ := "00010001";
                when "1011" =>
                  \$734\ := "11000001";
                when "1100" =>
                  \$734\ := "01100011";
                when "1101" =>
                  \$734\ := "10000101";
                when "1110" =>
                  \$734\ := "01100001";
                when "1111" =>
                  \$734\ := "01110001";
                when others =>
                  \$734\ := "11100011";
                end case;
                \$v645\ := eclat_sub("1111" & eclat_getBit(\$716\(32 to 47) & X"0000000" & X"7") & eclat_getBit(\$716\(32 to 47) & X"0000000" & X"6") & eclat_getBit(\$716\(32 to 47) & X"0000000" & X"5") & eclat_getBit(\$716\(32 to 47) & X"0000000" & X"4"));
                case \$v645\ is
                when "0000" =>
                  \$735\ := "00000011";
                when "0001" =>
                  \$735\ := "10011111";
                when "0010" =>
                  \$735\ := "00100101";
                when "0011" =>
                  \$735\ := "00001101";
                when "0100" =>
                  \$735\ := "10011001";
                when "0101" =>
                  \$735\ := "01001001";
                when "0110" =>
                  \$735\ := "01000001";
                when "0111" =>
                  \$735\ := "00011111";
                when "1000" =>
                  \$735\ := "00000001";
                when "1001" =>
                  \$735\ := "00001001";
                when "1010" =>
                  \$735\ := "00010001";
                when "1011" =>
                  \$735\ := "11000001";
                when "1100" =>
                  \$735\ := "01100011";
                when "1101" =>
                  \$735\ := "10000101";
                when "1110" =>
                  \$735\ := "01100001";
                when "1111" =>
                  \$735\ := "01110001";
                when others =>
                  \$735\ := "11100011";
                end case;
                \$v644\ := eclat_sub("1111" & eclat_getBit(\$716\(32 to 47) & X"0000000" & X"b") & eclat_getBit(\$716\(32 to 47) & X"0000000" & X"a") & eclat_getBit(\$716\(32 to 47) & X"0000000" & X"9") & eclat_getBit(\$716\(32 to 47) & X"0000000" & X"8"));
                case \$v644\ is
                when "0000" =>
                  \$736\ := "00000011";
                when "0001" =>
                  \$736\ := "10011111";
                when "0010" =>
                  \$736\ := "00100101";
                when "0011" =>
                  \$736\ := "00001101";
                when "0100" =>
                  \$736\ := "10011001";
                when "0101" =>
                  \$736\ := "01001001";
                when "0110" =>
                  \$736\ := "01000001";
                when "0111" =>
                  \$736\ := "00011111";
                when "1000" =>
                  \$736\ := "00000001";
                when "1001" =>
                  \$736\ := "00001001";
                when "1010" =>
                  \$736\ := "00010001";
                when "1011" =>
                  \$736\ := "11000001";
                when "1100" =>
                  \$736\ := "01100011";
                when "1101" =>
                  \$736\ := "10000101";
                when "1110" =>
                  \$736\ := "01100001";
                when "1111" =>
                  \$736\ := "01110001";
                when others =>
                  \$736\ := "11100011";
                end case;
                \$v643\ := eclat_sub("1111" & eclat_getBit(\$716\(32 to 47) & X"0000000" & X"f") & eclat_getBit(\$716\(32 to 47) & X"0000000" & X"e") & eclat_getBit(\$716\(32 to 47) & X"0000000" & X"d") & eclat_getBit(\$716\(32 to 47) & X"0000000" & X"c"));
                case \$v643\ is
                when "0000" =>
                  \$737\ := "00000011";
                when "0001" =>
                  \$737\ := "10011111";
                when "0010" =>
                  \$737\ := "00100101";
                when "0011" =>
                  \$737\ := "00001101";
                when "0100" =>
                  \$737\ := "10011001";
                when "0101" =>
                  \$737\ := "01001001";
                when "0110" =>
                  \$737\ := "01000001";
                when "0111" =>
                  \$737\ := "00011111";
                when "1000" =>
                  \$737\ := "00000001";
                when "1001" =>
                  \$737\ := "00001001";
                when "1010" =>
                  \$737\ := "00010001";
                when "1011" =>
                  \$737\ := "11000001";
                when "1100" =>
                  \$737\ := "01100011";
                when "1101" =>
                  \$737\ := "10000101";
                when "1110" =>
                  \$737\ := "01100001";
                when "1111" =>
                  \$737\ := "01110001";
                when others =>
                  \$737\ := "11100011";
                end case;
                \$724_digs\ := \$734\ & \$735\ & \$736\ & \$737\ & "11111101" & "00000011";
                result618 := ""&argument(0) & ""&argument(1) & ""&argument(2) & ""&argument(3) & ""&argument(4) & ""&argument(5) & ""&argument(6) & ""&argument(7) & ""&argument(8) & eclat_gt(\$716\(32 to 47) & X"000" & X"0") & \$724_digs\ & ""&\$716\(48) & ""&\$716\(49) & eclat_false & eclat_false & "0000" & "0000" & "0000" & ""&\$716\(50) & ""&\$716\(51);
                rdy619 := eclat_true;
                \state%next\ <= compute620;
              end if;
            else
              \$724_digs\ := "00000011" & "00000011" & "00000011" & "00000011" & "00000011" & "00000011";
              result618 := ""&argument(0) & ""&argument(1) & ""&argument(2) & ""&argument(3) & ""&argument(4) & ""&argument(5) & ""&argument(6) & ""&argument(7) & ""&argument(8) & eclat_gt(\$716\(32 to 47) & X"000" & X"0") & \$724_digs\ & ""&\$716\(48) & ""&\$716\(49) & eclat_false & eclat_false & "0000" & "0000" & "0000" & ""&\$716\(50) & ""&\$716\(51);
              rdy619 := eclat_true;
              \state%next\ <= compute620;
            end if;
          end if;
        end if;
      end case;\$v636%next\ <= \$v636\;
      \$806%next\ <= \$806\;
      \$v634%next\ <= \$v634\;
      \$v644%next\ <= \$v644\;
      \$v640%next\ <= \$v640\;
      \$v628%next\ <= \$v628\;
      \$875%next\ <= \$875\;
      \$773%next\ <= \$773\;
      \$805%next\ <= \$805\;
      \$v643%next\ <= \$v643\;
      \$v641%next\ <= \$v641\;
      \$803%next\ <= \$803\;
      \$911%next\ <= \$911\;
      \$v642%next\ <= \$v642\;
      \$v633%next\ <= \$v633\;
      \$v649%next\ <= \$v649\;
      \$v631%next\ <= \$v631\;
      \$v639%next\ <= \$v639\;
      \$774%next\ <= \$774\;
      \$v630%next\ <= \$v630\;
      \$843%next\ <= \$843\;
      \$v626%next\ <= \$v626\;
      \$716%next\ <= \$716\;
      \$844%next\ <= \$844\;
      \result618%next\ <= result618;
      \$735%next\ <= \$735\;
      \$v635%next\ <= \$v635\;
      \$873%next\ <= \$873\;
      \$v637%next\ <= \$v637\;
      \$841%next\ <= \$841\;
      \$v622%next\ <= \$v622\;
      \$874%next\ <= \$874\;
      \$v625%next\ <= \$v625\;
      \$v621%next\ <= \$v621\;
      \$v627%next\ <= \$v627\;
      \$912%next\ <= \$912\;
      \$v650%next\ <= \$v650\;
      \$804%next\ <= \$804\;
      \$v647%next\ <= \$v647\;
      \$724_digs%next\ <= \$724_digs\;
      \$734%next\ <= \$734\;
      \$910%next\ <= \$910\;
      \$v624%next\ <= \$v624\;
      \$736%next\ <= \$736\;
      \$772%next\ <= \$772\;
      \$913%next\ <= \$913\;
      \$872%next\ <= \$872\;
      \$842%next\ <= \$842\;
      \$v623%next\ <= \$v623\;
      \$775%next\ <= \$775\;
      \$v648%next\ <= \$v648\;
      \$v646%next\ <= \$v646\;
      \$v632%next\ <= \$v632\;
      \rdy619%next\ <= rdy619;
      \$v645%next\ <= \$v645\;
      \$v638%next\ <= \$v638\;
      \$v629%next\ <= \$v629\;
      \$737%next\ <= \$737\;
      
      
      result <= result618;
      rdy <= rdy619;
      end if;
    end process;
  end architecture;
