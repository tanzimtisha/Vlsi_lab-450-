library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_accumulator_4bit is
end tb_accumulator_4bit;

architecture Behavior of tb_accumulator_4bit is

    component accumulator_4bit
    Port(
         CLK   : in  std_logic;
         RESET : in  std_logic;
         A     : in  std_logic_vector(3 downto 0);
         B     : in  std_logic_vector(3 downto 0);
         Q     : out std_logic_vector(3 downto 0)
        );
    end component;
	 -- Inputs
   signal CLK   : std_logic := '0';
   signal RESET : std_logic := '0';
   signal A     : std_logic_vector(3 downto 0) := (others => '0');
   signal B     : std_logic_vector(3 downto 0) := (others => '0');

   -- Outputs
   signal Q     : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 20 ns;

begin
uut: accumulator_4bit PORT MAP (
          CLK => CLK,
          RESET => RESET,
          A => A,
          B => B,
          Q => Q
        );

   -- Clock Process
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
	-- Stimulus Process
   stim_proc: process
   begin		
      -- Step 1: Reset active
      RESET <= '1';
      A <= "0000";
      B <= "0000";
      wait for CLK_period;

      -- Step 2: 3 + 5 = 8 ("1000")
      RESET <= '0';
      A <= "0011";
      B <= "0101";
      wait for CLK_period;

      -- Step 3: 2 + 1 = 3 ("0011")
      A <= "0010";
      B <= "0001";
      wait for CLK_period;
		-- Step 4: 15 + 1 = 16 -> Overflow ("0000")
      A <= "1111";
      B <= "0001";
      wait for CLK_period;

      -- Step 5: 10 + 5 = 15 ("1111")
      A <= "1010";
      B <= "0101";
      wait for CLK_period;

      wait;
   end process;

end Behavior;