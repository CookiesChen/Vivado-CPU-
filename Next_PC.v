`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/23 10:02:42
// Design Name: 
// Module Name: Next_PC
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


module Next_PC(
    input [31:0] PC4,
    input [31:0] exten,
    input [31:0] addr,
    input [1:0] PCSrc,
    output reg [31:0] next_PC
    );
    
    always @(PCSrc or PC4 or exten) begin
        case(PCSrc)
            2'b00:begin
                next_PC = PC4;
            end
            2'b01:begin
                next_PC = PC4 + exten;
            end
            2'b10:begin
                next_PC = {PC4[31:28],exten[27:2],2'b00};
            end
        endcase
    end
endmodule
