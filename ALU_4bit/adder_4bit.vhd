library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder_4bit is
    Port ( A    : in  STD_LOGIC_VECTOR (3 downto 0);
           B    : in  STD_LOGIC_VECTOR (3 downto 0);
           CIN  : in  STD_LOGIC;
           SUM  : out STD_LOGIC_VECTOR (3 downto 0);
           COUT : out STD_LOGIC);
end adder_4bit;
architecture Structural of adder_4bit is

    component full_adder is
        Port ( A    : in  STD_LOGIC;
               B    : in  STD_LOGIC;
               CIN  : in  STD_LOGIC;
               SUM  : out STD_LOGIC;
               COUT : out STD_LOGIC);
    end component;

    signal c1, c2, c3 : STD_LOGIC;

begin
FA0: full_adder port map (A => A(0), B => B(0), CIN => CIN, SUM => SUM(0), COUT => c1);
    FA1: full_adder port map (A => A(1), B => B(1), CIN => c1,  SUM => SUM(1), COUT => c2);
    FA2: full_adder port map (A => A(2), B => B(2), CIN => c2,  SUM => SUM(2), COUT => c3);
    FA3: full_adder port map (A => A(3), B => B(3), CIN => c3,  SUM => SUM(3), COUT => COUT);

end Structural;