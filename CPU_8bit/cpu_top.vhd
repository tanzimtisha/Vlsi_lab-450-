library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cpu_top is
    Port ( clk    : in  STD_LOGIC;
           reset  : in  STD_LOGIC;
           Q      : out STD_LOGIC_VECTOR (7 downto 0);
           Z      : out STD_LOGIC;
           PC_out : out STD_LOGIC_VECTOR (3 downto 0));
end cpu_top;

architecture Structural of cpu_top is
    signal current_pc : STD_LOGIC_VECTOR(3 downto 0);
    signal instr      : STD_LOGIC_VECTOR(11 downto 0);
    signal alu_op     : STD_LOGIC_VECTOR(2 downto 0);
    signal acc_write  : STD_LOGIC;
    signal pc_load    : STD_LOGIC;
    signal alu_res    : STD_LOGIC_VECTOR(7 downto 0);
    signal alu_zero   : STD_LOGIC;
    signal acc_val    : STD_LOGIC_VECTOR(7 downto 0);
    signal z_val      : STD_LOGIC;

begin
   U_PC: entity work.pc
        port map (
            clk       => clk,
            reset     => reset,
            pc_load   => pc_load,
            target_pc => instr(3 downto 0),
            pc_out    => current_pc
        );

    U_ROM: entity work.program_rom
        port map (
            addr => current_pc,
            data => instr
        );
		  
	 U_CTRL: entity work.control_unit
        port map (
            opcode    => instr(11 downto 8),
            z_flag    => z_val,
            alu_op    => alu_op,
            acc_write => acc_write,
            pc_load   => pc_load
        );

    U_ALU: entity work.alu
        port map (
            acc_in  => acc_val,
            operand => instr(7 downto 0),
            alu_op  => alu_op,
            result  => alu_res,
            zero    => alu_zero
        ); 
		  
	 U_REGS: entity work.cpu_registers
        port map (
            clk       => clk,
            reset     => reset,
            acc_write => acc_write,
            alu_res   => alu_res,
            alu_zero  => alu_zero,
            acc_out   => acc_val,
            z_out     => z_val
        );

    Q      <= acc_val;
    Z      <= z_val;
    PC_out <= current_pc;

end Structural;