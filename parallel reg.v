// Code your design here
module parallel_register(clk,rst,en,d,q);
  input clk,rst,en;
  input [7:0] d;
  output reg [7:0] q;
  always@(posedge clk) begin
    if(rst)
      q<=8'b0;
    else
      if(en)
        q<=d;
  end
endmodule
// Code your testbench here
// or browse Examples
module tb;
  reg clk,rst,en;
  reg [7:0] d;
  wire [7:0] q;
  parallel_register pr(clk,rst,en,d,q);
  initial
    begin
      clk=0;
      forever #5 clk=~clk;
    end
  initial
    begin
      $monitor("time=%0t rst=%b en=%b d=%b q=%b",$time,rst,en,d,q);
      rst=1;en=0;d='b10101010;#10;
      rst=1;en=1;d='b10101010;#10;
      rst=0;en=1;d='b10101010;#10;
      rst=0;en=1;d='b11111111;#10;
      $finish;
    end
endmodule
//output
# KERNEL: time=0 rst=1 en=0 d=10101010 q=xxxxxxxx
# KERNEL: time=5 rst=1 en=0 d=10101010 q=00000000
# KERNEL: time=10 rst=1 en=1 d=10101010 q=00000000
# KERNEL: time=20 rst=0 en=1 d=10101010 q=00000000
# KERNEL: time=25 rst=0 en=1 d=10101010 q=10101010
# KERNEL: time=30 rst=0 en=1 d=11111111 q=10101010
# KERNEL: time=35 rst=0 en=1 d=11111111 q=11111111
