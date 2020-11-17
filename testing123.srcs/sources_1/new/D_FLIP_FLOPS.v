`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2020 10:38:09
// Design Name: 
// Module Name: D_FLIP_FLOPS
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
//module Dflipflop(
//    input d,
//    input clk,
//    output reg q
//);
//    always @(posedge clk)
//    begin
//        q <= d;
//    end
//endmodule

module D_FLIP_FLOPS(
    input [7:0]D,
    input CLK,
    output reg [7:0]Q
    );
    always @(posedge CLK)
        begin
        Q<=D;
        end  
endmodule
