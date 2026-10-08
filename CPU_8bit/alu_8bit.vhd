library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu is
    Port ( acc_in  : in  STD_LOGIC_VECTOR (7 downto 0);
           operand : in  STD_LOGIC_VECTOR (7 downto 0);
           alu_op  : in  STD_LOGIC_VECTOR (2 downto 0);
           result  : out STD_LOGIC_VECTOR (7 downto 0);
           zero    : out STD_LOGIC);
end alu;

architecture Behavioral of alu is
    signal res_internal : STD_LOGIC_VECTOR(7 downto 0);
begin
    process(acc_in, operand, alu_op)
    begin
        case alu_op is
		      when "001"  => res_internal <= operand;
            when "010"  => res_internal <= std_logic_vector(unsigned(acc_in) + unsigned(operand));
            when "011"  => res_internal <= acc_in and operand;
            when "100"  => res_internal <= not acc_in;
            when others => res_internal <= acc_in;
        end case;
    end process;
	 
	 result <= res_internal;
    zero   <= '1' when res_internal = x"00" else '0';
end Behavioral;