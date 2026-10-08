library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_4to1 is
    Port ( IN_AND  : in  STD_LOGIC_VECTOR (3 downto 0);
           IN_OR   : in  STD_LOGIC_VECTOR (3 downto 0);
           IN_ADD  : in  STD_LOGIC_VECTOR (3 downto 0);
           C_ADD   : in  STD_LOGIC;
           SEL     : in  STD_LOGIC_VECTOR (1 downto 0);
           Y       : out STD_LOGIC_VECTOR (3 downto 0);
           COUT    : out STD_LOGIC);
end mux_4to1;
architecture Dataflow of mux_4to1 is
begin
    process(IN_AND, IN_OR, IN_ADD, C_ADD, SEL)
    begin
        case SEL is
            when "00" =>
                Y    <= IN_AND;
                COUT <= '0';
            when "01" =>
                Y    <= IN_OR;
                COUT <= '0';
            when "10" =>
                Y    <= IN_ADD;
                COUT <= C_ADD;
            when others =>
                Y    <= "0000";
                COUT <= '0';
        end case;
    end process;
	 end Dataflow;