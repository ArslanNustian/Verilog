module tb_alu_task;

	// Inputs
	reg clk;
	reg rst;
	reg enter;
	reg [7:0] switch;

	// Outputs
	wire [15:0] result;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.clk(clk), 
		.rst(rst), 
		.result(result), 
		.enter(enter), 
		.switch(switch)
	);

   always
   #10 clk=~clk;
	

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		enter = 0;
		switch = 0;

		// Wait 100 ns for global reset to finish
		#100;
      rst=1;

      #100
      rst=0;		
		// Add stimulus here

     repeat (120)
	  begin
     #10
     switch=$random;

     #10
     enter=1;  //We Enter Op Code

     #5 
     enter=0;
     end

     
     	  
    
	end
      
endmodule
