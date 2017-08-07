using SME;

namespace PipelinedMIPS
{
    [InitializedBus]
    public interface IF_Instruction : IBus
    {
        uint instruction { get; set; }
    }

    [InitializedBus]
    public interface IF_Address : IBus
    {
        uint address { get; set; }
    }

    [InitializedBus]
    public interface IF_PCIn : IBus
    {
        uint newAddress { get; set; }
    }

    [InitializedBus]
    public interface IF_MuxIn : IBus
    {
        uint addr { get; set; }
    }

    [InitializedBus]
    public interface IF_IncrementerOut : IBus
    {
        uint address { get; set; }
    }

    [InitializedBus]
    public interface IF_Pipe_IncrementerOut : IBus
    {
        uint addr { get; set; }
    }

    [InitializedBus]
    public interface IF_Pipe_Instruction : IBus
    {
        uint instruction { get; set; }
    }
    
    [InitializedBus]
    public interface ID_RegDst : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface ID_RegWrite : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface ID_LogicalImmediate : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface ID_ReadA : IBus
    {
        byte addr { get; set; }
    }

    [InitializedBus]
    public interface ID_ReadB : IBus
    {
        byte addr { get; set; }
    }

    [InitializedBus]
    public interface ID_WriteAddr : IBus
    {
        byte addr { get; set; }
    }

    [InitializedBus]
    public interface ID_WriteData : IBus
    {
        uint data { get; set; }
    }

    [InitializedBus]
    public interface ID_SignExtIn : IBus
    {
        short data { get; set; }
    }

    [InitializedBus]
    public interface ID_SignExtOut : IBus
    {
        uint data { get; set; }
    }

    [InitializedBus]
    public interface ID_OutputA : IBus
    {
        uint data { get; set; }
    }

    [InitializedBus]
    public interface ID_OutputB : IBus
    {
        uint data { get; set; }
    }

    [InitializedBus]
    public interface ID_ControlIn : IBus
    {
        Opcodes opcode { get; set; }
    }

    [InitializedBus]
    public interface ID_RegDstMuxInput : IBus
    {
        byte rt { get; set; }
        byte rd { get; set; }
    }

    [InitializedBus]
    public interface ID_WriteDst : IBus
    {
        byte addr { get; set; }
    }

    [InitializedBus]
    public interface ID_WriteEnabled : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface ID_Shamt : IBus
    {
        byte amount { get; set; }
    }

    [InitializedBus]
    public interface ID_Jump : IBus
    {
        uint addr { get; set; }
    }

    [InitializedBus]
    public interface ID_ALUFunct : IBus
    {
        Funcs val { get; set; }
    }

    [InitializedBus]
    public interface ID_ALUOp : IBus
    {
        ALUOpcodes code { get; set; }
    }

    [InitializedBus]
    public interface ID_ALUSrc : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface ID_Branch : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface ID_Haz_Stall : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface ID_Haz_Flush : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface ID_Jmp : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface ID_JAL : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface ID_BranchNot : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface ID_MemRead : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface ID_MemWrite : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface ID_MemToReg : IBus
    {
        bool flg { get; set; }
    }
        
    [InitializedBus]
    public interface ID_Pipe_OutputA : IBus
    {
        uint data { get; set; }
    }

    [InitializedBus]
    public interface ID_Pipe_OutputB : IBus
    {
        uint data { get; set; }
    }

    [InitializedBus]
    public interface ID_Pipe_SignExtOut : IBus
    {
        uint data { get; set; }
    }

    [InitializedBus]
    public interface ID_Pipe_IncrementerOut : IBus
    {
        uint addr { get; set; }
    }

    [InitializedBus]
    public interface ID_Pipe_Jump : IBus
    {
        uint addr { get; set; }
    }

    [InitializedBus]
    public interface ID_Pipe_Shamt : IBus
    {
        byte amount { get; set; }
    }

    [InitializedBus]
    public interface ID_Pipe_WriteDst : IBus
    {
        byte addr { get; set; }
    }

    [InitializedBus]
    public interface ID_Pipe_ALUFunct : IBus
    {
        Funcs val { get; set; }
    }

    [InitializedBus]
    public interface ID_Pipe_RegWrite : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface ID_Pipe_ALUOp : IBus
    {
        ALUOpcodes code { get; set; }
    }

