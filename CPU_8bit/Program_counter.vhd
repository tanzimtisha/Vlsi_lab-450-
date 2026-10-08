library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity pc is
    Port ( clk      : in  STD_LOGIC;
           reset    : in  STD_LOGIC;
           pc_load  : in  STD_LOGIC;
           target_pc: in  STD_LOGIC_VECTOR (3 downto 0);
           pc_out   : out STD_LOGIC_VECTOR (3 downto 0));
end pc;

architecture Behavioral of pc is
    signal pc_reg : unsigned(3 downto 0) := (others => '0');
begin
    process(clk)
    begin
	 if rising_edge(clk) then
            if reset = '1' then
                pc_reg <= (others => '0');
            elsif pc_load = '1' then
                pc_reg <= unsigned(target_pc);
            else
                pc_reg <= pc_reg + 1;
            end if;
        end if;
    end process;
    pc_out <= std_logic_vector(pc_reg);
end Behavioral;