`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/22 19:56:50
// Design Name: 
// Module Name: Control_Unit
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


module Control_Unit(
    input [5:0] op,
    input zero,
    output reg PCWre,
    output reg ALUSrcA,
    output reg ALUSrcB,
    output reg DBDataSrc,
    output reg RegWre,
    output reg nRD,
    output reg nWR,
    output reg RegDst,
    output reg ExtSel,
    output reg [1:0] PCSrc,
    output reg [2:0] ALUOp
);
    initial begin
        PCWre = 1;
        PCSrc = 2'b00;
    end
    
    always @(op or zero) begin
        case(op)
            6'b000000 : begin //add
                PCWre <= 1;
                ALUSrcA <= 0;
                ALUSrcB <= 0;
                DBDataSrc <= 0;
                RegWre <= 1;
                nRD <= 0;
                nWR <= 0;
                RegDst <= 1; 
                PCSrc = 2'b00;
                ALUOp = 3'b000;
            end
            6'b000001 : begin //addi
                PCWre <= 1;
                ALUSrcA <= 0;
                ALUSrcB <= 1;
                DBDataSrc <= 0;
                RegWre <= 1;
                nRD <= 0;
                nWR <= 0;
                RegDst <= 0;
                ExtSel <= 1;
                PCSrc = 2'b00;
                ALUOp = 3'b000;
            end
            6'b000010 : begin //sub
                PCWre <= 1;
                ALUSrcA <= 0;
                ALUSrcB <= 0;
                DBDataSrc <= 0;
                RegWre <= 1;
                nRD <= 0;
                nWR <= 0;
                RegDst <= 1;
                PCSrc = 2'b00;
                ALUOp = 3'b001;
            end
            6'b010000 : begin //ori
                PCWre <= 1;
                ALUSrcA <= 0;
                ALUSrcB <= 1;
                DBDataSrc <= 0;
                RegWre <= 1;
                nRD <= 0;
                nWR <= 0;
                RegDst <= 0;
                ExtSel <= 1;
                PCSrc = 2'b00;
                ALUOp = 3'b011;
            end
            6'b010001 : begin //and
                PCWre <= 1;
                ALUSrcA <= 0;
                ALUSrcB <= 0;
                DBDataSrc <= 0;
                RegWre <= 1;
                nRD <= 0;
                nWR <= 0;
                RegDst <= 1;
                PCSrc = 2'b00;
                ALUOp = 3'b100;
            end
            6'b010010 : begin //or
                PCWre <= 1;
                ALUSrcA <= 0;
                ALUSrcB <= 0;
                DBDataSrc <= 0;
                RegWre <= 1;
                nRD <= 0;
                nWR <= 0;
                RegDst <= 1; 
                PCSrc = 2'b00;
                ALUOp = 3'b011;
            end
            6'b011000 : begin //sll
                PCWre <= 1;
                ALUSrcA <= 1;
                ALUSrcB <= 0;
                DBDataSrc <= 0;
                RegWre <= 1;
                nRD <= 0;
                nWR <= 0;
                RegDst <= 1;
                ExtSel = 0; 
                PCSrc = 2'b00;
                ALUOp = 3'b010;
            end
            6'b011011 : begin //slti
                PCWre <= 1;
                ALUSrcA <= 0;
                ALUSrcB <= 1;
                DBDataSrc <= 0;
                RegWre <= 1;
                nRD <= 0;
                nWR <= 0;
                RegDst <= 0;
                ExtSel <= 1;
                PCSrc = 2'b00;
                ALUOp = 3'b110;
            end
            6'b100110 : begin //sw
                PCWre <= 1;
                ALUSrcA <= 0;
                ALUSrcB <= 1;
                RegWre <= 0;
                nRD <= 0;
                nWR <= 1; 
                ExtSel <= 1;
                PCSrc = 2'b00;
                ALUOp = 3'b000;
            end
            6'b100111 : begin //lw
                PCWre <= 1;
                ALUSrcA <= 0;
                ALUSrcB <= 1;
                DBDataSrc <= 1;
                RegWre <= 1;
                nRD <= 1;
                nWR <= 0;
                RegDst <= 0;
                ExtSel <= 1;
                PCSrc = 2'b00;
                ALUOp = 3'b000;
            end
            6'b110000 : begin //beq
                PCWre <= 1;
                ALUSrcA <= 0;
                ALUSrcB <= 0;
                RegWre <= 0;
                nRD <= 0;
                nWR <= 0;
                ExtSel <= 1;
                if(zero == 1) PCSrc = 2'b01;
                else PCSrc = 2'b00;
                ALUOp = 3'b001;
            end
            6'b110001 : begin //bne
                PCWre <= 1;
                ALUSrcA <= 0;
                ALUSrcB <= 0;
                RegWre <= 0;
                nRD <= 0;
                nWR <= 0;
                ExtSel <= 1; 
                if(zero == 1) PCSrc = 2'b00;
                else PCSrc = 2'b01;
                ALUOp = 3'b001;
            end
            6'b111000 : begin //j
                PCWre <= 1;
                ALUSrcA <= 1;
                ALUSrcB <= 0;
                RegWre <= 0;
                nRD <= 0;
                nWR <= 0; 
                PCSrc = 2'b10;
                ALUOp = 3'b000;
            end
            6'b111111 : begin //halt
                PCWre <= 0;
                ALUSrcA <= 1;
                ALUSrcB <= 0;
                RegWre <= 0;
                nRD <= 0;
                nWR <= 0;
                PCSrc = 2'b00;
            end
        endcase
    end

endmodule
