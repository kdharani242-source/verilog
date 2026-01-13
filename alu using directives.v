design.sv
`define add 3'b000
`define sub 3'b001
`define And 3'b010
`define Or  3'b011
`define Xor 3'b100
`define Not 3'b101
alu.sv
`include "design.sv"
module alu(a,b,sel,result,carry);
  input [3:0] a,b;
  input [2:0] sel;
  output reg [3:0] result;
  output reg carry;
  always@(*) begin
    case(sel)
      `add:{carry,result}=a+b;
      `sub:{carry,result}=a-b;
      `And:result=a&b;
      `Or:result=a|b;
      `Xor:result=a^b;
      `Not:result=~a;
      default: result = 4'b0000;
    endcase
  end
endmodule
//tb
`include "design.sv"
`include "alu.sv"
module tb;
  reg [3:0] a,b;
  reg [2:0] sel; 
  wire [3:0]result;
  wire carry;
  alu u1(a,b,sel,result,carry);
  initial
    begin
      $monitor("a=%b b=%b sel=%b result=%b carry=%b",a,b,sel,result,carry);
      for(int i=0;i<7;i++) begin
        sel=i;a=i;b=i;#1;
      end
    end
endmodule

//output
# KERNEL: a=0000 b=0000 sel=000 result=0000 carry=0
# KERNEL: a=0001 b=0001 sel=001 result=0000 carry=0
# KERNEL: a=0010 b=0010 sel=010 result=0010 carry=0
# KERNEL: a=0011 b=0011 sel=011 result=0011 carry=0
# KERNEL: a=0100 b=0100 sel=100 result=0000 carry=0
# KERNEL: a=0101 b=0101 sel=101 result=1010 carry=0
# KERNEL: a=0110 b=0110 sel=110 result=0000 carry=0
