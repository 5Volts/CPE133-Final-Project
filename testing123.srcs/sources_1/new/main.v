`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.11.2020 17:49:27
// Design Name: 
// Module Name: main
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


module main(    
    input clk,
    output [15:0]LEDS,
    output [3:0]seg,
    output an
);    
    assign an = 1'b1;
    
    LED_RUNNER led_runner(
    .clk(clk),
    .LEDS(LEDS),
    .CURR_LED(seg)
    );
endmodule
