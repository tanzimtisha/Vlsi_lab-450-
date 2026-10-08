library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_4bit is
    Port ( A    : in  STD_LOGIC_VECTOR (3 downto 0);
           B    : in  STD_LOGIC_VECTOR (3 downto 0);
           SEL  : in  STD_LOGIC_VECTOR (1 downto 0);
           Y    : out STD_LOGIC_VECTOR (3 downto 0);
           COUT : out STD_LOGIC);
end alu_4bit;
architecture Structural of alu_4bit is

    signal wire_and : STD_LOGIC_VECTOR (3 downto 0);
    signal wire_or  : STD_LOGIC_VECTOR (3 downto 0);
    signal wire_add : STD_LOGIC_VECTOR (3 downto 0);
    signal wire_c   : STD_LOGIC;
	 component and_unit is
        Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
               B : in  STD_LOGIC_VECTOR (3 downto 0);
               Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    component or_unit is
        Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
               B : in  STD_LOGIC_VECTOR (3 downto 0);
               Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
	 component adder_4bit is
        Port ( A    : in  STD_LOGIC_VECTOR (3 downto 0);
               B    : in  STD_LOGIC_VECTOR (3 downto 0);
               CIN  : in  STD_LOGIC;
               SUM  : out STD_LOGIC_VECTOR (3 downto 0);
               COUT : out STD_LOGIC);
    end component;
	 component mux_4to1 is
        Port ( IN_AND  : in  STD_LOGIC_VECTOR (3 downto 0);
               IN_OR   : in  STD_LOGIC_VECTOR (3 downto 0);
               IN_ADD  : in  STD_LOGIC_VECTOR (3 downto 0);
               C_ADD   : in  STD_LOGIC;
               SEL     : in  STD_LOGIC_VECTOR (1 downto 0);
               Y       : out STD_LOGIC_VECTOR (3 downto 0);
               COUT    : out STD_LOGIC);
    end component;
	 begin

    U_AND: and_unit port map (A => A, B => B, Y => wire_and);
    U_OR:  or_unit  port map (A => A, B => B, Y => wire_or);
    U_ADD: adder_4bit port map (A => A, B => B, CIN => '0', SUM => wire_add, COUT => wire_c);

    U_MUX: mux_4to1 port map (
        IN_AND => wire_and,
        IN_OR  => wire_or,
        IN_ADD => wire_add,
        C_ADD  => wire_c,
        SEL    => SEL,
        Y      => Y,
        COUT   => COUT
    );

end Structural;