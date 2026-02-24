// Code your design here
module alu(a,b,sel,y);
  input [4:0] a,b;
  input [3:0] sel;
  output reg [9:0] y;
  always@(*) begin
    case(sel)
      4'b0000:y=a+b;
      4'b0001:y=a-b;
      4'b0010:y=a*b;
      4'b0011:y=a/b;
      4'b0100:y=a%b;
      4'b0101:y=a&b;
      4'b0110:y=a|b;
      4'b0111:y=~a;
      4'b1000:y=a^b;
      4'b1001:y=a>>b;
      4'b1010:y=a<<b;
      4'b1011:y=a>>>b;
      4'b1100:y=a<<<b;
      4'b1101:y={a,b};
      4'b1110:y={2{a}};
      4'b1111:y=b;
      default:y=4'b0000;;
    endcase
  end
endmodule

// Code your testbench here
// or browse Examples
module tb;
  reg [4:0] a,b;
  reg [3:0] sel;
  wire [9:0] y;
  alu dut(a,b,sel,y);
  initial
    begin
      $monitor("a=%0b(%0d) b=%0b(%0d} y=%0b(%0d)",a,b,y);
      a=5'b00111;b=5'b01010;
      for(int i=0;i<16;i++) begin
        sel=i;#10;
      end
    end
endmodule

//output
# KERNEL: a=7 b=10 y=17
# KERNEL: a=7 b=10 y=1021
# KERNEL: a=7 b=10 y=70
# KERNEL: a=7 b=10 y=0
# KERNEL: a=7 b=10 y=7
# KERNEL: a=7 b=10 y=2
# KERNEL: a=7 b=10 y=15
# KERNEL: a=7 b=10 y=1016
# KERNEL: a=7 b=10 y=13
# KERNEL: a=7 b=10 y=0
# KERNEL: a=7 b=10 y=234
# KERNEL: a=7 b=10 y=231
# KERNEL: a=7 b=10 y=10
