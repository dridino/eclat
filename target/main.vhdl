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

  type t_state is (compute141);
  signal state: t_state;
  type t_state_var294 is (compute254, pause_getI258, pause_getII259, pause_setI255, q_wait256, q_wait260);
  signal state_var294: t_state_var294;
  type t_state_var293 is (compute264, pause_getI268, pause_getII269, pause_setI265, q_wait266, q_wait270);
  signal state_var293: t_state_var293;
  type t_state_var292 is (compute151, pause_getI152, pause_getII153, q_wait154);
  signal state_var292: t_state_var292;
  type t_state_var291 is (compute163, pause_getI164, pause_getII165, q_wait166);
  signal state_var291: t_state_var291;
  type t_state_var290 is (compute175, pause_getI176, pause_getII177, q_wait178);
  signal state_var290: t_state_var290;
  type t_state_var289 is (compute187, pause_getI188, pause_getII189, q_wait190);
  signal state_var289: t_state_var289;
  type t_state_var288 is (compute199, pause_getI200, pause_getII201, q_wait202);
  signal state_var288: t_state_var288;
  type t_state_var287 is (compute211, pause_getI212, pause_getII213, q_wait214);
  signal state_var287: t_state_var287;
  type t_state_var286 is (compute223, pause_getI224, pause_getII225, q_wait226);
  signal state_var286: t_state_var286;
  type t_state_var285 is (compute230, pause_getI231, pause_getII232, q_wait233);
  signal state_var285: t_state_var285;
  type t_state_var284 is (compute218, par235);
  signal state_var284: t_state_var284;
  type t_state_var283 is (compute206, par237);
  signal state_var283: t_state_var283;
  type t_state_var282 is (compute194, par239);
  signal state_var282: t_state_var282;
  type t_state_var281 is (compute182, par241);
  signal state_var281: t_state_var281;
  type t_state_var280 is (compute170, par243);
  signal state_var280: t_state_var280;
  type t_state_var279 is (compute158, par245);
  signal state_var279: t_state_var279;
  type t_state_var278 is (compute144, \$31_loop\, \loop\, par247, par272);
  signal state_var278: t_state_var278;
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
      variable result139 : value(0 to 1) := (others => '0');
      variable result204 : value(0 to 95) := (others => '0');
      variable result168 : value(0 to 191) := (others => '0');
      variable result216 : value(0 to 63) := (others => '0');
      variable result180 : value(0 to 159) := (others => '0');
      variable \$v90\ : value(0 to 255) := (others => '0');
      variable result156 : value(0 to 223) := (others => '0');
      variable result192 : value(0 to 127) := (others => '0');
      variable rdy162, \$v203\, \$v238\, rdy143, rdy253, \$v246\, \$v248\, 
               rdy229, \$v276\, \$v242\, \$v274\, rdy140, \$v249\, rdy210, 
               \$v234\, rdy193, \$31_loop_result\, \$v167\, rdy181, \$v215\, 
               result142, rdy186, \$v244\, \$v277\, \$v271\, \$v191\, rdy198, 
               rdy217, result252, \$v101_init_done\, rdy222, rdy263, rdy205, 
               \$v240\, \$v267\, rdy157, \$v236\, rdy150, \$v145\, rdy169, 
               \$v146\, \$v273\, \$v155\, rdy174, \$v261\, result262, 
               \$v227\, \$v257\, \$v179\ : value(0 to 0) := (others => '0');
      variable result149, result185, \$46\, result161, \$40\, \$48\, \$42\, 
               b, \$49\, \$v101\, c, result197, result209, result228, 
               result173, \$44\, \$38\, loop_arg, \$v35\, loop_result, 
               \$31_loop_arg\, result221 : value(0 to 31) := (others => '0');
      variable \$tab_ptr_take\ : value(0 to 0) := "0";
      variable \$tab_ptr_write_take\ : value(0 to 0) := "0";
      
    begin
      
      if rising_edge(clk) then
        if (reset = '1') then
          default_zero(\$v90\); default_zero(result221); 
          default_zero(\$v179\); default_zero(\$v257\); 
          default_zero(\$v227\); default_zero(\$31_loop_arg\); 
          default_zero(result262); default_zero(loop_result); 
          default_zero(\$v35\); default_zero(\$v261\); 
          default_zero(loop_arg); default_zero(rdy174); 
          default_zero(\$v155\); default_zero(\$v273\); 
          default_zero(\$v146\); default_zero(result216); 
          default_zero(rdy169); default_zero(\$v145\); default_zero(rdy150); 
          default_zero(\$v236\); default_zero(\$38\); 
          default_zero(result156); default_zero(rdy157); 
          default_zero(\$v267\); default_zero(\$v240\); default_zero(rdy205); 
          default_zero(rdy263); default_zero(rdy222); 
          default_zero(\$v101_init_done\); default_zero(result252); 
          default_zero(rdy217); default_zero(\$44\); default_zero(result168); 
          default_zero(result180); default_zero(rdy198); 
          default_zero(\$v191\); default_zero(result192); 
          default_zero(result173); default_zero(result228); 
          default_zero(result209); default_zero(result197); 
          default_zero(\$v271\); default_zero(c); default_zero(\$v101\); 
          default_zero(\$49\); default_zero(\$v277\); default_zero(\$v244\); 
          default_zero(rdy186); default_zero(b); default_zero(result142); 
          default_zero(result139); default_zero(\$42\); 
          default_zero(\$v215\); default_zero(rdy181); default_zero(\$v167\); 
          default_zero(\$31_loop_result\); default_zero(\$48\); 
          default_zero(rdy193); default_zero(\$40\); default_zero(result161); 
          default_zero(\$46\); default_zero(result185); 
          default_zero(\$v234\); default_zero(rdy210); default_zero(\$v249\); 
          default_zero(rdy140); default_zero(\$v274\); default_zero(\$v242\); 
          default_zero(result204); default_zero(\$v276\); 
          default_zero(result149); default_zero(rdy229); 
          default_zero(\$v248\); default_zero(\$v246\); default_zero(rdy253); 
          default_zero(rdy143); default_zero(\$v238\); default_zero(\$v203\); 
          default_zero(rdy162); 
          rdy <= "1";
          rdy140 := "0";
          state <= compute141;
          state_var294 <= compute254;
          state_var293 <= compute264;
          state_var292 <= compute151;
          state_var291 <= compute163;
          state_var290 <= compute175;
          state_var289 <= compute187;
          state_var288 <= compute199;
          state_var287 <= compute211;
          state_var286 <= compute223;
          state_var285 <= compute230;
          state_var284 <= compute218;
          state_var283 <= compute206;
          state_var282 <= compute194;
          state_var281 <= compute182;
          state_var280 <= compute170;
          state_var279 <= compute158;
          state_var278 <= compute144;
          
        else if run = '1' then
          case state is
          when compute141 =>
            rdy140 := eclat_false;
            \$v277\ := eclat_not(\$v101_init_done\);
            if \$v277\(0) = '1' then
              \$v101\ := X"0000000" & X"0";
              \$v101_init_done\ := eclat_true;
            end if;
            \$v101\ := eclat_add(\$v101\ & X"0000000" & X"1");
            c := \$v101\;
            case state_var278 is
            when \$31_loop\ =>
              \$v274\ := eclat_ge(\$31_loop_arg\ & eclat_sub(std_logic_vector(to_unsigned(tab'length,32)) & X"0000000" & X"1"));
              if \$v274\(0) = '1' then
                \$31_loop_result\ := eclat_unit;
                eclat_print_string(of_string("cy:"));
                
                eclat_print_int(c);
                
                eclat_print_newline(eclat_unit);
                
                loop_arg := X"0000000" & X"0";
                state_var278 <= \loop\;
              else
                rdy253 := eclat_false;
                \$v261\ := \$tab_ptr_take\;
                if \$v261\(0) = '1' then
                  state_var294 <= q_wait260;
                else
                  \$tab_ptr_take\(0) := '1';
                  \$tab_ptr\ <= to_integer(unsigned(\$31_loop_arg\));
                  state_var294 <= pause_getI258;
                  state_var294 <= pause_getI258;
                end if;
                rdy263 := eclat_false;
                \$v271\ := \$tab_ptr_take\;
                if \$v271\(0) = '1' then
                  state_var293 <= q_wait270;
                else
                  \$tab_ptr_take\(0) := '1';
                  \$tab_ptr\ <= to_integer(unsigned(eclat_add(\$31_loop_arg\ & X"0000000" & X"1")));
                  state_var293 <= pause_getI268;
                  state_var293 <= pause_getI268;
                end if;
                state_var278 <= par272;
              end if;
            when \loop\ =>
              \$v249\ := eclat_ge(loop_arg & eclat_sub(std_logic_vector(to_unsigned(tab'length,32)) & X"0000000" & X"7"));
              if \$v249\(0) = '1' then
                loop_result := X"0000000" & X"0";
                b := loop_result;
                \$v145\ := eclat_eq(b & X"0000000" & X"1");
                if \$v145\(0) = '1' then
                  eclat_print_string(of_string("true"));
                  
                  eclat_print_newline(eclat_unit);
                  
                  result142 := eclat_unit;
                  rdy143 := eclat_true;
                  state_var278 <= compute144;
                else
                  eclat_print_string(of_string("false"));
                  
                  eclat_print_newline(eclat_unit);
                  
                  result142 := eclat_unit;
                  rdy143 := eclat_true;
                  state_var278 <= compute144;
                end if;
              else
                rdy150 := eclat_false;
                \$v155\ := \$tab_ptr_take\;
                if \$v155\(0) = '1' then
                  state_var292 <= q_wait154;
                else
                  \$tab_ptr_take\(0) := '1';
                  \$tab_ptr\ <= to_integer(unsigned(loop_arg));
                  state_var292 <= pause_getI152;
                  state_var292 <= pause_getI152;
                end if;
                rdy157 := eclat_false;
                rdy162 := eclat_false;
                \$v167\ := \$tab_ptr_take\;
                if \$v167\(0) = '1' then
                  state_var291 <= q_wait166;
                else
                  \$tab_ptr_take\(0) := '1';
                  \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"1")));
                  state_var291 <= pause_getI164;
                  state_var291 <= pause_getI164;
                end if;
                rdy169 := eclat_false;
                rdy174 := eclat_false;
                \$v179\ := \$tab_ptr_take\;
                if \$v179\(0) = '1' then
                  state_var290 <= q_wait178;
                else
                  \$tab_ptr_take\(0) := '1';
                  \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"2")));
                  state_var290 <= pause_getI176;
                  state_var290 <= pause_getI176;
                end if;
                rdy181 := eclat_false;
                rdy186 := eclat_false;
                \$v191\ := \$tab_ptr_take\;
                if \$v191\(0) = '1' then
                  state_var289 <= q_wait190;
                else
                  \$tab_ptr_take\(0) := '1';
                  \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"3")));
                  state_var289 <= pause_getI188;
                  state_var289 <= pause_getI188;
                end if;
                rdy193 := eclat_false;
                rdy198 := eclat_false;
                \$v203\ := \$tab_ptr_take\;
                if \$v203\(0) = '1' then
                  state_var288 <= q_wait202;
                else
                  \$tab_ptr_take\(0) := '1';
                  \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"4")));
                  state_var288 <= pause_getI200;
                  state_var288 <= pause_getI200;
                end if;
                rdy205 := eclat_false;
                rdy210 := eclat_false;
                \$v215\ := \$tab_ptr_take\;
                if \$v215\(0) = '1' then
                  state_var287 <= q_wait214;
                else
                  \$tab_ptr_take\(0) := '1';
                  \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"5")));
                  state_var287 <= pause_getI212;
                  state_var287 <= pause_getI212;
                end if;
                rdy217 := eclat_false;
                rdy222 := eclat_false;
                \$v227\ := \$tab_ptr_take\;
                if \$v227\(0) = '1' then
                  state_var286 <= q_wait226;
                else
                  \$tab_ptr_take\(0) := '1';
                  \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"6")));
                  state_var286 <= pause_getI224;
                  state_var286 <= pause_getI224;
                end if;
                rdy229 := eclat_false;
                \$v234\ := \$tab_ptr_take\;
                if \$v234\(0) = '1' then
                  state_var285 <= q_wait233;
                else
                  \$tab_ptr_take\(0) := '1';
                  \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"7")));
                  state_var285 <= pause_getI231;
                  state_var285 <= pause_getI231;
                end if;
                state_var284 <= par235;
                state_var283 <= par237;
                state_var282 <= par239;
                state_var281 <= par241;
                state_var280 <= par243;
                state_var279 <= par245;
                state_var278 <= par247;
              end if;
            when par247 =>
              case state_var292 is
              when pause_getI152 =>
                \$tab_ptr_take\(0) := '0';
                state_var292 <= pause_getII153;
              when pause_getII153 =>
                \$49\ := \$tab_value\;
                result149 := eclat_if(eclat_eq(\$49\ & X"0000000" & X"1") & X"0000000" & X"1" & X"0000000" & X"0");
                rdy150 := eclat_true;
                state_var292 <= compute151;
              when q_wait154 =>
                \$v155\ := \$tab_ptr_take\;
                if \$v155\(0) = '1' then
                  state_var292 <= q_wait154;
                else
                  \$tab_ptr_take\(0) := '1';
                  \$tab_ptr\ <= to_integer(unsigned(loop_arg));
                  state_var292 <= pause_getI152;
                  state_var292 <= pause_getI152;
                end if;
              when compute151 =>
                
              end case;
              case state_var279 is
              when par245 =>
                case state_var291 is
                when pause_getI164 =>
                  \$tab_ptr_take\(0) := '0';
                  state_var291 <= pause_getII165;
                when pause_getII165 =>
                  \$48\ := \$tab_value\;
                  result161 := eclat_if(eclat_eq(\$48\ & X"0000000" & X"1") & X"0000000" & X"1" & X"0000000" & X"0");
                  rdy162 := eclat_true;
                  state_var291 <= compute163;
                when q_wait166 =>
                  \$v167\ := \$tab_ptr_take\;
                  if \$v167\(0) = '1' then
                    state_var291 <= q_wait166;
                  else
                    \$tab_ptr_take\(0) := '1';
                    \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"1")));
                    state_var291 <= pause_getI164;
                    state_var291 <= pause_getI164;
                  end if;
                when compute163 =>
                  
                end case;
                case state_var280 is
                when par243 =>
                  case state_var290 is
                  when pause_getI176 =>
                    \$tab_ptr_take\(0) := '0';
                    state_var290 <= pause_getII177;
                  when pause_getII177 =>
                    \$46\ := \$tab_value\;
                    result173 := eclat_if(eclat_eq(\$46\ & X"0000000" & X"1") & X"0000000" & X"1" & X"0000000" & X"0");
                    rdy174 := eclat_true;
                    state_var290 <= compute175;
                  when q_wait178 =>
                    \$v179\ := \$tab_ptr_take\;
                    if \$v179\(0) = '1' then
                      state_var290 <= q_wait178;
                    else
                      \$tab_ptr_take\(0) := '1';
                      \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"2")));
                      state_var290 <= pause_getI176;
                      state_var290 <= pause_getI176;
                    end if;
                  when compute175 =>
                    
                  end case;
                  case state_var281 is
                  when par241 =>
                    case state_var289 is
                    when pause_getI188 =>
                      \$tab_ptr_take\(0) := '0';
                      state_var289 <= pause_getII189;
                    when pause_getII189 =>
                      \$44\ := \$tab_value\;
                      result185 := eclat_if(eclat_eq(\$44\ & X"0000000" & X"1") & X"0000000" & X"1" & X"0000000" & X"0");
                      rdy186 := eclat_true;
                      state_var289 <= compute187;
                    when q_wait190 =>
                      \$v191\ := \$tab_ptr_take\;
                      if \$v191\(0) = '1' then
                        state_var289 <= q_wait190;
                      else
                        \$tab_ptr_take\(0) := '1';
                        \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"3")));
                        state_var289 <= pause_getI188;
                        state_var289 <= pause_getI188;
                      end if;
                    when compute187 =>
                      
                    end case;
                    case state_var282 is
                    when par239 =>
                      case state_var288 is
                      when pause_getI200 =>
                        \$tab_ptr_take\(0) := '0';
                        state_var288 <= pause_getII201;
                      when pause_getII201 =>
                        \$42\ := \$tab_value\;
                        result197 := eclat_if(eclat_eq(\$42\ & X"0000000" & X"1") & X"0000000" & X"1" & X"0000000" & X"0");
                        rdy198 := eclat_true;
                        state_var288 <= compute199;
                      when q_wait202 =>
                        \$v203\ := \$tab_ptr_take\;
                        if \$v203\(0) = '1' then
                          state_var288 <= q_wait202;
                        else
                          \$tab_ptr_take\(0) := '1';
                          \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"4")));
                          state_var288 <= pause_getI200;
                          state_var288 <= pause_getI200;
                        end if;
                      when compute199 =>
                        
                      end case;
                      case state_var283 is
                      when par237 =>
                        case state_var287 is
                        when pause_getI212 =>
                          \$tab_ptr_take\(0) := '0';
                          state_var287 <= pause_getII213;
                        when pause_getII213 =>
                          \$40\ := \$tab_value\;
                          result209 := eclat_if(eclat_eq(\$40\ & X"0000000" & X"1") & X"0000000" & X"1" & X"0000000" & X"0");
                          rdy210 := eclat_true;
                          state_var287 <= compute211;
                        when q_wait214 =>
                          \$v215\ := \$tab_ptr_take\;
                          if \$v215\(0) = '1' then
                            state_var287 <= q_wait214;
                          else
                            \$tab_ptr_take\(0) := '1';
                            \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"5")));
                            state_var287 <= pause_getI212;
                            state_var287 <= pause_getI212;
                          end if;
                        when compute211 =>
                          
                        end case;
                        case state_var284 is
                        when par235 =>
                          case state_var286 is
                          when pause_getI224 =>
                            \$tab_ptr_take\(0) := '0';
                            state_var286 <= pause_getII225;
                          when pause_getII225 =>
                            \$38\ := \$tab_value\;
                            result221 := eclat_if(eclat_eq(\$38\ & X"0000000" & X"1") & X"0000000" & X"1" & X"0000000" & X"0");
                            rdy222 := eclat_true;
                            state_var286 <= compute223;
                          when q_wait226 =>
                            \$v227\ := \$tab_ptr_take\;
                            if \$v227\(0) = '1' then
                              state_var286 <= q_wait226;
                            else
                              \$tab_ptr_take\(0) := '1';
                              \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"6")));
                              state_var286 <= pause_getI224;
                              state_var286 <= pause_getI224;
                            end if;
                          when compute223 =>
                            
                          end case;
                          case state_var285 is
                          when pause_getI231 =>
                            \$tab_ptr_take\(0) := '0';
                            state_var285 <= pause_getII232;
                          when pause_getII232 =>
                            \$v35\ := \$tab_value\;
                            result228 := eclat_if(eclat_eq(\$v35\ & X"0000000" & X"1") & X"0000000" & X"1" & X"0000000" & X"0");
                            rdy229 := eclat_true;
                            state_var285 <= compute230;
                          when q_wait233 =>
                            \$v234\ := \$tab_ptr_take\;
                            if \$v234\(0) = '1' then
                              state_var285 <= q_wait233;
                            else
                              \$tab_ptr_take\(0) := '1';
                              \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"7")));
                              state_var285 <= pause_getI231;
                              state_var285 <= pause_getI231;
                            end if;
                          when compute230 =>
                            
                          end case;
                          \$v236\ := eclat_and(rdy222 & rdy229);
                          if \$v236\(0) = '1' then
                            result216 := result221 & result228;
                            rdy217 := eclat_true;
                            state_var284 <= compute218;
                          else
                            state_var284 <= par235;
                          end if;
                        when compute218 =>
                          
                        end case;
                        \$v238\ := eclat_and(rdy210 & rdy217);
                        if \$v238\(0) = '1' then
                          result204 := result209 & result216;
                          rdy205 := eclat_true;
                          state_var283 <= compute206;
                        else
                          state_var283 <= par237;
                        end if;
                      when compute206 =>
                        
                      end case;
                      \$v240\ := eclat_and(rdy198 & rdy205);
                      if \$v240\(0) = '1' then
                        result192 := result197 & result204;
                        rdy193 := eclat_true;
                        state_var282 <= compute194;
                      else
                        state_var282 <= par239;
                      end if;
                    when compute194 =>
                      
                    end case;
                    \$v242\ := eclat_and(rdy186 & rdy193);
                    if \$v242\(0) = '1' then
                      result180 := result185 & result192;
                      rdy181 := eclat_true;
                      state_var281 <= compute182;
                    else
                      state_var281 <= par241;
                    end if;
                  when compute182 =>
                    
                  end case;
                  \$v244\ := eclat_and(rdy174 & rdy181);
                  if \$v244\(0) = '1' then
                    result168 := result173 & result180;
                    rdy169 := eclat_true;
                    state_var280 <= compute170;
                  else
                    state_var280 <= par243;
                  end if;
                when compute170 =>
                  
                end case;
                \$v246\ := eclat_and(rdy162 & rdy169);
                if \$v246\(0) = '1' then
                  result156 := result161 & result168;
                  rdy157 := eclat_true;
                  state_var279 <= compute158;
                else
                  state_var279 <= par245;
                end if;
              when compute158 =>
                
              end case;
              \$v248\ := eclat_and(rdy150 & rdy157);
              if \$v248\(0) = '1' then
                \$v90\ := result149 & result156;
                \$v146\ := eclat_gt(eclat_add(eclat_add(eclat_add(eclat_add(eclat_add(eclat_add(eclat_add(\$v90\(0 to 31) & \$v90\(32 to 63)) & \$v90\(64 to 95)) & \$v90\(96 to 127)) & \$v90\(128 to 159)) & \$v90\(160 to 191)) & \$v90\(192 to 223)) & \$v90\(224 to 255)) & X"0000000" & X"0");
                if \$v146\(0) = '1' then
                  loop_result := X"0000000" & X"1";
                  b := loop_result;
                  \$v145\ := eclat_eq(b & X"0000000" & X"1");
                  if \$v145\(0) = '1' then
                    eclat_print_string(of_string("true"));
                    
                    eclat_print_newline(eclat_unit);
                    
                    result142 := eclat_unit;
                    rdy143 := eclat_true;
                    state_var278 <= compute144;
                  else
                    eclat_print_string(of_string("false"));
                    
                    eclat_print_newline(eclat_unit);
                    
                    result142 := eclat_unit;
                    rdy143 := eclat_true;
                    state_var278 <= compute144;
                  end if;
                else
                  loop_arg := eclat_add(loop_arg & X"0000000" & X"8");
                  state_var278 <= \loop\;
                end if;
              else
                state_var278 <= par247;
              end if;
            when par272 =>
              case state_var294 is
              when pause_getI258 =>
                \$tab_ptr_take\(0) := '0';
                state_var294 <= pause_getII259;
              when pause_getII259 =>
                \$v257\ := \$tab_ptr_write_take\;
                if \$v257\(0) = '1' then
                  state_var294 <= q_wait256;
                else
                  \$tab_ptr_write_take\(0) := '1';
                  \$tab_ptr_write\ <= to_integer(unsigned(\$31_loop_arg\));
                  \$tab_write_request\ <= '1';
                  \$tab_write\ <= eclat_mult(X"0000000" & X"2" & \$31_loop_arg\);
                  state_var294 <= pause_setI255;
                end if;
              when pause_setI255 =>
                \$tab_ptr_write_take\(0) := '0';
                \$tab_write_request\ <= '0';
                result252 := eclat_unit;
                rdy253 := eclat_true;
                state_var294 <= compute254;
              when q_wait256 =>
                \$v257\ := \$tab_ptr_write_take\;
                if \$v257\(0) = '1' then
                  state_var294 <= q_wait256;
                else
                  \$tab_ptr_write_take\(0) := '1';
                  \$tab_ptr_write\ <= to_integer(unsigned(\$31_loop_arg\));
                  \$tab_write_request\ <= '1';
                  \$tab_write\ <= eclat_mult(X"0000000" & X"2" & \$31_loop_arg\);
                  state_var294 <= pause_setI255;
                end if;
              when q_wait260 =>
                \$v261\ := \$tab_ptr_take\;
                if \$v261\(0) = '1' then
                  state_var294 <= q_wait260;
                else
                  \$tab_ptr_take\(0) := '1';
                  \$tab_ptr\ <= to_integer(unsigned(\$31_loop_arg\));
                  state_var294 <= pause_getI258;
                  state_var294 <= pause_getI258;
                end if;
              when compute254 =>
                
              end case;
              case state_var293 is
              when pause_getI268 =>
                \$tab_ptr_take\(0) := '0';
                state_var293 <= pause_getII269;
              when pause_getII269 =>
                \$v267\ := \$tab_ptr_write_take\;
                if \$v267\(0) = '1' then
                  state_var293 <= q_wait266;
                else
                  \$tab_ptr_write_take\(0) := '1';
                  \$tab_ptr_write\ <= to_integer(unsigned(eclat_add(\$31_loop_arg\ & X"0000000" & X"1")));
                  \$tab_write_request\ <= '1';
                  \$tab_write\ <= eclat_mult(X"0000000" & X"2" & eclat_add(\$31_loop_arg\ & X"0000000" & X"1"));
                  state_var293 <= pause_setI265;
                end if;
              when pause_setI265 =>
                \$tab_ptr_write_take\(0) := '0';
                \$tab_write_request\ <= '0';
                result262 := eclat_unit;
                rdy263 := eclat_true;
                state_var293 <= compute264;
              when q_wait266 =>
                \$v267\ := \$tab_ptr_write_take\;
                if \$v267\(0) = '1' then
                  state_var293 <= q_wait266;
                else
                  \$tab_ptr_write_take\(0) := '1';
                  \$tab_ptr_write\ <= to_integer(unsigned(eclat_add(\$31_loop_arg\ & X"0000000" & X"1")));
                  \$tab_write_request\ <= '1';
                  \$tab_write\ <= eclat_mult(X"0000000" & X"2" & eclat_add(\$31_loop_arg\ & X"0000000" & X"1"));
                  state_var293 <= pause_setI265;
                end if;
              when q_wait270 =>
                \$v271\ := \$tab_ptr_take\;
                if \$v271\(0) = '1' then
                  state_var293 <= q_wait270;
                else
                  \$tab_ptr_take\(0) := '1';
                  \$tab_ptr\ <= to_integer(unsigned(eclat_add(\$31_loop_arg\ & X"0000000" & X"1")));
                  state_var293 <= pause_getI268;
                  state_var293 <= pause_getI268;
                end if;
              when compute264 =>
                
              end case;
              \$v273\ := eclat_and(rdy253 & rdy263);
              if \$v273\(0) = '1' then
                \$31_loop_arg\ := eclat_add(\$31_loop_arg\ & X"0000000" & X"2");
                state_var278 <= \$31_loop\;
              else
                state_var278 <= par272;
              end if;
            when compute144 =>
              rdy143 := eclat_false;
              eclat_print_string(of_string("cy:"));
              
              eclat_print_int(c);
              
              eclat_print_newline(eclat_unit);
              
              \$31_loop_arg\ := X"0000000" & X"0";
              state_var278 <= \$31_loop\;
            end case;
            \$v276\ := eclat_not(rdy143);
            if \$v276\(0) = '1' then
              result142 := eclat_unit;
            end if;
            result139 := result142 & rdy143;
            rdy140 := eclat_true;
            state <= compute141;
          end case;
          
          result <= result139;
          rdy <= rdy140;
          
        end if;
      end if;
    end if;
  end process;
end architecture;
