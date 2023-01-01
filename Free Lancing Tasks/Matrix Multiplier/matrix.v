module alu_Matrix(instr,clk,alucon,result,zero,so1,so2);
input[31:0] instr;
input clk;
output reg [3:0] alucon;
output zero;
output reg [31:0]so1;
output reg [31:0]so2;
output reg [31:0]result;
reg[31:0] memory [39:0];
initial begin
  $readmemb("bitdata.txt", memory);
end

reg[31:0] s0=32'b0;
reg[31:0] s1=32'b0;
reg[31:0] s2=32'b0;
reg[31:0] s3=32'b0;
reg[31:0] s4=32'b0;
reg[31:0] s5=32'b0;
reg[31:0] s6=32'b0;
reg[31:0] s7=32'b0;


always@(posedge clk)
  begin
    if(instr[31:26]==6'b000000)
      begin
        if(instr[5:0]==6'b100000)alucon=4'b0010;
        else if(instr[5:0]==6'b100010)alucon=4'b0011;
        else if(instr[5:0]==6'b100100)alucon=4'b0000;
        else if(instr[5:0]==6'b100101)alucon=4'b0001;
        else if(instr[5:0]==6'b011000)alucon=4'b0100;
      end
    else if(instr[31:26]==6'b100011)
      begin
        alucon=4'b0010;
      end
    else if(instr[31:26]==6'b101011)
      begin
        alucon=4'b0010;
      end
    else if(instr[31:26]==6'b000100)
      begin
        alucon=4'b0011;
      end
    else if(instr[31:26]==6'b001000)
      begin
        alucon=4'b0010;
      end
  if(instr[31:26]==6'b000000|| instr[31:26]==6'b000100)
      begin
        case(instr[25:21])
          5'b10000:so1=s0;
          5'b10001:so1=s1;
          5'b10010:so1=s2;
          5'b10011:so1=s3;
          5'b10100:so1=s4;
          5'b10101:so1=s5;
          5'b10110:so1=s6;
          5'b10111:so1=s7;
        endcase
        case(instr[20:16])
          5'b10000:so2=s0;
          5'b10001:so2=s1;
          5'b10010:so2=s2;
          5'b10011:so2=s3;
          5'b10100:so2=s4;
          5'b10101:so2=s5;
          5'b10110:so2=s6;
          5'b10111:so2=s7;
        endcase
      end
    else if(instr[31:26]==6'b100011 || instr[31:26]==6'b101011 || instr[31:26]==6'b001000)
      begin
        case(instr[25:21])
          5'b10000:so1=s0;
          5'b10001:so1=s1;
          5'b10010:so1=s2;
          5'b10011:so1=s3;
          5'b10100:so1=s4;
          5'b10101:so1=s5;
          5'b10110:so1=s6;
          5'b10111:so1=s7;
        endcase
        so2 = instr[15:0];
      end
    case(alucon)
        4'b0000:  result = so1&so2;
        4'b0001:  result = so1|so2;
        4'b0010:result = so1+so2;
        4'b0011:
            begin
                  result = so1-so2;
            end
        4'b0100:result = so1*so2;
    endcase
      case(instr[31:26])
            6'b100011://load
                  begin
                  case(instr[20:16])
                        5'b10000:s0=memory[result];
                        5'b10001:s1=memory[result];
                        5'b10010:s2=memory[result];
                        5'b10011:s3=memory[result];
                        5'b10100:s4=memory[result];
                        5'b10101:s5=memory[result];
                        5'b10110:s6=memory[result];
                        5'b10111:s7=memory[result];
                  endcase
                  end
            6'b101011://store
                  begin
                  case(instr[20:16])
                        5'b10000:memory[result]=s0;
                        5'b10001:memory[result]=s1;
                        5'b10010:memory[result]=s2;
                        5'b10011:memory[result]=s3;
                        5'b10100:memory[result]=s4;
                        5'b10101:memory[result]=s5;
                        5'b10110:memory[result]=s6;
                        5'b10111:memory[result]=s7;
                  endcase
                  end
            6'b000000:
                  case(instr[15:11])
                        5'b10000:s0=result;
                        5'b10001:s1=result;
                        5'b10010:s2=result;
                        5'b10011:s3=result;
                        5'b10100:s4=result;
                        5'b10101:s5=result;
                        5'b10110:s6=result;
                        5'b10111:s7=result;
                  endcase
            6'b001000:
                  case(instr[20:16])
                        5'b10000:s0=result;
                        5'b10001:s1=result;
                        5'b10010:s2=result;
                        5'b10011:s3=result;
                        5'b10100:s4=result;
                        5'b10101:s5=result;
                        5'b10110:s6=result;
                        5'b10111:s7=result;
                  endcase
      endcase
      end
    initial begin
      $monitor("%d %d %d\n%d %d %d\n%d %d %d\n",memory[24],memory[25],memory[26],
                                          memory[27],memory[28],memory[29],
                                          memory[30],memory[31],memory[32],
														memory[33],memory[34],memory[34],
														memory[35],memory[36],memory[37],
														memory[38],memory[39]);
    end
endmodule
