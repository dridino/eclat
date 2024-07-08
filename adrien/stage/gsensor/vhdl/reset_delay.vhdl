library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reset_delay is
    port (
        iRSTN : in std_logic;
        iCLK : in std_logic;
        oRST : out std_logic
    );
end entity reset_delay;

architecture Behavioral of reset_delay is
    signal cont : std_logic_vector(20 downto 0);
begin
    process(iCLK, iRSTN)
    begin
        if rising_edge(iCLK) then
            if (iRSTN = '0') then
                cont <= "000000000000000000000";
                oRST <= '1';
            elsif (cont(20) = '0') then
                cont <= std_logic_vector(unsigned(cont) + 1);
                oRST <= '1';
            else
                oRST <= '0';
            end if;
        end if;
    end process;
end architecture Behavioral;
