library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- library SYSTEM_TYPES;
use work.SYSTEM_TYPES.ALL;

-- library CUSTOM_TYPES;
use work.CUSTOM_TYPES.ALL;

-- User defined packages here
-- #### USER-DATA-IMPORTS-START
-- #### USER-DATA-IMPORTS-END


entity EX_ALU is
  port(
    -- Input bus EX_ShmtMuxOut signals
    EX_ShmtMuxOut_data: in T_SYSTEM_UINT32;
    -- Input bus EX_ImmMuxOut signals
    EX_ImmMuxOut_data: in T_SYSTEM_UINT32;
    -- Input bus EX_ALUOperation signals
    EX_ALUOperation_code: in PipelinedMIPS_ALUOps;

    -- Output bus EX_Zero signals
    EX_Zero_flg: out T_SYSTEM_BOOL;
    -- Output bus EX_ALUResult signals
    EX_ALUResult_data: out T_SYSTEM_UINT32;


    -- Reset signal
    RST : Std_logic;

    -- Clock signal
    CLK : Std_logic
 );
end EX_ALU;

architecture RTL of EX_ALU is






  -- User defined signals, procedures and components here
  -- #### USER-DATA-SIGNALS-START
  -- #### USER-DATA-SIGNALS-END

begin

    -- #### USER-DATA-PROCESSES-START
    -- #### USER-DATA-PROCESSES-END


    process(
        CLK, 
        RST
    )


    -- #### USER-DATA-CLOCKEDVARIABLES-START
    -- #### USER-DATA-CLOCKEDVARIABLES-END
    begin

        -- Shared initialize code here
        -- #### USER-DATA-CLOCKEDSHAREDINITIALIZECODE-START
        -- #### USER-DATA-CLOCKEDSHAREDINITIALIZECODE-END

        if RST = '1' then
            -- Reset code here
            -- #### USER-DATA-RESETCODE-START
            -- #### USER-DATA-RESETCODE-END

        elsif rising_edge(CLK) then

            -- Initialize code here
            -- #### USER-DATA-CLOCKEDINITIALIZECODE-START
            -- #### USER-DATA-CLOCKEDINITIALIZECODE-END



            -- #### USER-DATA-ONRISE-START
            -- #### USER-DATA-ONRISE-END

        end if;
    end process;


    process(
        -- #### USER-DATA-SENSITIVITY-START
        -- #### USER-DATA-SENSITIVITY-END
        EX_ShmtMuxOut_data,
        EX_ImmMuxOut_data,
        EX_ALUOperation_code,
        CLK,
        RST
    )
    -- Internal variables
    variable HILO : T_SYSTEM_UINT64;
    variable num : T_SYSTEM_UINT32;
    variable local_var_0 : T_SYSTEM_UINT32;
    variable local_var_1 : T_SYSTEM_UINT32;

    -- #### USER-DATA-NONCLOCKEDVARIABLES-START
    -- #### USER-DATA-NONCLOCKEDVARIABLES-END
	begin
        -- Initialize code here
        -- #### USER-DATA-NONCLOCKEDSHAREDINITIALIZECODE-START
        -- #### USER-DATA-NONCLOCKEDSHAREDINITIALIZECODE-END

        if RST = '1' then
            EX_Zero_flg <= '0';
            EX_ALUResult_data <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            HILO := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT64'length));
            num := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            local_var_0 := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            local_var_1 := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));

            -- Initialize code here
            -- #### USER-DATA-NONCLOCKEDRESETCODE-START
            -- #### USER-DATA-NONCLOCKEDRESETCODE-END
        else


            -- Initialize code here
            -- #### USER-DATA-NONCLOCKEDINITIALIZECODE-START
            -- #### USER-DATA-NONCLOCKEDINITIALIZECODE-END


            num := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            case EX_ALUOperation_code is
                when PipelinedMIPS_ALUOps_and =>
                    num := EX_ShmtMuxOut_data and EX_ImmMuxOut_data;
                when PipelinedMIPS_ALUOps_or =>
                    num := EX_ShmtMuxOut_data or EX_ImmMuxOut_data;
                when PipelinedMIPS_ALUOps_add =>
                    num := STD_LOGIC_VECTOR(UNSIGNED(EX_ShmtMuxOut_data) + UNSIGNED(EX_ImmMuxOut_data));
                when PipelinedMIPS_ALUOps_sl =>
                    num := STD_LOGIC_VECTOR(shift_left(UNSIGNED(EX_ImmMuxOut_data), TO_INTEGER(UNSIGNED(EX_ShmtMuxOut_data))));
                when PipelinedMIPS_ALUOps_sr =>
                    num := STD_LOGIC_VECTOR(shift_right(UNSIGNED(EX_ImmMuxOut_data), TO_INTEGER(UNSIGNED(EX_ShmtMuxOut_data))));
                when PipelinedMIPS_ALUOps_sra =>
                    num := STD_LOGIC_VECTOR(shift_left(UNSIGNED(EX_ShmtMuxOut_data), TO_INTEGER(UNSIGNED(EX_ImmMuxOut_data))));
                when PipelinedMIPS_ALUOps_sub =>
                    num := STD_LOGIC_VECTOR(UNSIGNED(EX_ShmtMuxOut_data) - UNSIGNED(EX_ImmMuxOut_data));
                when PipelinedMIPS_ALUOps_slt =>
                    if UNSIGNED(EX_ShmtMuxOut_data) < UNSIGNED(EX_ImmMuxOut_data) then
                        local_var_0 := STD_LOGIC_VECTOR(TO_UNSIGNED(1, T_SYSTEM_UINT32'length));
                    else
                        local_var_0 := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
                    end if;
                    num := local_var_0;
                when PipelinedMIPS_ALUOps_addu =>
                    num := STD_LOGIC_VECTOR(UNSIGNED(EX_ShmtMuxOut_data) + UNSIGNED(EX_ImmMuxOut_data));
                when PipelinedMIPS_ALUOps_subu =>
                    num := STD_LOGIC_VECTOR(UNSIGNED(EX_ShmtMuxOut_data) - UNSIGNED(EX_ImmMuxOut_data));
                when PipelinedMIPS_ALUOps_mult =>
                    if falling_edge(CLK) then
                        HILO := STD_LOGIC_VECTOR(UNSIGNED(EX_ShmtMuxOut_data) * UNSIGNED(EX_ImmMuxOut_data));
                    end if;
                when PipelinedMIPS_ALUOps_multu =>
                    if falling_edge(CLK) then
                        HILO := STD_LOGIC_VECTOR(SIGNED(EX_ShmtMuxOut_data) * SIGNED(EX_ImmMuxOut_data));
                    end if;
                when PipelinedMIPS_ALUOps_nor =>
                    num := not (EX_ShmtMuxOut_data or EX_ImmMuxOut_data);
                when PipelinedMIPS_ALUOps_div =>
                    if falling_edge(CLK) then
                        HILO(63 downto 32) := STD_LOGIC_VECTOR(SIGNED(EX_ShmtMuxOut_data) mod SIGNED(EX_ImmMuxOut_data));
                        HILO(31 downto 0)  := STD_LOGIC_VECTOR(SIGNED(EX_ShmtMuxOut_data) / SIGNED(EX_ImmMuxOut_data));
                    end if;
                when PipelinedMIPS_ALUOps_divu =>
                    if falling_edge(CLK) then
                        HILO(63 downto 32) := STD_LOGIC_VECTOR(UNSIGNED(EX_ShmtMuxOut_data) mod UNSIGNED(EX_ImmMuxOut_data));
                        HILO(31 downto 0) := STD_LOGIC_VECTOR(UNSIGNED(EX_ShmtMuxOut_data) / UNSIGNED(EX_ImmMuxOut_data));
                    end if;
                when PipelinedMIPS_ALUOps_xor =>
                    num := EX_ShmtMuxOut_data xor EX_ImmMuxOut_data;
                when PipelinedMIPS_ALUOps_mtlo =>
                    if falling_edge(CLK) then
                        HILO(31 downto 0) := EX_ShmtMuxOut_data;
                    end if;
                when PipelinedMIPS_ALUOps_mthi =>
                    if falling_edge(CLK) then
                        HILO(63 downto 32) := EX_ShmtMuxOut_data;
                    end if;
                when PipelinedMIPS_ALUOps_mflo =>
                    num := HILO(31 downto 0);
                when PipelinedMIPS_ALUOps_mfhi =>
                    num := HILO(63 downto 32);
                when PipelinedMIPS_ALUOps_sltu =>
                    if UNSIGNED(EX_ShmtMuxOut_data) < UNSIGNED(EX_ImmMuxOut_data) then
                        local_var_1 := STD_LOGIC_VECTOR(TO_UNSIGNED(1, T_SYSTEM_UINT32'length));
                    else
                        local_var_1 := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
                    end if;
                    num := local_var_1;
                when others =>
                    num := STD_LOGIC_VECTOR'("11111111111111111111111111111111");
            end case;
            EX_ALUResult_data <= num;
            if UNSIGNED(num) = TO_UNSIGNED(0, 32) then
                EX_Zero_flg <= '1';
            else
                EX_Zero_flg <= '0';
            end if;

        end if;

        -- Non-clocked process actions here

        -- #### USER-DATA-CODE-START
        -- #### USER-DATA-CODE-END

    end process;

end RTL;

-- User defined architectures here
-- #### USER-DATA-ARCH-START
-- #### USER-DATA-ARCH-END