    [InitializedBus]
    public interface ID_Pipe_ALUSrc : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface ID_Pipe_Branch : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface ID_Pipe_Jmp : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface ID_Pipe_JAL : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface ID_Pipe_BranchNot : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface ID_Pipe_MemRead : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface ID_Pipe_MemWrite : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface ID_Pipe_MemToReg : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface ID_Pipe_ReadA : IBus
    {
        byte addr { get; set; }
    }

    [InitializedBus]
    public interface ID_Pipe_ReadB : IBus
    {
        byte addr { get; set; }
    }
    
    [InitializedBus]
    public interface EX_ALUOperation : IBus
    {
        ALUOps code { get; set; }
    }

    [InitializedBus]
    public interface EX_BranchAddress : IBus
    {
        uint addr { get; set; }
    }

    [InitializedBus]
    public interface EX_ForwardA : IBus
    {
        uint data { get; set; }
    }

    [InitializedBus]
    public interface EX_ForwardB : IBus
    {
        uint data { get; set; }
    }

    [InitializedBus]
    public interface EX_ImmMuxOut : IBus
    {
        uint data { get; set; }
    }

    [InitializedBus]
    public interface EX_ShmtMuxOut : IBus
    {
        uint data { get; set; }
    }

    [InitializedBus]
    public interface EX_Zero : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface EX_ALUResult : IBus
    {
        uint data { get; set; }
    }

    [InitializedBus]
    public interface EX_JALOut : IBus
    {
        uint val { get; set; }
    }

    [InitializedBus]
    public interface EX_JumpAddress : IBus
    {
        uint addr { get; set; }
    }

    [InitializedBus]
    public interface EX_JumpPacked : IBus
    {
        uint addr { get; set; }
    }

    [InitializedBus]
    public interface EX_JumpReg : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface EX_Shift : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface EX_ShiftBranch : IBus
    {
        uint addr { get; set; }
    }

    [InitializedBus]
    public interface EX_ShiftJump : IBus
    {
        uint addr { get; set; }
    }

    [InitializedBus]
    public interface EX_RegWriteAddr : IBus
    {
        byte addr { get; set; }
    }
        
    [InitializedBus]
    public interface EX_Pipe_Branch : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface EX_Pipe_BranchAddress : IBus
    {
        uint addr { get; set; }
    }

    [InitializedBus]
    public interface EX_Pipe_BranchNot : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface EX_Pipe_JALOut : IBus
    {
        uint val { get; set; }
    }

    [InitializedBus]
    public interface EX_Pipe_Jmp : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface EX_Pipe_JumpAddress : IBus
    {
        uint addr { get; set; }
    }

    [InitializedBus]
    public interface EX_Pipe_JumpReg : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface EX_Pipe_MemRead : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface EX_Pipe_MemToReg : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface EX_Pipe_MemWrite : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface EX_Pipe_OutputB : IBus
    {
        uint data { get; set; }
    }

    [InitializedBus]
    public interface EX_Pipe_RegWrite : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface EX_Pipe_RegWriteAddr : IBus
    {
        byte addr { get; set; }
    }

    [InitializedBus]
    public interface EX_Pipe_Zero : IBus
    {
        bool flg { get; set; }
    }
        
    [InitializedBus]
    public interface EX_Forw_ForwardA : IBus
    {
        ForwardSelection selection { get; set; }
    }

    [InitializedBus]
    public interface EX_Forw_ForwardB : IBus
    {
        ForwardSelection selection { get; set; }
    }
    
    [InitializedBus]
    public interface MEM_ReadData : IBus
    {
        uint data { get; set; }
    }

    [InitializedBus]
    public interface MEM_Pipe_JALOut : IBus
    {
        uint val { get; set; }
    }

    [InitializedBus]
    public interface MEM_Pipe_MemToReg : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface MEM_Pipe_ReadData : IBus
    {
        uint data { get; set; }
    }

    [InitializedBus]
    public interface MEM_Pipe_RegWrite : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface MEM_Pipe_RegWriteAddr : IBus
    {
        byte addr { get; set;}
    }
    
    [InitializedBus]
    public interface JumpUnit_AndOut : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface JumpUnit_PCSrc : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface JumpUnit_BranchCondition : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface WB_WriteData : IBus
    {
        uint data { get; set; }
    }
}