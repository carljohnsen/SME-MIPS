library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SingleCycleMIPS_v1_0 is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface Control
		C_Control_DATA_WIDTH	: integer	:= 32;
		C_Control_ADDR_WIDTH	: integer	:= 4;

		-- Parameters of Axi Slave Bus Interface Instruction
		C_Instruction_DATA_WIDTH	: integer	:= 32;
		C_Instruction_ADDR_WIDTH	: integer	:= 9;

		-- Parameters of Axi Slave Bus Interface Memory
		C_Memory_DATA_WIDTH	: integer	:= 32;
		C_Memory_ADDR_WIDTH	: integer	:= 9
	);
	port (
		-- Users to add ports here
        cpu_clk : in std_logic;
		-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Slave Bus Interface Control
		control_aclk	: in std_logic;
		control_aresetn	: in std_logic;
		control_awaddr	: in std_logic_vector(C_Control_ADDR_WIDTH-1 downto 0);
		control_awprot	: in std_logic_vector(2 downto 0);
		control_awvalid	: in std_logic;
		control_awready	: out std_logic;
		control_wdata	: in std_logic_vector(C_Control_DATA_WIDTH-1 downto 0);
		control_wstrb	: in std_logic_vector((C_Control_DATA_WIDTH/8)-1 downto 0);
		control_wvalid	: in std_logic;
		control_wready	: out std_logic;
		control_bresp	: out std_logic_vector(1 downto 0);
		control_bvalid	: out std_logic;
		control_bready	: in std_logic;
		control_araddr	: in std_logic_vector(C_Control_ADDR_WIDTH-1 downto 0);
		control_arprot	: in std_logic_vector(2 downto 0);
		control_arvalid	: in std_logic;
		control_arready	: out std_logic;
		control_rdata	: out std_logic_vector(C_Control_DATA_WIDTH-1 downto 0);
		control_rresp	: out std_logic_vector(1 downto 0);
		control_rvalid	: out std_logic;
		control_rready	: in std_logic;

		-- Ports of Axi Slave Bus Interface Instruction
		instruction_aclk	: in std_logic;
		instruction_aresetn	: in std_logic;
		instruction_awaddr	: in std_logic_vector(C_Instruction_ADDR_WIDTH-1 downto 0);
		instruction_awprot	: in std_logic_vector(2 downto 0);
		instruction_awvalid	: in std_logic;
		instruction_awready	: out std_logic;
		instruction_wdata	: in std_logic_vector(C_Instruction_DATA_WIDTH-1 downto 0);
		instruction_wstrb	: in std_logic_vector((C_Instruction_DATA_WIDTH/8)-1 downto 0);
		instruction_wvalid	: in std_logic;
		instruction_wready	: out std_logic;
		instruction_bresp	: out std_logic_vector(1 downto 0);
		instruction_bvalid	: out std_logic;
		instruction_bready	: in std_logic;
		instruction_araddr	: in std_logic_vector(C_Instruction_ADDR_WIDTH-1 downto 0);
		instruction_arprot	: in std_logic_vector(2 downto 0);
		instruction_arvalid	: in std_logic;
		instruction_arready	: out std_logic;
		instruction_rdata	: out std_logic_vector(C_Instruction_DATA_WIDTH-1 downto 0);
		instruction_rresp	: out std_logic_vector(1 downto 0);
		instruction_rvalid	: out std_logic;
		instruction_rready	: in std_logic;

		-- Ports of Axi Slave Bus Interface Memory
		memory_aclk	: in std_logic;
		memory_aresetn	: in std_logic;
		memory_awaddr	: in std_logic_vector(C_Memory_ADDR_WIDTH-1 downto 0);
		memory_awprot	: in std_logic_vector(2 downto 0);
		memory_awvalid	: in std_logic;
		memory_awready	: out std_logic;
		memory_wdata	: in std_logic_vector(C_Memory_DATA_WIDTH-1 downto 0);
		memory_wstrb	: in std_logic_vector((C_Memory_DATA_WIDTH/8)-1 downto 0);
		memory_wvalid	: in std_logic;
		memory_wready	: out std_logic;
		memory_bresp	: out std_logic_vector(1 downto 0);
		memory_bvalid	: out std_logic;
		memory_bready	: in std_logic;
		memory_araddr	: in std_logic_vector(C_Memory_ADDR_WIDTH-1 downto 0);
		memory_arprot	: in std_logic_vector(2 downto 0);
		memory_arvalid	: in std_logic;
		memory_arready	: out std_logic;
		memory_rdata	: out std_logic_vector(C_Memory_DATA_WIDTH-1 downto 0);
		memory_rresp	: out std_logic_vector(1 downto 0);
		memory_rvalid	: out std_logic;
		memory_rready	: in std_logic
	);
