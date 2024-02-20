-- code generated from the following source code:
--   ../adrien/exists.ecl
--
-- with the following command:
--
--    ./eclat ../adrien/exists.ecl

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.runtime.all;


entity main is
  
  port(signal clk    : in std_logic;
       signal reset  : in std_logic;
       signal run    : in std_logic;
       signal rdy    : out value(0 to 0);
       signal argument : in value(0 to 0);
       signal result : out value(0 to 1));
       
end entity;
architecture rtl of main is

  type t_state is (compute93);
  signal state: t_state;
  type t_state_var246 is (compute206, pause_getI210, pause_getII211, pause_setI207, q_wait208, q_wait212);
  signal state_var246: t_state_var246;
  type t_state_var245 is (compute216, pause_getI220, pause_getII221, pause_setI217, q_wait218, q_wait222);
  signal state_var245: t_state_var245;
  type t_state_var244 is (compute103, pause_getI104, pause_getII105, q_wait106);
  signal state_var244: t_state_var244;
  type t_state_var243 is (compute115, pause_getI116, pause_getII117, q_wait118);
  signal state_var243: t_state_var243;
  type t_state_var242 is (compute127, pause_getI128, pause_getII129, q_wait130);
  signal state_var242: t_state_var242;
  type t_state_var241 is (compute139, pause_getI140, pause_getII141, q_wait142);
  signal state_var241: t_state_var241;
  type t_state_var240 is (compute151, pause_getI152, pause_getII153, q_wait154);
  signal state_var240: t_state_var240;
  type t_state_var239 is (compute163, pause_getI164, pause_getII165, q_wait166);
  signal state_var239: t_state_var239;
  type t_state_var238 is (compute175, pause_getI176, pause_getII177, q_wait178);
  signal state_var238: t_state_var238;
  type t_state_var237 is (compute182, pause_getI183, pause_getII184, q_wait185);
  signal state_var237: t_state_var237;
  type t_state_var236 is (compute170, par187);
  signal state_var236: t_state_var236;
  type t_state_var235 is (compute158, par189);
  signal state_var235: t_state_var235;
  type t_state_var234 is (compute146, par191);
  signal state_var234: t_state_var234;
  type t_state_var233 is (compute134, par193);
  signal state_var233: t_state_var233;
  type t_state_var232 is (compute122, par195);
  signal state_var232: t_state_var232;
  type t_state_var231 is (compute110, par197);
  signal state_var231: t_state_var231;
  type t_state_var230 is (compute96, \$31_loop\, \loop\, par199, par224);
  signal state_var230: t_state_var230;
  type array_value_32 is array (natural range <>) of value(0 to 31);
  signal tab : array_value_32(0 to 127) := (others => X"000000" & X"64"); 
  signal \$tab_value\ : value(0 to 31);
  signal \$tab_ptr\ : natural range 0 to 127;
  signal \$tab_ptr_write\ : natural range 0 to 127;
  signal \$tab_write\ : value(0 to 31);
  signal \$tab_write_request\ : std_logic := '0';
  
  begin
    process (clk)
            begin
            if (rising_edge(clk)) then
                  if \$tab_write_request\ = '1' then
                    tab(\$tab_ptr_write\) <= \$tab_write\;
                  else
                   \$tab_value\ <= tab(\$tab_ptr\);
                  end if;
            end if;
        end process;
    
    process(clk)
      variable result120 : value(0 to 5) := (others => '0');
      variable result91, result168 : value(0 to 1) := (others => '0');
      variable \$v65\ : value(0 to 7) := (others => '0');
      variable result108 : value(0 to 6) := (others => '0');
      variable result156 : value(0 to 2) := (others => '0');
      variable result132 : value(0 to 4) := (others => '0');
      variable result144 : value(0 to 3) := (others => '0');
      variable rdy162, \$v98\, \$v200\, result149, \$v225\, result204, 
               \$v76_init_done\, \$v107\, \$v188\, \$v223\, result161, 
               \$v196\, \$31_loop_result\, \$v167\, rdy181, \$v194\, \$v190\, 
               rdy114, b, \$v192\, result94, result101, result214, rdy133, 
               \$v219\, rdy109, \$v131\, \$v143\, \$v186\, result173, rdy92, 
               rdy102, \$v198\, result113, result125, \$v226\, result180, 
               \$v201\, \$v228\, \$v119\, \$v209\, rdy205, \$v213\, \$v97\, 
               rdy157, rdy150, rdy95, \$v229\, rdy126, rdy169, rdy138, 
               \$v155\, rdy174, loop_result, rdy121, rdy145, rdy215, \$v179\, 
               result137 : value(0 to 0) := (others => '0');
      variable \$46\, \$40\, \$48\, \$42\, \$49\, c, \$44\, \$v76\, \$38\, 
               \$v19\, loop_arg, \$31_loop_arg\ : value(0 to 31) := (others => '0');
      variable \$tab_ptr_take\ : value(0 to 0) := "0";
      variable \$tab_ptr_write_take\ : value(0 to 0) := "0";
      
    begin
      
      if rising_edge(clk) then
        if (reset = '1') then
          default_zero(result137); default_zero(\$v179\); 
          default_zero(rdy215); default_zero(\$v65\); default_zero(rdy145); 
          default_zero(\$31_loop_arg\); default_zero(rdy121); 
          default_zero(loop_result); default_zero(loop_arg); 
          default_zero(rdy174); default_zero(\$v155\); default_zero(rdy138); 
          default_zero(rdy169); default_zero(rdy126); default_zero(\$v229\); 
          default_zero(rdy95); default_zero(rdy150); default_zero(\$v19\); 
          default_zero(\$38\); default_zero(result156); default_zero(rdy157); 
          default_zero(\$v97\); default_zero(\$v76\); default_zero(\$v213\); 
          default_zero(rdy205); default_zero(\$v209\); default_zero(\$v119\); 
          default_zero(result144); default_zero(\$v228\); 
          default_zero(\$44\); default_zero(\$v201\); 
          default_zero(result168); default_zero(result180); 
          default_zero(\$v226\); default_zero(result125); 
          default_zero(result113); default_zero(\$v198\); 
          default_zero(result120); default_zero(rdy102); default_zero(rdy92); 
          default_zero(result173); default_zero(\$v186\); 
          default_zero(result132); default_zero(\$v143\); 
          default_zero(\$v131\); default_zero(rdy109); default_zero(c); 
          default_zero(\$v219\); default_zero(\$49\); default_zero(rdy133); 
          default_zero(result214); default_zero(result91); 
          default_zero(result101); default_zero(result94); 
          default_zero(\$v192\); default_zero(b); default_zero(rdy114); 
          default_zero(\$v190\); default_zero(\$v194\); default_zero(\$42\); 
          default_zero(rdy181); default_zero(\$v167\); 
          default_zero(\$31_loop_result\); default_zero(\$48\); 
          default_zero(\$v196\); default_zero(\$40\); 
          default_zero(result161); default_zero(\$46\); 
          default_zero(\$v223\); default_zero(\$v188\); 
          default_zero(\$v107\); default_zero(\$v76_init_done\); 
          default_zero(result204); default_zero(\$v225\); 
          default_zero(result149); default_zero(result108); 
          default_zero(\$v200\); default_zero(\$v98\); default_zero(rdy162); 
          rdy <= "1";
          rdy92 := "0";
          state <= compute93;
          state_var246 <= compute206;
          state_var245 <= compute216;
          state_var244 <= compute103;
          state_var243 <= compute115;
          state_var242 <= compute127;
          state_var241 <= compute139;
          state_var240 <= compute151;
          state_var239 <= compute163;
          state_var238 <= compute175;
          state_var237 <= compute182;
          state_var236 <= compute170;
          state_var235 <= compute158;
          state_var234 <= compute146;
          state_var233 <= compute134;
          state_var232 <= compute122;
          state_var231 <= compute110;
          state_var230 <= compute96;
          
        else if run = '1' then
          case state is
          when compute93 =>
            rdy92 := eclat_false;
            \$v229\ := eclat_not(\$v76_init_done\);
            if \$v229\(0) = '1' then
              \$v76\ := X"0000000" & X"0";
              \$v76_init_done\ := eclat_true;
            end if;
            \$v76\ := eclat_add(\$v76\ & X"0000000" & X"1");
            c := \$v76\;
            case state_var230 is
            when \$31_loop\ =>
              \$v226\ := eclat_ge(\$31_loop_arg\ & eclat_sub(std_logic_vector(to_unsigned(tab'length,32)) & X"0000000" & X"1"));
              if \$v226\(0) = '1' then
                \$31_loop_result\ := eclat_unit;
                eclat_print_string(of_string("cy:"));
                
                eclat_print_int(c);
                
                eclat_print_newline(eclat_unit);
                
                loop_arg := X"0000000" & X"0";
                state_var230 <= \loop\;
              else
                rdy205 := eclat_false;
                \$v213\ := \$tab_ptr_take\;
                if \$v213\(0) = '1' then
                  state_var246 <= q_wait212;
                else
                  \$tab_ptr_take\(0) := '1';
                  \$tab_ptr\ <= to_integer(unsigned(\$31_loop_arg\));
                  state_var246 <= pause_getI210;
                  state_var246 <= pause_getI210;
                end if;
                rdy215 := eclat_false;
                \$v223\ := \$tab_ptr_take\;
                if \$v223\(0) = '1' then
                  state_var245 <= q_wait222;
                else
                  \$tab_ptr_take\(0) := '1';
                  \$tab_ptr\ <= to_integer(unsigned(eclat_add(\$31_loop_arg\ & X"0000000" & X"1")));
                  state_var245 <= pause_getI220;
                  state_var245 <= pause_getI220;
                end if;
                state_var230 <= par224;
              end if;
            when \loop\ =>
              \$v201\ := eclat_ge(loop_arg & eclat_sub(std_logic_vector(to_unsigned(tab'length,32)) & X"0000000" & X"7"));
              if \$v201\(0) = '1' then
                loop_result := eclat_false;
                b := loop_result;
                \$v97\ := b;
                if \$v97\(0) = '1' then
                  eclat_print_string(of_string("true"));
                  
                  eclat_print_newline(eclat_unit);
                  
                  result94 := eclat_unit;
                  rdy95 := eclat_true;
                  state_var230 <= compute96;
                else
                  eclat_print_string(of_string("false"));
                  
                  eclat_print_newline(eclat_unit);
                  
                  result94 := eclat_unit;
                  rdy95 := eclat_true;
                  state_var230 <= compute96;
                end if;
              else
                rdy102 := eclat_false;
                \$v107\ := \$tab_ptr_take\;
                if \$v107\(0) = '1' then
                  state_var244 <= q_wait106;
                else
                  \$tab_ptr_take\(0) := '1';
                  \$tab_ptr\ <= to_integer(unsigned(loop_arg));
                  state_var244 <= pause_getI104;
                  state_var244 <= pause_getI104;
                end if;
                rdy109 := eclat_false;
                rdy114 := eclat_false;
                \$v119\ := \$tab_ptr_take\;
                if \$v119\(0) = '1' then
                  state_var243 <= q_wait118;
                else
                  \$tab_ptr_take\(0) := '1';
                  \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"1")));
                  state_var243 <= pause_getI116;
                  state_var243 <= pause_getI116;
                end if;
                rdy121 := eclat_false;
                rdy126 := eclat_false;
                \$v131\ := \$tab_ptr_take\;
                if \$v131\(0) = '1' then
                  state_var242 <= q_wait130;
                else
                  \$tab_ptr_take\(0) := '1';
                  \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"2")));
                  state_var242 <= pause_getI128;
                  state_var242 <= pause_getI128;
                end if;
                rdy133 := eclat_false;
                rdy138 := eclat_false;
                \$v143\ := \$tab_ptr_take\;
                if \$v143\(0) = '1' then
                  state_var241 <= q_wait142;
                else
                  \$tab_ptr_take\(0) := '1';
                  \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"3")));
                  state_var241 <= pause_getI140;
                  state_var241 <= pause_getI140;
                end if;
                rdy145 := eclat_false;
                rdy150 := eclat_false;
                \$v155\ := \$tab_ptr_take\;
                if \$v155\(0) = '1' then
                  state_var240 <= q_wait154;
                else
                  \$tab_ptr_take\(0) := '1';
                  \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"4")));
                  state_var240 <= pause_getI152;
                  state_var240 <= pause_getI152;
                end if;
                rdy157 := eclat_false;
                rdy162 := eclat_false;
                \$v167\ := \$tab_ptr_take\;
                if \$v167\(0) = '1' then
                  state_var239 <= q_wait166;
                else
                  \$tab_ptr_take\(0) := '1';
                  \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"5")));
                  state_var239 <= pause_getI164;
                  state_var239 <= pause_getI164;
                end if;
                rdy169 := eclat_false;
                rdy174 := eclat_false;
                \$v179\ := \$tab_ptr_take\;
                if \$v179\(0) = '1' then
                  state_var238 <= q_wait178;
                else
                  \$tab_ptr_take\(0) := '1';
                  \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"6")));
                  state_var238 <= pause_getI176;
                  state_var238 <= pause_getI176;
                end if;
                rdy181 := eclat_false;
                \$v186\ := \$tab_ptr_take\;
                if \$v186\(0) = '1' then
                  state_var237 <= q_wait185;
                else
                  \$tab_ptr_take\(0) := '1';
                  \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"7")));
                  state_var237 <= pause_getI183;
                  state_var237 <= pause_getI183;
                end if;
                state_var236 <= par187;
                state_var235 <= par189;
                state_var234 <= par191;
                state_var233 <= par193;
                state_var232 <= par195;
                state_var231 <= par197;
                state_var230 <= par199;
              end if;
            when par199 =>
              case state_var244 is
              when pause_getI104 =>
                \$tab_ptr_take\(0) := '0';
                state_var244 <= pause_getII105;
              when pause_getII105 =>
                \$49\ := \$tab_value\;
                result101 := eclat_eq(\$49\ & X"0000000" & X"1");
                rdy102 := eclat_true;
                state_var244 <= compute103;
              when q_wait106 =>
                \$v107\ := \$tab_ptr_take\;
                if \$v107\(0) = '1' then
                  state_var244 <= q_wait106;
                else
                  \$tab_ptr_take\(0) := '1';
                  \$tab_ptr\ <= to_integer(unsigned(loop_arg));
                  state_var244 <= pause_getI104;
                  state_var244 <= pause_getI104;
                end if;
              when compute103 =>
                
              end case;
              case state_var231 is
              when par197 =>
                case state_var243 is
                when pause_getI116 =>
                  \$tab_ptr_take\(0) := '0';
                  state_var243 <= pause_getII117;
                when pause_getII117 =>
                  \$48\ := \$tab_value\;
                  result113 := eclat_eq(\$48\ & X"0000000" & X"1");
                  rdy114 := eclat_true;
                  state_var243 <= compute115;
                when q_wait118 =>
                  \$v119\ := \$tab_ptr_take\;
                  if \$v119\(0) = '1' then
                    state_var243 <= q_wait118;
                  else
                    \$tab_ptr_take\(0) := '1';
                    \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"1")));
                    state_var243 <= pause_getI116;
                    state_var243 <= pause_getI116;
                  end if;
                when compute115 =>
                  
                end case;
                case state_var232 is
                when par195 =>
                  case state_var242 is
                  when pause_getI128 =>
                    \$tab_ptr_take\(0) := '0';
                    state_var242 <= pause_getII129;
                  when pause_getII129 =>
                    \$46\ := \$tab_value\;
                    result125 := eclat_eq(\$46\ & X"0000000" & X"1");
                    rdy126 := eclat_true;
                    state_var242 <= compute127;
                  when q_wait130 =>
                    \$v131\ := \$tab_ptr_take\;
                    if \$v131\(0) = '1' then
                      state_var242 <= q_wait130;
                    else
                      \$tab_ptr_take\(0) := '1';
                      \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"2")));
                      state_var242 <= pause_getI128;
                      state_var242 <= pause_getI128;
                    end if;
                  when compute127 =>
                    
                  end case;
                  case state_var233 is
                  when par193 =>
                    case state_var241 is
                    when pause_getI140 =>
                      \$tab_ptr_take\(0) := '0';
                      state_var241 <= pause_getII141;
                    when pause_getII141 =>
                      \$44\ := \$tab_value\;
                      result137 := eclat_eq(\$44\ & X"0000000" & X"1");
                      rdy138 := eclat_true;
                      state_var241 <= compute139;
                    when q_wait142 =>
                      \$v143\ := \$tab_ptr_take\;
                      if \$v143\(0) = '1' then
                        state_var241 <= q_wait142;
                      else
                        \$tab_ptr_take\(0) := '1';
                        \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"3")));
                        state_var241 <= pause_getI140;
                        state_var241 <= pause_getI140;
                      end if;
                    when compute139 =>
                      
                    end case;
                    case state_var234 is
                    when par191 =>
                      case state_var240 is
                      when pause_getI152 =>
                        \$tab_ptr_take\(0) := '0';
                        state_var240 <= pause_getII153;
                      when pause_getII153 =>
                        \$42\ := \$tab_value\;
                        result149 := eclat_eq(\$42\ & X"0000000" & X"1");
                        rdy150 := eclat_true;
                        state_var240 <= compute151;
                      when q_wait154 =>
                        \$v155\ := \$tab_ptr_take\;
                        if \$v155\(0) = '1' then
                          state_var240 <= q_wait154;
                        else
                          \$tab_ptr_take\(0) := '1';
                          \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"4")));
                          state_var240 <= pause_getI152;
                          state_var240 <= pause_getI152;
                        end if;
                      when compute151 =>
                        
                      end case;
                      case state_var235 is
                      when par189 =>
                        case state_var239 is
                        when pause_getI164 =>
                          \$tab_ptr_take\(0) := '0';
                          state_var239 <= pause_getII165;
                        when pause_getII165 =>
                          \$40\ := \$tab_value\;
                          result161 := eclat_eq(\$40\ & X"0000000" & X"1");
                          rdy162 := eclat_true;
                          state_var239 <= compute163;
                        when q_wait166 =>
                          \$v167\ := \$tab_ptr_take\;
                          if \$v167\(0) = '1' then
                            state_var239 <= q_wait166;
                          else
                            \$tab_ptr_take\(0) := '1';
                            \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"5")));
                            state_var239 <= pause_getI164;
                            state_var239 <= pause_getI164;
                          end if;
                        when compute163 =>
                          
                        end case;
                        case state_var236 is
                        when par187 =>
                          case state_var238 is
                          when pause_getI176 =>
                            \$tab_ptr_take\(0) := '0';
                            state_var238 <= pause_getII177;
                          when pause_getII177 =>
                            \$38\ := \$tab_value\;
                            result173 := eclat_eq(\$38\ & X"0000000" & X"1");
                            rdy174 := eclat_true;
                            state_var238 <= compute175;
                          when q_wait178 =>
                            \$v179\ := \$tab_ptr_take\;
                            if \$v179\(0) = '1' then
                              state_var238 <= q_wait178;
                            else
                              \$tab_ptr_take\(0) := '1';
                              \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"6")));
                              state_var238 <= pause_getI176;
                              state_var238 <= pause_getI176;
                            end if;
                          when compute175 =>
                            
                          end case;
                          case state_var237 is
                          when pause_getI183 =>
                            \$tab_ptr_take\(0) := '0';
                            state_var237 <= pause_getII184;
                          when pause_getII184 =>
                            \$v19\ := \$tab_value\;
                            result180 := eclat_eq(\$v19\ & X"0000000" & X"1");
                            rdy181 := eclat_true;
                            state_var237 <= compute182;
                          when q_wait185 =>
                            \$v186\ := \$tab_ptr_take\;
                            if \$v186\(0) = '1' then
                              state_var237 <= q_wait185;
                            else
                              \$tab_ptr_take\(0) := '1';
                              \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"7")));
                              state_var237 <= pause_getI183;
                              state_var237 <= pause_getI183;
                            end if;
                          when compute182 =>
                            
                          end case;
                          \$v188\ := eclat_and(rdy174 & rdy181);
                          if \$v188\(0) = '1' then
                            result168 := result173 & result180;
                            rdy169 := eclat_true;
                            state_var236 <= compute170;
                          else
                            state_var236 <= par187;
                          end if;
                        when compute170 =>
                          
                        end case;
                        \$v190\ := eclat_and(rdy162 & rdy169);
                        if \$v190\(0) = '1' then
                          result156 := result161 & result168;
                          rdy157 := eclat_true;
                          state_var235 <= compute158;
                        else
                          state_var235 <= par189;
                        end if;
                      when compute158 =>
                        
                      end case;
                      \$v192\ := eclat_and(rdy150 & rdy157);
                      if \$v192\(0) = '1' then
                        result144 := result149 & result156;
                        rdy145 := eclat_true;
                        state_var234 <= compute146;
                      else
                        state_var234 <= par191;
                      end if;
                    when compute146 =>
                      
                    end case;
                    \$v194\ := eclat_and(rdy138 & rdy145);
                    if \$v194\(0) = '1' then
                      result132 := result137 & result144;
                      rdy133 := eclat_true;
                      state_var233 <= compute134;
                    else
                      state_var233 <= par193;
                    end if;
                  when compute134 =>
                    
                  end case;
                  \$v196\ := eclat_and(rdy126 & rdy133);
                  if \$v196\(0) = '1' then
                    result120 := result125 & result132;
                    rdy121 := eclat_true;
                    state_var232 <= compute122;
                  else
                    state_var232 <= par195;
                  end if;
                when compute122 =>
                  
                end case;
                \$v198\ := eclat_and(rdy114 & rdy121);
                if \$v198\(0) = '1' then
                  result108 := result113 & result120;
                  rdy109 := eclat_true;
                  state_var231 <= compute110;
                else
                  state_var231 <= par197;
                end if;
              when compute110 =>
                
              end case;
              \$v200\ := eclat_and(rdy102 & rdy109);
              if \$v200\(0) = '1' then
                \$v65\ := result101 & result108;
                \$v98\ := eclat_if(""&\$v65\(0) & eclat_true & eclat_if(""&\$v65\(1) & eclat_true & 
                                                               eclat_if(""&\$v65\(2) & eclat_true & 
                                                               eclat_if(""&\$v65\(3) & eclat_true & 
                                                               eclat_if(""&\$v65\(4) & eclat_true & 
                                                               eclat_if(""&\$v65\(5) & eclat_true & 
                                                               eclat_if(""&\$v65\(6) & eclat_true & ""&\$v65\(7))))))));
                if \$v98\(0) = '1' then
                  loop_result := eclat_true;
                  b := loop_result;
                  \$v97\ := b;
                  if \$v97\(0) = '1' then
                    eclat_print_string(of_string("true"));
                    
                    eclat_print_newline(eclat_unit);
                    
                    result94 := eclat_unit;
                    rdy95 := eclat_true;
                    state_var230 <= compute96;
                  else
                    eclat_print_string(of_string("false"));
                    
                    eclat_print_newline(eclat_unit);
                    
                    result94 := eclat_unit;
                    rdy95 := eclat_true;
                    state_var230 <= compute96;
                  end if;
                else
                  loop_arg := eclat_add(loop_arg & X"0000000" & X"8");
                  state_var230 <= \loop\;
                end if;
              else
                state_var230 <= par199;
              end if;
            when par224 =>
              case state_var246 is
              when pause_getI210 =>
                \$tab_ptr_take\(0) := '0';
                state_var246 <= pause_getII211;
              when pause_getII211 =>
                \$v209\ := \$tab_ptr_write_take\;
                if \$v209\(0) = '1' then
                  state_var246 <= q_wait208;
                else
                  \$tab_ptr_write_take\(0) := '1';
                  \$tab_ptr_write\ <= to_integer(unsigned(\$31_loop_arg\));
                  \$tab_write_request\ <= '1';
                  \$tab_write\ <= eclat_mult(X"0000000" & X"2" & \$31_loop_arg\);
                  state_var246 <= pause_setI207;
                end if;
              when pause_setI207 =>
                \$tab_ptr_write_take\(0) := '0';
                \$tab_write_request\ <= '0';
                result204 := eclat_unit;
                rdy205 := eclat_true;
                state_var246 <= compute206;
              when q_wait208 =>
                \$v209\ := \$tab_ptr_write_take\;
                if \$v209\(0) = '1' then
                  state_var246 <= q_wait208;
                else
                  \$tab_ptr_write_take\(0) := '1';
                  \$tab_ptr_write\ <= to_integer(unsigned(\$31_loop_arg\));
                  \$tab_write_request\ <= '1';
                  \$tab_write\ <= eclat_mult(X"0000000" & X"2" & \$31_loop_arg\);
                  state_var246 <= pause_setI207;
                end if;
              when q_wait212 =>
                \$v213\ := \$tab_ptr_take\;
                if \$v213\(0) = '1' then
                  state_var246 <= q_wait212;
                else
                  \$tab_ptr_take\(0) := '1';
                  \$tab_ptr\ <= to_integer(unsigned(\$31_loop_arg\));
                  state_var246 <= pause_getI210;
                  state_var246 <= pause_getI210;
                end if;
              when compute206 =>
                
              end case;
              case state_var245 is
              when pause_getI220 =>
                \$tab_ptr_take\(0) := '0';
                state_var245 <= pause_getII221;
              when pause_getII221 =>
                \$v219\ := \$tab_ptr_write_take\;
                if \$v219\(0) = '1' then
                  state_var245 <= q_wait218;
                else
                  \$tab_ptr_write_take\(0) := '1';
                  \$tab_ptr_write\ <= to_integer(unsigned(eclat_add(\$31_loop_arg\ & X"0000000" & X"1")));
                  \$tab_write_request\ <= '1';
                  \$tab_write\ <= eclat_mult(X"0000000" & X"2" & eclat_add(\$31_loop_arg\ & X"0000000" & X"1"));
                  state_var245 <= pause_setI217;
                end if;
              when pause_setI217 =>
                \$tab_ptr_write_take\(0) := '0';
                \$tab_write_request\ <= '0';
                result214 := eclat_unit;
                rdy215 := eclat_true;
                state_var245 <= compute216;
              when q_wait218 =>
                \$v219\ := \$tab_ptr_write_take\;
                if \$v219\(0) = '1' then
                  state_var245 <= q_wait218;
                else
                  \$tab_ptr_write_take\(0) := '1';
                  \$tab_ptr_write\ <= to_integer(unsigned(eclat_add(\$31_loop_arg\ & X"0000000" & X"1")));
                  \$tab_write_request\ <= '1';
                  \$tab_write\ <= eclat_mult(X"0000000" & X"2" & eclat_add(\$31_loop_arg\ & X"0000000" & X"1"));
                  state_var245 <= pause_setI217;
                end if;
              when q_wait222 =>
                \$v223\ := \$tab_ptr_take\;
                if \$v223\(0) = '1' then
                  state_var245 <= q_wait222;
                else
                  \$tab_ptr_take\(0) := '1';
                  \$tab_ptr\ <= to_integer(unsigned(eclat_add(\$31_loop_arg\ & X"0000000" & X"1")));
                  state_var245 <= pause_getI220;
                  state_var245 <= pause_getI220;
                end if;
              when compute216 =>
                
              end case;
              \$v225\ := eclat_and(rdy205 & rdy215);
              if \$v225\(0) = '1' then
                \$31_loop_arg\ := eclat_add(\$31_loop_arg\ & X"0000000" & X"2");
                state_var230 <= \$31_loop\;
              else
                state_var230 <= par224;
              end if;
            when compute96 =>
              rdy95 := eclat_false;
              eclat_print_string(of_string("cy:"));
              
              eclat_print_int(c);
              
              eclat_print_newline(eclat_unit);
              
              \$31_loop_arg\ := X"0000000" & X"0";
              state_var230 <= \$31_loop\;
            end case;
            \$v228\ := eclat_not(rdy95);
            if \$v228\(0) = '1' then
              result94 := eclat_unit;
            end if;
            result91 := result94 & rdy95;
            rdy92 := eclat_true;
            state <= compute93;
          end case;
          
          result <= result91;
          rdy <= rdy92;
          
        end if;
      end if;
    end if;
  end process;
end architecture;
