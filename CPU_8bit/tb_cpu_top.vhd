library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_cpu_top is
end tb_cpu_top;

architecture Behavioral of tb_cpu_top is

    component cpu_top
        Port ( clk    : in  STD_LOGIC;
               reset  : in  STD_LOGIC;
               Q      : out STD_LOGIC_VECTOR (7 downto 0);
               Z      : out STD_LOGIC;
               PC_out : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
	 
	 signal clk    : STD_LOGIC := '0';
    signal reset  : STD_LOGIC := '0';
    signal Q      : STD_LOGIC_VECTOR(7 downto 0);
    signal Z      : STD_LOGIC;
    signal PC_out : STD_LOGIC_VECTOR(3 downto 0);

    constant clk_period : time := 10 ns;

begin

   uut: cpu_top PORT MAP (
          clk    => clk,
          reset  => reset,
          Q      => Q,
          Z      => Z,
          PC_out => PC_out
        );

    clk_process : process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;
	 
	 stim_proc: process
    begin
        reset <= '1';
        wait for clk_period;
        reset <= '0';
        wait for clk_period * 15;
        wait;
    end process;
	 
end Behavioral;