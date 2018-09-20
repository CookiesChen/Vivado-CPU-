`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/23 12:46:13
// Design Name: 
// Module Name: Extend_Unit
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


module Extend_Unit(
    input ExtSel,
    input [15:0] ime,
    output reg [31:0] exten
);
    
    always @( ExtSel or ime) begin
        if(ExtSel == 1 && ime[15] == 1) exten = {16'hffff, ime};
        else exten = {16'h0000, ime};
    end
endmodule
