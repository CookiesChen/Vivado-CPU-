`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/23 13:23:13
// Design Name: 
// Module Name: Single_CPU
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


module Single_CPU( CLK, RST, addr, next_PC, IDataOut, ReadData1, ReadData2, result, DB);
    input CLK;
    input RST;
    
    
    //Control Unit
    wire zero;
    wire PCWre;
    wire ALUSrcA;
    wire ALUSrcB;
    wire DBDataSrc;
    wire RegWre;
    wire nRD;
    wire nWR;
    wire RegDst;
    wire ExtSel;
    wire [1:0] PCSrc;
    wire [2:0] ALUOp;
    
    //IM
    output wire [31:0] addr;
    output wire [31:0] IDataOut;
    
    //Regfile
    output wire[31:0] ReadData1;
    output wire [31:0] ReadData2;
    wire [4:0] WriteReg;
    
    //PC
    wire [31:0] PC4;
    
    //Next_PC
    output wire [31:0] next_PC;
    //Extend
    wire [31:0] exten;
    
    //ALU
    output wire [31:0] result;
    wire [31:0] rega;
    wire [31:0] regb;
    
    //RAM
    wire [31:0] Dataout;
    
    //WB
    output wire [31:0] DB;
    
    assign rega = (ALUSrcA == 0) ?  ReadData1 : {24'h000000, 3'b000, IDataOut[10:6]};
    assign regb = (ALUSrcB == 0) ?  ReadData2 : exten;
    assign WriteReg = (RegDst == 0) ? IDataOut[20:16] : IDataOut[15:11];
    
    PC my_PC(.CLK(CLK),.RST(RST),.PCWre(PCWre),.PC_in(next_PC),.addr(addr),.PC4(PC4));
    Next_PC my_Next_PC(.PC4(PC4),.exten(exten << 2),.addr(addr), .PCSrc(PCSrc), .next_PC(next_PC));
    Instruction_Memory my_Instruction_Memory(.addr(addr), .IDataOut(IDataOut));
    Control_Unit my_Control_Unit(.op(IDataOut[31:26]), .zero(zero),.PCWre(PCWre), .ALUSrcA(ALUSrcA), .ALUSrcB(ALUSrcB), .DBDataSrc(DBDataSrc), .RegWre(RegWre), .nRD(nRD), .nWR(nWR), .RegDst(RegDst), .ExtSel(ExtSel), .PCSrc(PCSrc), .ALUOp(ALUOp));
    Regfile my_Regfile(.CLK(CLK), .RST(RST), .RegWre(RegWre), .ReadReg1(IDataOut[25:21]), .ReadReg2(IDataOut[20:16]), .WriteReg(WriteReg), .WriteData(DB), .ReadData1(ReadData1), .ReadData2(ReadData2));
    Extend_Unit my_Extend_Unit(.ExtSel(ExtSel), .ime(IDataOut[15:0]), .exten(exten));
    ALU my_ALU(.ALUopcode(ALUOp), .rega(rega), .regb(regb), .result(result), .zero(zero));
    RAM my_RAM(.clk(CLK), .address(result), .writeData(ReadData2), .nRD(nRD), .nWR(nWR), .Dataout(Dataout));
    WB_Unit my_WB_Unit(.DBDataSrc(DBDataSrc), .result(result), .DataOut(Dataout), .DB(DB));
    
endmodule
