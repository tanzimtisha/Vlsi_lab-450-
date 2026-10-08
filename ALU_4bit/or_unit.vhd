library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or_unit is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end or_unit;

architecture Dataflow of or_unit is
begin
    Y <= A or B;
end Dataflow;