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
module clk_div2(
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
    output logic [7:0]seg,
    output [3:0]an
);    
    //assign an = 1'b0;
    logic [3:0]segs;
    reg [7:0]score=0;
    wire sclk;
    integer mag_ = 10000000;
    logic wait_ = 0;
    reg [7:0]stored_score;
    
//    D_FLIP_FLOPS(
//    .D(score),
//    .CLK(clk),
//    .Q(stored_score)
//    );
    
    BIN_2_DEC_SEG(
    .Q_IN(score),
    .CLK(clk),
    .CAT(seg),
    .AN(an)
    );
    
    clk_div2 sdiv(
    .clk(clk),
    .mag(mag_),
    .sclk(sclk)
    );
    
    LED_RUNNER led_runner(
    .clk(sclk),
    .LEDS(LEDS),
    .CURR_LED(segs)
    );
    
    always_ff @ (posedge clk) begin
        if(SW[segs] == 1 && BTN == 1&& wait_==0)begin
            score++;
            wait_=1;
            mag_= mag_ / 3;

        end 
        if(SW[segs] == 1 && BTN == 1&& wait_==1)begin          
            score=score;   
        end 
        else if(SW[segs] == 0 && BTN == 0 && wait_==1) begin
            wait_=0;
        end 
        else if(SW[segs] == 0 && BTN == 1 && wait_==0) begin
            score=0;
        end 
//        else begin
//            score = score;
//        end
    end
    
endmodule
