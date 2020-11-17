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
module clk_div(
    input clk,
    input [31:0]mag,
    output sclk
 );
    integer div_cnt =0;
    reg tmp_clk =0;
    always @ (posedge clk)
    begin
        if(div_cnt == mag)
        begin
            tmp_clk = ~tmp_clk;
            div_cnt = 0;
        end else
            div_cnt = div_cnt + 1;
    end
    assign sclk = tmp_clk;
endmodule

module main(    
    input clk,
    input BTN,
    input [15:0]SW,
    output [15:0]LEDS,
    output reg [3:0]seg,
    output an
);    
    assign an = 1'b0;
    reg [3:0]segs;
//    integer sw_idx;
    wire sclk;
    clk_div sdiv(
    .clk(clk),
    .mag(30000000),
    .sclk(sclk)
    );
    
    LED_RUNNER led_runner(
    .clk(sclk),
    .LEDS(LEDS),
    .CURR_LED(segs)
    );
    
    always begin
        if(SW[segs] == 1)begin
            seg[0]=1;
        end 
        else begin
            seg[0]=0;
        end 
//        for(int sw_idx=0; sw_idx < 15; sw_idx++) begin
//            $display(sw_idx, SW[sw_idx]);
//            if(SW[sw_idx] == 1) begin
//                seg[0]=1;
//            end
//            else begin
//                seg[0]=0;
//            end
//        end
    end
    
endmodule
