`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/22 15:33:52
// Design Name: 
// Module Name: Instruction_Memory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Instruction_Memory(
    input [31:0] addr, // 存储器地址
    output reg [31:0] IDataOut // 输出的数据
    );
    reg RW;
    reg [7:0] InsMemory[0:100];
    initial begin // 加载数据到存储器rom。注意：必须使用绝对路径，如：E:/Xlinx/VivadoProject/ROM/（自己定）
        RW = 0;
        $readmemb ("C:/Users/11093/Desktop/课业/大二/下/计组/单周期CPU/ins.txt", InsMemory); // 数据文件rom_data（.coe或.txt）。未指定，就从0地址开始存放。
    end
    always @( RW or addr ) begin
        if (RW == 0) begin // 为0，读存储器。大端数据存储模式
            IDataOut[31:24] = InsMemory[addr];
            IDataOut[23:16] = InsMemory[addr+1];
            IDataOut[15:8] = InsMemory[addr+2];
            IDataOut[7:0] = InsMemory[addr+3];
        end
    end
endmodule



