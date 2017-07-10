library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Multiplier is
  port(
    InputA : in std_logic_vector(31 downto 0);
    InputB : in std_logic_vector(31 downto 0);
    Output : out std_logic_vector(31 downto 0)
  );
end Multiplier;

architecture RTL of Multiplier is

begin
    process(InputA, InputB)
	begin
        Output <= STD_LOGIC_VECTOR(UNSIGNED(InputA) * UNSIGNED(InputB));
    end process;
end RTL;
