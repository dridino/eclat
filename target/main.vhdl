-- code generated from the following source code:
--   ../adrien/for_all.ecl
--
-- with the following command:
--
--    ./eclat ../adrien/for_all.ecl

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

  type t_state is (compute122);
  signal state: t_state;
  type t_state_var357 is (compute315, \$341_foo\, pause_getI320, pause_getII321, pause_setI317, q_wait318, q_wait322);
  signal state_var357: t_state_var357;
  type t_state_var356 is (compute326, \$337_foo\, pause_getI331, pause_getII332, pause_setI328, q_wait329, q_wait333);
  signal state_var356: t_state_var356;
  type t_state_var355 is (compute132, \$325_foo\, \$326_foo\, pause_getI135, pause_getII136, q_wait137);
  signal state_var355: t_state_var355;
  type t_state_var354 is (compute149, \$306_foo\, \$307_foo\, \$308_foo\, pause_getI153, pause_getII154, q_wait155);
  signal state_var354: t_state_var354;
  type t_state_var353 is (compute168, \$280_foo\, \$281_foo\, \$282_foo\, \$283_foo\, pause_getI173, pause_getII174, q_wait175);
  signal state_var353: t_state_var353;
  type t_state_var352 is (compute189, \$247_foo\, \$248_foo\, \$249_foo\, \$250_foo\, \$251_foo\, pause_getI195, pause_getII196, q_wait197);
  signal state_var352: t_state_var352;
  type t_state_var351 is (compute212, \$207_foo\, \$208_foo\, \$209_foo\, \$210_foo\, \$211_foo\, \$212_foo\, pause_getI219, pause_getII220, q_wait221);
  signal state_var351: t_state_var351;
  type t_state_var350 is (compute237, \$160_foo\, \$161_foo\, \$162_foo\, \$163_foo\, \$164_foo\, \$165_foo\, \$166_foo\, pause_getI245, pause_getII246, q_wait247);
  signal state_var350: t_state_var350;
  type t_state_var349 is (compute264, \$106_foo\, \$107_foo\, \$108_foo\, \$109_foo\, \$110_foo\, \$111_foo\, \$112_foo\, \$113_foo\, pause_getI273, pause_getII274, q_wait275);
  signal state_var349: t_state_var349;
  type t_state_var348 is (compute281, \$76_foo\, \$77_foo\, \$78_foo\, \$79_foo\, \$80_foo\, \$81_foo\, \$82_foo\, \$83_foo\, pause_getI290, pause_getII291, q_wait292);
  signal state_var348: t_state_var348;
  type t_state_var347 is (compute253, \$70_foo\, \$71_foo\, \$72_foo\, \$73_foo\, \$74_foo\, \$75_foo\, par296);
  signal state_var347: t_state_var347;
  type t_state_var346 is (compute227, \$65_foo\, \$66_foo\, \$67_foo\, \$68_foo\, \$69_foo\, par298);
  signal state_var346: t_state_var346;
  type t_state_var345 is (compute203, \$61_foo\, \$62_foo\, \$63_foo\, \$64_foo\, par300);
  signal state_var345: t_state_var345;
  type t_state_var344 is (compute181, \$58_foo\, \$59_foo\, \$60_foo\, par302);
  signal state_var344: t_state_var344;
  type t_state_var343 is (compute161, \$56_foo\, \$57_foo\, par304);
  signal state_var343: t_state_var343;
  type t_state_var342 is (compute143, foo, par306);
  signal state_var342: t_state_var342;
  type t_state_var341 is (compute125, \$50_loop\, \loop\, par308, par335);
  signal state_var341: t_state_var341;
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
      variable result159 : value(0 to 5) := (others => '0');
      variable result251, result120 : value(0 to 1) := (others => '0');
      variable \$v77\ : value(0 to 7) := (others => '0');
      variable result225 : value(0 to 2) := (others => '0');
      variable result141 : value(0 to 6) := (others => '0');
      variable result179 : value(0 to 4) := (others => '0');
      variable result201 : value(0 to 3) := (others => '0');
      variable \$v206\, \$v248\, \$v144\, \$v177\, \$v258\, \$v216\, \$v199\, 
               \$v223\, \$v294\, \$166_foo_result\, \$v256\, \$v157\, 
               \$v295\, rdy236, \$v283\, \$v244\, \$v178\, \$v254\, \$v182\, 
               \$v204\, \$v96_init_done\, \$283_foo_result\, \$v286\, 
               \$v156\, \$v232\, rdy280, \$v193\, \$v169\, \$v229\, 
               \$326_foo_result\, \$v255\, \$83_foo_result\, 
               \$50_loop_result\, \$v224\, \$v340\, result147, rdy211, 
               result166, \$v133\, \$v88_init_done\, \$v151\, 
               \$v90_init_done\, \$v301\, \$v339\, \$v207\, \$v218\, \$v134\, 
               rdy314, \$308_foo_result\, \$v316\, rdy148, \$v307\, 
               \$v85_init_done\, \$v194\, \$v334\, \$v217\, \$v305\, rdy124, 
               \$v198\, \$v327\, \$v150\, \$v183\, \$v228\, \$v287\, \$v140\, 
               \$v266\, \$v240\, \$v309\, rdy226, \$v171\, \$v270\, 
               \$113_foo_result\, result313, rdy121, \$v330\, 
               \$v87_init_done\, \$v243\, \$v184\, \$v242\, \$v152\, 
               result187, \$v241\, \$v249\, result130, \$v323\, rdy131, 
               rdy180, \$v293\, \$v289\, \$v190\, rdy142, result324, 
               \$v91_init_done\, \$v222\, \$v271\, rdy325, rdy252, 
               \$v84_init_done\, \$v284\, \$v158\, rdy188, rdy160, \$v213\, 
               \$v285\, \$212_foo_result\, \$v239\, result235, \$v170\, 
               result279, \$v231\, \$v297\, \$v126\, rdy202, \$v214\, 
               \$v272\, \$v319\, \$v257\, \$v200\, \$v163\, \$v238\, 
               \$v89_init_done\, \$v299\, \$v276\, \$v278\, \$v288\, \$v268\, 
               \$v265\, \$v205\, \$v215\, \$v127\, b, \$v192\, \$v259\, 
               \$v250\, \$v277\, rdy167, result123, \$v139\, \$v310\, 
               \$v172\, \$v230\, \$v191\, \$251_foo_result\, \$v337\, 
               \$v162\, rdy263, \$v303\, \$v336\, \$v138\, \$v267\, \$v176\, 
               \$v282\, \$v269\, result210, \$v86_init_done\, loop_result, 
               result262 : value(0 to 0) := (others => '0');
      variable \$280_foo_arg\, \$115_c\, \$168_c\, \$56_foo_arg\, \$v88\, 
               \$7_c\, \$162_foo_arg\, \$60_foo_arg\, \$210_foo_arg\, 
               \$107_foo_arg\, \$v91\, \$63_foo_arg\, \$286\, \$v86\, 
               \$78_foo_arg\, \$113_foo_arg\, \$70_foo_arg\, \$248_foo_arg\, 
               \$254\, \$62_foo_arg\, \$80_foo_arg\, \$327_c\, \$v89\, 
               \$v90\, \$208_foo_arg\, \$65_foo_arg\, \$58_foo_arg\, \$v96\, 
               \$165_foo_arg\, \$247_foo_arg\, \$209_foo_arg\, 
               \$166_foo_arg\, \$v87\, \$73_foo_arg\, \$74_foo_arg\, \$169\, 
               \$111_foo_arg\, \$50_loop_arg\, \$310_c\, \$325_foo_arg\, 
               \$82_foo_arg\, \$163_foo_arg\, \$116\, \$76_foo_arg\, 
               \$81_foo_arg\, \$250_foo_arg\, \$283_foo_arg\, \$282_foo_arg\, 
               \$212_foo_arg\, \$326_foo_arg\, \$110_foo_arg\, 
               \$249_foo_arg\, \$71_foo_arg\, \$214_c\, \$61_foo_arg\, 
               \$83_foo_arg\, \$211_foo_arg\, c, \$67_foo_arg\, 
               \$306_foo_arg\, \$337_foo_arg\, \$285_c\, \$109_foo_arg\, 
               \$77_foo_arg\, \$72_foo_arg\, \$108_foo_arg\, \$75_foo_arg\, 
               \$112_foo_arg\, \$106_foo_arg\, \$v28\, \$79_foo_arg\, 
               \$68_foo_arg\, \$66_foo_arg\, \$v85\, \$311\, \$64_foo_arg\, 
               \$308_foo_arg\, \$281_foo_arg\, \$341_foo_arg\, \$v84\, 
               \$328\, \$69_foo_arg\, \$57_foo_arg\, \$307_foo_arg\, 
               \$160_foo_arg\, foo_arg, \$207_foo_arg\, \$215\, 
               \$251_foo_arg\, \$59_foo_arg\, \$161_foo_arg\, loop_arg, 
               \$164_foo_arg\, \$253_c\ : value(0 to 31) := (others => '0');
      variable \$tab_ptr_take\ : value(0 to 0) := "0";
      variable \$tab_ptr_write_take\ : value(0 to 0) := "0";
      
    begin
      
      if rising_edge(clk) then
        if (reset = '1') then
          default_zero(\$253_c\); default_zero(\$164_foo_arg\); 
          default_zero(result262); default_zero(loop_result); 
          default_zero(loop_arg); default_zero(\$v86_init_done\); 
          default_zero(result210); default_zero(\$v269\); 
          default_zero(\$161_foo_arg\); default_zero(\$59_foo_arg\); 
          default_zero(\$v282\); default_zero(\$v176\); 
          default_zero(\$v267\); default_zero(\$251_foo_arg\); 
          default_zero(\$v138\); default_zero(\$v336\); 
          default_zero(\$v303\); default_zero(rdy263); default_zero(\$215\); 
          default_zero(\$207_foo_arg\); default_zero(\$v162\); 
          default_zero(foo_arg); default_zero(\$160_foo_arg\); 
          default_zero(\$v337\); default_zero(\$307_foo_arg\); 
          default_zero(\$251_foo_result\); default_zero(\$v191\); 
          default_zero(\$v230\); default_zero(\$57_foo_arg\); 
          default_zero(\$v172\); default_zero(\$v310\); 
          default_zero(\$v139\); default_zero(result123); 
          default_zero(\$69_foo_arg\); default_zero(rdy167); 
          default_zero(\$v277\); default_zero(\$v250\); 
          default_zero(\$v259\); default_zero(\$v192\); default_zero(b); 
          default_zero(\$328\); default_zero(\$v84\); default_zero(\$v127\); 
          default_zero(\$341_foo_arg\); default_zero(\$v215\); 
          default_zero(\$v205\); default_zero(\$v265\); 
          default_zero(\$v268\); default_zero(\$v288\); 
          default_zero(\$281_foo_arg\); default_zero(result201); 
          default_zero(\$v278\); default_zero(\$308_foo_arg\); 
          default_zero(\$v276\); default_zero(\$v299\); 
          default_zero(\$64_foo_arg\); default_zero(\$311\); 
          default_zero(\$v89_init_done\); default_zero(\$v85\); 
          default_zero(\$v238\); default_zero(\$v163\); 
          default_zero(\$v200\); default_zero(\$v257\); 
          default_zero(\$v319\); default_zero(\$v272\); 
          default_zero(\$66_foo_arg\); default_zero(\$68_foo_arg\); 
          default_zero(\$v214\); default_zero(rdy202); 
          default_zero(\$79_foo_arg\); default_zero(\$v126\); 
          default_zero(\$v297\); default_zero(\$v28\); 
          default_zero(\$106_foo_arg\); default_zero(\$v231\); 
          default_zero(result279); default_zero(\$v170\); 
          default_zero(result235); default_zero(\$112_foo_arg\); 
          default_zero(\$75_foo_arg\); default_zero(\$v239\); 
          default_zero(\$212_foo_result\); default_zero(\$v285\); 
          default_zero(\$v213\); default_zero(\$108_foo_arg\); 
          default_zero(rdy160); default_zero(\$72_foo_arg\); 
          default_zero(rdy188); default_zero(\$77_foo_arg\); 
          default_zero(\$v158\); default_zero(\$v284\); 
          default_zero(\$v84_init_done\); default_zero(\$109_foo_arg\); 
          default_zero(rdy252); default_zero(\$285_c\); 
          default_zero(\$337_foo_arg\); default_zero(\$306_foo_arg\); 
          default_zero(rdy325); default_zero(\$v77\); default_zero(\$v271\); 
          default_zero(\$67_foo_arg\); default_zero(result179); 
          default_zero(c); default_zero(\$v222\); 
          default_zero(\$211_foo_arg\); default_zero(\$v91_init_done\); 
          default_zero(\$83_foo_arg\); default_zero(result324); 
          default_zero(\$61_foo_arg\); default_zero(\$214_c\); 
          default_zero(rdy142); default_zero(\$v190\); default_zero(\$v289\); 
          default_zero(\$71_foo_arg\); default_zero(\$249_foo_arg\); 
          default_zero(\$v293\); default_zero(\$110_foo_arg\); 
          default_zero(rdy180); default_zero(rdy131); 
          default_zero(\$326_foo_arg\); default_zero(\$v323\); 
          default_zero(\$212_foo_arg\); default_zero(\$282_foo_arg\); 
          default_zero(result130); default_zero(\$v249\); 
          default_zero(\$v241\); default_zero(\$283_foo_arg\); 
          default_zero(result187); default_zero(\$250_foo_arg\); 
          default_zero(\$81_foo_arg\); default_zero(\$76_foo_arg\); 
          default_zero(\$v152\); default_zero(\$v242\); default_zero(\$116\); 
          default_zero(\$163_foo_arg\); default_zero(\$v184\); 
          default_zero(\$v243\); default_zero(result141); 
          default_zero(\$82_foo_arg\); default_zero(\$325_foo_arg\); 
          default_zero(\$v87_init_done\); default_zero(\$v330\); 
          default_zero(rdy121); default_zero(result313); 
          default_zero(\$113_foo_result\); default_zero(\$v270\); 
          default_zero(\$v171\); default_zero(rdy226); 
          default_zero(\$310_c\); default_zero(\$v309\); 
          default_zero(\$v240\); default_zero(\$50_loop_arg\); 
          default_zero(\$v266\); default_zero(\$v140\); 
          default_zero(\$v287\); default_zero(\$v228\); 
          default_zero(\$v183\); default_zero(\$v150\); 
          default_zero(\$v327\); default_zero(\$111_foo_arg\); 
          default_zero(\$v198\); default_zero(result120); 
          default_zero(rdy124); default_zero(\$169\); 
          default_zero(\$74_foo_arg\); default_zero(\$73_foo_arg\); 
          default_zero(\$v87\); default_zero(\$v305\); 
          default_zero(\$166_foo_arg\); default_zero(\$209_foo_arg\); 
          default_zero(\$v217\); default_zero(\$v334\); 
          default_zero(\$v194\); default_zero(\$v85_init_done\); 
          default_zero(\$v307\); default_zero(\$247_foo_arg\); 
          default_zero(result225); default_zero(\$165_foo_arg\); 
          default_zero(rdy148); default_zero(\$v96\); default_zero(\$v316\); 
          default_zero(\$308_foo_result\); default_zero(rdy314); 
          default_zero(\$v134\); default_zero(\$58_foo_arg\); 
          default_zero(\$65_foo_arg\); default_zero(\$v218\); 
          default_zero(\$v207\); default_zero(\$v339\); 
          default_zero(\$v301\); default_zero(\$v90_init_done\); 
          default_zero(\$v151\); default_zero(\$v88_init_done\); 
          default_zero(\$208_foo_arg\); default_zero(\$v133\); 
          default_zero(result166); default_zero(rdy211); 
          default_zero(result147); default_zero(\$v340\); 
          default_zero(\$v224\); default_zero(\$v90\); 
          default_zero(\$50_loop_result\); default_zero(\$83_foo_result\); 
          default_zero(\$v89\); default_zero(\$v255\); 
          default_zero(result251); default_zero(\$326_foo_result\); 
          default_zero(\$327_c\); default_zero(\$v229\); 
          default_zero(\$80_foo_arg\); default_zero(\$v169\); 
          default_zero(\$62_foo_arg\); default_zero(\$v193\); 
          default_zero(\$254\); default_zero(rdy280); default_zero(\$v232\); 
          default_zero(\$248_foo_arg\); default_zero(\$v156\); 
          default_zero(\$v286\); default_zero(\$70_foo_arg\); 
          default_zero(\$283_foo_result\); default_zero(\$v96_init_done\); 
          default_zero(\$113_foo_arg\); default_zero(\$v204\); 
          default_zero(\$v182\); default_zero(\$78_foo_arg\); 
          default_zero(\$v254\); default_zero(result159); 
          default_zero(\$v86\); default_zero(\$286\); default_zero(\$v178\); 
          default_zero(\$63_foo_arg\); default_zero(\$v244\); 
          default_zero(\$v91\); default_zero(\$v283\); 
          default_zero(\$107_foo_arg\); default_zero(rdy236); 
          default_zero(\$v295\); default_zero(\$v157\); 
          default_zero(\$v256\); default_zero(\$166_foo_result\); 
          default_zero(\$210_foo_arg\); default_zero(\$60_foo_arg\); 
          default_zero(\$v294\); default_zero(\$v223\); 
          default_zero(\$162_foo_arg\); default_zero(\$v199\); 
          default_zero(\$7_c\); default_zero(\$v88\); default_zero(\$v216\); 
          default_zero(\$v258\); default_zero(\$v177\); 
          default_zero(\$56_foo_arg\); default_zero(\$168_c\); 
          default_zero(\$v144\); default_zero(\$v248\); 
          default_zero(\$v206\); default_zero(\$115_c\); 
          default_zero(\$280_foo_arg\); 
          rdy <= "1";
          rdy121 := "0";
          state <= compute122;
          state_var357 <= compute315;
          state_var356 <= compute326;
          state_var355 <= compute132;
          state_var354 <= compute149;
          state_var353 <= compute168;
          state_var352 <= compute189;
          state_var351 <= compute212;
          state_var350 <= compute237;
          state_var349 <= compute264;
          state_var348 <= compute281;
          state_var347 <= compute253;
          state_var346 <= compute227;
          state_var345 <= compute203;
          state_var344 <= compute181;
          state_var343 <= compute161;
          state_var342 <= compute143;
          state_var341 <= compute125;
          
        else if run = '1' then
          case state is
          when compute122 =>
            rdy121 := eclat_false;
            \$v340\ := eclat_not(\$v96_init_done\);
            if \$v340\(0) = '1' then
              \$v96\ := X"0000000" & X"0";
              \$v96_init_done\ := eclat_true;
            end if;
            \$v96\ := eclat_add(\$v96\ & X"0000000" & X"1");
            c := \$v96\;
            case state_var341 is
            when \$50_loop\ =>
              \$v337\ := eclat_ge(\$50_loop_arg\ & eclat_sub(std_logic_vector(to_unsigned(tab'length,32)) & X"0000000" & X"1"));
              if \$v337\(0) = '1' then
                \$50_loop_result\ := eclat_unit;
                eclat_print_string(of_string("cy:"));
                
                eclat_print_int(c);
                
                eclat_print_newline(eclat_unit);
                
                loop_arg := X"0000000" & X"0";
                state_var341 <= \loop\;
              else
                rdy314 := eclat_false;
                \$v323\ := \$tab_ptr_take\;
                if \$v323\(0) = '1' then
                  state_var357 <= q_wait322;
                else
                  \$tab_ptr_take\(0) := '1';
                  \$tab_ptr\ <= to_integer(unsigned(\$50_loop_arg\));
                  state_var357 <= pause_getI320;
                  state_var357 <= pause_getI320;
                end if;
                rdy325 := eclat_false;
                \$v334\ := \$tab_ptr_take\;
                if \$v334\(0) = '1' then
                  state_var356 <= q_wait333;
                else
                  \$tab_ptr_take\(0) := '1';
                  \$tab_ptr\ <= to_integer(unsigned(eclat_add(\$50_loop_arg\ & X"0000000" & X"1")));
                  state_var356 <= pause_getI331;
                  state_var356 <= pause_getI331;
                end if;
                state_var341 <= par335;
              end if;
            when \loop\ =>
              \$v310\ := eclat_ge(loop_arg & eclat_sub(std_logic_vector(to_unsigned(tab'length,32)) & X"0000000" & X"7"));
              if \$v310\(0) = '1' then
                loop_result := eclat_true;
                b := loop_result;
                \$v126\ := b;
                if \$v126\(0) = '1' then
                  eclat_print_string(of_string("true"));
                  
                  eclat_print_newline(eclat_unit);
                  
                  result123 := eclat_unit;
                  rdy124 := eclat_true;
                  state_var341 <= compute125;
                else
                  eclat_print_string(of_string("false"));
                  
                  eclat_print_newline(eclat_unit);
                  
                  result123 := eclat_unit;
                  rdy124 := eclat_true;
                  state_var341 <= compute125;
                end if;
              else
                rdy131 := eclat_false;
                \$v140\ := eclat_not(\$v91_init_done\);
                if \$v140\(0) = '1' then
                  \$v91\ := X"0000000" & X"0";
                  \$v91_init_done\ := eclat_true;
                end if;
                \$v91\ := eclat_if(eclat_false & X"0000000" & X"0" & eclat_add(\$v91\ & X"0000000" & X"1"));
                \$327_c\ := \$v91\;
                \$v139\ := eclat_gt(\$327_c\ & X"000000" & X"14");
                if \$v139\(0) = '1' then
                  result130 := eclat_false;
                  rdy131 := eclat_true;
                  state_var355 <= compute132;
                else
                  \$v138\ := \$tab_ptr_take\;
                  if \$v138\(0) = '1' then
                    state_var355 <= q_wait137;
                  else
                    \$tab_ptr_take\(0) := '1';
                    \$tab_ptr\ <= to_integer(unsigned(loop_arg));
                    state_var355 <= pause_getI135;
                    state_var355 <= pause_getI135;
                  end if;
                end if;
                rdy142 := eclat_false;
                rdy148 := eclat_false;
                \$v158\ := eclat_not(\$v90_init_done\);
                if \$v158\(0) = '1' then
                  \$v90\ := X"0000000" & X"0";
                  \$v90_init_done\ := eclat_true;
                end if;
                \$v90\ := eclat_if(eclat_false & X"0000000" & X"0" & eclat_add(\$v90\ & X"0000000" & X"1"));
                \$310_c\ := \$v90\;
                \$v157\ := eclat_gt(\$310_c\ & X"000000" & X"14");
                if \$v157\(0) = '1' then
                  result147 := eclat_false;
                  rdy148 := eclat_true;
                  state_var354 <= compute149;
                else
                  \$v156\ := \$tab_ptr_take\;
                  if \$v156\(0) = '1' then
                    state_var354 <= q_wait155;
                  else
                    \$tab_ptr_take\(0) := '1';
                    \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"1")));
                    state_var354 <= pause_getI153;
                    state_var354 <= pause_getI153;
                  end if;
                end if;
                rdy160 := eclat_false;
                rdy167 := eclat_false;
                \$v178\ := eclat_not(\$v89_init_done\);
                if \$v178\(0) = '1' then
                  \$v89\ := X"0000000" & X"0";
                  \$v89_init_done\ := eclat_true;
                end if;
                \$v89\ := eclat_if(eclat_false & X"0000000" & X"0" & eclat_add(\$v89\ & X"0000000" & X"1"));
                \$285_c\ := \$v89\;
                \$v177\ := eclat_gt(\$285_c\ & X"000000" & X"14");
                if \$v177\(0) = '1' then
                  result166 := eclat_false;
                  rdy167 := eclat_true;
                  state_var353 <= compute168;
                else
                  \$v176\ := \$tab_ptr_take\;
                  if \$v176\(0) = '1' then
                    state_var353 <= q_wait175;
                  else
                    \$tab_ptr_take\(0) := '1';
                    \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"2")));
                    state_var353 <= pause_getI173;
                    state_var353 <= pause_getI173;
                  end if;
                end if;
                rdy180 := eclat_false;
                rdy188 := eclat_false;
                \$v200\ := eclat_not(\$v88_init_done\);
                if \$v200\(0) = '1' then
                  \$v88\ := X"0000000" & X"0";
                  \$v88_init_done\ := eclat_true;
                end if;
                \$v88\ := eclat_if(eclat_false & X"0000000" & X"0" & eclat_add(\$v88\ & X"0000000" & X"1"));
                \$253_c\ := \$v88\;
                \$v199\ := eclat_gt(\$253_c\ & X"000000" & X"14");
                if \$v199\(0) = '1' then
                  result187 := eclat_false;
                  rdy188 := eclat_true;
                  state_var352 <= compute189;
                else
                  \$v198\ := \$tab_ptr_take\;
                  if \$v198\(0) = '1' then
                    state_var352 <= q_wait197;
                  else
                    \$tab_ptr_take\(0) := '1';
                    \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"3")));
                    state_var352 <= pause_getI195;
                    state_var352 <= pause_getI195;
                  end if;
                end if;
                rdy202 := eclat_false;
                rdy211 := eclat_false;
                \$v224\ := eclat_not(\$v87_init_done\);
                if \$v224\(0) = '1' then
                  \$v87\ := X"0000000" & X"0";
                  \$v87_init_done\ := eclat_true;
                end if;
                \$v87\ := eclat_if(eclat_false & X"0000000" & X"0" & eclat_add(\$v87\ & X"0000000" & X"1"));
                \$214_c\ := \$v87\;
                \$v223\ := eclat_gt(\$214_c\ & X"000000" & X"14");
                if \$v223\(0) = '1' then
                  result210 := eclat_false;
                  rdy211 := eclat_true;
                  state_var351 <= compute212;
                else
                  \$v222\ := \$tab_ptr_take\;
                  if \$v222\(0) = '1' then
                    state_var351 <= q_wait221;
                  else
                    \$tab_ptr_take\(0) := '1';
                    \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"4")));
                    state_var351 <= pause_getI219;
                    state_var351 <= pause_getI219;
                  end if;
                end if;
                rdy226 := eclat_false;
                rdy236 := eclat_false;
                \$v250\ := eclat_not(\$v86_init_done\);
                if \$v250\(0) = '1' then
                  \$v86\ := X"0000000" & X"0";
                  \$v86_init_done\ := eclat_true;
                end if;
                \$v86\ := eclat_if(eclat_false & X"0000000" & X"0" & eclat_add(\$v86\ & X"0000000" & X"1"));
                \$168_c\ := \$v86\;
                \$v249\ := eclat_gt(\$168_c\ & X"000000" & X"14");
                if \$v249\(0) = '1' then
                  result235 := eclat_false;
                  rdy236 := eclat_true;
                  state_var350 <= compute237;
                else
                  \$v248\ := \$tab_ptr_take\;
                  if \$v248\(0) = '1' then
                    state_var350 <= q_wait247;
                  else
                    \$tab_ptr_take\(0) := '1';
                    \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"5")));
                    state_var350 <= pause_getI245;
                    state_var350 <= pause_getI245;
                  end if;
                end if;
                rdy252 := eclat_false;
                rdy263 := eclat_false;
                \$v278\ := eclat_not(\$v85_init_done\);
                if \$v278\(0) = '1' then
                  \$v85\ := X"0000000" & X"0";
                  \$v85_init_done\ := eclat_true;
                end if;
                \$v85\ := eclat_if(eclat_false & X"0000000" & X"0" & eclat_add(\$v85\ & X"0000000" & X"1"));
                \$115_c\ := \$v85\;
                \$v277\ := eclat_gt(\$115_c\ & X"000000" & X"14");
                if \$v277\(0) = '1' then
                  result262 := eclat_false;
                  rdy263 := eclat_true;
                  state_var349 <= compute264;
                else
                  \$v276\ := \$tab_ptr_take\;
                  if \$v276\(0) = '1' then
                    state_var349 <= q_wait275;
                  else
                    \$tab_ptr_take\(0) := '1';
                    \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"6")));
                    state_var349 <= pause_getI273;
                    state_var349 <= pause_getI273;
                  end if;
                end if;
                rdy280 := eclat_false;
                \$v295\ := eclat_not(\$v84_init_done\);
                if \$v295\(0) = '1' then
                  \$v84\ := X"0000000" & X"0";
                  \$v84_init_done\ := eclat_true;
                end if;
                \$v84\ := eclat_if(eclat_false & X"0000000" & X"0" & eclat_add(\$v84\ & X"0000000" & X"1"));
                \$7_c\ := \$v84\;
                \$v294\ := eclat_gt(\$7_c\ & X"000000" & X"14");
                if \$v294\(0) = '1' then
                  result279 := eclat_false;
                  rdy280 := eclat_true;
                  state_var348 <= compute281;
                else
                  \$v293\ := \$tab_ptr_take\;
                  if \$v293\(0) = '1' then
                    state_var348 <= q_wait292;
                  else
                    \$tab_ptr_take\(0) := '1';
                    \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"7")));
                    state_var348 <= pause_getI290;
                    state_var348 <= pause_getI290;
                  end if;
                end if;
                state_var347 <= par296;
                state_var346 <= par298;
                state_var345 <= par300;
                state_var344 <= par302;
                state_var343 <= par304;
                state_var342 <= par306;
                state_var341 <= par308;
              end if;
            when par308 =>
              case state_var355 is
              when \$325_foo\ =>
                \$v133\ := eclat_eq(\$325_foo_arg\ & X"000000" & X"2a");
                if \$v133\(0) = '1' then
                  \$325_foo_arg\ := \$325_foo_arg\;
                  state_var355 <= \$325_foo\;
                else
                  state_var355 <= \$325_foo\;
                end if;
              when \$326_foo\ =>
                \$v134\ := eclat_eq(\$326_foo_arg\ & X"000000" & X"2a");
                if \$v134\(0) = '1' then
                  \$326_foo_arg\ := \$326_foo_arg\;
                  state_var355 <= \$326_foo\;
                else
                  \$326_foo_result\ := eclat_false;
                  result130 := \$326_foo_result\;
                  rdy131 := eclat_true;
                  state_var355 <= compute132;
                end if;
              when pause_getI135 =>
                \$tab_ptr_take\(0) := '0';
                state_var355 <= pause_getII136;
              when pause_getII136 =>
                \$328\ := \$tab_value\;
                \$326_foo_arg\ := \$328\;
                state_var355 <= \$326_foo\;
              when q_wait137 =>
                \$v138\ := \$tab_ptr_take\;
                if \$v138\(0) = '1' then
                  state_var355 <= q_wait137;
                else
                  \$tab_ptr_take\(0) := '1';
                  \$tab_ptr\ <= to_integer(unsigned(loop_arg));
                  state_var355 <= pause_getI135;
                  state_var355 <= pause_getI135;
                end if;
              when compute132 =>
                
              end case;
              case state_var342 is
              when foo =>
                \$v144\ := eclat_eq(foo_arg & X"000000" & X"2a");
                if \$v144\(0) = '1' then
                  foo_arg := foo_arg;
                  state_var342 <= foo;
                else
                  state_var342 <= foo;
                end if;
              when par306 =>
                case state_var354 is
                when \$306_foo\ =>
                  \$v150\ := eclat_eq(\$306_foo_arg\ & X"000000" & X"2a");
                  if \$v150\(0) = '1' then
                    \$306_foo_arg\ := \$306_foo_arg\;
                    state_var354 <= \$306_foo\;
                  else
                    state_var354 <= \$306_foo\;
                  end if;
                when \$307_foo\ =>
                  \$v151\ := eclat_eq(\$307_foo_arg\ & X"000000" & X"2a");
                  if \$v151\(0) = '1' then
                    \$307_foo_arg\ := \$307_foo_arg\;
                    state_var354 <= \$307_foo\;
                  else
                    state_var354 <= \$307_foo\;
                  end if;
                when \$308_foo\ =>
                  \$v152\ := eclat_eq(\$308_foo_arg\ & X"000000" & X"2a");
                  if \$v152\(0) = '1' then
                    \$308_foo_arg\ := \$308_foo_arg\;
                    state_var354 <= \$308_foo\;
                  else
                    \$308_foo_result\ := eclat_false;
                    result147 := \$308_foo_result\;
                    rdy148 := eclat_true;
                    state_var354 <= compute149;
                  end if;
                when pause_getI153 =>
                  \$tab_ptr_take\(0) := '0';
                  state_var354 <= pause_getII154;
                when pause_getII154 =>
                  \$311\ := \$tab_value\;
                  \$308_foo_arg\ := \$311\;
                  state_var354 <= \$308_foo\;
                when q_wait155 =>
                  \$v156\ := \$tab_ptr_take\;
                  if \$v156\(0) = '1' then
                    state_var354 <= q_wait155;
                  else
                    \$tab_ptr_take\(0) := '1';
                    \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"1")));
                    state_var354 <= pause_getI153;
                    state_var354 <= pause_getI153;
                  end if;
                when compute149 =>
                  
                end case;
                case state_var343 is
                when \$56_foo\ =>
                  \$v162\ := eclat_eq(\$56_foo_arg\ & X"000000" & X"2a");
                  if \$v162\(0) = '1' then
                    \$56_foo_arg\ := \$56_foo_arg\;
                    state_var343 <= \$56_foo\;
                  else
                    state_var343 <= \$56_foo\;
                  end if;
                when \$57_foo\ =>
                  \$v163\ := eclat_eq(\$57_foo_arg\ & X"000000" & X"2a");
                  if \$v163\(0) = '1' then
                    \$57_foo_arg\ := \$57_foo_arg\;
                    state_var343 <= \$57_foo\;
                  else
                    state_var343 <= \$57_foo\;
                  end if;
                when par304 =>
                  case state_var353 is
                  when \$280_foo\ =>
                    \$v169\ := eclat_eq(\$280_foo_arg\ & X"000000" & X"2a");
                    if \$v169\(0) = '1' then
                      \$280_foo_arg\ := \$280_foo_arg\;
                      state_var353 <= \$280_foo\;
                    else
                      state_var353 <= \$280_foo\;
                    end if;
                  when \$281_foo\ =>
                    \$v170\ := eclat_eq(\$281_foo_arg\ & X"000000" & X"2a");
                    if \$v170\(0) = '1' then
                      \$281_foo_arg\ := \$281_foo_arg\;
                      state_var353 <= \$281_foo\;
                    else
                      state_var353 <= \$281_foo\;
                    end if;
                  when \$282_foo\ =>
                    \$v171\ := eclat_eq(\$282_foo_arg\ & X"000000" & X"2a");
                    if \$v171\(0) = '1' then
                      \$282_foo_arg\ := \$282_foo_arg\;
                      state_var353 <= \$282_foo\;
                    else
                      state_var353 <= \$282_foo\;
                    end if;
                  when \$283_foo\ =>
                    \$v172\ := eclat_eq(\$283_foo_arg\ & X"000000" & X"2a");
                    if \$v172\(0) = '1' then
                      \$283_foo_arg\ := \$283_foo_arg\;
                      state_var353 <= \$283_foo\;
                    else
                      \$283_foo_result\ := eclat_false;
                      result166 := \$283_foo_result\;
                      rdy167 := eclat_true;
                      state_var353 <= compute168;
                    end if;
                  when pause_getI173 =>
                    \$tab_ptr_take\(0) := '0';
                    state_var353 <= pause_getII174;
                  when pause_getII174 =>
                    \$286\ := \$tab_value\;
                    \$283_foo_arg\ := \$286\;
                    state_var353 <= \$283_foo\;
                  when q_wait175 =>
                    \$v176\ := \$tab_ptr_take\;
                    if \$v176\(0) = '1' then
                      state_var353 <= q_wait175;
                    else
                      \$tab_ptr_take\(0) := '1';
                      \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"2")));
                      state_var353 <= pause_getI173;
                      state_var353 <= pause_getI173;
                    end if;
                  when compute168 =>
                    
                  end case;
                  case state_var344 is
                  when \$58_foo\ =>
                    \$v182\ := eclat_eq(\$58_foo_arg\ & X"000000" & X"2a");
                    if \$v182\(0) = '1' then
                      \$58_foo_arg\ := \$58_foo_arg\;
                      state_var344 <= \$58_foo\;
                    else
                      state_var344 <= \$58_foo\;
                    end if;
                  when \$59_foo\ =>
                    \$v183\ := eclat_eq(\$59_foo_arg\ & X"000000" & X"2a");
                    if \$v183\(0) = '1' then
                      \$59_foo_arg\ := \$59_foo_arg\;
                      state_var344 <= \$59_foo\;
                    else
                      state_var344 <= \$59_foo\;
                    end if;
                  when \$60_foo\ =>
                    \$v184\ := eclat_eq(\$60_foo_arg\ & X"000000" & X"2a");
                    if \$v184\(0) = '1' then
                      \$60_foo_arg\ := \$60_foo_arg\;
                      state_var344 <= \$60_foo\;
                    else
                      state_var344 <= \$60_foo\;
                    end if;
                  when par302 =>
                    case state_var352 is
                    when \$247_foo\ =>
                      \$v190\ := eclat_eq(\$247_foo_arg\ & X"000000" & X"2a");
                      if \$v190\(0) = '1' then
                        \$247_foo_arg\ := \$247_foo_arg\;
                        state_var352 <= \$247_foo\;
                      else
                        state_var352 <= \$247_foo\;
                      end if;
                    when \$248_foo\ =>
                      \$v191\ := eclat_eq(\$248_foo_arg\ & X"000000" & X"2a");
                      if \$v191\(0) = '1' then
                        \$248_foo_arg\ := \$248_foo_arg\;
                        state_var352 <= \$248_foo\;
                      else
                        state_var352 <= \$248_foo\;
                      end if;
                    when \$249_foo\ =>
                      \$v192\ := eclat_eq(\$249_foo_arg\ & X"000000" & X"2a");
                      if \$v192\(0) = '1' then
                        \$249_foo_arg\ := \$249_foo_arg\;
                        state_var352 <= \$249_foo\;
                      else
                        state_var352 <= \$249_foo\;
                      end if;
                    when \$250_foo\ =>
                      \$v193\ := eclat_eq(\$250_foo_arg\ & X"000000" & X"2a");
                      if \$v193\(0) = '1' then
                        \$250_foo_arg\ := \$250_foo_arg\;
                        state_var352 <= \$250_foo\;
                      else
                        state_var352 <= \$250_foo\;
                      end if;
                    when \$251_foo\ =>
                      \$v194\ := eclat_eq(\$251_foo_arg\ & X"000000" & X"2a");
                      if \$v194\(0) = '1' then
                        \$251_foo_arg\ := \$251_foo_arg\;
                        state_var352 <= \$251_foo\;
                      else
                        \$251_foo_result\ := eclat_false;
                        result187 := \$251_foo_result\;
                        rdy188 := eclat_true;
                        state_var352 <= compute189;
                      end if;
                    when pause_getI195 =>
                      \$tab_ptr_take\(0) := '0';
                      state_var352 <= pause_getII196;
                    when pause_getII196 =>
                      \$254\ := \$tab_value\;
                      \$251_foo_arg\ := \$254\;
                      state_var352 <= \$251_foo\;
                    when q_wait197 =>
                      \$v198\ := \$tab_ptr_take\;
                      if \$v198\(0) = '1' then
                        state_var352 <= q_wait197;
                      else
                        \$tab_ptr_take\(0) := '1';
                        \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"3")));
                        state_var352 <= pause_getI195;
                        state_var352 <= pause_getI195;
                      end if;
                    when compute189 =>
                      
                    end case;
                    case state_var345 is
                    when \$61_foo\ =>
                      \$v204\ := eclat_eq(\$61_foo_arg\ & X"000000" & X"2a");
                      if \$v204\(0) = '1' then
                        \$61_foo_arg\ := \$61_foo_arg\;
                        state_var345 <= \$61_foo\;
                      else
                        state_var345 <= \$61_foo\;
                      end if;
                    when \$62_foo\ =>
                      \$v205\ := eclat_eq(\$62_foo_arg\ & X"000000" & X"2a");
                      if \$v205\(0) = '1' then
                        \$62_foo_arg\ := \$62_foo_arg\;
                        state_var345 <= \$62_foo\;
                      else
                        state_var345 <= \$62_foo\;
                      end if;
                    when \$63_foo\ =>
                      \$v206\ := eclat_eq(\$63_foo_arg\ & X"000000" & X"2a");
                      if \$v206\(0) = '1' then
                        \$63_foo_arg\ := \$63_foo_arg\;
                        state_var345 <= \$63_foo\;
                      else
                        state_var345 <= \$63_foo\;
                      end if;
                    when \$64_foo\ =>
                      \$v207\ := eclat_eq(\$64_foo_arg\ & X"000000" & X"2a");
                      if \$v207\(0) = '1' then
                        \$64_foo_arg\ := \$64_foo_arg\;
                        state_var345 <= \$64_foo\;
                      else
                        state_var345 <= \$64_foo\;
                      end if;
                    when par300 =>
                      case state_var351 is
                      when \$207_foo\ =>
                        \$v213\ := eclat_eq(\$207_foo_arg\ & X"000000" & X"2a");
                        if \$v213\(0) = '1' then
                          \$207_foo_arg\ := \$207_foo_arg\;
                          state_var351 <= \$207_foo\;
                        else
                          state_var351 <= \$207_foo\;
                        end if;
                      when \$208_foo\ =>
                        \$v214\ := eclat_eq(\$208_foo_arg\ & X"000000" & X"2a");
                        if \$v214\(0) = '1' then
                          \$208_foo_arg\ := \$208_foo_arg\;
                          state_var351 <= \$208_foo\;
                        else
                          state_var351 <= \$208_foo\;
                        end if;
                      when \$209_foo\ =>
                        \$v215\ := eclat_eq(\$209_foo_arg\ & X"000000" & X"2a");
                        if \$v215\(0) = '1' then
                          \$209_foo_arg\ := \$209_foo_arg\;
                          state_var351 <= \$209_foo\;
                        else
                          state_var351 <= \$209_foo\;
                        end if;
                      when \$210_foo\ =>
                        \$v216\ := eclat_eq(\$210_foo_arg\ & X"000000" & X"2a");
                        if \$v216\(0) = '1' then
                          \$210_foo_arg\ := \$210_foo_arg\;
                          state_var351 <= \$210_foo\;
                        else
                          state_var351 <= \$210_foo\;
                        end if;
                      when \$211_foo\ =>
                        \$v217\ := eclat_eq(\$211_foo_arg\ & X"000000" & X"2a");
                        if \$v217\(0) = '1' then
                          \$211_foo_arg\ := \$211_foo_arg\;
                          state_var351 <= \$211_foo\;
                        else
                          state_var351 <= \$211_foo\;
                        end if;
                      when \$212_foo\ =>
                        \$v218\ := eclat_eq(\$212_foo_arg\ & X"000000" & X"2a");
                        if \$v218\(0) = '1' then
                          \$212_foo_arg\ := \$212_foo_arg\;
                          state_var351 <= \$212_foo\;
                        else
                          \$212_foo_result\ := eclat_false;
                          result210 := \$212_foo_result\;
                          rdy211 := eclat_true;
                          state_var351 <= compute212;
                        end if;
                      when pause_getI219 =>
                        \$tab_ptr_take\(0) := '0';
                        state_var351 <= pause_getII220;
                      when pause_getII220 =>
                        \$215\ := \$tab_value\;
                        \$212_foo_arg\ := \$215\;
                        state_var351 <= \$212_foo\;
                      when q_wait221 =>
                        \$v222\ := \$tab_ptr_take\;
                        if \$v222\(0) = '1' then
                          state_var351 <= q_wait221;
                        else
                          \$tab_ptr_take\(0) := '1';
                          \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"4")));
                          state_var351 <= pause_getI219;
                          state_var351 <= pause_getI219;
                        end if;
                      when compute212 =>
                        
                      end case;
                      case state_var346 is
                      when \$65_foo\ =>
                        \$v228\ := eclat_eq(\$65_foo_arg\ & X"000000" & X"2a");
                        if \$v228\(0) = '1' then
                          \$65_foo_arg\ := \$65_foo_arg\;
                          state_var346 <= \$65_foo\;
                        else
                          state_var346 <= \$65_foo\;
                        end if;
                      when \$66_foo\ =>
                        \$v229\ := eclat_eq(\$66_foo_arg\ & X"000000" & X"2a");
                        if \$v229\(0) = '1' then
                          \$66_foo_arg\ := \$66_foo_arg\;
                          state_var346 <= \$66_foo\;
                        else
                          state_var346 <= \$66_foo\;
                        end if;
                      when \$67_foo\ =>
                        \$v230\ := eclat_eq(\$67_foo_arg\ & X"000000" & X"2a");
                        if \$v230\(0) = '1' then
                          \$67_foo_arg\ := \$67_foo_arg\;
                          state_var346 <= \$67_foo\;
                        else
                          state_var346 <= \$67_foo\;
                        end if;
                      when \$68_foo\ =>
                        \$v231\ := eclat_eq(\$68_foo_arg\ & X"000000" & X"2a");
                        if \$v231\(0) = '1' then
                          \$68_foo_arg\ := \$68_foo_arg\;
                          state_var346 <= \$68_foo\;
                        else
                          state_var346 <= \$68_foo\;
                        end if;
                      when \$69_foo\ =>
                        \$v232\ := eclat_eq(\$69_foo_arg\ & X"000000" & X"2a");
                        if \$v232\(0) = '1' then
                          \$69_foo_arg\ := \$69_foo_arg\;
                          state_var346 <= \$69_foo\;
                        else
                          state_var346 <= \$69_foo\;
                        end if;
                      when par298 =>
                        case state_var350 is
                        when \$160_foo\ =>
                          \$v238\ := eclat_eq(\$160_foo_arg\ & X"000000" & X"2a");
                          if \$v238\(0) = '1' then
                            \$160_foo_arg\ := \$160_foo_arg\;
                            state_var350 <= \$160_foo\;
                          else
                            state_var350 <= \$160_foo\;
                          end if;
                        when \$161_foo\ =>
                          \$v239\ := eclat_eq(\$161_foo_arg\ & X"000000" & X"2a");
                          if \$v239\(0) = '1' then
                            \$161_foo_arg\ := \$161_foo_arg\;
                            state_var350 <= \$161_foo\;
                          else
                            state_var350 <= \$161_foo\;
                          end if;
                        when \$162_foo\ =>
                          \$v240\ := eclat_eq(\$162_foo_arg\ & X"000000" & X"2a");
                          if \$v240\(0) = '1' then
                            \$162_foo_arg\ := \$162_foo_arg\;
                            state_var350 <= \$162_foo\;
                          else
                            state_var350 <= \$162_foo\;
                          end if;
                        when \$163_foo\ =>
                          \$v241\ := eclat_eq(\$163_foo_arg\ & X"000000" & X"2a");
                          if \$v241\(0) = '1' then
                            \$163_foo_arg\ := \$163_foo_arg\;
                            state_var350 <= \$163_foo\;
                          else
                            state_var350 <= \$163_foo\;
                          end if;
                        when \$164_foo\ =>
                          \$v242\ := eclat_eq(\$164_foo_arg\ & X"000000" & X"2a");
                          if \$v242\(0) = '1' then
                            \$164_foo_arg\ := \$164_foo_arg\;
                            state_var350 <= \$164_foo\;
                          else
                            state_var350 <= \$164_foo\;
                          end if;
                        when \$165_foo\ =>
                          \$v243\ := eclat_eq(\$165_foo_arg\ & X"000000" & X"2a");
                          if \$v243\(0) = '1' then
                            \$165_foo_arg\ := \$165_foo_arg\;
                            state_var350 <= \$165_foo\;
                          else
                            state_var350 <= \$165_foo\;
                          end if;
                        when \$166_foo\ =>
                          \$v244\ := eclat_eq(\$166_foo_arg\ & X"000000" & X"2a");
                          if \$v244\(0) = '1' then
                            \$166_foo_arg\ := \$166_foo_arg\;
                            state_var350 <= \$166_foo\;
                          else
                            \$166_foo_result\ := eclat_false;
                            result235 := \$166_foo_result\;
                            rdy236 := eclat_true;
                            state_var350 <= compute237;
                          end if;
                        when pause_getI245 =>
                          \$tab_ptr_take\(0) := '0';
                          state_var350 <= pause_getII246;
                        when pause_getII246 =>
                          \$169\ := \$tab_value\;
                          \$166_foo_arg\ := \$169\;
                          state_var350 <= \$166_foo\;
                        when q_wait247 =>
                          \$v248\ := \$tab_ptr_take\;
                          if \$v248\(0) = '1' then
                            state_var350 <= q_wait247;
                          else
                            \$tab_ptr_take\(0) := '1';
                            \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"5")));
                            state_var350 <= pause_getI245;
                            state_var350 <= pause_getI245;
                          end if;
                        when compute237 =>
                          
                        end case;
                        case state_var347 is
                        when \$70_foo\ =>
                          \$v254\ := eclat_eq(\$70_foo_arg\ & X"000000" & X"2a");
                          if \$v254\(0) = '1' then
                            \$70_foo_arg\ := \$70_foo_arg\;
                            state_var347 <= \$70_foo\;
                          else
                            state_var347 <= \$70_foo\;
                          end if;
                        when \$71_foo\ =>
                          \$v255\ := eclat_eq(\$71_foo_arg\ & X"000000" & X"2a");
                          if \$v255\(0) = '1' then
                            \$71_foo_arg\ := \$71_foo_arg\;
                            state_var347 <= \$71_foo\;
                          else
                            state_var347 <= \$71_foo\;
                          end if;
                        when \$72_foo\ =>
                          \$v256\ := eclat_eq(\$72_foo_arg\ & X"000000" & X"2a");
                          if \$v256\(0) = '1' then
                            \$72_foo_arg\ := \$72_foo_arg\;
                            state_var347 <= \$72_foo\;
                          else
                            state_var347 <= \$72_foo\;
                          end if;
                        when \$73_foo\ =>
                          \$v257\ := eclat_eq(\$73_foo_arg\ & X"000000" & X"2a");
                          if \$v257\(0) = '1' then
                            \$73_foo_arg\ := \$73_foo_arg\;
                            state_var347 <= \$73_foo\;
                          else
                            state_var347 <= \$73_foo\;
                          end if;
                        when \$74_foo\ =>
                          \$v258\ := eclat_eq(\$74_foo_arg\ & X"000000" & X"2a");
                          if \$v258\(0) = '1' then
                            \$74_foo_arg\ := \$74_foo_arg\;
                            state_var347 <= \$74_foo\;
                          else
                            state_var347 <= \$74_foo\;
                          end if;
                        when \$75_foo\ =>
                          \$v259\ := eclat_eq(\$75_foo_arg\ & X"000000" & X"2a");
                          if \$v259\(0) = '1' then
                            \$75_foo_arg\ := \$75_foo_arg\;
                            state_var347 <= \$75_foo\;
                          else
                            state_var347 <= \$75_foo\;
                          end if;
                        when par296 =>
                          case state_var349 is
                          when \$106_foo\ =>
                            \$v265\ := eclat_eq(\$106_foo_arg\ & X"000000" & X"2a");
                            if \$v265\(0) = '1' then
                              \$106_foo_arg\ := \$106_foo_arg\;
                              state_var349 <= \$106_foo\;
                            else
                              state_var349 <= \$106_foo\;
                            end if;
                          when \$107_foo\ =>
                            \$v266\ := eclat_eq(\$107_foo_arg\ & X"000000" & X"2a");
                            if \$v266\(0) = '1' then
                              \$107_foo_arg\ := \$107_foo_arg\;
                              state_var349 <= \$107_foo\;
                            else
                              state_var349 <= \$107_foo\;
                            end if;
                          when \$108_foo\ =>
                            \$v267\ := eclat_eq(\$108_foo_arg\ & X"000000" & X"2a");
                            if \$v267\(0) = '1' then
                              \$108_foo_arg\ := \$108_foo_arg\;
                              state_var349 <= \$108_foo\;
                            else
                              state_var349 <= \$108_foo\;
                            end if;
                          when \$109_foo\ =>
                            \$v268\ := eclat_eq(\$109_foo_arg\ & X"000000" & X"2a");
                            if \$v268\(0) = '1' then
                              \$109_foo_arg\ := \$109_foo_arg\;
                              state_var349 <= \$109_foo\;
                            else
                              state_var349 <= \$109_foo\;
                            end if;
                          when \$110_foo\ =>
                            \$v269\ := eclat_eq(\$110_foo_arg\ & X"000000" & X"2a");
                            if \$v269\(0) = '1' then
                              \$110_foo_arg\ := \$110_foo_arg\;
                              state_var349 <= \$110_foo\;
                            else
                              state_var349 <= \$110_foo\;
                            end if;
                          when \$111_foo\ =>
                            \$v270\ := eclat_eq(\$111_foo_arg\ & X"000000" & X"2a");
                            if \$v270\(0) = '1' then
                              \$111_foo_arg\ := \$111_foo_arg\;
                              state_var349 <= \$111_foo\;
                            else
                              state_var349 <= \$111_foo\;
                            end if;
                          when \$112_foo\ =>
                            \$v271\ := eclat_eq(\$112_foo_arg\ & X"000000" & X"2a");
                            if \$v271\(0) = '1' then
                              \$112_foo_arg\ := \$112_foo_arg\;
                              state_var349 <= \$112_foo\;
                            else
                              state_var349 <= \$112_foo\;
                            end if;
                          when \$113_foo\ =>
                            \$v272\ := eclat_eq(\$113_foo_arg\ & X"000000" & X"2a");
                            if \$v272\(0) = '1' then
                              \$113_foo_arg\ := \$113_foo_arg\;
                              state_var349 <= \$113_foo\;
                            else
                              \$113_foo_result\ := eclat_false;
                              result262 := \$113_foo_result\;
                              rdy263 := eclat_true;
                              state_var349 <= compute264;
                            end if;
                          when pause_getI273 =>
                            \$tab_ptr_take\(0) := '0';
                            state_var349 <= pause_getII274;
                          when pause_getII274 =>
                            \$116\ := \$tab_value\;
                            \$113_foo_arg\ := \$116\;
                            state_var349 <= \$113_foo\;
                          when q_wait275 =>
                            \$v276\ := \$tab_ptr_take\;
                            if \$v276\(0) = '1' then
                              state_var349 <= q_wait275;
                            else
                              \$tab_ptr_take\(0) := '1';
                              \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"6")));
                              state_var349 <= pause_getI273;
                              state_var349 <= pause_getI273;
                            end if;
                          when compute264 =>
                            
                          end case;
                          case state_var348 is
                          when \$76_foo\ =>
                            \$v282\ := eclat_eq(\$76_foo_arg\ & X"000000" & X"2a");
                            if \$v282\(0) = '1' then
                              \$76_foo_arg\ := \$76_foo_arg\;
                              state_var348 <= \$76_foo\;
                            else
                              state_var348 <= \$76_foo\;
                            end if;
                          when \$77_foo\ =>
                            \$v283\ := eclat_eq(\$77_foo_arg\ & X"000000" & X"2a");
                            if \$v283\(0) = '1' then
                              \$77_foo_arg\ := \$77_foo_arg\;
                              state_var348 <= \$77_foo\;
                            else
                              state_var348 <= \$77_foo\;
                            end if;
                          when \$78_foo\ =>
                            \$v284\ := eclat_eq(\$78_foo_arg\ & X"000000" & X"2a");
                            if \$v284\(0) = '1' then
                              \$78_foo_arg\ := \$78_foo_arg\;
                              state_var348 <= \$78_foo\;
                            else
                              state_var348 <= \$78_foo\;
                            end if;
                          when \$79_foo\ =>
                            \$v285\ := eclat_eq(\$79_foo_arg\ & X"000000" & X"2a");
                            if \$v285\(0) = '1' then
                              \$79_foo_arg\ := \$79_foo_arg\;
                              state_var348 <= \$79_foo\;
                            else
                              state_var348 <= \$79_foo\;
                            end if;
                          when \$80_foo\ =>
                            \$v286\ := eclat_eq(\$80_foo_arg\ & X"000000" & X"2a");
                            if \$v286\(0) = '1' then
                              \$80_foo_arg\ := \$80_foo_arg\;
                              state_var348 <= \$80_foo\;
                            else
                              state_var348 <= \$80_foo\;
                            end if;
                          when \$81_foo\ =>
                            \$v287\ := eclat_eq(\$81_foo_arg\ & X"000000" & X"2a");
                            if \$v287\(0) = '1' then
                              \$81_foo_arg\ := \$81_foo_arg\;
                              state_var348 <= \$81_foo\;
                            else
                              state_var348 <= \$81_foo\;
                            end if;
                          when \$82_foo\ =>
                            \$v288\ := eclat_eq(\$82_foo_arg\ & X"000000" & X"2a");
                            if \$v288\(0) = '1' then
                              \$82_foo_arg\ := \$82_foo_arg\;
                              state_var348 <= \$82_foo\;
                            else
                              state_var348 <= \$82_foo\;
                            end if;
                          when \$83_foo\ =>
                            \$v289\ := eclat_eq(\$83_foo_arg\ & X"000000" & X"2a");
                            if \$v289\(0) = '1' then
                              \$83_foo_arg\ := \$83_foo_arg\;
                              state_var348 <= \$83_foo\;
                            else
                              \$83_foo_result\ := eclat_false;
                              result279 := \$83_foo_result\;
                              rdy280 := eclat_true;
                              state_var348 <= compute281;
                            end if;
                          when pause_getI290 =>
                            \$tab_ptr_take\(0) := '0';
                            state_var348 <= pause_getII291;
                          when pause_getII291 =>
                            \$v28\ := \$tab_value\;
                            \$83_foo_arg\ := \$v28\;
                            state_var348 <= \$83_foo\;
                          when q_wait292 =>
                            \$v293\ := \$tab_ptr_take\;
                            if \$v293\(0) = '1' then
                              state_var348 <= q_wait292;
                            else
                              \$tab_ptr_take\(0) := '1';
                              \$tab_ptr\ <= to_integer(unsigned(eclat_add(loop_arg & X"0000000" & X"7")));
                              state_var348 <= pause_getI290;
                              state_var348 <= pause_getI290;
                            end if;
                          when compute281 =>
                            
                          end case;
                          \$v297\ := eclat_and(rdy263 & rdy280);
                          if \$v297\(0) = '1' then
                            result251 := result262 & result279;
                            rdy252 := eclat_true;
                            state_var347 <= compute253;
                          else
                            state_var347 <= par296;
                          end if;
                        when compute253 =>
                          
                        end case;
                        \$v299\ := eclat_and(rdy236 & rdy252);
                        if \$v299\(0) = '1' then
                          result225 := result235 & result251;
                          rdy226 := eclat_true;
                          state_var346 <= compute227;
                        else
                          state_var346 <= par298;
                        end if;
                      when compute227 =>
                        
                      end case;
                      \$v301\ := eclat_and(rdy211 & rdy226);
                      if \$v301\(0) = '1' then
                        result201 := result210 & result225;
                        rdy202 := eclat_true;
                        state_var345 <= compute203;
                      else
                        state_var345 <= par300;
                      end if;
                    when compute203 =>
                      
                    end case;
                    \$v303\ := eclat_and(rdy188 & rdy202);
                    if \$v303\(0) = '1' then
                      result179 := result187 & result201;
                      rdy180 := eclat_true;
                      state_var344 <= compute181;
                    else
                      state_var344 <= par302;
                    end if;
                  when compute181 =>
                    
                  end case;
                  \$v305\ := eclat_and(rdy167 & rdy180);
                  if \$v305\(0) = '1' then
                    result159 := result166 & result179;
                    rdy160 := eclat_true;
                    state_var343 <= compute161;
                  else
                    state_var343 <= par304;
                  end if;
                when compute161 =>
                  
                end case;
                \$v307\ := eclat_and(rdy148 & rdy160);
                if \$v307\(0) = '1' then
                  result141 := result147 & result159;
                  rdy142 := eclat_true;
                  state_var342 <= compute143;
                else
                  state_var342 <= par306;
                end if;
              when compute143 =>
                
              end case;
              \$v309\ := eclat_and(rdy131 & rdy142);
              if \$v309\(0) = '1' then
                \$v77\ := result130 & result141;
                \$v127\ := eclat_if(""&\$v77\(0) & eclat_if(""&\$v77\(1) & 
                                                   eclat_if(""&\$v77\(2) & 
                                                   eclat_if(""&\$v77\(3) & 
                                                   eclat_if(""&\$v77\(4) & 
                                                   eclat_if(""&\$v77\(5) & 
                                                   eclat_if(""&\$v77\(6) & ""&\$v77\(7) & eclat_false) & eclat_false) & eclat_false) & eclat_false) & eclat_false) & eclat_false) & eclat_false);
                if \$v127\(0) = '1' then
                  loop_arg := eclat_add(loop_arg & X"0000000" & X"8");
                  state_var341 <= \loop\;
                else
                  loop_result := eclat_false;
                  b := loop_result;
                  \$v126\ := b;
                  if \$v126\(0) = '1' then
                    eclat_print_string(of_string("true"));
                    
                    eclat_print_newline(eclat_unit);
                    
                    result123 := eclat_unit;
                    rdy124 := eclat_true;
                    state_var341 <= compute125;
                  else
                    eclat_print_string(of_string("false"));
                    
                    eclat_print_newline(eclat_unit);
                    
                    result123 := eclat_unit;
                    rdy124 := eclat_true;
                    state_var341 <= compute125;
                  end if;
                end if;
              else
                state_var341 <= par308;
              end if;
            when par335 =>
              case state_var357 is
              when \$341_foo\ =>
                \$v316\ := eclat_eq(\$341_foo_arg\ & X"000000" & X"2a");
                if \$v316\(0) = '1' then
                  \$341_foo_arg\ := \$341_foo_arg\;
                  state_var357 <= \$341_foo\;
                else
                  state_var357 <= \$341_foo\;
                end if;
              when pause_getI320 =>
                \$tab_ptr_take\(0) := '0';
                state_var357 <= pause_getII321;
              when pause_getII321 =>
                \$v319\ := \$tab_ptr_write_take\;
                if \$v319\(0) = '1' then
                  state_var357 <= q_wait318;
                else
                  \$tab_ptr_write_take\(0) := '1';
                  \$tab_ptr_write\ <= to_integer(unsigned(\$50_loop_arg\));
                  \$tab_write_request\ <= '1';
                  \$tab_write\ <= eclat_mult(X"0000000" & X"2" & \$50_loop_arg\);
                  state_var357 <= pause_setI317;
                end if;
              when pause_setI317 =>
                \$tab_ptr_write_take\(0) := '0';
                \$tab_write_request\ <= '0';
                result313 := eclat_unit;
                rdy314 := eclat_true;
                state_var357 <= compute315;
              when q_wait318 =>
                \$v319\ := \$tab_ptr_write_take\;
                if \$v319\(0) = '1' then
                  state_var357 <= q_wait318;
                else
                  \$tab_ptr_write_take\(0) := '1';
                  \$tab_ptr_write\ <= to_integer(unsigned(\$50_loop_arg\));
                  \$tab_write_request\ <= '1';
                  \$tab_write\ <= eclat_mult(X"0000000" & X"2" & \$50_loop_arg\);
                  state_var357 <= pause_setI317;
                end if;
              when q_wait322 =>
                \$v323\ := \$tab_ptr_take\;
                if \$v323\(0) = '1' then
                  state_var357 <= q_wait322;
                else
                  \$tab_ptr_take\(0) := '1';
                  \$tab_ptr\ <= to_integer(unsigned(\$50_loop_arg\));
                  state_var357 <= pause_getI320;
                  state_var357 <= pause_getI320;
                end if;
              when compute315 =>
                
              end case;
              case state_var356 is
              when \$337_foo\ =>
                \$v327\ := eclat_eq(\$337_foo_arg\ & X"000000" & X"2a");
                if \$v327\(0) = '1' then
                  \$337_foo_arg\ := \$337_foo_arg\;
                  state_var356 <= \$337_foo\;
                else
                  state_var356 <= \$337_foo\;
                end if;
              when pause_getI331 =>
                \$tab_ptr_take\(0) := '0';
                state_var356 <= pause_getII332;
              when pause_getII332 =>
                \$v330\ := \$tab_ptr_write_take\;
                if \$v330\(0) = '1' then
                  state_var356 <= q_wait329;
                else
                  \$tab_ptr_write_take\(0) := '1';
                  \$tab_ptr_write\ <= to_integer(unsigned(eclat_add(\$50_loop_arg\ & X"0000000" & X"1")));
                  \$tab_write_request\ <= '1';
                  \$tab_write\ <= eclat_mult(X"0000000" & X"2" & eclat_add(\$50_loop_arg\ & X"0000000" & X"1"));
                  state_var356 <= pause_setI328;
                end if;
              when pause_setI328 =>
                \$tab_ptr_write_take\(0) := '0';
                \$tab_write_request\ <= '0';
                result324 := eclat_unit;
                rdy325 := eclat_true;
                state_var356 <= compute326;
              when q_wait329 =>
                \$v330\ := \$tab_ptr_write_take\;
                if \$v330\(0) = '1' then
                  state_var356 <= q_wait329;
                else
                  \$tab_ptr_write_take\(0) := '1';
                  \$tab_ptr_write\ <= to_integer(unsigned(eclat_add(\$50_loop_arg\ & X"0000000" & X"1")));
                  \$tab_write_request\ <= '1';
                  \$tab_write\ <= eclat_mult(X"0000000" & X"2" & eclat_add(\$50_loop_arg\ & X"0000000" & X"1"));
                  state_var356 <= pause_setI328;
                end if;
              when q_wait333 =>
                \$v334\ := \$tab_ptr_take\;
                if \$v334\(0) = '1' then
                  state_var356 <= q_wait333;
                else
                  \$tab_ptr_take\(0) := '1';
                  \$tab_ptr\ <= to_integer(unsigned(eclat_add(\$50_loop_arg\ & X"0000000" & X"1")));
                  state_var356 <= pause_getI331;
                  state_var356 <= pause_getI331;
                end if;
              when compute326 =>
                
              end case;
              \$v336\ := eclat_and(rdy314 & rdy325);
              if \$v336\(0) = '1' then
                \$50_loop_arg\ := eclat_add(\$50_loop_arg\ & X"0000000" & X"2");
                state_var341 <= \$50_loop\;
              else
                state_var341 <= par335;
              end if;
            when compute125 =>
              rdy124 := eclat_false;
              eclat_print_string(of_string("cy:"));
              
              eclat_print_int(c);
              
              eclat_print_newline(eclat_unit);
              
              \$50_loop_arg\ := X"0000000" & X"0";
              state_var341 <= \$50_loop\;
            end case;
            \$v339\ := eclat_not(rdy124);
            if \$v339\(0) = '1' then
              result123 := eclat_unit;
            end if;
            result120 := result123 & rdy124;
            rdy121 := eclat_true;
            state <= compute122;
          end case;
          
          result <= result120;
          rdy <= rdy121;
          
        end if;
      end if;
    end if;
  end process;
end architecture;
