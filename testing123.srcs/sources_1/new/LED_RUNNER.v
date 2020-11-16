`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.11.2020 22:37:29
// Design Name: 
// Module Name: LED_RUNNER
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
    output sclk
 );
    integer MAX_COUNT = 10000000;
    integer div_cnt =0;
    reg tmp_clk =0;
    always @ (posedge clk)
    begin
        if(div_cnt == MAX_COUNT)
        begin
            tmp_clk = ~tmp_clk;
            div_cnt = 0;
        end else
            div_cnt = div_cnt + 1;
    end
    assign sclk = tmp_clk;
endmodule

module encoder16bit(
    input [15:0]in,
    output reg [3:0]out
);
    always_comb begin
        case(in)
            16'b0000000000000001:out=4'd0;
            16'b0000000000000010:out=4'd1;
            16'b0000000000000100:out=4'd2;
            16'b0000000000001000:out=4'd3;
            16'b0000000000010000:out=4'd4;
            16'b0000000000100000:out=4'd5;
            16'b0000000001000000:out=4'd6;
            16'b0000000010000000:out=4'd7;
            16'b0000000100000000:out=4'd8;
            16'b0000001000000000:out=4'd9;
            16'b0000010000000000:out=4'd10;
            16'b0000100000000000:out=4'd11;
            16'b0001000000000000:out=4'd12;
            16'b0010000000000000:out=4'd13;
            16'b0100000000000000:out=4'd14;
            16'b1000000000000000:out=4'd15;
            default: out=4'd0;
        endcase
    end
endmodule

module Dflipflop(
    input d,
    input clk,
    output reg q
);
    always @(posedge clk)
    begin
        q <= d;
    end
endmodule

module LED_RUNNER(
    input clk,
    output [15:0]LEDS,
    output reg [3:0]CURR_LED
    );
    logic [15:0]din;
    logic [15:0]qout;
    wire sclk;
    
    clk_div CLKDIV(
    .clk(clk),
    .sclk(sclk)
    );
    assign din[0] = qout[15] | ~qout[0] & ~qout[1] & ~qout[2] & ~qout[3] & ~qout[4] & ~qout[5] & ~qout[6] & ~qout[7] & ~qout[8] & ~qout[9] & ~qout[10] & ~qout[11] & ~qout[12] & ~qout[13] & ~qout[14] & ~qout[15];
    assign din[1] = qout[0];
    assign din[2] = qout[1];
    assign din[3] = qout[2];
    assign din[4] = qout[3];
    assign din[5] = qout[4];
    assign din[6] = qout[5];
    assign din[7] = qout[6];
    assign din[8] = qout[7];
    assign din[9] = qout[8];
    assign din[10] = qout[9];
    assign din[11] = qout[10];
    assign din[12] = qout[11];
    assign din[13] = qout[12];
    assign din[14] = qout[13];
    assign din[15] = qout[14];

//    initial begin
////    integer i;
//    for(int i=0;i < 15;i++) assign din[i+1] = qout[i]
//    end

//    assign din[1] = qout[0] & ~qout[1] & ~qout[2];
//    assign din[2] = ~qout[0] & qout[1] & ~qout[2];
    assign LEDS = qout;
    
    encoder16bit enc(
    .in(qout),
    .out(CURR_LED)
    );
    
    Dflipflop dff0(
    .d(din[0]),
    .clk(sclk),
    .q(qout[0])
    );
    
    Dflipflop dff1(
    .d(din[1]),
    .clk(sclk),
    .q(qout[1])
    );
    
    Dflipflop dff2(
    .d(din[2]),
    .clk(sclk),
    .q(qout[2])
    );
    
    Dflipflop dff3(
    .d(din[3]),
    .clk(sclk),
    .q(qout[3])
    );
    
    Dflipflop dff4(
    .d(din[4]),
    .clk(sclk),
    .q(qout[4])
    );
    
    Dflipflop dff5(
    .d(din[5]),
    .clk(sclk),
    .q(qout[5])
    );
    
     Dflipflop dff6(
    .d(din[6]),
    .clk(sclk),
    .q(qout[6])
    );
    
    Dflipflop dff7(
    .d(din[7]),
    .clk(sclk),
    .q(qout[7])
    );
    
    Dflipflop dff8(
    .d(din[8]),
    .clk(sclk),
    .q(qout[8])
    );
    
    Dflipflop dff9(
    .d(din[9]),
    .clk(sclk),
    .q(qout[9])
    );
    
    Dflipflop dff10(
    .d(din[10]),
    .clk(sclk),
    .q(qout[10])
    );
    
    Dflipflop dff11(
    .d(din[11]),
    .clk(sclk),
    .q(qout[11])
    );
    
     Dflipflop dff12(
    .d(din[12]),
    .clk(sclk),
    .q(qout[12])
    );
    
    Dflipflop dff13(
    .d(din[13]),
    .clk(sclk),
    .q(qout[13])
    );
    
    Dflipflop dff14(
    .d(din[14]),
    .clk(sclk),
    .q(qout[14])
    );
    
    Dflipflop dff15(
    .d(din[15]),
    .clk(sclk),
    .q(qout[15])
    );

    
   
    
endmodule
