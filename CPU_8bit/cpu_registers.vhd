library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cpu_registers is
    Port ( clk       : in  STD_LOGIC;
           reset     : in  STD_LOGIC;
           acc_write : in  STD_LOGIC;
           alu_res   : in  STD_LOGIC_VECTOR (7 downto 0);
           alu_zero  : in  STD_LOGIC;
           acc_out   : out STD_LOGIC_VECTOR (7 downto 0);
           z_out     : out STD_LOGIC);
end cpu_registers;

architecture Behavioral of cpu_registers is
    signal acc_reg : STD_LOGIC_VECTOR(7 downto 0) := x"00";
    signal z_reg   : STD_LOGIC := '1';
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                acc_reg <= x"00";
                z_reg   <= '1';
            elsif acc_write = '1' then
                acc_reg <= alu_res;
                z_reg   <= alu_zero;
					 end if;
        end if;
    end process;

    acc_out <= acc_reg;
    z_out   <= z_reg;
end Behavioral;