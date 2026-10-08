library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_alu_4bit is
end tb_alu_4bit;

architecture Behavior of tb_alu_4bit is

    component alu_4bit
    Port(
         A    : in  std_logic_vector(3 downto 0);
         B    : in  std_logic_vector(3 downto 0);
         SEL  : in  std_logic_vector(1 downto 0);
         Y    : out std_logic_vector(3 downto 0);
         COUT : out std_logic
        );
    end component;
	 -- Inputs
   signal A    : std_logic_vector(3 downto 0) := (others => '0');
   signal B    : std_logic_vector(3 downto 0) := (others => '0');
   signal SEL  : std_logic_vector(1 downto 0) := (others => '0');

   -- Outputs
   signal Y    : std_logic_vector(3 downto 0);
   signal COUT : std_logic;

begin

   uut: alu_4bit PORT MAP (
          A => A,
          B => B,
          SEL => SEL,
          Y => Y,
          COUT => COUT
        );
		  stim_proc: process
   begin		
      -- Step 1: AND (1100 AND 1010)
      SEL <= "00"; A <= "1100"; B <= "1010"; wait for 10 ns;
      assert (Y = "1000" and COUT = '0') report "Step 1 Failed" severity error;

      -- Step 2: AND (1111 AND 0101)
      SEL <= "00"; A <= "1111"; B <= "0101"; wait for 10 ns;
      assert (Y = "0101" and COUT = '0') report "Step 2 Failed" severity error;
		-- Step 3: OR (1100 OR 0011)
      SEL <= "01"; A <= "1100"; B <= "0011"; wait for 10 ns;
      assert (Y = "1111" and COUT = '0') report "Step 3 Failed" severity error;

      -- Step 4: OR (1001 OR 0100)
      SEL <= "01"; A <= "1001"; B <= "0100"; wait for 10 ns;
      assert (Y = "1101" and COUT = '0') report "Step 4 Failed" severity error;
		-- Step 5: ADD (3 + 5 = 8)
      SEL <= "10"; A <= "0011"; B <= "0101"; wait for 10 ns;
      assert (Y = "1000" and COUT = '0') report "Step 5 Failed" severity error;

      -- Step 6: ADD Overflow (15 + 1 = 16)
      SEL <= "10"; A <= "1111"; B <= "0001"; wait for 10 ns;
      assert (Y = "0000" and COUT = '1') report "Step 6 Failed" severity error;
		-- Step 7: ADD Max (10 + 5 = 15)
      SEL <= "10"; A <= "1010"; B <= "0101"; wait for 10 ns;
      assert (Y = "1111" and COUT = '0') report "Step 7 Failed" severity error;

      -- Step 8: Unused Select Code
      SEL <= "11"; A <= "1010"; B <= "0101"; wait for 10 ns;
      assert (Y = "0000" and COUT = '0') report "Step 8 Failed" severity error;
		wait;
   end process;

end Behavior;