end SingleCycleMIPS_v1_0;

architecture arch_imp of SingleCycleMIPS_v1_0 is

	-- component declaration
	component SingleCycleMIPS_v1_0_Control is
		generic (
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	: integer	:= 4
		);
		port (
		cpu_running : in std_logic;
		cpu_clocks : in std_logic_vector(31 downto 0);
		cpu_reset : out std_logic;
		cpu_count : out std_logic_vector(31 downto 0);
		S_AXI_ACLK	: in std_logic;
		S_AXI_ARESETN	: in std_logic;
		S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
		S_AXI_AWVALID	: in std_logic;
		S_AXI_AWREADY	: out std_logic;
		S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		S_AXI_WVALID	: in std_logic;
		S_AXI_WREADY	: out std_logic;
		S_AXI_BRESP	: out std_logic_vector(1 downto 0);
		S_AXI_BVALID	: out std_logic;
		S_AXI_BREADY	: in std_logic;
		S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
		S_AXI_ARVALID	: in std_logic;
		S_AXI_ARREADY	: out std_logic;
		S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_RRESP	: out std_logic_vector(1 downto 0);
		S_AXI_RVALID	: out std_logic;
		S_AXI_RREADY	: in std_logic
		);
	end component SingleCycleMIPS_v1_0_Control;

	component SingleCycleMIPS_v1_0_Instruction is
		generic (
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	: integer	:= 9
		);
		port (
		cpu_addr: in std_logic_vector(31 downto 0);
		cpu_instruction: out std_logic_vector(31 downto 0);
		S_AXI_ACLK	: in std_logic;
		S_AXI_ARESETN	: in std_logic;
		S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
		S_AXI_AWVALID	: in std_logic;
		S_AXI_AWREADY	: out std_logic;
		S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		S_AXI_WVALID	: in std_logic;
		S_AXI_WREADY	: out std_logic;
		S_AXI_BRESP	: out std_logic_vector(1 downto 0);
		S_AXI_BVALID	: out std_logic;
		S_AXI_BREADY	: in std_logic;
		S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
		S_AXI_ARVALID	: in std_logic;
		S_AXI_ARREADY	: out std_logic;
		S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_RRESP	: out std_logic_vector(1 downto 0);
		S_AXI_RVALID	: out std_logic;
		S_AXI_RREADY	: in std_logic
		);
	end component SingleCycleMIPS_v1_0_Instruction;

	component SingleCycleMIPS_v1_0_Memory is
		generic (
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	: integer	:= 9
		);
		port (
		CPU_READ : in std_logic;
		CPU_WRITE : in std_logic;
		CPU_ADDR : in std_logic_vector(31 downto 0);
		CPU_DATA_IN : in std_logic_vector(31 downto 0);
		CPU_DATA_OUT : out std_logic_vector(31 downto 0);
		S_AXI_ACLK	: in std_logic;
		S_AXI_ARESETN	: in std_logic;
		S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
		S_AXI_AWVALID	: in std_logic;
		S_AXI_AWREADY	: out std_logic;
		S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		S_AXI_WVALID	: in std_logic;
		S_AXI_WREADY	: out std_logic;
		S_AXI_BRESP	: out std_logic_vector(1 downto 0);
		S_AXI_BVALID	: out std_logic;
		S_AXI_BREADY	: in std_logic;
		S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
		S_AXI_ARVALID	: in std_logic;
		S_AXI_ARREADY	: out std_logic;
		S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_RRESP	: out std_logic_vector(1 downto 0);
		S_AXI_RVALID	: out std_logic;
		S_AXI_RREADY	: in std_logic
		);
	end component SingleCycleMIPS_v1_0_Memory;

    component SingleCycleMIPS_export is
        port(
            EXT_RUNNING: out std_logic;
            EXT_CLOCKS: out std_logic_vector(31 downto 0);
            EXT_COUNT: in std_logic_vector(31 downto 0);
            EXT_ADDR: out std_logic_vector(31 downto 0);
            EXT_INSTRUCTION: in std_logic_vector(31 downto 0);
            
            EXT_MEM_READ : out std_logic;
            EXT_MEM_WRITE : out std_logic;
            EXT_MEM_ADDR : out std_logic_vector(31 downto 0);
            EXT_MEM_IN : in std_logic_vector(31 downto 0);
            EXT_MEM_OUT : out std_logic_vector(31 downto 0);
            clk : in std_logic;
            rst : in std_logic
        );
    end component SingleCycleMIPS_export;
    signal cpu_running : std_logic;
    signal cpu_clocks : std_logic_vector(31 downto 0);
    signal cpu_reset : std_logic;
    signal cpu_count : std_logic_vector(31 downto 0);
    signal cpu_addr : std_logic_vector(31 downto 0);
    signal cpu_instruction : std_logic_vector(31 downto 0);
    
    signal cpu_read : std_logic;
    signal cpu_write : std_logic;
    signal cpu_mem_addr : std_logic_vector(31 downto 0);
    signal cpu_data_in : std_logic_vector(31 downto 0);
    signal cpu_data_out : std_logic_vector(31 downto 0);
