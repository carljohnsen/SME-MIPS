using System;
using SME;

namespace PipelinedMIPS
{
    public class MEM_Memory : SimpleProcess
    {
        [InputBus]
        EX_Pipe_MemWrite memwrite;
        [InputBus]
        EX_Pipe_MemRead memread;
        [InputBus]
        EX_Pipe_JALOut addr;
        [InputBus]
        EX_Pipe_OutputB write;

        [OutputBus]
        MEM_ReadData output;

        byte[] mem = new byte[16384];

        protected override void OnTick()
        {
            uint add = addr.val;
            if (memread.flg)
            {
                output.data = 0u 
                    | (uint) (mem[add]     << 24) 
                    | (uint) (mem[add + 1] << 16) 
                    | (uint) (mem[add + 2] << 8) 
                    |         mem[add + 3];
            }
            else if (memwrite.flg)
            {
                uint data = write.data;
                mem[add]     = (byte)((data >> 24) & 0xFF);
                mem[add + 1] = (byte)((data >> 16) & 0xFF);
                mem[add + 2] = (byte)((data >> 8)  & 0xFF);
                mem[add + 3] = (byte)( data        & 0xFF);
                output.data = 0;
            }
            else
            {
                output.data = 0;
            }

            Console.Write("MEM [");
            for (int i = 0; i < 15; i++)
            {
                int a = 0
                | mem[i * 4]     << 24
                | mem[i * 4 + 1] << 16
                | mem[i * 4 + 2] << 8
                | mem[i * 4 + 3];
                Console.Write(a + ",");
            }
            Console.WriteLine("]");
        }
    }
        
    [ClockedProcess]
    public class MEM_Pipe : SimpleProcess
    {
        [InputBus]
        EX_Pipe_JALOut jouti;
        [InputBus]
        EX_Pipe_MemToReg memtoregi;
        [InputBus]
        MEM_ReadData readdatai;
        [InputBus]
        EX_Pipe_RegWrite regwritei;
        [InputBus]
        EX_Pipe_RegWriteAddr regaddri;

        uint jouttmp = 0;
        bool memtoregtmp = false;
        uint readdatatmp = 0;
        bool regwritetmp = false;
        byte regaddrtmp = 0;

        [OutputBus]
        MEM_Pipe_JALOut jouto;
        [OutputBus]
        MEM_Pipe_MemToReg memtorego;
        [OutputBus]
        MEM_Pipe_ReadData readdatao;
        [OutputBus]
        MEM_Pipe_RegWrite regwriteo;
        [OutputBus]
        MEM_Pipe_RegWriteAddr regaddro;

        protected override void OnTick()
        {
            jouttmp = jouti.val;
            memtoregtmp = memtoregi.flg;
            readdatatmp = readdatai.data;
            regwritetmp = regwritei.flg;
            regaddrtmp = regaddri.addr;

            jouto.val      = jouttmp;
            memtorego.flg  = memtoregtmp;
            readdatao.data = readdatatmp;
            regwriteo.flg  = regwritetmp;
            regaddro.addr  = regaddrtmp;
        }
    }
    
    public class MEM_BranchOrJumpMux : SimpleProcess
    {
        [InputBus]
        EX_Pipe_JumpAddress jump;
        [InputBus]
        EX_Pipe_BranchAddress branch;
        [InputBus]
        JumpUnit_AndOut shouldBranch;

        [OutputBus]
        IF_MuxIn pc;

        protected override void OnTick()
        {
            pc.addr = shouldBranch.flg ? branch.addr : jump.addr;
        }
    }

    public class MEM_Jump_Or : SimpleProcess
    {
        [InputBus]
        EX_Pipe_Jmp jmp;
        [InputBus]
        EX_Pipe_JumpReg jr;
        [InputBus]
        JumpUnit_AndOut branch;

        [OutputBus]
        JumpUnit_PCSrc output;

        protected override void OnTick()
        {
            output.flg = jmp.flg || jr.flg || branch.flg;
        }
    }

    public class MEM_Jump_Condition : SimpleProcess
    {
        [InputBus]
        EX_Pipe_Zero zero;
        [InputBus]
        EX_Pipe_BranchNot bne;

        [OutputBus]
        JumpUnit_BranchCondition cond;

        protected override void OnTick()
        {
            cond.flg = bne.flg ? !zero.flg : zero.flg;
        }
    }

    public class MEM_Jump_And : SimpleProcess
    {
        [InputBus]
        EX_Pipe_Branch branch;
        [InputBus]
        JumpUnit_BranchCondition cond;

        [OutputBus]
        JumpUnit_AndOut output;

        protected override void OnTick()
        {
            output.flg = cond.flg && branch.flg;
        }
    }
}
