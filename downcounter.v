// Code your design here
module downcounter(clk,rst,count);
  input clk,rst;
  output reg [3:0]count=15;
  always@(posedge clk ) begin
    if(rst)
      count<='b1111;
     else
       count<=count-1;
  end
endmodule
// Code your testbench here
// or browse Examples
module tb;
  reg clk,rst;
  wire [3:0] count;
  downcounter u1(clk,rst,count);
  initial
    begin
      clk=0;
      forever #5 clk=~clk;
    end
  initial begin
    $monitor("time=%0t rst=%b count=%d",$time,rst,count);
    rst=0;#10;
    rst=1;#10;
    rst=0;#10;
    rst=0;#10;
    rst=0;#10;
    $finish;
  end
endmodule

//output
# KERNEL: time=0 rst=0 count=15
# KERNEL: time=5 rst=0 count=14
# KERNEL: time=10 rst=1 count=14
# KERNEL: time=15 rst=1 count=15
# KERNEL: time=20 rst=0 count=15
# KERNEL: time=25 rst=0 count=14
# KERNEL: time=35 rst=0 count=13
# KERNEL: time=45 rst=0 count=12
