using SME;

namespace PipelinedMIPS
{
    public partial class IF
    {
        [InitializedBus]
        public interface Instruction : IBus
        {
            uint instruction { get; set; }
        }

        [InitializedBus]
        public interface Address : IBus
        {
            uint address { get; set; }
        }

        [InitializedBus]
        public interface PCIn : IBus
        {
            uint newAddress { get; set; }
        }

        [InitializedBus]
        public interface MuxIn : IBus
        {
            uint addr { get; set; }
        }

        [InitializedBus]
        public interface IncrementerOut : IBus
        {
            uint address { get; set; }
        }

        public partial class Pipe
        {
            [InitializedBus]
            public interface IncrementerOut : IBus
            {
                uint addr { get; set; }
            }

            [InitializedBus]
            public interface Instruction : IBus
            {
                uint instruction { get; set; }
            }
        }
    }

    public partial class ID
    {
        [InitializedBus]
        public interface RegDst : IBus
        {
            bool flg { get; set; }
        }

        [InitializedBus]
        public interface RegWrite : IBus
        {
            bool flg { get; set; }
        }

        [InitializedBus]
        public interface LogicalImmediate : IBus
        {
            bool flg { get; set; }
        }

        [InitializedBus]
        public interface ReadA : IBus
        {
            byte addr { get; set; }
        }

        [InitializedBus]
        public interface ReadB : IBus
        {
            byte addr { get; set; }
        }

        [InitializedBus]
        public interface WriteAddr : IBus
        {
            byte addr { get; set; }
        }

        [InitializedBus]
        public interface WriteData : IBus
        {
            uint data { get; set; }
        }

        [InitializedBus]
        public interface SignExtIn : IBus
        {
            short data { get; set; }
        }

        [InitializedBus]
        public interface SignExtOut : IBus
        {
            uint data { get; set; }
        }

        [InitializedBus]
        public interface OutputA : IBus
        {
            uint data { get; set; }
        }

        [InitializedBus]
        public interface OutputB : IBus
        {
            uint data { get; set; }
        }

        [InitializedBus]
        public interface ControlIn : IBus
        {
            byte opcode { get; set; }
        }

        [InitializedBus]
        public interface RegDstMuxInput : IBus
        {
            byte rt { get; set; }
            byte rd { get; set; }
        }

        [InitializedBus]
        public interface WriteDst : IBus
        {
            byte addr { get; set; }
        }

        [InitializedBus]
        public interface WriteEnabled : IBus
        {
            bool flg { get; set; }
        }

        [InitializedBus]
        public interface Shamt : IBus
        {
            byte amount { get; set; }
        }

        [InitializedBus]
        public interface Jump : IBus
        {
            uint addr { get; set; }
        }

        [InitializedBus]
        public interface ALUFunct : IBus
        {
            byte val { get; set; }
        }

        [InitializedBus]
        public interface ALUOp : IBus
        {
            byte code { get; set; }
        }

        [InitializedBus]
        public interface ALUSrc : IBus
        {
            bool flg { get; set; }
        }

        [InitializedBus]
        public interface Branch : IBus
        {
            bool flg { get; set; }
        }

        [InitializedBus]
        public interface Jmp : IBus
        {
            bool flg { get; set; }
        }

        [InitializedBus]
        public interface JAL : IBus
        {
            bool flg { get; set; }
        }

        [InitializedBus]
        public interface BranchNot : IBus
        {
            bool flg { get; set; }
        }

        [InitializedBus]
        public interface MemRead : IBus
        {
            bool flg { get; set; }
        }

        [InitializedBus]
        public interface MemWrite : IBus
        {
            bool flg { get; set; }
        }

        [InitializedBus]
        public interface MemToReg : IBus
        {
            bool flg { get; set; }
        }

        public partial class Pipe
        {
            [InitializedBus]
            public interface OutputA : IBus
            {
                uint data { get; set; }
            }

            [InitializedBus]
            public interface OutputB : IBus
            {
                uint data { get; set; }
            }

            [InitializedBus]
            public interface SignExtOut : IBus
            {
                uint data { get; set; }
            }

            [InitializedBus]
            public interface IncrementerOut : IBus
            {
                uint addr { get; set; }
            }

            [InitializedBus]
            public interface Jump : IBus
            {
                uint addr { get; set; }
            }

            [InitializedBus]
            public interface Shamt : IBus
            {
                byte amount { get; set; }
            }

            [InitializedBus]
            public interface WriteDst : IBus
            {
                byte addr { get; set; }
            }

            [InitializedBus]
            public interface ALUFunct : IBus
            {
                byte val { get; set; }
            }

            [InitializedBus]
            public interface RegWrite : IBus
            {
                bool flg { get; set; }
            }

            [InitializedBus]
            public interface ALUOp : IBus
            {
                byte code { get; set; }
            }

            [InitializedBus]
            public interface ALUSrc : IBus
            {
                bool flg { get; set; }
            }

