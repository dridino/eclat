library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity led_driver is
    port (
        iRSTN : in std_logic;
        iCLK : in std_logic;
        iDIG : in std_logic_vector(9 downto 0);
        iG_INT2 : in std_logic;
        oLED : out std_logic_vector(9 downto 0)
    );
end entity led_driver;

architecture Behavioral of led_driver is
    signal select_data : std_logic_vector(4 downto 0);
	 signal select_data_tmp1 : std_logic_vector(4 downto 0);
	 signal select_data_tmp2 : std_logic_vector(4 downto 0);
    signal signed_bit : std_logic;
    signal abs_select_high : std_logic_vector(3 downto 0);
    signal int2_d : std_logic_vector(1 downto 0);
    signal int2_count : std_logic_vector(23 downto 0);
    signal int2_count_en : std_logic;
	 
	 signal oLED_tmp : std_logic_vector(9 downto 0);
	 signal oLED_tmp2 : std_logic_vector(9 downto 0);
begin
	 process (iDIG, IG_INT2)
	 begin
	 if iG_INT2 = '1' then
		select_data <= iDIG(9 downto 5);
	 else
		if iDIG(9) = '1' then
			if iDIG(8) = '1' then
				select_data <= iDIG(8 downto 4);
			else
				select_data <= "10000";
			end if;
		else
			if iDIG(8) = '1' then
				select_data <= "01111";
			else
				select_data <= iDIG(8 downto 4);
			end if;
		end if;
	end if;
	end process;
    signed_bit <= select_data(4);
    abs_select_high <= (not select_data(3 downto 0)) when signed_bit = '1' else select_data(3 downto 0);

	 process (abs_select_high, signed_bit, int2_count)
	 begin
	 case abs_select_high(3 downto 0) is
		when "0000" =>
			oLED_tmp <= "0000110000";
		when "0001" =>
			if signed_bit then
				oLED_tmp <= "0000010000";
			else
				oLED_tmp <= "0000100000";
			end if;
		when "0010" =>
			if signed_bit then
				oLED_tmp <= "0000011000";
			else
				oLED_tmp <= "0001100000";
			end if;
		when "0011" =>
			if signed_bit then
				oLED_tmp <= "0000001000";
			else
				oLED_tmp <= "0001000000";
			end if;
		when "0100" =>
			if signed_bit then
				oLED_tmp <= "0000001100";
			else
				oLED_tmp <= "0011000000";
			end if;
		when "0101" =>
			if signed_bit then
				oLED_tmp <= "0000000100";
			else
				oLED_tmp <= "0010000000";
			end if;
		when "0110" =>
			if signed_bit then
				oLED_tmp <= "0000000110";
			else
				oLED_tmp <= "0110000000";
			end if;
		when "0111" =>
			if signed_bit then
				oLED_tmp <= "0000000010";
			else
				oLED_tmp <= "0100000000";
			end if;
		when "1000" =>
			if signed_bit then
				oLED_tmp <= "0000000011";
			else
				oLED_tmp <= "1100000000";
			end if;
		when others =>
			if signed_bit then
				oLED_tmp <= "0000000001";
			else
				oLED_tmp <= "1000000000";
			end if;
	 end case;
	 if int2_count(20) = '1' then
		oLED_tmp2 <= "0000000000";
	 else
		oLED_tmp2 <= "1111111111";
	 end if;
	 end process;
	
    oLED <= oLED_tmp when int2_count(23) = '1' else oLED_tmp2;

    process(iCLK, iRSTN)
    begin
        if (iRSTN = '0') then
            int2_count_en <= '0';
            int2_count <= "100000000000000000000000";
        elsif rising_edge(iCLK) then
            int2_d <= int2_d(0) & iG_INT2;
            if (int2_d(1) = '0' and int2_d(0) = '1') then
                int2_count_en <= '1';
                int2_count <= "000000000000000000000000";
            elsif (int2_count(23) = '1') then
                int2_count_en <= '0';
            else
                int2_count <= std_logic_vector(unsigned(int2_count) + 1);
            end if;
        end if;
    end process;
end architecture Behavioral;
