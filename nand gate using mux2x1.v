// Code your design here
module mux2x1(s,i,y);
  input s;
  input [1:0]i;
  output y;
  assign y=s?i[1]:i[0];
endmodule
module nand_gate(a,b,y);
  input a,b;
  output y;
  wire [1:0] i;
  assign i[0]=1;
  assign i[1]=~b;
  mux2x1 m(a,i,y);
endmodule

// Code your testbench here
// or browse Examples
module tb;
  reg a,b;
  wire y;
  nand_gate n(a,b,y);
  initial
    begin
      $monitor("a=%0b b=%0b y=%0b",a,b,y);
      for(int i=0;i<4;i++) begin
        {a,b}=i;#10;
      end
    end
endmodule

//output
# KERNEL: a=0 b=0 y=1
# KERNEL: a=0 b=1 y=1
# KERNEL: a=1 b=0 y=1
# KERNEL: a=1 b=1 y=0
