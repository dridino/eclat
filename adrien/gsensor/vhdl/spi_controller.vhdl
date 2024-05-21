library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

entity spi_controller is
    generic (
        SI_DataL: integer := 15;
        SO_DataL: integer := 7
    );
    port (
        iRSTN: in std_logic;
        iSPI_CLK: in std_logic;
        iSPI_CLK_OUT: in std_logic;
        iP2S_DATA: in std_logic_vector(SI_DataL downto 0);
        iSPI_GO: in std_logic;
        oSPI_END: out std_logic;
        oS2P_DATA: out std_logic_vector(SO_DataL downto 0);
        SPI_SDIO: inout std_logic;
        oSPI_CSN: out std_logic;
        oSPI_CLK: out std_logic
    );
end spi_controller;

architecture Behavioral of spi_controller is
    signal read_mode, write_address: std_logic;
    signal spi_count_en: std_logic;
    signal spi_count: std_logic_vector(3 downto 0);
begin
    read_mode <= iP2S_DATA(SI_DataL);
    write_address <= spi_count(3);
    oSPI_END <= not or_reduce(spi_count);
    oSPI_CSN <= not iSPI_GO;
    process(spi_count_en)
    begin
        if spi_count_en = '1' then
            oSPI_CLK <= iSPI_CLK_OUT;
        else
            oSPI_CLK <= '1';
        end if;
    end process;
     process(spi_count_en, read_mode, write_address)
	 begin
	 if spi_count_en and ((not read_mode) or write_address) then
	 	SPI_SDIO <= iP2S_DATA(to_integer(unsigned(spi_count)));
	 else
	 	SPI_SDIO <= 'Z';
	 end if;
	 end process;
    process(iSPI_CLK, iRSTN)
    begin
        if rising_edge(iSPI_CLK) then
            if (iRSTN = '0') then
                spi_count_en <= '0';
                spi_count <= "1111";
            else
                if (oSPI_END = '1') then
                    spi_count_en <= '0';
                elsif (iSPI_GO = '1') then
                    spi_count_en <= '1';
                end if;

                if (spi_count_en = '0') then
                    spi_count <= "1111";
                else
                    spi_count <= std_logic_vector(unsigned(spi_count) - 1);
                end if;

                if (read_mode = '1' and write_address = '0') then
                    oS2P_DATA <= oS2P_DATA(SO_DataL-1 downto 0) & SPI_SDIO;
                end if;
            end if;
        end if;
    end process;
end Behavioral;
