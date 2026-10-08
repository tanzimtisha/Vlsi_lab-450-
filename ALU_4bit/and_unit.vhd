library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_unit is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end and_unit;

architecture Dataflow of and_unit is
begin
    Y <= A and B;
end Dataflow;