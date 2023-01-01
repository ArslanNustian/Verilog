`timescale 1ns / 1ps

module SEGMENTS(
	input [3:0] number,
	output reg [6:0] leds
    );

always@*
begin
	case(number)
	4'h0: leds = 7'b1111110;
	4'h1: leds = 7'b0110000;
	4'h2: leds = 7'b1101101;
	4'h3: leds = 7'b1111001;
	4'h4: leds = 7'b0110011;
	4'h5: leds = 7'b1011011;
	4'h6: leds = 7'b1011111;
	4'h7: leds = 7'b1110000;
	4'h8: leds = 7'b1111111;
	4'h9: leds = 7'b1111011;
	4'ha: leds = 7'b1110111;
	4'hb: leds = 7'b0011111;
	4'hc: leds = 7'b0001101;
	4'hd: leds = 7'b0111101;
	4'he: leds = 7'b1001111;
	4'hf: leds = 7'b1000111;
	endcase
end

endmodule

`timescale 1ns / 1ps

module SEVEN_SEGMENTS(
	input clk,rst,
	input [3:0] A,B,
	output reg [6:0] seven_segment,
	output dp,
	output reg [3:0] an
    );

reg [63:0] count;
wire [6:0] seven_segment0;
wire [6:0] seven_segment1;
wire [6:0] seven_segment2;
wire [6:0] seven_segment3;
	
assign dp = 1;

always@(posedge clk)
if(rst)
count<=0;

else
count <= #1 count+1;

SEGMENTS seg_inst0(A  ,seven_segment0);
SEGMENTS seg_inst1(B  ,seven_segment1);
SEGMENTS seg_inst2(4'b1111 ,seven_segment2);
SEGMENTS seg_inst3(4'b1111,seven_segment3);


//Mux Counter Slow Clock
always@(posedge clk)

if(rst)
begin
seven_segment =0;
an=0;
end

else
begin
	case(count[12:11])
	2'd0: begin seven_segment = ~seven_segment0; an = 4'b1110;end
	2'd1: begin seven_segment = ~seven_segment1; an = 4'b1101;end
	2'd2: begin seven_segment = ~seven_segment2; an = 4'b1011;end
	2'd3: begin seven_segment = ~seven_segment3; an = 4'b0111;end
	endcase
end
	
endmodule

