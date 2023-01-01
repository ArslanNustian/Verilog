`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:30:39 05/12/2022
// Design Name:   SEVEN_SEGMENTS
// Module Name:   E:/risvAI/tb_count.v
// Project Name:  risvAI
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SEVEN_SEGMENTS
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_count;

	// Inputs
	reg clk;
	reg rst;
	reg [3:0] A;
	reg [3:0] B;

	// Outputs
	wire [6:0] seven_segment;
	wire dp;
	wire [3:0] an;

	// Instantiate the Unit Under Test (UUT)
	SEVEN_SEGMENTS uut (
		.clk(clk), 
		.rst(rst), 
		.A(A), 
		.B(B), 
		.seven_segment(seven_segment), 
		.dp(dp), 
		.an(an)
	);

   always
	#10 clk=~clk;
	
   
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		A = 0;
		B = 0;

		// Wait 100 ns for global reset to finish
		#100;
		rst=1;
		
		#100;
		rst=0;
		
		repeat(1705032704)
		begin
		#100
		A=$random;
		B=$random;
		
		
		#100
		A=$random;
		B=$random;
		
		#100
		A=$random;
		B=$random;
		end
		
		#20
		$stop;
		$finish;
		
        
		// Add stimulus here

	end
      
endmodule

