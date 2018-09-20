`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/23 12:59:26
// Design Name: 
// Module Name: WB_Unit
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


module WB_Unit(
    input DBDataSrc,
    input [31:0] result,
    input [31:0] DataOut,
    output [31:0] DB
    );
    assign DB = (DBDataSrc == 0) ? result : DataOut;

endmodule


