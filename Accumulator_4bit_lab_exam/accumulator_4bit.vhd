library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity accumulator_4bit is
    Port ( CLK   : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           A     : in  STD_LOGIC_VECTOR (3 downto 0);
           B     : in  STD_LOGIC_VECTOR (3 downto 0);
           Q     : out STD_LOGIC_VECTOR (3 downto 0));
end accumulator_4bit;

architecture Structural of accumulator_4bit is

    signal sum_internal : STD_LOGIC_VECTOR (3 downto 0);
	 component adder_4bit is
        Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
               B : in  STD_LOGIC_VECTOR (3 downto 0);
               SUM : out  STD_LOGIC_VECTOR (3 downto 0));
    end component;

    component register_4bit is
        Port ( CLK   : in  STD_LOGIC;
               RESET : in  STD_LOGIC;
               D     : in  STD_LOGIC_VECTOR (3 downto 0);
               Q     : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

begin
ADDER_UNIT: adder_4bit port map (
        A => A,
        B => B,
        SUM => sum_internal
    );

    REG_UNIT: register_4bit port map (
        CLK => CLK,
        RESET => RESET,
        D => sum_internal,
        Q => Q
    );

end Structural;
