`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/22 15:44:44
// Design Name: 
// Module Name: PC
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


module PC(
    input CLK,
    input RST,
    input PCWre,
    input [31:0] PC_in,
    output reg [31:0] addr,
    output reg [31:0] PC4
);
    
    initial begin
        addr = 0;
        PC4 = 0;
    end
    
    always @(posedge CLK) begin
        if(RST == 0) begin
            addr = 0;
            PC4 = 4;
        end else if(PCWre == 1) begin
            addr = PC_in;
            PC4 = PC_in + 4;
        end
    end
endmodule
