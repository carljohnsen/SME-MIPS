
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.TEXTIO.all;
use IEEE.STD_LOGIC_TEXTIO.all;

--library SYSTEM_TYPES;
use work.SYSTEM_TYPES.ALL;

--library CUSTOM_TYPES;
use work.CUSTOM_TYPES.ALL;

use work.csv_util.all;

-- User defined packages here
-- #### USER-DATA-IMPORTS-START
-- #### USER-DATA-IMPORTS-END

entity LogicGates_tb is
end;

architecture TestBench of LogicGates_tb is

  signal CLOCK : Std_logic;
  signal StopClock : BOOLEAN;
  signal RESET : Std_logic;

  signal Input_bit1 : T_SYSTEM_BOOL;
  signal Input_bit2 : T_SYSTEM_BOOL;
  signal Output_And : T_SYSTEM_BOOL;
  signal Output_Or : T_SYSTEM_BOOL;
  signal Output_Not : T_SYSTEM_BOOL;
  signal Output_Xor : T_SYSTEM_BOOL;

begin

  uut: entity work.LogicGates
  port map (

    Input_bit1 => Input_bit1,
    Input_bit2 => Input_bit2,
    Output_And => Output_And,
    Output_Or => Output_Or,
    Output_Not => Output_Not,
    Output_Xor => Output_Xor,

    RST => RESET,
    CLK => CLOCK
  );

  Clk: process
  begin
    while not StopClock loop
      CLOCK <= '1';
      wait for 5 NS;
      CLOCK <= '0';
      wait for 5 NS;
    end loop;
    wait;
  end process;


TraceFileTester: process
    file F: TEXT;
    variable L: LINE;
    variable Status: FILE_OPEN_STATUS;
    constant filename : string := "C:\Users\ihicajo\Documents\Xilinx\LogicGates\trace.csv";
    variable clockcycle : integer := 0;
    variable tmp : CSV_LINE_T;
    variable readOK : boolean;
    variable fieldno : integer := 0;

begin

    -- #### USER-DATA-CONDITONING-START
    -- #### USER-DATA-CONDITONING-END

    FILE_OPEN(Status, F, filename, READ_MODE);
    if Status /= OPEN_OK then
        report "Failed to open CSV trace file" severity Failure;
    else
        -- Verify the headers
        READLINE(F, L);

        fieldno := 0;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "Input.bit1") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Input.bit1" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "Input.bit2") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Input.bit2" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "Output.And") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Output.And" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "Output.Not") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Output.Not" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "Output.Or") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Output.Or" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "Output.Xor") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Output.Xor" severity Failure;
        fieldno := fieldno + 1;

		RESET <= '1';
        wait for 5 NS;
        RESET <= '0';

        -- Read a line each clock
        while not ENDFILE(F) loop
            READLINE(F, L);

            fieldno := 0;

            -- Write all driver signals out
            read_csv_field(L, tmp);
            if are_strings_equal(tmp, "U") then
                Input_bit1 <= 'U';
            else
                Input_bit1 <= to_std_logic(truncate(tmp));
            end if;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            if are_strings_equal(tmp, "U") then
                Input_bit2 <= 'U';
            else
                Input_bit2 <= to_std_logic(truncate(tmp));
            end if;
            fieldno := fieldno + 1;

            wait until Rising_edge(CLOCK);

            -- Compare each signal with the value in the CSV file
	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(Output_And), tmp) report "Value for Output_And in cycle " & integer'image(clockcycle) & " was: " & str(Output_And) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(Output_Not), tmp) report "Value for Output_Not in cycle " & integer'image(clockcycle) & " was: " & str(Output_Not) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(Output_Or), tmp) report "Value for Output_Or in cycle " & integer'image(clockcycle) & " was: " & str(Output_Or) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(Output_Xor), tmp) report "Value for Output_Xor in cycle " & integer'image(clockcycle) & " was: " & str(Output_Xor) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;


            clockcycle := clockcycle + 1;
        end loop;

        FILE_CLOSE(F);
    end if;

	report "completed after " & integer'image(clockcycle) & " clockcycles";
    StopClock <= true;

    wait;
end process;
end architecture TestBench;