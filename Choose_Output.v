`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/25 17:04:01
// Design Name: 
// Module Name: Choose_Output
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


module Choose_Output(
    input clk,
    input [7:0] in1,
    input [7:0] in2,
    output reg [3:0] Enable,
    output reg [3:0] disp
    );
    
    reg [1:0] num;
    
    initial num = 0;
    
    always @(posedge clk) begin
        num = num + 1;
        if(num >= 4) num = 0;
        case(num)
           2'b00:begin
              Enable = 4'b0111;
              disp = in1[7:4];
           end
           2'b01:begin
              Enable = 4'b1011;
              disp = in1[3:0];
           end
           2'b10:begin
              Enable = 4'b1101;
              disp = in2[7:4];
           end
           2'b11:begin
              Enable = 4'b1110;
              disp = in2[3:0];
           end
         endcase
    end
    
endmodule