begin
-- Instantiation of Axi Bus Interface Control
SingleCycleMIPS_v1_0_Control_inst : SingleCycleMIPS_v1_0_Control
	generic map (
		C_S_AXI_DATA_WIDTH	=> C_Control_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_Control_ADDR_WIDTH
	)
	port map (
	    cpu_running => cpu_running,
	    cpu_clocks => cpu_clocks,
	    cpu_reset => cpu_reset,
	    cpu_count => cpu_count,
		S_AXI_ACLK	=> control_aclk,
		S_AXI_ARESETN	=> control_aresetn,
		S_AXI_AWADDR	=> control_awaddr,
		S_AXI_AWPROT	=> control_awprot,
		S_AXI_AWVALID	=> control_awvalid,
		S_AXI_AWREADY	=> control_awready,
		S_AXI_WDATA	=> control_wdata,
		S_AXI_WSTRB	=> control_wstrb,
		S_AXI_WVALID	=> control_wvalid,
		S_AXI_WREADY	=> control_wready,
		S_AXI_BRESP	=> control_bresp,
		S_AXI_BVALID	=> control_bvalid,
		S_AXI_BREADY	=> control_bready,
		S_AXI_ARADDR	=> control_araddr,
		S_AXI_ARPROT	=> control_arprot,
		S_AXI_ARVALID	=> control_arvalid,
		S_AXI_ARREADY	=> control_arready,
		S_AXI_RDATA	=> control_rdata,
		S_AXI_RRESP	=> control_rresp,
		S_AXI_RVALID	=> control_rvalid,
		S_AXI_RREADY	=> control_rready
	);

