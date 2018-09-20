`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/25 23:04:56
// Design Name: 
// Module Name: key_but
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


module key_but(
    input clk,
    input key,
    output reg but
    );
    
    
    reg sysclk;
    reg [18:0] cnt_20;
    always @(posedge clk) begin
        cnt_20 <= cnt_20 + 1;
        if(cnt_20 == 19'd500000) sysclk <= ~sysclk;
    end
    
    reg low;
    
    always @(posedge sysclk) begin
        low <= key;
    end
    
    reg low_r;
   
    always @(posedge clk) begin
       low_r <= low;  
    end 
   
    wire but_c;
    assign but_c = low_r & (!low);
   
    always @(posedge clk) begin
        if(but_c == 1) but <=  ~but;
    end
    
endmodule