            [InitializedBus]
            public interface Branch : IBus
            {
                bool flg { get; set; }
            }

            [InitializedBus]
            public interface Jmp : IBus
            {
                bool flg { get; set; }
            }

            [InitializedBus]
            public interface JAL : IBus
            {
                bool flg { get; set; }
            }

            [InitializedBus]
            public interface BranchNot : IBus
            {
                bool flg { get; set; }
            }

            [InitializedBus]
            public interface MemRead : IBus
            {
                bool flg { get; set; }
            }

            [InitializedBus]
            public interface MemWrite : IBus
            {
                bool flg { get; set; }
            }

            [InitializedBus]
            public interface MemToReg : IBus
            {
                bool flg { get; set; }
            }
        }
    }

    public partial class EX
    {
        [InitializedBus]
        public interface ALUOperation : IBus
        {
            short val { get; set; }
        }

        [InitializedBus]
        public interface BranchAddress : IBus
        {
            uint addr { get; set; }
        }

        [InitializedBus]
        public interface ImmMuxOut : IBus
        {
            uint data { get; set; }
        }

        [InitializedBus]
        public interface ShmtMuxOut : IBus
        {
            uint data { get; set; }
        }

        [InitializedBus]
        public interface Zero : IBus
        {
            bool flg { get; set; }
        }

        [InitializedBus]
        public interface ALUResult : IBus
        {
            uint data { get; set; }
        }

        [InitializedBus]
        public interface JALOut : IBus
        {
            uint val { get; set; }
        }

        [InitializedBus]
        public interface JumpAddress : IBus
        {
            uint addr { get; set; }
        }

        [InitializedBus]
        public interface JumpPacked : IBus
        {
            uint addr { get; set; }
        }

        [InitializedBus]
        public interface JumpReg : IBus
        {
            bool flg { get; set; }
        }

        [InitializedBus]
        public interface Shift : IBus
        {
            bool flg { get; set; }
        }

        [InitializedBus]
        public interface ShiftBranch : IBus
        {
            uint addr { get; set; }
        }

        [InitializedBus]
        public interface ShiftJump : IBus
        {
            uint addr { get; set; }
        }

        [InitializedBus]
        public interface RegWriteAddr : IBus
        {
            byte addr { get; set; }
        }

        public partial class Pipe
        {
            [InitializedBus]
            public interface Branch : IBus
            {
                bool flg { get; set; }
            }

            [InitializedBus]
            public interface BranchAddress : IBus
            {
                uint addr { get; set; }
            }

            [InitializedBus]
            public interface BranchNot : IBus
            {
                bool flg { get; set; }
            }

            [InitializedBus]
            public interface JALOut : IBus
            {
                uint val { get; set; }
            }

            [InitializedBus]
            public interface Jmp : IBus
            {
                bool flg { get; set; }
            }

            [InitializedBus]
            public interface JumpAddress : IBus
            {
                uint addr { get; set; }
            }

            [InitializedBus]
            public interface JumpReg : IBus
            {
                bool flg { get; set; }
            }

            [InitializedBus]
            public interface MemRead : IBus
            {
                bool flg { get; set; }
            }

            [InitializedBus]
            public interface MemToReg : IBus
            {
                bool flg { get; set; }
            }

            [InitializedBus]
            public interface MemWrite : IBus
            {
                bool flg { get; set; }
            }

            [InitializedBus]
            public interface OutputB : IBus
            {
                uint data { get; set; }
            }

            [InitializedBus]
            public interface RegWrite : IBus
            {
                bool flg { get; set; }
            }

            [InitializedBus]
            public interface RegWriteAddr : IBus
            {
                byte addr { get; set; }
            }

            [InitializedBus]
            public interface Zero : IBus
            {
                bool flg { get; set; }
            }
        }
    }

    public partial class MEM
    {
        [InitializedBus]
        public interface ReadData : IBus
        {
            uint data { get; set; }
        }

        public partial class Pipe
        {
            [InitializedBus]
            public interface JALOut : IBus
            {
                uint val { get; set; }
            }

            [InitializedBus]
            public interface MemToReg : IBus
            {
                bool flg { get; set; }
            }

            [InitializedBus]
            public interface ReadData : IBus
            {
                uint data { get; set; }
            }

            [InitializedBus]
            public interface RegWrite : IBus
            {
                bool flg { get; set; }
            }

            [InitializedBus]
            public interface RegWriteAddr : IBus
            {
                byte addr { get; set;}
            }
        }
    }

    public partial class JumpUnit
    {
        [InitializedBus]
        public interface AndOut : IBus
        {
            bool flg { get; set; }
        }



        [InitializedBus]
        public interface PCSrc : IBus
        {
            bool flg { get; set; }
        }

        [InitializedBus]
        public interface BranchCondition : IBus
        {
            bool flg { get; set; }
        }
    }

    public partial class WB
    {
        [InitializedBus]
        public interface WriteData : IBus
        {
            uint data { get; set; }
        }
    }
}