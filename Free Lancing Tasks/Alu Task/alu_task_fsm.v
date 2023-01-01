module alu(input clk,rst, output reg[15:0]result,input enter, input [7:0]switch);

reg [3:0]PS;

reg [1:0]AS;

parameter S0=4'b0000;
parameter S1=4'b0001;
parameter S2=4'b0010;
parameter S3=4'b0011;
parameter S4=4'b0100;
parameter S5=4'b0101;
parameter S6=4'b0110;
parameter S7=4'b0111;
parameter S8=4'b1000;
parameter S9=4'b1001;
parameter S10=4'b1010;
parameter S11=4'b1011;
parameter S12=4'b1100;
parameter S13=4'b1101;
parameter S14=4'b1111; //Reset

parameter SS0=2'b00; //Reset State
parameter SS1=2'b01; //Take Opcode
parameter SS2=2'b10; //Take 1st Operand
parameter SS3=2'b11; //Take 2nd Operand


reg [3:0]opcode;

reg [7:0]reg_A;
reg [7:0]reg_B;

wire [15:0]prod;  //Sequential Multiplier Result

always@(posedge clk or posedge rst)
begin
if(rst)
PS<=S14;

else
PS<=opcode;
end


seq_mul uut1(.clk(clk),.reset(rst),.test(1'b1),.mul(reg_A),.b(reg_B),.prod(prod));

always@(*)
case(PS)
S0:result=reg_A&reg_B&(4342); //Bit Wise Special And
S1:result= {8'b0000000,(~reg_A+1) +(~reg_B+1)};   //Add
S2:result= {8'b0000000,(~reg_A+1) +(~reg_B+1)};  //Subtract 
S3:result= {8'b0000000,(~reg_A+1)}; //Negate
S4:result=~(reg_A&reg_B);  //Nand
S5:result=~(reg_A|reg_B);
S6:result=(reg_A^reg_B);
S7:result=~(reg_A);
S8:result={reg_A[5:0],reg_B,reg_A[7:6]}; //Circular Shift Right
S9:result={reg_A[7:6],reg_B,reg_A[5:0]}; //Circular Shift Left
S10:result=reg_A>>reg_B; //Arithmetic Right
S11:result=reg_A<<reg_B; //Arithmetic Left
S12:result=prod; //Sequential Multiplier
S13:result=0;   //Debug
S14:result=0;  //Reset
endcase



always@(*)
case(AS)
1:opcode=switch[3:0];
2:reg_A=switch[7:0];
3:reg_B=switch[7:0];
endcase

always@(posedge clk or posedge rst)
begin
if(rst)
AS<=SS0;

else
case(AS)
SS1: if(enter)
     AS<=SS2;  //Give Opcode
      else
     AS<=SS1;


SS2:if(enter)
     AS<=SS3;  //Take 1st Operand     
     else
     AS<=SS2;

SS3:if(enter)
     AS<=SS0; //Take Second Operand
     else
     AS<=SS3;
endcase
end


endmodule
