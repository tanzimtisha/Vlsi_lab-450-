library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_unit is
    Port ( opcode    : in  STD_LOGIC_VECTOR (3 downto 0);
           z_flag    : in  STD_LOGIC;
           alu_op    : out STD_LOGIC_VECTOR (2 downto 0);
           acc_write : out STD_LOGIC;
           pc_load   : out STD_LOGIC);
end control_unit;

architecture Behavioral of control_unit is
begin
    process(opcode, z_flag)
    begin
        alu_op    <= "000";
        acc_write <= '0';
        pc_load   <= '0';

        case opcode is
            when "0001" => -- LDI
                alu_op    <= "001";
                acc_write <= '1';
					 
				when "0010" => -- ADD
                alu_op    <= "010";
                acc_write <= '1';

            when "0100" => -- AND
                alu_op    <= "011";
                acc_write <= '1';

            when "0111" => -- NOT
                alu_op    <= "100";
                acc_write <= '1'; 
					 
				when "1100" => -- JZ
                if z_flag = '1' then
                    pc_load <= '1';
                end if;

            when others =>
                null;
	     end case;
    end process;
end Behavioral;				 