library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DE10_LITE_GSENSOR is
    port (
        -- CLOCK
        ADC_CLK_10: in std_logic;
        MAX10_CLK1_50: in std_logic;
        MAX10_CLK2_50: in std_logic;
        
        -- KEY
        KEY : in std_logic_vector(1 downto 0);

        -- LED
        LEDR : out std_logic_vector(9 downto 0);
        
        -- Accelerometer
        GSENSOR_CS_N : out std_logic;
        GSENSOR_INT : in std_logic_vector(2 downto 1);
        GSENSOR_SCLK : out std_logic;
        GSENSOR_SDI : inout std_logic;
        GSENSOR_SDO : inout std_logic
    );
end DE10_LITE_GSENSOR;

architecture Behavioral of DE10_LITE_GSENSOR is
    signal dly_rst : std_logic;
    signal spi_clk : std_logic;
    signal spi_clk_out : std_logic;
    signal data_x : std_logic_vector(15 downto 0);
begin
    -- Reset
    u_reset_delay : entity work.reset_delay port map (
        iRSTN => KEY(0),
        iCLK => MAX10_CLK1_50,
        oRST => dly_rst
    );

    -- PLL
    u_spi_pll : entity work.spi_pll port map (
        areset => dly_rst,
        inclk0 => MAX10_CLK1_50,
        c0 => spi_clk,      -- 2MHz
        locked => spi_clk_out   -- 2MHz phase shift 
    );

    -- Initial Setting and Data Read Back
    u_spi_ee_config : entity work.spi_ee_config port map (
        iRSTN => not dly_rst,
        iSPI_CLK => spi_clk,
        iSPI_CLK_OUT => spi_clk_out,
        iG_INT2 => GSENSOR_INT(1),
        oDATA_L => data_x(7 downto 0),
        oDATA_H => data_x(15 downto 8),
        SPI_SDIO => GSENSOR_SDI,
        oSPI_CSN => GSENSOR_CS_N,
        oSPI_CLK => GSENSOR_SCLK
    );

    -- LED
    u_led_driver : entity work.led_driver port map (
        iRSTN => not dly_rst,
        iCLK => MAX10_CLK1_50,
        iDIG => data_x(9 downto 0),
        iG_INT2 => GSENSOR_INT(1),
        oLED => LEDR
    );
end Behavioral;
