library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity spi_ee_config is
    generic (
        SI_DataL: integer := 15;
        SO_DataL: integer := 7
    );
    port (
        iRSTN: in std_logic;
        iSPI_CLK: in std_logic;
        iSPI_CLK_OUT: in std_logic;
        iG_INT2: in std_logic;
        oDATA_L: out std_logic_vector(SO_DataL downto 0);
        oDATA_H: out std_logic_vector(SO_DataL downto 0);
        SPI_SDIO: inout std_logic;
        oSPI_CSN: out std_logic;
        oSPI_CLK: out std_logic
    );
end spi_ee_config;

architecture Behavioral of spi_ee_config is
    signal ini_index: std_logic_vector(3 downto 0);
    signal spi_go: std_logic;
    signal spi_state: std_logic;
    signal read_idle_count: std_logic_vector(14 downto 0);
    signal high_byte: std_logic;
    signal read_back: std_logic;
    signal clear_status: std_logic;
    signal clear_status_d: std_logic_vector(3 downto 0);
    signal high_byte_d: std_logic;
    signal read_back_d: std_logic;
    signal write_data: std_logic_vector(SI_DataL-2 downto 0);
    signal p2s_data: std_logic_vector(SI_DataL downto 0);
    signal spi_end: std_logic;
    signal s2p_data: std_logic_vector(SO_DataL downto 0);
    signal low_byte_data: std_logic_vector(SO_DataL downto 0);
    signal read_ready: std_logic;
begin

	u_spi_controller : entity work.spi_controller
    port map (
        iRSTN        => iRSTN,
        iSPI_CLK     => iSPI_CLK,
        iSPI_CLK_OUT => iSPI_CLK_OUT,
        iP2S_DATA    => p2s_data,
        iSPI_GO      => spi_go,
        oSPI_END     => spi_end,
        oS2P_DATA    => s2p_data,
        SPI_SDIO     => SPI_SDIO,
        oSPI_CSN     => oSPI_CSN,
        oSPI_CLK     => oSPI_CLK
    );
	 
	 process(ini_index)
	 variable THRESH_ACT : std_logic_vector(5 downto 0);
	 variable THRESH_INACT : std_logic_vector(5 downto 0);
	 variable TIME_INACT : std_logic_vector(5 downto 0);
	 variable ACT_INACT_CTL : std_logic_vector(5 downto 0);
	 variable THRESH_FF : std_logic_vector(5 downto 0);
	 variable TIME_FF : std_logic_vector(5 downto 0);
	 variable BW_RATE : std_logic_vector(5 downto 0);
	 variable INT_ENABLE : std_logic_vector(5 downto 0);
	 variable INT_MAP : std_logic_vector(5 downto 0);
	 variable DATA_FORMAT : std_logic_vector(5 downto 0);
	 variable POWER_CONTROL : std_logic_vector(5 downto 0);
begin
	 THRESH_ACT := "100100";
	 THRESH_INACT := "100101";
	 TIME_INACT := "100110";
	 ACT_INACT_CTL := "100111";
	 THRESH_FF := "101000";
	 TIME_FF := "101001";
	 BW_RATE := "101100";
	 INT_ENABLE := "101110";
	 INT_MAP := "101111";
	 DATA_FORMAT := "110001";
	 POWER_CONTROL := "101101";
	 
    case ini_index is
        when "0000" =>
            write_data <= THRESH_ACT & "00100000"; -- Assuming THRESH_ACT is a std_logic_vector
        when "0001" =>
            write_data <= THRESH_INACT & "00000011"; -- Assuming THRESH_INACT is a std_logic_vector
        when "0010" =>
            write_data <= TIME_INACT & "00000001"; -- Assuming TIME_INACT is a std_logic_vector
        when "0011" =>
            write_data <= ACT_INACT_CTL & "01111111"; -- Assuming ACT_INACT_CTL is a std_logic_vector
        when "0100" =>
            write_data <= THRESH_FF & "00001001"; -- Assuming THRESH_FF is a std_logic_vector
        when "0101" =>
            write_data <= TIME_FF & "01000110"; -- Assuming TIME_FF is a std_logic_vector
        when "0110" =>
            write_data <= BW_RATE & "00001001"; -- Assuming BW_RATE is a std_logic_vector
        when "0111" =>
            write_data <= INT_ENABLE & "00010000"; -- Assuming INT_ENABLE is a std_logic_vector
        when "1000" =>
            write_data <= INT_MAP & "00010000"; -- Assuming INT_MAP is a std_logic_vector
        when "1001" =>
            write_data <= DATA_FORMAT & "01000000"; -- Assuming DATA_FORMAT is a std_logic_vector
        when others =>
            write_data <= POWER_CONTROL & "00001000"; -- Assuming POWER_CONTROL is a std_logic_vector
    end case;
end process;


    process(iSPI_CLK, iRSTN)
begin
    if rising_edge(iSPI_CLK) then
        if (iRSTN = '0') then
            ini_index <= "0000";
            spi_go <= '0';
            spi_state <= '0';
            read_idle_count <= "000000000000000";
            high_byte <= '0';
            read_back <= '0';
            clear_status <= '0';
        elsif (ini_index < "1011") then
            case spi_state is
                when '0' =>
                    p2s_data <= "00" & write_data;
                    spi_go <= '1';
                    spi_state <= '1';
                when '1' =>
                    if (spi_end = '1') then
                        ini_index <= std_logic_vector(unsigned(ini_index) + 1);
                        spi_go <= '0';
                        spi_state <= '0';
                    end if;
                when others =>
                    null;
            end case;
        else
            case spi_state is
                when '0' =>
                    read_idle_count <= std_logic_vector(unsigned(read_idle_count) + 1);
                    if (high_byte = '1') then
                        p2s_data(15 downto 8) <= "10" & "110011";
                        read_back <= '1';
                    elsif (read_ready = '1') then
                        p2s_data(15 downto 8) <= "10" & "110100";
                        read_back <= '1';
                    elsif (((clear_status_d(3) = '0') and iG_INT2 = '1') or read_idle_count(14) = '1') then
                        p2s_data(15 downto 8) <= "10" & "110000";
                        clear_status <= '1';
                    end if;
                    if (high_byte = '1' or read_ready = '1' or read_idle_count(14) = '1' or ((clear_status_d(3) = '0') and iG_INT2 = '1')) then
                        spi_go <= '1';
                        spi_state <= '1';
                    end if;
                    if (read_back_d = '1') then
                        if (high_byte_d = '1') then
                            oDATA_H <= s2p_data;
                            oDATA_L <= low_byte_data;
                        else
                            low_byte_data <= s2p_data;
                        end if;
                    end if;
                when '1' =>
                    if (spi_end = '1') then
                        spi_go <= '0';
                        spi_state <= '0';
                        if (read_back = '1') then
                            read_back <= '0';
                            high_byte <= not(high_byte);
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

process(iSPI_CLK, iRSTN)
begin
    if rising_edge(iSPI_CLK) then
        if (iRSTN = '0') then
            high_byte_d <= '0';
            read_back_d <= '0';
            clear_status_d <= "0000";
        else
            high_byte_d <= high_byte;
            read_back_d <= read_back;
            clear_status_d <= clear_status_d(2 downto 0) & clear_status;
        end if; 
    end if;
end process;

end Behavioral;