-- Instantiation of Axi Bus Interface Instruction
SingleCycleMIPS_v1_0_Instruction_inst : SingleCycleMIPS_v1_0_Instruction
	generic map (
		C_S_AXI_DATA_WIDTH	=> C_Instruction_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_Instruction_ADDR_WIDTH
	)
	port map (
	    cpu_addr => cpu_addr,
	    cpu_instruction => cpu_instruction,
		S_AXI_ACLK	=> instruction_aclk,
		S_AXI_ARESETN	=> instruction_aresetn,
		S_AXI_AWADDR	=> instruction_awaddr,
		S_AXI_AWPROT	=> instruction_awprot,
		S_AXI_AWVALID	=> instruction_awvalid,
		S_AXI_AWREADY	=> instruction_awready,
		S_AXI_WDATA	=> instruction_wdata,
		S_AXI_WSTRB	=> instruction_wstrb,
		S_AXI_WVALID	=> instruction_wvalid,
		S_AXI_WREADY	=> instruction_wready,
		S_AXI_BRESP	=> instruction_bresp,
		S_AXI_BVALID	=> instruction_bvalid,
		S_AXI_BREADY	=> instruction_bready,
		S_AXI_ARADDR	=> instruction_araddr,
		S_AXI_ARPROT	=> instruction_arprot,
		S_AXI_ARVALID	=> instruction_arvalid,
		S_AXI_ARREADY	=> instruction_arready,
		S_AXI_RDATA	=> instruction_rdata,
		S_AXI_RRESP	=> instruction_rresp,
		S_AXI_RVALID	=> instruction_rvalid,
		S_AXI_RREADY	=> instruction_rready
	);

-- Instantiation of Axi Bus Interface Memory
SingleCycleMIPS_v1_0_Memory_inst : SingleCycleMIPS_v1_0_Memory
	generic map (
		C_S_AXI_DATA_WIDTH	=> C_Memory_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_Memory_ADDR_WIDTH
	)
	port map (
        CPU_READ => cpu_read,
        CPU_WRITE => cpu_write,
        CPU_ADDR => cpu_mem_addr,
        CPU_DATA_IN => cpu_data_in,
        CPU_DATA_OUT => cpu_data_out,
		S_AXI_ACLK	=> memory_aclk,
		S_AXI_ARESETN	=> memory_aresetn,
		S_AXI_AWADDR	=> memory_awaddr,
		S_AXI_AWPROT	=> memory_awprot,
		S_AXI_AWVALID	=> memory_awvalid,
		S_AXI_AWREADY	=> memory_awready,
		S_AXI_WDATA	=> memory_wdata,
		S_AXI_WSTRB	=> memory_wstrb,
		S_AXI_WVALID	=> memory_wvalid,
		S_AXI_WREADY	=> memory_wready,
		S_AXI_BRESP	=> memory_bresp,
		S_AXI_BVALID	=> memory_bvalid,
		S_AXI_BREADY	=> memory_bready,
		S_AXI_ARADDR	=> memory_araddr,
		S_AXI_ARPROT	=> memory_arprot,
		S_AXI_ARVALID	=> memory_arvalid,
		S_AXI_ARREADY	=> memory_arready,
		S_AXI_RDATA	=> memory_rdata,
		S_AXI_RRESP	=> memory_rresp,
		S_AXI_RVALID	=> memory_rvalid,
		S_AXI_RREADY	=> memory_rready
	);

	-- Add user logic here
SingleCycleMIPS_export_inst : SingleCycleMIPS_export
    port map (
        clk => cpu_clk,
        rst => cpu_reset,
        EXT_RUNNING => cpu_running,
        EXT_CLOCKS => cpu_clocks,
        EXT_COUNT => cpu_count,
        EXT_ADDR => cpu_addr,
        EXT_INSTRUCTION => cpu_instruction,
        
        EXT_MEM_READ => cpu_read,
        EXT_MEM_WRITE => cpu_write,
        EXT_MEM_ADDR => cpu_mem_addr,
        EXT_MEM_IN => cpu_data_out,
        EXT_MEM_OUT => cpu_data_in
    );
	-- User logic ends

end arch_imp;
