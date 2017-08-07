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


entity ALU is
  port(
    -- Input bus ShmtMuxOut signals
    ShmtMuxOut_data: in T_SYSTEM_UINT32;
    -- Input bus ImmMuxOut signals
    ImmMuxOut_data: in T_SYSTEM_UINT32;
    -- Input bus ALUOperation signals
    ALUOperation_code: in SingleCycleMIPS_ALUOps;

    -- Output bus Zero signals
    Zero_flg: out T_SYSTEM_BOOL;
    -- Output bus ALUResult signals
    ALUResult_data: out T_SYSTEM_UINT32;


    -- Reset signal
    RST : Std_logic;

    -- Clock signal
    CLK : Std_logic
 );
end ALU;

architecture RTL of ALU is






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
        ShmtMuxOut_data,
        ImmMuxOut_data,
        ALUOperation_code,
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
            Zero_flg <= '0';
            ALUResult_data <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
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
            case ALUOperation_code is
                when SingleCycleMIPS_ALUOps_and =>
                    num := ShmtMuxOut_data and ImmMuxOut_data;
                when SingleCycleMIPS_ALUOps_or =>
                    num := ShmtMuxOut_data or ImmMuxOut_data;
                when SingleCycleMIPS_ALUOps_add =>
                    num := STD_LOGIC_VECTOR(SIGNED(ShmtMuxOut_data) + SIGNED(ImmMuxOut_data));
                when SingleCycleMIPS_ALUOps_sl =>
                    num := STD_LOGIC_VECTOR(shift_left(UNSIGNED(ImmMuxOut_data), TO_INTEGER(UNSIGNED(ShmtMuxOut_data))));
                when SingleCycleMIPS_ALUOps_sr =>
                    num := STD_LOGIC_VECTOR(shift_right(UNSIGNED(ImmMuxOut_data), TO_INTEGER(UNSIGNED(ShmtMuxOut_data))));
                when SingleCycleMIPS_ALUOps_sra =>
                    num := STD_LOGIC_VECTOR(shift_right(SIGNED(ShmtMuxOut_data), TO_INTEGER(UNSIGNED(ImmMuxOut_data))));
                when SingleCycleMIPS_ALUOps_sub =>
                    num := STD_LOGIC_VECTOR(SIGNED(ShmtMuxOut_data) - SIGNED(ImmMuxOut_data));
                when SingleCycleMIPS_ALUOps_slt =>
                    if SIGNED(ShmtMuxOut_data) < SIGNED(ImmMuxOut_data) then
                        local_var_0 := STD_LOGIC_VECTOR(TO_UNSIGNED(1, T_SYSTEM_UINT32'length));
                    else
                        local_var_0 := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
                    end if;
                    num := local_var_0;
                when SingleCycleMIPS_ALUOps_addu =>
                    num := STD_LOGIC_VECTOR(UNSIGNED(ShmtMuxOut_data) + UNSIGNED(ImmMuxOut_data));
                when SingleCycleMIPS_ALUOps_subu =>
                    num := STD_LOGIC_VECTOR(UNSIGNED(ShmtMuxOut_data) - UNSIGNED(ImmMuxOut_data));
                when SingleCycleMIPS_ALUOps_mult =>
                    if falling_edge(CLK) then
                        HILO := STD_LOGIC_VECTOR(SIGNED(ShmtMuxOut_data) * SIGNED(ImmMuxOut_data));
                    end if;
                when SingleCycleMIPS_ALUOps_multu =>
                    if falling_edge(CLK) then
                        HILO := STD_LOGIC_VECTOR(UNSIGNED(ShmtMuxOut_data) * UNSIGNED(ImmMuxOut_data));
                    end if;
                when SingleCycleMIPS_ALUOps_nor =>
                    num := not (ShmtMuxOut_data or ImmMuxOut_data);
                when SingleCycleMIPS_ALUOps_div =>
                    if falling_edge(CLK) then
                        HILO(63 downto 32) := STD_LOGIC_VECTOR(SIGNED(ShmtMuxOut_data) mod SIGNED(ImmMuxOut_data));
                        HILO(31 downto 0) := STD_LOGIC_VECTOR(SIGNED(ShmtMuxOut_data) / SIGNED(ImmMuxOut_data));
                    end if;
                when SingleCycleMIPS_ALUOps_divu =>
                    if falling_edge(CLK) then
                        HILO(63 downto 32) := STD_LOGIC_VECTOR(UNSIGNED(ShmtMuxOut_data) mod UNSIGNED(ImmMuxOut_data));
                        HILO(31 downto 0) := STD_LOGIC_VECTOR(UNSIGNED(ShmtMuxOut_data) / UNSIGNED(ImmMuxOut_data));
                    end if;
                when SingleCycleMIPS_ALUOps_xor =>
                    num := ShmtMuxOut_data xor ImmMuxOut_data;
                when SingleCycleMIPS_ALUOps_mtlo =>
                    if falling_edge(CLK) then
                        HILO(31 downto 0) := ShmtMuxOut_data;
                    end if;
                when SingleCycleMIPS_ALUOps_mthi =>
                    if falling_edge(CLK) then
                        HILO(63 downto 32) := ShmtMuxOut_data;
                    end if;
                when SingleCycleMIPS_ALUOps_mflo =>
                    num := HILO(31 downto 0);
                when SingleCycleMIPS_ALUOps_mfhi =>
                    num := HILO(63 downto 32);
                when SingleCycleMIPS_ALUOps_sltu =>
                    if UNSIGNED(ShmtMuxOut_data) < UNSIGNED(ImmMuxOut_data) then
                        local_var_1 := STD_LOGIC_VECTOR(TO_UNSIGNED(1, T_SYSTEM_UINT32'length));
                    else
                        local_var_1 := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
                    end if;
                    num := local_var_1;
                when others =>
                    num := STD_LOGIC_VECTOR'("11111111111111111111111111111111");
            end case;
            ALUResult_data <= num;
            if UNSIGNED(num) = TO_UNSIGNED(0, 32) then
                Zero_flg <= '1';
            else
                Zero_flg <= '0';
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
