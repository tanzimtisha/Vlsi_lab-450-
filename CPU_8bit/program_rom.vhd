library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity program_rom is
    Port ( addr : in  STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end program_rom;

architecture Behavioral of program_rom is
    type rom_type is array (0 to 15) of STD_LOGIC_VECTOR(11 downto 0);
    
    constant ROM : rom_type := (
        0 => x"1A5",
        1 => x"45A",
        2 => x"C05",
        3 => x"201",
        4 => x"201",
        5 => x"700",
        6 => x"40F",
        7 => x"C00",
        8 => x"201",
        others => x"000"
    );
begin
    data <= ROM(to_integer(unsigned(addr)));
end Behavioral; 